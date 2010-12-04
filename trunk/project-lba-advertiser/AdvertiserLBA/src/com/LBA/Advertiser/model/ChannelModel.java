package com.LBA.Advertiser.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;

import com.LBA.Advertiser.bean.ChannelBean;

public class ChannelModel {
	static boolean valueInserted;
	static Statement stmtInsert = null;
	static Statement stmtView = null;
	static ResultSet rsSet = null;
	ChannelBean viewBean1 = new ChannelBean();

	public void setChannel(ChannelBean chBeanObject) {
		/*
		 * This method will insert the new channel details based on category.
		 */
		DBConnect.connectDB();
		try {
			stmtInsert = DBConnect.con.createStatement();
			String qry = "INSERT into channel"
					+ " (channelname,channeldescription)" + " values ('"
					+ chBeanObject.getChannelname() + "','"
					+ chBeanObject.getChanneldescription() + "');";
			System.out.println(qry);
			int res = stmtInsert.executeUpdate(qry);
			
			if (res == 1) {
				//Select the ChannelID from Channel table;
				int channelID = getChannelID();
				stmtView = DBConnect.con.createStatement();
				String qry1 = "INSERT INTO Cat_Channel (categoryID, channelID) values("
					+ chBeanObject.getCategoryID() +","+channelID+");";
				int rs = stmtView.executeUpdate(qry1);
				if(rs==1){
					System.out.println(qry1);
					valueInserted = true;
				}else{
					valueInserted = false;
				}
				
			} else {
				valueInserted = false;
			}
			stmtInsert.close();
			DBConnect.disconnectDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public int getChannelID(){
		DBConnect.connectDB();
		int chID =0;
		try {
			Statement stmt = DBConnect.con.createStatement();
			String qr = "SELECT MAX(channelID) as chID from Channel;";
			ResultSet rs = stmt.executeQuery(qr);
			rs.next();
			chID = rs.getInt("chID");
			
			stmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return chID;
	}
	public boolean getChannel() {
		/*
		 * To check whether the user registration was successful. This value
		 * will be retrieved in showResult.jsp form.
		 */
		return valueInserted;
	}

	// Need to work on this method--Veenit 9/26/2010
	public int getChannelCount() {

		int count = 0;
		DBConnect.connectDB();
		try {
			stmtView = DBConnect.con.createStatement();

			String qryCount = "SELECT COUNT(*) as cnt FROM channel;";
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

	public ChannelBean[] viewChannelDetails() {
		/*
		 * This function will retrieve contract details
		 */

		int count = getChannelCount();
		ChannelBean[] viewBean = new ChannelBean[count];
		if (count == 0) {

		} else {
			try {
				DBConnect.connectDB();
				stmtView = DBConnect.con.createStatement();
				// String qry = "SELECT * from contract where space='"+
				// UserRegistrationServlet.globalSession +"'";
				String qry = "SELECT * from channel;";
				int i = 0;
				rsSet = stmtView.executeQuery(qry);
				while (rsSet.next()) {
					viewBean[i] = new ChannelBean();
					viewBean[i].setChannelid(rsSet.getString("channelid"));
					viewBean[i].setChannelname(rsSet.getString("channelname"));
					viewBean[i].setChanneldescription(rsSet
							.getString("channeldescription"));
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

	// Start of addition by veenit on 9/13/2010
	public ChannelBean viewcurrentChannelDetails() {
		/*
		 * This function will retrieve contract details
		 */

		try {
			DBConnect.connectDB();
			stmtView = DBConnect.con.createStatement();
			// String qry = "SELECT * from contract where space='"+
			// UserRegistrationServlet.globalSession +"'";
			String qry = "SELECT * from channel where channelid=(select count(*) from channel)";
			rsSet = stmtView.executeQuery(qry);
			rsSet.next();

			viewBean1.setChannelid(rsSet.getString("channelid"));
			viewBean1.setChannelname(rsSet.getString("channelname"));
			viewBean1.setChanneldescription(rsSet
					.getString("channeldescription"));

			stmtView.close();
			rsSet.close();
			DBConnect.disconnectDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return viewBean1;
	}
	// End of addition by Veenit on 09/13/2010
	
	public Hashtable<Integer, String> loadCategoryName(){
		Hashtable<Integer, String> hashCategory = new Hashtable<Integer, String>();
		ResultSet rsRead = null;
		try {
			DBConnect.connectDB();
			
			stmtView = DBConnect.con.createStatement();
			String qry = "Select * from category ORDER BY categoryID;";
			rsRead = stmtView.executeQuery(qry);
			while(rsRead.next()){
				hashCategory.put(rsRead.getInt("categoryID"), rsRead.getString("categoryname")+"\t"+rsRead.getString("descr")+"\t");
			}
			
			stmtView.close();
			rsRead.close();
			DBConnect.disconnectDB();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return hashCategory;
	}
	
	public int getCategoryCount(){
		DBConnect.connectDB();
		
		int count=0;
	
		try {
			stmtView = DBConnect.con.createStatement();
			
			String qryCount = "SELECT COUNT(*) as cnt FROM Category;";
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
	
}
