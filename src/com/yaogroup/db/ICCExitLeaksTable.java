package com.yaogroup.db;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;

import edu.psu.cse.siis.ic3.db.ApplicationTable;
import edu.psu.cse.siis.ic3.db.SQLConnection;
import edu.psu.cse.siis.ic3.db.Table;
import soot.SootMethod;
import soot.Unit;

public class ICCExitLeaksTable extends Table {
  private static final String INSERT = "INSERT INTO ICCExitLeaks "
      + "(exit_point_id, leak_source, leak_sink, leak_path,method) VALUES (?, ?, ?, ?,?)";

  /*
   * private static final String FIND =
   * "SELECT id FROM ExitPoints WHERE class_id = ? AND method = ? AND instruction = ? " +
   * "AND exit_kind = ?";
   */
  private static int  cacheAppID=-1;
  private static HashMap<String,Integer> hashSetDataleaks=new HashMap<>();
  
  public static String MD5(String md5) {
	   try {
	        java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
	        byte[] array = md.digest(md5.getBytes());
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < array.length; ++i) {
	          sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
	       }
	        return sb.toString();
	    } catch (java.security.NoSuchAlgorithmException e) {
	    }
	    return null;
	}

	public int insert(int exitPoint, String leakSource, String leakSink, String leakPath, String method, int AppID)
			throws SQLException {
		// int id = find(classId, method, instruction, exit_kind);
		// if (id != NOT_FOUND) {
		// return id;
		// }
		if (AppID != cacheAppID) {
			hashSetDataleaks.clear();
			cacheAppID = AppID;
		}
		String md5 = generateMD5(exitPoint,leakSource, leakSink, leakPath,method);
		
		if (hashSetDataleaks.containsKey(md5)) {
			System.out.println("found in cache");
			return hashSetDataleaks.get(md5);
		}

		if (insertStatement == null || insertStatement.isClosed()) {
			insertStatement = getConnection().prepareStatement(INSERT);
		}
		insertStatement.setInt(1, exitPoint);
		if (leakSource.length() > 512) {
			leakSource = leakSource.substring(0, 512);
		}
		insertStatement.setString(2, leakSource);
		insertStatement.setString(3, leakSink);
		insertStatement.setString(4, leakPath);
		insertStatement.setString(5, method);

		if (insertStatement.executeUpdate() == 0) {
			return NOT_FOUND;
		}
		int row_id = findAutoIncrement();
		hashSetDataleaks.put(md5, row_id);
		return row_id;
	}
  
  
	public static String generateMD5(int exitPoint,String leakSource, String leakSink, String leakPath, String method) {
		String concat=exitPoint+":"+leakSource+":"+leakSink+":"+leakPath+":"+method;
		  String md5=MD5(concat);
		return md5;
	}


  /*
   * public int find(int classId, String method, int instruction, String exit_kind) throws
   * SQLException { if (findStatement == null || findStatement.isClosed()) { findStatement =
   * getConnection().prepareStatement(FIND); } findStatement.setInt(1, classId);
   * findStatement.setString(2, method); findStatement.setInt(3, instruction);
   * findStatement.setString(4, exit_kind); return processIntFindQuery(findStatement); }
   */
}
