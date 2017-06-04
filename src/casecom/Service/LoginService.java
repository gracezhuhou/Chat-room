package casecom.Service;

/**
 * The LoginService method
 *
 * This method is used to access the database.
 * @param 
 * @param 
 * @throws 
 * @throws 
 */

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import util.JdbcConnecter;
import casecom.bean.user;

public class LoginService {

	public boolean checkPassword(user user){
		JdbcConnecter jc = new JdbcConnecter();    
		ResultSet rs = jc.executeQuery("select password from user where username ='"+user.getUsername()+"'");
		String password = "";
		try {
			while(rs.next()) {
				password = rs.getString("password");
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		jc.close();

		if(password.equals(user.getPassword())){
			return true;
		}
		else{
			return false;
		}
			
	}

}