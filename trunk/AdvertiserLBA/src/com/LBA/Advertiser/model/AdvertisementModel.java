package com.LBA.Advertiser.model;

import java.sql.ResultSet;
import java.util.Hashtable;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.LBA.Advertiser.bean.AdvertisementBean;
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
				String qry = "select * from product where product.username='"+GlobalBean.getUsersession()+"' AND productID NOT IN (SELECT ad_product.productID from ad_product where product.productID = ad_product.productID);";

				rsRead = stmtView.executeQuery(qry);
				while(rsRead.next()){
					hashProduct.put(rsRead.getInt("productID"), rsRead.getString("productname")+"\t"+rsRead.getString("productdescription")+"\t"+ rsRead.getDouble("price")+"\t");
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
			String qry = "SELECT * from Contract where username='"+ GlobalBean.getUsersession()+"';";
			rsSet = stmtView.executeQuery(qry);
			while(rsSet.next()){
				hashContract.put(rsSet.getInt("contractID"), rsSet.getString("contractname")+"\t"+rsSet.getString("contractcreatedby")+"\t"+rsSet.getDate("contractdate")+"\t"+rsSet.getString("space")
				+"\t"+rsSet.getDate("startdate")+"\t"+rsSet.getDate("enddate")+"\t");
			}
			
			stmtView.close();
			rsSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return hashContract;
			
	}
	
	public void addAdvertisement(AdvertisementBean sqlAdBean){
		/*
		 * To add the Advertisement in the database. I have all the values in the bean now. 
		 * I want to add the record in the database. But before I start adding it, I need to check 
		 * the ad's date is not crossing contract's date. Also, I need to check the ad's file 
		 * size doesn't cross the contract's file size limit.
		 */
		
		DBConnect.connectDB();
		
		try {
			stmtInsert = DBConnect.con.createStatement();
			
			//This logic is to convert the java date to sql date.
			 
			
			java.sql.Date sqlStartDate = java.sql.Date.valueOf(sqlAdBean.getAdStartDate());
			System.out.println(sqlStartDate);
			java.sql.Date sqlEndDate = java.sql.Date.valueOf(sqlAdBean.getAdEndDate());
			System.out.println(sqlEndDate);
			String qty = "INSERT INTO Advertisement (adname, addesc, contractID, adstartdate, adenddate) values ('"+ sqlAdBean.getAdName()+"','"+sqlAdBean.getAdDesc() +"', "+sqlAdBean.getContractID() +", '"+sqlStartDate +"', '"+sqlEndDate +"');";
			System.out.println(qty);
			int rs = stmtInsert.executeUpdate(qty);
			if (rs==1){
				System.out.println("Successful");
				stmtView = DBConnect.con.createStatement();
				String qry = "SELECT MAX(adID) as adID from Advertisement";
				rsRead = stmtView.executeQuery(qry);
				rsRead.next();
				
				int adID = rsRead.getInt("adID");
				//rsRead.close();
				//stmtView.close();
				Statement stmt = DBConnect.con.createStatement();
				int res = stmt.executeUpdate("INSERT INTO AD_Product (adID, productID, adfilelocation, adSize) values("+ adID + ", "+ sqlAdBean.getProductID()+ ", '"+ sqlAdBean.getFileLocation() + "', '"+ sqlAdBean.getFileSize() + "')");
				if(res==1){
					valueInserted= true;
				}
				else{
					valueInserted = false;
				}
				
				stmt.close();
			}
			
			rsRead.close();
			stmtInsert.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean getInsertedResult(){
		//Return the result of the value inserted.
		return valueInserted;
	}
	
	public long checkContractAdSize(int contractID){
		long totalSize = 0;
		DBConnect.connectDB();
		
		try {
			stmtInsert = DBConnect.con.createStatement();
			
			String qry = "Select SUM(ad.adSize) as totalSize, c.contractID, a.adID from contract c, ad_product ad, advertisement a where a.adID = ad.adID and c.contractID="+contractID+" and c.contractID = a.contractID and c.username='"+GlobalBean.getUsersession() +"';";
			//select SUM(ad.adSize) as totalSize, c.contractID, a.adID from contract c, ad_product ad, advertisement a where a.adID = ad.adID and c.contractID = a.contractID; 
			//select SUM(ad.adSize) as totalSize, c.contractID, a.adID from contract c, ad_product ad, advertisement a where a.adID = ad.adID and c.contractID = a.contractID and c.contractID=2;
			System.out.println(qry);
			rsRead = stmtInsert.executeQuery(qry);
			rsRead.next();
			
			totalSize = rsRead.getLong("totalSize");
			
			stmtInsert.close();
			rsRead.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalSize;
	}
	
	
}
