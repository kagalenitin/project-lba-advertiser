package com.LBA.Advertiser.servlet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LBA.Advertiser.bean.ContractBean;
import com.LBA.Advertiser.model.ContractModel;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.tomcat.jni.Directory;
public class ContractCreateServlet extends HttpServlet
{
	ContractModel objContract = new ContractModel();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ContractModel objModel = new ContractModel();
    ContractBean contractBean = new ContractBean();
    
    public ContractCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{

			doPost(request, response);
		
		
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	
    	//SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
    	String postAction = request.getParameter("page"); 
    	System.out.println(postAction);
    	/*if(postAction.equals("viewcontract")){
    		request.setAttribute("viewcontract", objModel);
    		getServletContext().getRequestDispatcher("/viewContract.jsp").forward(request, response);}
    	
    	else*/ 
    	try{
    		if(postAction.equals("contract")){
            	getServletContext().getRequestDispatcher("/contract.jsp").forward(request, response);;

        	}else if(postAction.equals("post_contract")){
        		contractBean.setSpace(request.getParameter("space"));
    			contractBean.setContractname(StringEscapeUtils.escapeSql(request.getParameter("contractname")));
    			contractBean.setContractcreatedby(StringEscapeUtils.escapeSql(request.getParameter("contractcreatedby")));
    			contractBean.setContractdate(request.getParameter("contractdate"));
    			contractBean.setStartdate(request.getParameter("startdate"));
    			contractBean.setDuration(request.getParameter("duration"));
    			contractBean.setPaymenttype(request.getParameter("paymenttype"));
    			objModel.setContract(contractBean);
    			
    			if(objModel.getContract()){
    				request.setAttribute("registrationDone", objModel);
    				getServletContext().getRequestDispatcher("/viewcurrentcontract.jsp").forward(request, response);;
    			}else{
    				String msg="Contract not created.";
    				System.out.println(msg);
    				request.setAttribute("notdone", msg);
    				response.sendRedirect("NavigationServlet?page=contract&contractCreate=false");
    			}
    			
        	}else if(postAction.equals("postcreatepdf")){
	    		System.out.println(request.getParameter("contractID"));
				//objContract.GeneratePDF();
        		ContractBean contractBean = new ContractBean();
	    		contractBean.setSpace(request.getParameter("space"));
    			contractBean.setContractname(StringEscapeUtils.escapeSql(request.getParameter("contractname")));
    		//	contractBean.setContractcreatedby(StringEscapeUtils.escapeSql(request.getParameter("contractcreatedby")));
    			contractBean.setContractdate(request.getParameter("contractdate"));
    			contractBean.setStartdate(request.getParameter("startdate"));
    			contractBean.setDuration(request.getParameter("duration"));
    			contractBean.setPaymenttype(request.getParameter("paymenttype"));
    			contractBean.setContractID(request.getParameter("contractID"));
	    		
    			Document document=new Document();
    			String path = request.getContextPath();
    			//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    			//System.out.println(basePath);
    			  String prjDir ="";
    			  System.out.println(path+" is the path");
    			  //prjDir = request.getRealPath("/images/pdf");
    			  File flDir = new File(path+"/images/pdf");
    			  System.out.println(flDir);
    			  if(!flDir.exists()){
    				  if(flDir.mkdir()){
    					  System.out.println("Dir created!"); 
    				  }
    				  
    			  }
	    		  System.out.println(flDir+"/" + contractBean.getContractID()+contractBean.getContractname()+".pdf");
	    		  
	    	
	    		  
	    		  
	    	     try {
	    	    	  
	    			  PdfWriter.getInstance(document,new FileOutputStream(flDir+"/"+ contractBean.getContractID()+contractBean.getContractname()+".pdf"));
	    			  document.open();  
	    		      //Image image = Image.getInstance (path+"adSpotWeb.gif");
	    		      Paragraph para=new Paragraph("\n\nContract Details:"+"\n");
	    		      //"Contract Created by:"+contractBean.getContractcreatedby()+"\n" +
	    		      Paragraph para1=new Paragraph("Contract Id:"+ contractBean.getContractID()+"\n"+"Contract Name:"+contractBean.getContractname()+"\n"+ "Contract Space:"+contractBean.getSpace()+"\n"+"Contract Start Date:"+contractBean.getStartdate()+"\n"+"Contract End Date:"+contractBean.getEnddate()+"\n"+"Contract Payment Type:"+contractBean.getPaymenttype()+"\n");
	    		      Paragraph para3=new Paragraph("\nADSpot Agreement Details:"+"\n");
	    		      Paragraph para4= new Paragraph("\nAdSpot is wholly owned by the PNV Limited. Advertiser agrees that AdSpot has the right to reject advertising:"+"\n"+ "1. If editors determine that the advertising is inconsistent with their understanding of the community’s objectives, values or image or the aesthetics standards of AdSpot."+"\n"+ " 2. If advertiser fails to meet deadlines for space reservation, ad revisions & approvals or new advertising."+"\n"+" 3. For any other reason or for no reason."+"\n"
	    	          +"Advertising space is sold on a “first-come first-served” basis. Advertiser releases AdSpot from any and all loss, liability or expense occasioned by Advertiser by reason of "+"\n"+"a) any failure to publish advertising pursuant to this contract"+"\n"+" b) failure to return ad media (original artwork, discs, film)."+"\n"+" In such event the advertising is not affected, the Advertising Charge (or the prorated portion thereof) will be refunded to the Advertiser\n");
	    		      Paragraph para5=new Paragraph("\nContract Signed By: _____________________"+"\n");
	    		      Paragraph para6=new Paragraph("\nSignature: __________________"+"\n");
	    		      Paragraph para7=new Paragraph("\nContract Signed on:______________________ "+"\n");
	    		     // document.add(image);
	    		      document.add(para);
	    		      document.add(para1);
	    		      document.add(para3);
	    		      document.add(para4);
	    		      document.add(para5);
	    		      document.add(para6);
	    		      document.add(para7);
	    		      document.close(); 
	    		} catch (FileNotFoundException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		} catch (DocumentException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		} catch (IOException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	    		 
	    		String msg="PDF Created";
	    		//request.setAttribute("print", msg);
	    		getServletContext().getRequestDispatcher("/pdf.jsp").forward(request, response);
	    	}
	
    	}catch(Exception ex){
    		ex.printStackTrace();
    		getServletContext().getRequestDispatcher("/errorhandle.jsp").forward(request, response);
    	}
    	    	
    }	 
}