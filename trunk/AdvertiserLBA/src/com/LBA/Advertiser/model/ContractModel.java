package com.LBA.Advertiser.model;



import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.ResultSet;


import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;

import javax.swing.text.DateFormatter;

import org.apache.catalina.connector.Request;


import com.LBA.Advertiser.bean.ContractBean;
import com.LBA.Advertiser.bean.GlobalBean;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;


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
		DateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		//System.out.println("--------");
		//Get the date from the conBeanObject.
		//java.util.Date startDate = new java.util.Date(conBeanObject.getStartdate());
		java.sql.Date startDate = java.sql.Date.valueOf(conBeanObject.getStartdate());
		//System.out.println(conBeanObject.getDuration());
		int endmonth=startDate.getMonth()+Integer.parseInt(conBeanObject.getDuration())+1;
		int year=startDate.getYear()+1900;
		String enddate="";
		//System.out.println(startDate.getDate());
		if(endmonth>12)
			
		{
			endmonth= endmonth % 12;
			year++;
		}
		
		//This part of the logic is to add the dashes between the date to make them 
		 // in the format yyyy-MM-dd

 		if(endmonth<10){
 			//System.out.println("1");
 			enddate = year+"-0"+endmonth;
 			if(startDate.getDate()<10){
 				//System.out.println("2");
 				enddate = enddate + "-0"+startDate.getDate();
 			}else{
 			//	System.out.println("3");
 				enddate = enddate + "-"+startDate.getDate();
 			}
 		}else if(startDate.getDate()<10){
 			//System.out.println("4");
 			enddate = year+"-"+ String.valueOf(endmonth) +"-0"+ startDate.getDate();
 		}else{
 			//System.out.println("5");
 			enddate = year +"-"+ String.valueOf(endmonth) +"-"+ startDate.getDate();
 		}
			
		//System.out.println("END DATE: "+ enddate);
		
		//java.sql.Date jsqlD = java.sql.Date.valueOf(enddate);
		try {
			//Logic to insert the value in the table. Inserting value in the 'Contract' DB table.
			//Need to figure out how to insert Advertiser Id 
			//Enddate convert into sql date format.
			//java.util.Date endDateObject = sdformat.parse(enddate);
			//java.sql.Date sqlEndDate = java.sql.Date.valueOf(sdformat.format(endDateObject));
			java.sql.Date sqlEndDate = java.sql.Date.valueOf(enddate);
			//java.sql.Date sqlStartDate = java.sql.Date.valueOf(startDate); 
	     	
			//Contract date convert into sql date format.
			//java.util.Date contractDateObject = new java.util.Date(conBeanObject.getContractdate().toString());
			//System.out.println(contractDateObject);
			java.sql.Date sqlContractDate = java.sql.Date.valueOf(conBeanObject.getContractdate());
			//System.out.println(sqlContractDate);
			stmtInsert = DBConnect.con.createStatement();
			System.out.println("Get user session:"+GlobalBean.getUsersession());
			String qry = "INSERT into contract"+
			" (contractname,username,contractcreatedby,contractdate,space,startdate,enddate,paymenttype,status)"+
			" values ('"+conBeanObject.getContractname()+"','"+GlobalBean.getUsersession()+"','"+conBeanObject.getContractcreatedby()+"','"+sqlContractDate+"','"+conBeanObject.getSpace()+"','"+startDate+"','"+sqlEndDate+"','"+conBeanObject.getPaymenttype()+"','InProcess');";
			System.out.println(qry);
			int res = 0;
			res = stmtInsert.executeUpdate(qry);
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
		System.out.println("GetContract: " +valueInserted);
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
		System.out.println("viewcurrentcontDetailsGLOBAL "+ GlobalBean.getUsersession());
		try {
			DBConnect.connectDB();
			stmtView = DBConnect.con.createStatement();
			//String qry = "SELECT * from contract where space='"+ UserRegistrationServlet.globalSession +"'";
			//String qry = "SELECT *  from contract contractID =(select MAX(contractID) from contract where username='"+ GlobalBean.getUsersession()+"';";
			String qry = "select c1.*, sq1.maxID FROM contract c1, (SELECT MAX(contractID) as maxID from contract where username = '"+ GlobalBean.getUsersession() +"') AS sq1 WHERE contractID = sq1.maxID;";
			System.out.println("View Current Contract: "+qry);
			rsSet = stmtView.executeQuery(qry);
			rsSet.next();
			
			viewBean1.setContractID(rsSet.getString("maxID"));
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
	

	 public void GeneratePDF() throws DocumentException, MalformedURLException, IOException{
		 ContractModel cModel = new ContractModel();
		 ContractBean viewBean = cModel.viewcurrentContractDetails();
		 
		  Document document=new Document();
		  System.out.println("/Stuff/LBAProject/AdvertiserLBA/WebContent/images/"+ viewBean.getContractID()+viewBean.getContractname()+".pdf");
	      PdfWriter.getInstance(document,new FileOutputStream("/Stuff/LBAProject/AdvertiserLBA/WebContent/images/"+ viewBean.getContractID()+viewBean.getContractname()+".pdf"));
	      document.open();  
	      Image image = Image.getInstance ("/Stuff/LBAProject/AdvertiserLBA/WebContent/images/adSpotWeb.gif");
	      Paragraph para=new Paragraph("\n\nContract Details:"+"\n");
	      Paragraph para1=new Paragraph("Contract Id:"+ viewBean.getContractID()+"\n"+"Contract Name:"+viewBean.getContractname()+"\n"+"Contract Created by:"+viewBean.getContractcreatedby()+"\n" +"Contract Space:"+viewBean.getSpace()+"\n"+"Contract Start Date:"+viewBean.getStartdate()+"\n"+"Contract End Date:"+viewBean.getEnddate()+"\n"+"Contract Payment Type:"+viewBean.getPaymenttype()+"\n");
	      Paragraph para3=new Paragraph("\nADSpot Agreement Details:"+"\n");
	      Paragraph para4= new Paragraph("\nAdSpot is wholly owned by the PNV Limited. Advertiser agrees that AdSpot has the right to reject advertising:"+"\n"+ "1. If editors determine that the advertising is inconsistent with their understanding of the community’s objectives, values or image or the aesthetics standards of AdSpot."+"\n"+ " 2. If advertiser fails to meet deadlines for space reservation, ad revisions & approvals or new advertising."+"\n"+" 3. For any other reason or for no reason."+"\n"
          +"Advertising space is sold on a “first-come first-served” basis. Advertiser releases AdSpot from any and all loss, liability or expense occasioned by Advertiser by reason of "+"\n"+"a) any failure to publish advertising pursuant to this contract"+"\n"+" b) failure to return ad media (original artwork, discs, film)."+"\n"+" In such event the advertising is not affected, the Advertising Charge (or the prorated portion thereof) will be refunded to the Advertiser\n");
	      Paragraph para5=new Paragraph("\nContract Signed By: _____________________"+"\n");
	      Paragraph para6=new Paragraph("\nSignature: __________________"+"\n");
	      Paragraph para7=new Paragraph("\nContract Signed on:______________________ "+"\n");
	      document.add(image);
	      document.add(para);
	      document.add(para1);
	      document.add(para3);
	      document.add(para4);
	      document.add(para5);
	      document.add(para6);
	      document.add(para7);
	      document.close(); 
	      
	 }
}	
