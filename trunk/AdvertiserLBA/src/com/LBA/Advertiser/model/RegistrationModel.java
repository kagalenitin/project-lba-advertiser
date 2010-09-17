package com.LBA.Advertiser.model;


import java.io.IOException;
import com.LBA.Advertiser.bean.GlobalBean;

import java.io.PrintStream;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sun.net.smtp.SmtpClient;


import com.LBA.Advertiser.bean.AdvertiserBean;
import com.LBA.Advertiser.servlet.UserRegistrationServlet;
//import com.sun.tools.internal.ws.processor.model.Request;
public class RegistrationModel {
	static boolean valueInserted;
	static Statement stmtInsert=null;
	static Statement stmtView=null;
	static ResultSet rsSet = null;
	AdvertiserBean editBean = new AdvertiserBean();
	
	public void setUserRegistration(AdvertiserBean adBeanObject){
		/*This method will insert the new user in the Advertiser table of the DB.
		 *Connects to DB.
		 **/
		DBConnect.connectDB();
		try {
			//Logic to insert the value in the table. Inserting value in the 'Advertiser' DB table.
			stmtInsert = DBConnect.con.createStatement();
			String qry = "INSERT into Advertiser"+
						" (companyname, username, password, firstname, lastname, address, phone, email)"+
						" values ('"+ adBeanObject.getCompanyName()+"', '"+adBeanObject.getUserName() +"', '"+adBeanObject.getPassword() +"', '"+adBeanObject.getFirstName()+"',"+
						"'"+ adBeanObject.getLastName()+"', '"+adBeanObject.getAddress()+"', "+adBeanObject.getPhone()+", '"+adBeanObject.getEmail() +"');";
			
			int res = 0;
			res = stmtInsert.executeUpdate(qry);
			if(res==1){
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
	
	public boolean getRegistrationStatus(){
		/* To check whether the user registration was successful. 
		 * This value will be retrieved in showResult.jsp form.
		 * */
		return valueInserted;
	}
	
	//Start of addition by Veenit on 9/1/2010
	public boolean userLogin(AdvertiserBean adBeanObject){
		/*This method will validate the user credentials
		 **/
		DBConnect.connectDB();
		boolean isSuccess = false;
		try {
			//To check username and password compatibility. 
			//We will be allowing user to either login using username or email address.
			stmtView = DBConnect.con.createStatement();
			String qry = "select firstname, lastname, username from advertiser where (username='"+ adBeanObject.getUserName() +"' or email='"+ adBeanObject.getEmail() +"') and password ='"+adBeanObject.getPassword()+"'" ;
			
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
	
	public AdvertiserBean editUserDetail(){
		/*
		 * This function will retrieve user details to edit..
		 * ENSURE THAT WE HAVE KEPT USERNAME AND EMAIL NOT TO BE CHANGED. 
		 * WE MAY HAVE TO CHANGE IT LATER ON.
		 */
		
		try {
			DBConnect.connectDB();
			stmtView = DBConnect.con.createStatement();
			String qry = "SELECT * from Advertiser where username='"+ UserRegistrationServlet.globalSession +"' OR email='"+ UserRegistrationServlet.globalSession +"';";
			
			rsSet = stmtView.executeQuery(qry);
			rsSet.next();
			editBean.setUserName(rsSet.getString("username"));
			editBean.setAddress(rsSet.getString("address"));
			editBean.setCompanyName(rsSet.getString("companyname"));
			editBean.setFirstName(rsSet.getString("firstname"));
			editBean.setLastName(rsSet.getString("lastname"));
			editBean.setPassword(rsSet.getString("password"));
			editBean.setPhone(rsSet.getString("phone"));
			editBean.setEmail(rsSet.getString("email"));
			
			stmtView.close();
			rsSet.close();
			DBConnect.disconnectDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return editBean;
	}
	
	public void setEditRegistration(AdvertiserBean adBeanObject){
		/*
		 * This function will set the edited details of the user.
		 * valueInserted=true will return success.
		 */
		
		try {
			DBConnect.connectDB();
			stmtInsert = DBConnect.con.createStatement();
			
			String qry = "UPDATE Advertiser SET companyname='"+adBeanObject.getCompanyName() +"', username='"+adBeanObject.getUserName() +"', lastname='"+
			adBeanObject.getLastName()+"', address='"+adBeanObject.getAddress()+"', password='"+adBeanObject.getPassword()+"', email='"+
			adBeanObject.getEmail()+"', phone='"+ adBeanObject.getPhone()+"' WHERE username='"+UserRegistrationServlet.globalSession
			+ "' OR email='"+ UserRegistrationServlet.globalSession+"';";
			
			int res = stmtInsert.executeUpdate(qry);
			if(res==1){
				valueInserted = true;
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
	
	public boolean retrievePassword(AdvertiserBean adBean){
		boolean isSuccess=false;
		DBConnect.connectDB();
		
		String from="hectomaniaster@gmail.com";
		String to = adBean.getEmail();
		
		try{
		     SmtpClient client = new SmtpClient("smtp.gmail.com");
		     client.from(from);
		     client.to(to);
		     PrintStream message = client.startMessage();
		     message.println("To: " + to);
		     message.println("Subject:  Sending email from JSP!");
		     message.println("This was sent from a JSP page!");
		     message.println("Cool beans! :-)");
		     client.closeServer();
		     isSuccess=true;
		  }
		  catch (IOException e){	
		     System.out.println("ERROR SENDING EMAIL:"+e);
		  }
		  return isSuccess; 
	}
	
}