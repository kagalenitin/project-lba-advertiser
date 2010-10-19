package com.LBA.Advertiser.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.LBA.Advertiser.bean.AdminBean;
import com.LBA.Advertiser.bean.AdvertiserBean;
import com.LBA.Advertiser.bean.GlobalBean;
import com.LBA.Advertiser.bean.ProductBean;
public class AdminModel {
	static boolean valueInserted;
	static Statement stmtInsert=null;
	static Statement stmtView=null;
	static ResultSet rsSet = null;
	static ResultSet rsRead = null;
	ProductBean productBean = new ProductBean();
	
	
	

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
public int getProductCount(){
	DBConnect.connectDB();
	
	int count=0;

	try {
		stmtView = DBConnect.con.createStatement();
		String qryCount = "SELECT COUNT(*) as cnt FROM Product;";
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


public ProductBean[] viewAllProducts(){
	
	DBConnect.connectDB();
	int count = getProductCount();
	ProductBean[] objBean = new ProductBean[count];
	if(count == 0){
		
	}else{

		try{	
			int i=0;
			//objBean = new ProductBean[count];
			stmtView = DBConnect.con.createStatement();
			
			String qry = "SELECT * FROM Product;";
			rsRead = stmtView.executeQuery(qry);
			while(rsRead.next()){
				objBean[i] = new ProductBean();
				objBean[i].setCount(rsRead.getInt("productid"));
				objBean[i].setProductName(rsRead.getString("productname"));
				objBean[i].setProductdescription(rsRead.getString("productdescription"));
				objBean[i].setPrice(rsRead.getDouble("price"));
				objBean[i].setUsername(rsRead.getString("username"));
				i++;
			}
			
			stmtView.close();
			rsRead.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	return objBean;		
}
}