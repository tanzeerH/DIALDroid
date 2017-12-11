package com.yaogroup.db;
import edu.psu.cse.siis.ic3.db.Table;

import java.sql.SQLException;
import java.util.HashMap;

public class ICCEntryLeaksTable extends Table {
  private static final String INSERT = "INSERT INTO ICCEntryLeaks "
      + "(entry_point_id, leak_source,leak_sink, leak_path) VALUES (?, ?,?, ?)";

  private static int  cacheAppID=-1;
  private static HashMap<String,Integer> hashSetEntryleaks=new HashMap<>();
  /*
   * 
   * private static final String FIND =
   * "SELECT id FROM ExitPoints WHERE class_id = ? AND method = ? AND instruction = ? " +
   * "AND exit_kind = ?";
   */

  public int insert(int entryPoint, String leakSource, String leakSink, String leakPath, int AppID)
      throws SQLException {
	  
	  if (AppID != cacheAppID) {
		  hashSetEntryleaks.clear();
			cacheAppID = AppID;
		}
		String md5 = ICCExitLeaksTable.generateMD5(entryPoint,leakSource, leakSink, leakPath, "");
		
    if (hashSetEntryleaks.containsKey(md5)) {
		System.out.println("found in cache");
		return hashSetEntryleaks.get(md5);
	}
    if (insertStatement == null || insertStatement.isClosed()) {
      insertStatement = getConnection().prepareStatement(INSERT);
    }
    insertStatement.setInt(1, entryPoint);
    if (leakSource.length() > 512) {
      leakSource = leakSource.substring(0, 512);
    }
    insertStatement.setString(2, leakSource);
    insertStatement.setString(4, leakPath);
    insertStatement.setString(3, leakSink);

    if (insertStatement.executeUpdate() == 0) {
      return NOT_FOUND;
    }
    int row_id = findAutoIncrement();
    hashSetEntryleaks.put(md5, row_id);
	return row_id;
  }

  /*
   * public int find(int classId, String method, int instruction, String exit_kind) throws
   * SQLException { if (findStatement == null || findStatement.isClosed()) { findStatement =
   * getConnection().prepareStatement(FIND); } findStatement.setInt(1, classId);
   * findStatement.setString(2, method); findStatement.setInt(3, instruction);
   * findStatement.setString(4, exit_kind); return processIntFindQuery(findStatement); }
   */
}
