package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcConnecter {

	private Connection conn = null;
	private Statement  stmt  = null;
	private ResultSet  rs    = null;
	private String name ="root";
	private String password ="zhqc110672";
	private String url = "jdbc:mysql://localhost:3306/case?useUnicode=true&characterEncoding=UTF-8";
	
	public JdbcConnecter(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void execute(String sql){
		try{
			conn = DriverManager.getConnection(url,name,password);
			stmt = conn.createStatement();
			stmt.execute(sql);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public int executeUpdate(String sql){
		int row = 0;
		try{
			conn = DriverManager.getConnection(url,name,password);
			stmt = conn.createStatement();
			row = stmt.executeUpdate(sql);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return row;
	}
	
	public ResultSet executeQuery(String sql){
		try{
			conn = DriverManager.getConnection(url,name,password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public void close(){
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
