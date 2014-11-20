package cmput391.OracleHandler;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OracleHandler {
	
	// connection should stay open, rather than reconnecting
	private static final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String CONNECTION_STRING = "jdbc:oracle:thin:@gwynne.cs.ualberta.ca:1521:CRS";
	private static final String USERNAME = "jyuen";
	private static final String PASSWORD = "pass2014";
	
	public static int insertRecord(String statement) {
		try {
			Connection conn = getConnected(ORACLE_DRIVER, CONNECTION_STRING, USERNAME, PASSWORD);
			
			PreparedStatement stmt = conn.prepareStatement(statement);
			
			stmt.executeUpdate();
			stmt.execute("commit");
			conn.close();
		} catch (SQLException e) {
			System.err.println("SQL ERROR: "+e.getMessage());
			
			return -1;
		} catch (Exception e) {
			System.err.println("ERROR: "+e.getMessage());
			
			return -1;
		}
		
		return 0;
	}
	
	private static Connection getConnected(
		String drivername, String dbstring, String username, String password) throws Exception {
		
		@SuppressWarnings("rawtypes")
		Class drvClass = Class.forName(drivername);
		DriverManager.registerDriver((Driver) drvClass.newInstance());
		
		return DriverManager.getConnection(dbstring,username,password);
	}
}
