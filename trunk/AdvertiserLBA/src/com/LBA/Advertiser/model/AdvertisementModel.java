package com.LBA.Advertiser.model;

import java.sql.ResultSet;
import java.util.Hashtable;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.LBA.Advertiser.bean.AdMerchantBean;
import com.LBA.Advertiser.bean.AdvertisementBean;
import com.LBA.Advertiser.bean.GlobalBean;
import com.LBA.Advertiser.servlet.UserRegistrationServlet;


public class AdvertisementModel {
	static boolean valueInserted;
	static boolean valueDeleted;
	static Statement stmtInsert=null;
	static Statement stmtView=null;
	static ResultSet rsSet = null;
	static ResultSet rsRead = null;
	
	public int getAdvertisementIDCount(){
		/*
		 * Get the count of the Advertisement 
		 */
		DBConnect.connectDB();
		
		int count=0;
	
		try {
			stmtView = DBConnect.con.createStatement();
			
			String qryCount = "select COUNT(*) as cnt from advertisement ad, ad_product ap, product p where ad.adID= ap.adID and p.productID=ap.productID and p.username='"+GlobalBean.getUsersession() +"';";
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
				//String qry = "select * from product where product.username='"+GlobalBean.getUsersession()+"' AND productID NOT IN (SELECT ad_product.productID from ad_product where product.productID = ad_product.productID);";
				String qry = "Select * from product where product.username='"+GlobalBean.getUsersession()+"';";
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
					Statement smlstmnt = DBConnect.con.createStatement();
					int rss = smlstmnt.executeUpdate("INSERT INTO Channel_Ad values ("+ sqlAdBean.getChannelID()+", "+ adID +");");
					if(rss==1){
						valueInserted= true;
					}else{
						valueInserted= false;
					}
					smlstmnt.close();
					
				}
				else{
					valueInserted = false;
				}
				
				stmt.close();	
			}else{
				valueInserted = false;
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
	
	public Hashtable<Integer, String> loadAdName(){
		Hashtable<Integer, String> hashAd = new Hashtable<Integer, String>();
		Statement stmt = null;
		DBConnect.connectDB();
		try {
			stmt= DBConnect.con.createStatement();
			String qry = "select ad.* from advertisement ad, ad_product ap, product p where ad.adID= ap.adID and p.productID=ap.productID and p.username='"+GlobalBean.getUsersession() +"';";
			rsSet = stmt.executeQuery(qry);
			while(rsSet.next()){
				hashAd.put(rsSet.getInt("adID"), rsSet.getString("adname")+"\t"+rsSet.getString("addesc")+"\t");
			}
			
			stmt.close();
			rsSet.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DBConnect.disconnectDB();
		return hashAd;
			
	}
	
	public void addMerchantLocationToAd(AdMerchantBean adBean){
		DBConnect.connectDB();
		
		try {
			stmtInsert = DBConnect.con.createStatement();
			String qry = "INSERT INTO MerchantLocation (longitude, latitude, address, city, state, zip) values ('"+ adBean.getLongitude()+"', '"+ adBean.getLatitude()+"', " +
					"'"+adBean.getAddress() +"', '"+ adBean.getCity()+"', '"+adBean.getState() +"', "+ Integer.parseInt(adBean.getZip()) +");";
			System.out.println(qry);
			int res = stmtInsert.executeUpdate(qry);
			if(res==1){
				System.out.println("In here");
				stmtView = DBConnect.con.createStatement();
				String qry1 = "SELECT MAX(merchantlocationID) as mercID from MerchantLocation";
				rsRead = stmtView.executeQuery(qry1);
				rsRead.next();
				int mercID = rsRead.getInt("mercID");
				System.out.println(mercID);
				Statement stmt = DBConnect.con.createStatement();
				String newqry = "INSERT INTO Ad_Merchant (merchantlocationID, adID) values ("+ mercID +", "+ adBean.getAdID()+");";
				int rs = stmt.executeUpdate(newqry);
				if(rs==1){
					valueInserted = true;
				}else{
					valueInserted = false;
				}
				stmt.close();
			}
			stmtView.close();
			stmtInsert.close();
			rsRead.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnect.disconnectDB();
	}
	
	public boolean getAdMerchantResult(){
			return valueInserted;
	}
	
	public AdvertisementBean[] viewAllAds(){
			
			DBConnect.connectDB();
			int count = getProductCountForAds();
			AdvertisementBean[] objBean = new AdvertisementBean [count];
			//ContractBean[] obj = new ContractBean[count];
			if(count == 0){
				
			}else{
	
				try{	
					int i=0;
					//objBean = new ProductBean[count];
					stmtView = DBConnect.con.createStatement();
					//String qry = "SELECT adname,addesc,adstartdate,adenddate,adsize,p.productid,productname,productdescription,price from advertisement a,ad_product c,product p where a.adID=c.adID and c.productID= p.productID";
					String qry = "SELECT adname,addesc,adstartdate,adenddate,adsize,p.productid,productname,productdescription,price from advertisement a,ad_product c,product p where a.adID=c.adID and c.productID= p.productID and p.username='"+ GlobalBean.getUsersession()+"'";
					rsRead = stmtView.executeQuery(qry);
					//System.out.println(rsRead);
					while(rsRead.next()){
						objBean[i] = new AdvertisementBean();
						objBean[i].setAdName(rsRead.getString("adname"));
						objBean[i].setAdDesc(rsRead.getString("addesc"));
						objBean[i].setAdsize(rsRead.getString("adsize"));
						objBean[i].setAdStartDate(rsRead.getString("adstartdate"));
						objBean[i].setAdEndDate(rsRead.getString("adenddate"));
						objBean[i].setProductID(rsRead.getString("productid"));
						objBean[i].setProductname(rsRead.getString("productname"));
						objBean[i].setProductdescription(rsRead.getString("productdescription"));
						objBean[i].setProductprice(rsRead.getString("price"));
						i++;

					}
					
					//System.out.println(rsRead.getString("contractname"));
					stmtView.close();
					rsRead.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					
			}
			return objBean;
	}
	
	//=======
	public int getProductCountForAds(){
		/*
		 * Get the count of the Product for current user 
		 */
		DBConnect.connectDB();
		
		int count=0;
	
		try {
			stmtView = DBConnect.con.createStatement();
			
			String qryCount = "select COUNT(ad.adID) as cnt from product p, ad_product ad where p.productID=ad.productID and p.username='"+ GlobalBean.getUsersession()+"';";
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
	
	//=======
	
	public int getAdCount(){
		DBConnect.connectDB();
		
		int count=0;
	
		try {
			stmtView = DBConnect.con.createStatement();
			
			//String qryCount = "SELECT COUNT(*) as cnt FROM advertisement";
			String qryCount = "select count(ad.adID) as cnt from advertisement ad, ad_product ap, product p where ad.adID = ap.adID and ap.productID=p.productID and p.username='"+GlobalBean.getUsersession() +"'";
			rsSet = stmtView.executeQuery(qryCount);
			rsSet.next();
			count = rsSet.getInt("cnt");
			//System.out.println(count);
			stmtView.close();
			rsSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	

	public AdvertisementBean[] viewAddDetails(int productID){

		int count = getADCountForWS(productID);
		System.out.println("Count:"+count);
		AdvertisementBean[] viewAdBean = new AdvertisementBean[count];
		int j=0;
		
		if(count>0){
			System.out.println("Inside if");
			try{
				
				DBConnect.connectDB();
				stmtView = DBConnect.con.createStatement();
				String qry = "SELECT ad.adID as adv, ad.adfilelocation as loc, ad.adSize as size," +
						" a.adstartdate as stdt, a.adenddate as eddt, a.adname as name, a.addesc as descrp " +
						"from advertisement a, ad_product ad, product p where a.adID=ad.adID and ad.productID=p.productID and p.productID="+ productID +";";
				rsSet = stmtView.executeQuery(qry);
				while(rsSet.next()){
					viewAdBean[j] = new AdvertisementBean();
					viewAdBean[j].setAdId(rsSet.getString("adv"));
					viewAdBean[j].setFileLocation(rsSet.getString("loc"));
					viewAdBean[j].setAdsize(rsSet.getString("size"));
					viewAdBean[j].setAdStartDate(rsSet.getString("stdt"));
					viewAdBean[j].setAdEndDate(rsSet.getString("eddt"));
					viewAdBean[j].setAdName(rsSet.getString("name"));
					viewAdBean[j].setAdDesc(rsSet.getString("descrp"));
					j++;
				}
				
			stmtView.close();
			rsSet.close();
			}
				
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		for(int i=0; i<j; i++){
			System.out.println(viewAdBean[i].getAdId()+" \n"+viewAdBean[i].getAdName()+"\n"+viewAdBean[i].getAdEndDate());
		}
		return viewAdBean;
	}
	
	public int getADCountForWS(int productID){
		int count=0;
		
		DBConnect.connectDB();
		
		try {
			stmtInsert = DBConnect.con.createStatement();
			String qry ="select count(ad.adID) as cnt from advertisement a, product p, ad_product" +
					" ad where p.productID=ad.productID and ad.adID=a.adID and p.productID="+ productID +";";
			
			rsRead = stmtInsert.executeQuery(qry);
			rsRead.next();
			count = rsRead.getInt("cnt");
			
			stmtInsert.close();
			rsRead.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DBConnect.disconnectDB();
		return count;
	}
}
