package casecom.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import util.JdbcConnecter;
import casecom.bean.user;

public class RegisterService {
	public boolean inputUser(user user){
		JdbcConnecter jc = new JdbcConnecter(); 
		ResultSet rs = jc.executeQuery("select * from user where username ='"+user.getUsername()+"'");
		try {
			rs.last();
			int rowCount = rs.getRow();
			if(rowCount == 0){
				jc.executeUpdate("insert into user values ('"+user.getUsername()+"', '"+user.getPassword()+"')");
				return true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		jc.close();
		return false;
	}
}
