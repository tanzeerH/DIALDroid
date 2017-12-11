package com.yaogroup.collusion;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.xml.stream.XMLStreamException;

import com.yaogroup.db.DialDroidSQLConnection;

import edu.psu.cse.siis.ic3.Timers;
import edu.psu.cse.siis.ic3.db.SQLConnection;
import edu.psu.cse.siis.ic3.db.Table;
import edu.psu.cse.siis.ic3.manifest.ManifestPullParser;
import edu.psu.cse.siis.ic3.manifest.SHA256Calculator;
import soot.SootMethod;
import soot.Unit;
import soot.jimple.Stmt;
import soot.jimple.infoflow.android.TestApps.Test;
import soot.jimple.infoflow.handlers.ResultsAvailableHandler;
import soot.jimple.infoflow.handlers.ResultsAvailableHandler2;
import soot.jimple.infoflow.results.InfoflowResults;
import soot.jimple.infoflow.results.ResultSinkInfo;
import soot.jimple.infoflow.results.ResultSourceInfo;
import soot.jimple.infoflow.results.xml.InfoflowResultsSerializer;
import soot.jimple.infoflow.solver.cfg.IInfoflowCFG;
import soot.tagkit.LineNumberTag;

public class AppAnalysis{

	
	
	private static int getIdForUnit(Unit unit, SootMethod method) {
		int id = 0;
		for (Unit currentUnit : method.getActiveBody().getUnits()) {
			if (currentUnit == unit) {
				return id;
			}
			++id;
		}

		return -1;
	}
	

	private static void getApkList(File apkFileOrDirectory, ArrayList<File> apkList) {

		if (!apkFileOrDirectory.isDirectory()) {

			if (apkFileOrDirectory.getName().endsWith(".apk") || apkFileOrDirectory.getName().endsWith(".APK")) {
				apkList.add(apkFileOrDirectory);
				return;
			}
		}

		File[] folderList = apkFileOrDirectory.listFiles();

		for (File apkFile : folderList) {
			getApkList(apkFile, apkList);

		}

	}
	
