package com.LBA.Advertiser.model;


import java.io.IOException;
import com.LBA.Advertiser.bean.GlobalBean;

import java.io.PrintStream;

import java.security.Security;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
	GlobalBean glblBean = new GlobalBean();
	private static final String charset = "0123456789abcdefghijklmnopqrstuvwxyz";
	 public static String randompass ;
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
			String qry = "select firstname, lastname, username, companyname from advertiser where (username='"+ adBeanObject.getUserName() +"' or email='"+ adBeanObject.getEmail() +"') and password ='"+adBeanObject.getPassword()+"'" ;
			
			stmtView.executeQuery (qry);
			rsSet = stmtView.getResultSet();
			boolean valid= rsSet.next();
			if (!valid){
				isSuccess = false; 
			}
			else if (valid){	
				isSuccess = true;
				GlobalBean.setUsersession(rsSet.getString("username"));
				GlobalBean.setCompanyname(rsSet.getString("companyname"));
				GlobalBean.setFirstname(rsSet.getString("firstname"));
				GlobalBean.setLastname(rsSet.getString("lastname"));
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
	
	//Start of Addition by Veenit on 9/18/2010 for email n random string generation
	 public void  getRandomString() {
	        Random rand = new Random(System.currentTimeMillis());
	        StringBuffer randstring = new StringBuffer();
	        for (int i = 0; i < 8; i++) {
	        	
	            int pos = rand.nextInt(charset.length());
	            randstring.append(charset.charAt(pos));
	        }
	        randompass=randstring.toString();
	    }
	 
	public void setPassword(AdvertiserBean adBeanObject){
		/*This method will insert the new user in the Advertiser table of the DB.
		 *Connects to DB.
		 **/
		DBConnect.connectDB();
		try {
			stmtInsert = DBConnect.con.createStatement();
			String qry = "UPDATE Advertiser SET password='"+randompass+"' where email='"+adBeanObject.getEmail()+"'";
				System.out.print(randompass);		
			
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
	
	public boolean retrievePassword(AdvertiserBean adBeanObject){
		boolean isSuccess=false;
		DBConnect.connectDB();
		try{
		
		 final String mailhost = "smtp.gmail.com";
		 Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		 Properties props = new Properties();
		 props.setProperty("mail.transport.protocol", "smtp");
		 props.setProperty("mail.host", mailhost);
		 props.put("mail.smtp.auth", "true");
		 props.put("mail.smtp.port", "465");
		 props.put("mail.smtp.socketFactory.port", "465");
		 props.put("mail.smtp.socketFactory.class",
		 "javax.net.ssl.SSLSocketFactory");
		 props.put("mail.smtp.socketFactory.fallback", "false");
		 props.setProperty("mail.smtp.quitwait", "false");
		 Session session = Session.getInstance(props, new javax.mail.Authenticator() 
		 			{
			 	protected PasswordAuthentication getPasswordAuthentication(){ 
			 		return new PasswordAuthentication("cmpe287.fall10@gmail.com","Nitin@e492" +
			 		"");
			 	}//Add password---
		 		});		
		 MimeMessage message = new MimeMessage(session);
		 message.setSender(new InternetAddress(adBeanObject.getEmail()));
		 message.setSubject( "Password retrieval from AdSpot Admin!");
		 message.setContent("Kindly use the current password as soon as possible. The password will deactivate in 10 days. Your new password is "+randompass, "text/plain");
//		 if (recipients.indexOf(',') > 0) 
//			 message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipients));
//		 	else
		 System.out.println();
		 		message.setRecipient(Message.RecipientType.TO, new InternetAddress(adBeanObject.getEmail()));	
		 Transport.send(message);
		}catch(Exception e){
			e.printStackTrace();
		}
		 return true;
	   }
	

	public boolean validateretrivedetails(AdvertiserBean adBeanObject){
		boolean isSuccess=false;
		DBConnect.connectDB();
		
		
		try {
			stmtView = DBConnect.con.createStatement();
			
			String qryCount = "SELECT * FROM advertiser where username='"+adBeanObject.getUserName()+"' and email='"+adBeanObject.getEmail()+"';";
			stmtView.executeQuery (qryCount);
			rsSet = stmtView.getResultSet();
			System.out.println(rsSet);
			boolean valid= rsSet.next();
			if (!valid){
				isSuccess = false; 
			}
			else if (valid){	
				isSuccess = true;
				//GlobalBean.setUsersession(rsSet.getString("username"));
			}
		}
		catch(Exception ex) { 
			System.out.println("Invalid Username n Email id" + ex); 
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
	
}
