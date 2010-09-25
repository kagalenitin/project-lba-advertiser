package com.LBA.Advertiser.model;


import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
	ContractBean viewBean1 = new ContractBean();
	
	 
	public void setContract(ContractBean conBeanObject){
		/*This method will insert the new contract details in the Contract table
		 *Connects to DB.
		 **/
		DBConnect.connectDB();
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy/MM/dd");
		System.out.println("THTHHTT");
		//Date getStDt = new Date(conBeanObject.getStartdate());
		
		Date startdate= new Date(conBeanObject.getStartdate());
		
		/*System.out.println("Month"+startdate.getMonth());
		System.out.println("Day"+startdate.getDate());
		System.out.println("Year"+startdate.getYear());*/

		int endmonth=startdate.getMonth()+Integer.parseInt(conBeanObject.getDuration())+1;
		int year=startdate.getYear()+1900;
		String enddate=null;
		
		if(endmonth>12)
			
		{
			endmonth= endmonth % 12;
			System.out.print("result"+endmonth);
			year++;
		}
	
			 enddate=year+"-0"+endmonth+"-0"+startdate.getDate();
			
		
		java.sql.Date jsqlD = java.sql.Date.valueOf(enddate);
		System.out.println("After THTHTT");
		System.out.println(jsqlD);
		try {
			//Logic to insert the value in the table. Inserting value in the 'Contract' DB table.
			//Need to figure out how to insert Advertiser Id 
			System.out.println(conBeanObject.getPaymenttype());
			System.out.println(conBeanObject.getContractdate());
			stmtInsert = DBConnect.con.createStatement();
			java.sql.Date jsqlDate = java.sql.Date.valueOf( "2010-01-31" );
			String qry = "INSERT into contract"+
			" (contractname,username,contractcreatedby,contractdate,space,startdate,enddate,paymenttype,status)"+
			" values ('"+conBeanObject.getContractname()+"','"+GlobalBean.getUsersession()+"','"+conBeanObject.getContractcreatedby()+"','"+conBeanObject.getContractdate()+"','"+conBeanObject.getSpace()+"','"+conBeanObject.getStartdate()+"','"+jsqlD+"','"+conBeanObject.getPaymenttype()+"','InProcess');";
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
				String qry = "SELECT * from Contract where username='"+ GlobalBean.getUsersession()+"';";
				
				int i=0;
				rsSet = stmtView.executeQuery(qry);
				while(rsSet.next()){
					viewBean[i]= new ContractBean();
					viewBean[i].setContractID(String.valueOf(rsSet.getInt("contractID")));
					viewBean[i].setUsername(rsSet.getString("username"));
					viewBean[i].setContractname(rsSet.getString("contractname"));
					viewBean[i].setContractcreatedby(rsSet.getString("contractcreatedby"));
					viewBean[i].setContractdate(rsSet.getString("contractdate"));
					viewBean[i].setSpace(rsSet.getString("space"));
					viewBean[i].setStartdate(rsSet.getString("startdate"));
					viewBean[i].setEnddate(rsSet.getString("enddate"));
					viewBean[i].setPaymenttype(rsSet.getString("paymenttype"));
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
//Start of addition by veenit on 9/13/2010
	public ContractBean viewcurrentContractDetails(){
		/*
		 * This function will retrieve contract details
		*/
		
		try {
			DBConnect.connectDB();
			stmtView = DBConnect.con.createStatement();
			//String qry = "SELECT * from contract where space='"+ UserRegistrationServlet.globalSession +"'";
			String qry = "SELECT * from contract where contractID=(select count(*) from contract)";
			rsSet = stmtView.executeQuery(qry);
			System.out.println(rsSet);
			rsSet.next();
			
			viewBean1.setContractID(rsSet.getString("contractid"));
			viewBean1.setUsername(rsSet.getString("username"));
			viewBean1.setContractname(rsSet.getString("contractname"));
			viewBean1.setContractcreatedby(rsSet.getString("contractcreatedby"));
			viewBean1.setContractdate(rsSet.getString("contractdate"));
			viewBean1.setSpace(rsSet.getString("space"));
			viewBean1.setStartdate(rsSet.getString("startdate"));
			viewBean1.setPaymenttype(rsSet.getString("paymenttype"));
			viewBean1.setEnddate(rsSet.getString("enddate"));
			
			
			stmtView.close();
			rsSet.close();
			DBConnect.disconnectDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return viewBean1;
	}
	//End of addition by Veenit on 09/13/2010
}	
