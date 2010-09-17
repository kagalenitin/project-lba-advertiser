package com.LBA.Advertiser.model;

import java.sql.ResultSet;
import java.util.Hashtable;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.LBA.Advertiser.bean.GlobalBean;


public class AdvertisementModel {
	static boolean valueInserted;
	static boolean valueDeleted;
	static Statement stmtInsert=null;
	static Statement stmtView=null;
	static ResultSet rsSet = null;
	static ResultSet rsRead = null;
	
	public int getAdvertisementIDCount(){
		/*
		 * Get the count of the Product for current user 
		 */
		DBConnect.connectDB();
		
		int count=0;
	
		try {
			stmtView = DBConnect.con.createStatement();
			
			String qryCount = "SELECT COUNT(*) as cnt FROM Advertisement";
			rsSet = stmtView.executeQuery(qryCount);
			rsSet.next();
			count = rsSet.getInt("cnt");
			
			stmtView.close();
			rsSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	
	public int getProductCount(){
		/*
		 * Get the count of the Product for current user 
		 */
		DBConnect.connectDB();
		
		int count=0;
	
		try {
			stmtView = DBConnect.con.createStatement();
			
			String qryCount = "SELECT COUNT(*) as cnt FROM Product where username='"+ GlobalBean.getUsersession()+"';";
			rsSet = stmtView.executeQuery(qryCount);
			rsSet.next();
			count = rsSet.getInt("cnt");
			
			stmtView.close();
			rsSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	
	
	public Hashtable<Integer, String> onLoadAddProduct(){
		/*
		 * This function returns the productname for the product combobox while
		 * creating advertisement.
		 */
		
		Hashtable<Integer, String> hashProduct = new Hashtable<Integer, String>();
		try {
				DBConnect.connectDB();
				
				stmtView = DBConnect.con.createStatement();
				String qry = "SELECT productID, productname from PRODUCT where username='"+GlobalBean.getUsersession()+"';";
				rsRead = stmtView.executeQuery(qry);
				while(rsRead.next()){
					hashProduct.put(rsRead.getInt("productID"), rsRead.getString("productname"));
				}
				stmtView.close();
				rsRead.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hashProduct;
		
	}
	
	public int getChannelCount(){
		/*
		 * Get Channel Count. 
		 */
		int count=0;
		DBConnect.connectDB();
		
		try {
			stmtView = DBConnect.con.createStatement();
			String qry = "SELECT COUNT(*) as cnt from Channel";
			rsRead = stmtView.executeQuery(qry);
			rsRead.next();
			count = rsRead.getInt("cnt");
			
			stmtView.close();
			rsRead.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
	}
	
	public Hashtable<Integer, String> loadChannelName(){
		/*
		 * Load all the channels in the drop down of createAdvertisement form.
		 */
		Hashtable<Integer, String> hashChannel = new Hashtable<Integer, String>();
		
		try {
			DBConnect.connectDB();
			stmtInsert = DBConnect.con.createStatement();
			String qry = "SELECT channelID, channelname from Channel";
			rsRead = stmtInsert.executeQuery(qry);
			
			while(rsRead.next()){
				hashChannel.put(rsRead.getInt("channelID"), rsRead.getString("channelname"));
			}
			
			stmtInsert.close();
			rsRead.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return hashChannel;
	}
	
	public int getContractCount(){
		/*
		 * Get the count of the Contract for current user 
		 */
		DBConnect.connectDB();
		
		int count=0;
	
		try {
			stmtView = DBConnect.con.createStatement();
			
			String qryCount = "SELECT COUNT(*) as cnt FROM Contract where username='"+ GlobalBean.getUsersession()+"';";
			rsSet = stmtView.executeQuery(qryCount);
			rsSet.next();
			count = rsSet.getInt("cnt");
			
			stmtView.close();
			rsSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public Hashtable<Integer, String> loadContractName(){
		Hashtable<Integer, String> hashContract = new Hashtable<Integer, String>();
		try {
			stmtView = DBConnect.con.createStatement();
			String qry = "SELECT contractID, contractname from Contract where username='"+ GlobalBean.getUsersession()+"';";
			rsSet = stmtView.executeQuery(qry);
			while(rsSet.next()){
				hashContract.put(rsSet.getInt("contractID"), rsSet.getString("contractname"));
			}
			
			stmtView.close();
			rsSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return hashContract;
			
	}
	
	public void addAdvertisement(){
		/*
		 * To add the Advertisement in the database. I have all the values in the bean now. 
		 * I want to add the record in the database. But before I start adding it, I need to check 
		 * the ad's date is not crossing contract's date. Also, I need to check the ad's file 
		 * size doesn't cross the contract's file size limit.
		 */
		
		DBConnect.connectDB();
		
		try {
			stmtInsert = DBConnect.con.createStatement();
			
			
			
			int rs = stmtInsert.executeUpdate("INSERT INTO image set image='';");
			if (rs==1){
				System.out.println("Successful");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	
}
