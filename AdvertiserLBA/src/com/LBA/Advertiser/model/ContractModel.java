package com.LBA.Advertiser.model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.LBA.Advertiser.bean.AdvertiserBean;
import com.LBA.Advertiser.bean.ContractBean;
import com.LBA.Advertiser.servlet.UserRegistrationServlet;

public class ContractModel {
	static boolean valueInserted;
	static Statement stmtInsert=null;
	static Statement stmtView=null;
	static ResultSet rsSet = null;
	ContractBean viewBean = new ContractBean();
	public void setContract(ContractBean conBeanObject){
		/*This method will insert the new contract details in the Contract table
		 *Connects to DB.
		 **/
		DBConnect.connectDB();
		//SimpleDateFormat format = new SimpleDateFormat("MM-dd-yyyy");
		try {
			//Logic to insert the value in the table. Inserting value in the 'Contract' DB table.
			//Need to figure out how to insert Advertiser Id 
			stmtInsert = DBConnect.con.createStatement();
			String qry = "INSERT into contract"+
			" (contractID, space, startdate)"+
			" values (2, '"+conBeanObject.getSpace()+"', '"+conBeanObject.getStartdate()+"');";
			System.out.println(qry);
			int res = stmtInsert.executeUpdate(qry);
			if(res==1)
			{
				valueInserted = true;
			}
			else{
				valueInserted = false;
			}
			stmtInsert.close();
			DBConnect.disconnectDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public boolean getContract(){
		 /* To check whether the user registration was successful. 
		 * This value will be retrieved in showResult.jsp form.
		 */
		return valueInserted;
	}


	
public ContractBean viewContractDetails(){
	/*
	 * This function will retrieve contract details
	*/
	
	try {
		DBConnect.connectDB();
		stmtView = DBConnect.con.createStatement();
		//String qry = "SELECT * from contract where space='"+ UserRegistrationServlet.globalSession +"'";
		String qry = "SELECT * from contract where space='50MB'";
		rsSet = stmtView.executeQuery(qry);
		System.out.println(rsSet);
		rsSet.next();
		
		viewBean.setStartdate(rsSet.getString("startdate"));
		viewBean.setEnddate(rsSet.getString("enddate"));
		viewBean.setSpace(rsSet.getString("space"));
		
		stmtView.close();
		rsSet.close();
		DBConnect.disconnectDB();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return viewBean;
}
}
	/*//Start of addition by Veenit on 9/1/2010
	public boolean Login(AdvertiserBean adBeanObject){
		This method will validate the user credentials
		 *
		DBConnect.connectDB();
		boolean isSuccess = false;
		try {
			//Logic to insert the value in the table. Inserting value in the 'Advertiser' DB table.
			stmtInsert = DBConnect.con.createStatement();
			String qry = "select * from advertiser where username='"+ adBeanObject.getUserName() +"' and password ='"+adBeanObject.getPassword()+"'" ;

			stmtInsert.executeQuery (qry);
			rsSet = stmtInsert.getResultSet();
			boolean valid= rsSet.next();
			if (!valid) 
			{ System.out.println("Sorry, you are not a registered user! Please sign up first"); 
			}
			else if (valid) 
			{ String firstName = rsSet.getString("username");  
			System.out.println("Welcome " + firstName);
			isSuccess = true;
			}
		}
		catch(Exception ex) 
		{ System.out.println("Log In failed: An Exception has occurred! " + ex); } 
		{

		}
		return isSuccess;


	}
	//End of addition by Veenit on 09/21/10
}*/
