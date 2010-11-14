package com.LBA.Advertiser.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.LBA.Advertiser.bean.GlobalBean;
import com.LBA.Advertiser.bean.ProductBean;

public class ProductModel {
	static boolean valueInserted;
	static boolean valueDeleted;
	static Statement stmtInsert=null;
	static Statement stmtView=null;
	static ResultSet rsSet = null;
	static ResultSet rsRead = null;
	ProductBean productBean = new ProductBean();
	
	public void setProductDetails(ProductBean beanObj){
		DBConnect.connectDB();
		try {
			stmtInsert = DBConnect.con.createStatement();
			String qry ="INSERT INTO Product (productname, productdescription, price, username) values " +
			"('"+beanObj.getProductName()+"', '"+beanObj.getProductdescription()+"', "+ beanObj.getPrice() +
			", '"+GlobalBean.getUsersession()+"');";
			System.out.println(qry);
			int res = stmtInsert.executeUpdate(qry);
			
			if(res==1){
				valueInserted= true;
			}else{
				valueInserted = false;
			}
			
			stmtInsert.close();
			DBConnect.disconnectDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public boolean getProductDetails(){
		return valueInserted;
	}
	
	public int getProductCount(){
		int count=0;
	
		try {
			DBConnect.connectDB();
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
		DBConnect.disconnectDB();
		return count;
	}
	
	public ProductBean[] viewAllProducts(){
		
		
		int count = getProductCount();
		ProductBean[] objBean = new ProductBean[count];
		if(count == 0){
			
		}else{

			try{	
				int i=0;
				DBConnect.connectDB();
				//objBean = new ProductBean[count];
				stmtView = DBConnect.con.createStatement();
				String qry = "SELECT * FROM Product where username='"+ GlobalBean.getUsersession()+"';";
				rsRead = stmtView.executeQuery(qry);
				while(rsRead.next()){
					objBean[i] = new ProductBean();
					objBean[i].setCount(rsRead.getInt("productid"));
					objBean[i].setProductName(rsRead.getString("productname"));
					objBean[i].setProductdescription(rsRead.getString("productdescription"));
					objBean[i].setPrice(rsRead.getDouble("price"));
					i++;
				}
				
				stmtView.close();
				rsRead.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}
		DBConnect.disconnectDB();
		return objBean;		
		
	}
	
	public void editProductDetail(int productID){
		try {
			DBConnect.connectDB();
			stmtView = DBConnect.con.createStatement();
			String qry = "SELECT * FROM Product where productID="+productID+";";
			rsRead = stmtView.executeQuery(qry);
			rsRead.next();
			
			//System.out.println(rsRead.getString("productname")+"\t"+rsRead.getString("productdesc")+"\t"+rsRead.getInt("productID")+"\t"+rsRead.getDouble("price"));
			productBean.setCount(rsRead.getInt("productID"));
			productBean.setAdvertiserName(rsRead.getString("username"));
			productBean.setProductName(rsRead.getString("productname"));
			productBean.setProductdescription(rsRead.getString("productdescription"));
			productBean.setPrice(rsRead.getDouble("price"));
			
			stmtView.close();
			rsRead.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnect.disconnectDB();
		
	}
	
	public ProductBean getEditProductDetail(){
		
		return productBean;
	}
	
	public boolean updateProduct(ProductBean beanObject){
		
		try {
			DBConnect.connectDB();
			stmtInsert = DBConnect.con.createStatement();
			String qry = "UPDATE Product SET productname='"+
						 beanObject.getProductName() + "', productdescription='"+ beanObject.getProductdescription()+"'"+
						 ", price="+beanObject.getPrice()+" WHERE productID="+beanObject.getCount()+";";
			
			int res = stmtInsert.executeUpdate(qry);
			if(res==1){
				valueInserted = true;
			}else{
				valueInserted = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnect.disconnectDB();
		return valueInserted;
		
	}
	
	public boolean deleteProduct(ProductBean beanObject){
		/*
		 * 
		 *  Select the merchant location if its thr. 
		 *	
		 *  select COUNT(ad.merchantlocationID) from ad_merchant ad, ad_product ap where ad.adID = ap.adID and ap.productID=2;
		 *  //Select the advertisementIDs to delete from the merchantlocation table.
		 * 
		 *  delete merchantlocation, ad_merchant from merchantlocation, ad_merchant where (merchantlocation.merchantlocationID = ad_merchant.merchantlocationID) and (ad_merchant.adID IN (select DISTINCT a.adID from ad_product ad, advertisement a, product p where p.productID = ad.productID and p.productID=2;)); 
		 *  
		 *  Select the ads to be deleted
		 *  select DISTINCT a.adID from ad_product ad, advertisement a, product p where p.productID = ad.productID and p.productID=2;
		 *  delete advertisement, ad_product from advertisement, ad_product where (advertisement.adID=ad_product.adID) and (ad_product.productID=1);
		 *  
		 *  Select the product to be deleted.
		 *	select 	DISTINCT a.adID from ad_product ad, advertisement a, product p where p.productID = ad.productID and p.productID=1;
		 *  Have to modify this method, take care of the cascading.
		 */

		Statement stmtMerchant = null;
		Statement stmtAd = null;
		ResultSet rsMerchant = null;
		
		try{
			DBConnect.connectDB();
			//beanObject.setCount(7);
			stmtInsert = DBConnect.con.createStatement();
			stmtMerchant = DBConnect.con.createStatement();
			stmtAd = DBConnect.con.createStatement();
			Statement stmtTemp = DBConnect.con.createStatement();
			boolean empty=true;
			
			String qry1 = "select DISTINCT m.merchantlocationID as mID from merchantlocation m, ad_merchant ad, ad_product ap where ap.adId=ad.adID and ap.productID ="+beanObject.getCount() +";";
			System.out.println(qry1);
			rsMerchant = stmtMerchant.executeQuery(qry1);
			while(rsMerchant.next()){
				empty=false;
			}
			if(empty){
				System.out.println(empty+ " means it is empty.");
				//The recordset was empty.
			}else{
				//Delete the records.
				rsMerchant.absolute(1);
				String dqlQry1= "delete merchantlocation, ad_merchant from merchantlocation, ad_merchant where (merchantlocation.merchantlocationID = ad_merchant.merchantlocationID) and (ad_merchant.adID IN (select DISTINCT a.adID from ad_product ad, advertisement a, product p where p.productID = ad.productID and p.productID="+ beanObject.getCount() +"));";
				//String delQry = "DELETE FROM merchantlocation WHERE merchantlocationID= "+rsMerchant.getInt("mID")+";";
				System.out.println(dqlQry1);
				stmtTemp.executeUpdate(dqlQry1);
			}
			
			boolean empty1 = true;
			//Value deleted successfully. Now delete the ads.
			String qry2 = "select DISTINCT ad.adID from ad_product ad, product p where p.productID="+ beanObject.getCount() +";";
			System.out.println("AD QRY: "+ qry2);
			rsRead = stmtAd.executeQuery(qry2);
			while(rsRead.next()){
				empty1=false;
			}
			if(empty1){
				System.out.println(empty1+ " means it is empty.");
			}else{
				//Delete the records;
				rsRead.absolute(1);
				String delQry1 = "delete advertisement, ad_product from advertisement, ad_product where (advertisement.adID=ad_product.adID) and (ad_product.productID="+ beanObject.getCount() +");";
				System.out.println("Del ADs: "+ delQry1);
				stmtTemp.executeUpdate(delQry1);
			}
			
			String qry = "DELETE FROM Product where productID="+beanObject.getCount()+";";
			System.out.println("Product del: "+qry);
            int res = stmtInsert.executeUpdate(qry);
            if (res==1){
            	valueDeleted = true;
            }else{
            	valueDeleted = false;
            }
            stmtMerchant.close();
			stmtTemp.close();
			rsMerchant.close();
			stmtAd.close();
			rsRead.close();
			
		} catch(SQLException e){
			e.printStackTrace();
		}	
		DBConnect.disconnectDB();
		return valueInserted;

	}
}
