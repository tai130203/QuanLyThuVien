package DB_util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

import oracle.jdbc.driver.OracleDriver;

public class connect_db {
	public static Connection getConnnection()
	{
		Connection c = null;
		
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			String url = "jdbc:oracle:thin:@localhost:1521/orcl";//url = "jdbc:oracle:thin:@localhost:1521/orcl";//
			String username = "c##qlthuvien";
			String password = "113";
			
			c = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	public static void closeConection(Connection c)
	{
		try {
			if(c != null)
			{
				c.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static void printInfor(Connection c)
	{
			try {
				if(c != null){
					DatabaseMetaData mtdt = c.getMetaData();
					System.out.println(mtdt.getDatabaseProductName());
					System.out.println(mtdt.getDatabaseProductVersion());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
}
