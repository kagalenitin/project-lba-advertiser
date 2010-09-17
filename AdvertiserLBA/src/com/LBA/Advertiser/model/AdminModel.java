package com.LBA.Advertiser.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.LBA.Advertiser.bean.AdminBean;
import com.LBA.Advertiser.bean.AdvertiserBean;
import com.LBA.Advertiser.bean.GlobalBean;
public class AdminModel {
	static boolean valueInserted;
	static Statement stmtInsert=null;
	static Statement stmtView=null;
	static ResultSet rsSet = null;
	
	

public boolean userLogin(AdminBean adminBeanObject){
		/*This method will validate the user credentials
		 **/
		DBConnect.connectDB();
		boolean isSuccess = false;
		try {
			//To check username and password compatibility. 
			//We will be allowing user to either login using username or email address.
			stmtView = DBConnect.con.createStatement();
			String qry = "select firstname, lastname, username from administrator where username='"+ adminBeanObject.getUserName() +"' and password ='"+adminBeanObject.getPassword()+"'" ;
			
			stmtView.executeQuery (qry);
			rsSet = stmtView.getResultSet();
			boolean valid= rsSet.next();
			if (!valid){
				isSuccess = false; 
			}
			else if (valid){	
				isSuccess = true;
				GlobalBean.setUsersession(rsSet.getString("username"));
			}
		}
		catch(Exception ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + ex); 
		} 
		
		try {
			stmtView.close();
			rsSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnect.disconnectDB();
		return isSuccess;

	}
	//End of addition by Veenit on 09/2/10
}