	private static ResultsAvailableHandler ExitResultsAvailableHandler=new ResultsAvailableHandler() {
		
		@Override
		public boolean onSingleResultAvailable(IInfoflowCFG cfg, ResultSourceInfo source, ResultSinkInfo sinks) {
			System.out.println("incremental printing in dialdroid");
			System.out.println(("\t- " + source.getSource() + " (in "));
			if (source.getPath() != null)
				System.out.println(("\t\ton Path " + Arrays.toString(source.getPath())));
			
			insertIncrementalExitPoints(cfg, source, sinks);
			return false;
		}
		
		@Override
		public void onResultsAvailable(IInfoflowCFG cfg, InfoflowResults results) {
			// TODO Auto-generated method stub
			
		}
		
	};
	private static void insertIncrementalExitPoints(IInfoflowCFG cfg, ResultSourceInfo source, ResultSinkInfo sinks)
	{
		try {
			SootMethod method = cfg.getMethodOf(sinks.getSink());

			String className = cfg.getMethodOf(sinks.getSink()).getDeclaringClass().toString();

			int instruction = getIdForUnit(sinks.getSink(), cfg.getMethodOf(sinks.getSink()));

			if (sinks.getSink().hasTag("LineNumberTag")) {
				instruction = ((LineNumberTag) sinks.getSink().getTag("LineNumberTag")).getLineNumber();
			}

			String leakSource = source.getSource().toString();
			String methodCalling = null;

			try {
				methodCalling = source.getSource().getInvokeExpr().getMethod().getName();
			} catch (Exception e) {

			}

			String leakSink = sinks.getSink().toString();
			StringBuffer leakPath = new StringBuffer();

			if (source.getPath() != null) {
				for (Stmt stmt : source.getPath()) {
					leakPath.append(stmt.toString() + ",");
				}
			}

			DialDroidSQLConnection.insertDataLeak(className, method, instruction, sinks.getSink(), leakSource, leakSink,
					leakPath.toString(), methodCalling);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	private static ResultsAvailableHandler EntryResultsAvailableHandler=new ResultsAvailableHandler() {
		
		@Override
		public boolean onSingleResultAvailable(IInfoflowCFG cfg, ResultSourceInfo source, ResultSinkInfo sinks) {
			System.out.println("incremental printing in dialdroid");
			System.out.println(("\t- " + source.getSource() + " (in "));
			if (source.getPath() != null)
				System.out.println(("\t\ton Path " + Arrays.toString(source.getPath())));
			
			insertIncrementalEntryPoints(cfg, source, sinks);
			return false;
		}
		
		@Override
		public void onResultsAvailable(IInfoflowCFG cfg, InfoflowResults results) {
			// TODO Auto-generated method stub
			
		}
		
	};
	
	
	private static void insertIncrementalEntryPoints(IInfoflowCFG cfg, ResultSourceInfo source, ResultSinkInfo sinks)
	{
		try {
			SootMethod method = cfg.getMethodOf(sinks.getSink());

			String className = cfg.getMethodOf(sinks.getSink()).getDeclaringClass().toString();

			int instruction = getIdForUnit(sinks.getSink(), cfg.getMethodOf(sinks.getSink()));

			if (sinks.getSink().hasTag("LineNumberTag")) {
				instruction = ((LineNumberTag) sinks.getSink().getTag("LineNumberTag")).getLineNumber();
			}

			String leakSource = source.getSource().toString();
			String methodCalling = null;

			try {
				methodCalling = source.getSource().getInvokeExpr().getMethod().getName();
			} catch (Exception e) {

			}

			String leakSink = sinks.getSink().toString();
			StringBuffer leakPath = new StringBuffer();

			if (source.getPath() != null) {
				for (Stmt stmt : source.getPath()) {
					leakPath.append(stmt.toString() + ",");
				}
			}

			DialDroidSQLConnection.insertFromICCDataLeak(className, method.toString(), instruction,
					sinks.getSink(), leakSource, leakSink, leakPath.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	

	
	public static void main(String[] args) {

		if (args.length < 4) {
			System.out.println(
					"Invalid program usage!! use: computeicc|appanalysis classpath dbname dbhostname [directory] [category]");
			return;
		}

		String dbName = args[2].trim();
		String dbHost = args[3].trim();
		System.out.println(dbName + " " + dbHost);

		Table.setDBHost(dbHost);
		DialDroidSQLConnection.init(dbName, "./cc.properties", null, 3306);

		if (args[0].compareToIgnoreCase("computeicc") == 0) {

			DialDroidSQLConnection.computeSensitiveChannels();
			return;
		}

		if (args[0].compareToIgnoreCase("appanalysis") != 0) {
			System.out.println(
					"Invalid program usage!! use: computeicc|appanalysis classpath dbname dbhostname [directory] [category]");
			return;
		}

		File apkDirectory = new File(args[4]);
		String appCategory = args[5].trim();
		String classPath = args[1].trim();

		ArrayList<File> apkList = new ArrayList<File>();

		getApkList(apkDirectory, apkList);

		for (File apkFile : apkList) {

			try {

				String appName = apkFile.getName().toLowerCase();
				appName = appName.substring(0, appName.indexOf(".apk"));
				System.out.println(appName);

				String shasum = SHA256Calculator.getSHA256(apkFile);

				if (SQLConnection.checkIfAppAnalyzed(shasum)) {
					DialDroidSQLConnection.saveAppCategory(appCategory, apkFile.getAbsolutePath());
					continue;
				}

				Timers.clear();
				Timers.v().analysisTimer.start();

				boolean InfoFlowComputationTimeOut = false;

				edu.psu.cse.siis.ic3.Main.main(new String[] { "-in", apkFile.getAbsolutePath(), "-cp", classPath, "-db",
						"./cc.properties", "-dbname", dbName, "-dbhost", dbHost });

				// DialDroidSQLConnection.saveAppCategory(appCategory,
				// apkFile.getAbsolutePath());
				// Timers.v().saveTimeToDb();

				Timers.v().exitPathTimer.start();
				InfoflowResults results = soot.jimple.infoflow.android.TestApps.Test
						.runAnalysisForResultsWithIncrementalReporting(new String[] { apkFile.getAbsolutePath(),
								classPath, "--aplength", "2", "--timeout", "540" }, ExitResultsAvailableHandler);

				//
				DialDroidSQLConnection.insertSourceSinkCount(InfoflowResults.numSources, InfoflowResults.numSinks);
				InfoflowResults.reset();

				Timers.v().exitPathTimer.end();

				Timers.v().entryPathTimer.start();
				results = soot.jimple.infoflow.android.TestApps.Test.runAnalysisForResultsWithIncrementalReporting(
						new String[] { apkFile.getAbsolutePath(), classPath, "--iccentry", "--aplength", "2",
								"--timeout", "540" },
						EntryResultsAvailableHandler);

				Timers.v().entryPathTimer.end();

				Timers.v().analysisTimer.end();
				Timers.v().saveTimeToDb();

				System.out.println("Done:" + appName);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
