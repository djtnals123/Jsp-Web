package kr.ac.sumin.webprograming;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
	private static Connection connection;
	
	private Connector() {}
	
	public static synchronized Connection getConnection() throws ClassNotFoundException, SQLException {
		if(connection == null) {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/dbname";  
			String dbId = "root";  
			String dbPw = "root";  
			connection = DriverManager.getConnection(url, dbId, dbPw);
		} 
		return connection;
	}
}
