package com.LBA.Advertiser.model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.LBA.Advertiser.bean.AdvertiserBean;
import com.LBA.Advertiser.bean.ContractBean;
import com.LBA.Advertiser.bean.GlobalBean;
import com.LBA.Advertiser.servlet.UserRegistrationServlet;

public class ContractModel {
	static boolean valueInserted;
	static Statement stmtInsert=null;
	static Statement stmtView=null;
	static ResultSet rsSet = null;
	
	 
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
			//java.sql.Date jsqlD = java.sql.Date.valueOf( "2010-01-31" );
			String qry = "INSERT into contract"+
			" (username, space, startdate,enddate,status)"+
			" values ('veenit', '"+conBeanObject.getSpace()+"', '"+conBeanObject.getStartdate()+"','2010-09-10','InProcess');";
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

	public int getContractCount(){
		
		int count=0;
		DBConnect.connectDB();
		try {
			stmtView = DBConnect.con.createStatement();
			
			String qryCount = "SELECT COUNT(*) as cnt FROM Contract where username='"+ GlobalBean.getUsersession()+"';";
			rsSet = stmtView.executeQuery(qryCount);
			rsSet.next();
			count = rsSet.getInt("cnt");
			
			stmtView.close();
			rsSet.close();
			DBConnect.disconnectDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public ContractBean[] viewContractDetails(){
		/*
		 * This function will retrieve contract details
		*/
		
		int count = getContractCount();
		ContractBean[] viewBean = new ContractBean[count];
		if(count==0){
			
		}else{
			try {
				DBConnect.connectDB();
				stmtView = DBConnect.con.createStatement();
				//String qry = "SELECT * from contract where space='"+ UserRegistrationServlet.globalSession +"'";
				String qry = "SELECT * from Contract where username='kagalenitin'";
				
				int i=0;
				rsSet = stmtView.executeQuery(qry);
				while(rsSet.next()){
					viewBean[i]= new ContractBean();
					viewBean[i].setContractID(String.valueOf(rsSet.getInt("contractID")));
					viewBean[i].setUsername(rsSet.getString("username"));
					viewBean[i].setSpace(rsSet.getString("space"));
					viewBean[i].setStartdate(rsSet.getString("startdate"));
					viewBean[i].setEnddate(rsSet.getString("enddate"));
					viewBean[i].setStatus(rsSet.getString("status"));
					i++;
		
				}

				stmtView.close();
				rsSet.close();
				DBConnect.disconnectDB();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}
		
		return viewBean;
	}

	
}	
