package cmput391.OracleHandler.JUnitTests;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import cmput391.OracleHandler.OracleHandler;

public class OracleHandlerTests {
	
	@Test
	public void oracleInsertUsers() {
		int returnVal = OracleHandler.insertRecord(
			"INSERT INTO USERS ('USER_NAME','PASSWORD','DATE_REGISTERED') "+
			"VALUES ('testuser','testpass',SYSTIMESTAMP)");
		
		System.out.println("END");
		
		assertEquals(returnVal, 0);
	}
	
}
