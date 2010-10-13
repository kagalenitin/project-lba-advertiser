package com.LBA.Advertiser.servlet;

import java.io.DataInput;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.devlib.schmidt.imageinfo.ImageInfo;

import com.LBA.Advertiser.bean.AdvertisementBean;
import com.LBA.Advertiser.model.AdvertisementModel;


/**
 * Servlet implementation class AdvertisementServlet
 */
public class AdvertisementServlet extends HttpServlet {
	ArrayList<String> arrAdDetails = new ArrayList<String>();
	File file=null;
    
	long contractFileSize = 0;
	
	boolean validFileTypeFlag = false;
    boolean validFileSizeFlag = false;
    FileItem item = null;
    
	AdvertisementBean objAdBean = new AdvertisementBean();
	AdvertisementModel objAdModel = new AdvertisementModel();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdvertisementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		uploadImageFromServlet(request, response);
	}

	public void uploadImageFromServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		int adIDCount = objAdModel.getAdvertisementIDCount() + 1;
		
		
        String reg = "[.*]";
        String replacingtext = "";
        String fileType="";
        long fileSize=0;
         
        
        Pattern pattern = Pattern.compile(reg);
        Matcher matcher;
        StringBuffer buffer = new StringBuffer();
        String finalImage = null;
        String domainName = null;
        
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if (!isMultipart) {
	    	System.out.println("File Not Uploaded");
	    }else{
	    
	    	FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            try {
            		
                items = upload.parseRequest(request);
                System.out.println("items: " + items+" \n");
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
            	item = (FileItem) itr.next();
            	if(item.isFormField()){
            		String value = item.getString();
                    arrAdDetails.add(value);
                    
            	}else{
            		 String itemName = item.getName();
            		 matcher = pattern.matcher(itemName); 
            		 
                    while (matcher.find()) {
                        matcher.appendReplacement(buffer, replacingtext);
                    }
                  
                    if(checkFileType()){
                    	System.out.println("Valid file format");
                    }else{
                    	System.out.println("Invalid file format");
                    }
                    
                    int indexOf = itemName.indexOf(".");
                    domainName = itemName.substring(indexOf);
                    fileSize =  item.getSize();
                    System.out.println("Filesize: "+fileSize);
                    
            	}
            	
            }
            
            /*for(int i=0; i<arrAdDetails.size(); i++){
            	System.out.println("i: "+i +" "+arrAdDetails.get(i));
            }*/
           
            if(checkTotalUsedSpace()){
            	System.out.println("OK You have space available to upload.");
            }else{
            	System.out.println("Not enough space to upload.");
            }
            
         
           
    		//Save the image file in the images folder of the application.
            finalImage = buffer.toString() + String.valueOf(adIDCount) + arrAdDetails.get(2) + domainName;
            
        	String destinationDir = "/Users/nitinkagale/Documents/workspace/AdvertiserLBA/WebContent/images/userUploadedImages/";
            //String destinationDir = request.getContextPath().toString() +"/images/userUploadedImages/";
            //System.out.println("Servlet : " + destinationDir);

        	itr = items.iterator();
			while(itr.hasNext()) {
				 item = (FileItem) itr.next();
				/*
				 * Handle Form Fields.
				 */
				if(item.isFormField()) {
					System.out.println("File Name = "+item.getFieldName()+", Value = "+item.getString());
				} else {
					//Handle Uploaded files.
					System.out.println("Field Name = "+item.getFieldName()+
						", File Name = "+item.getName()+
						", Content type = "+item.getContentType()+
						", File Size = "+item.getSize());
					/*
					 * Write file to the ultimate location.
					 */
					file = new File(destinationDir,finalImage);
					try {
						item.write(file);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				//out.close();
			}
    		//objAdBean.setFileLocation(savedFile.toString());
			
			if(checkDimension()){
				
			}
		
            /*if((validFileSizeFlag==true) && (validFileTypeFlag==true)){
            	System.out.println("Success");
            }else{
            	System.out.println("UnSuccess");
            }*/
            
            /*objAdBean.setAdName(arrAdDetails.get(0));
    		objAdBean.setAdDesc(arrAdDetails.get(1));
    		objAdBean.setProductID(arrAdDetails.get(2));
    		objAdBean.setContractID(arrAdDetails.get(3));
    		objAdBean.setAdStartDate(arrAdDetails.get(4));
    		objAdBean.setAdEndDate(arrAdDetails.get(5));
    		objAdBean.setChannelID(arrAdDetails.get(6));
    		//Append the AdID + productID here and then set the final Image.
    		finalImage = buffer.toString() + String.valueOf(adIDCount) + arrAdDetails.get(2) + domainName;
    		
    		arrAdDetails.add(finalImage);
    		objAdBean.setFileName(arrAdDetails.get(7));
    		
    		*/
	    }
	    
	}
	
	public boolean checkTotalUsedSpace(){
		//Check the totalUsedSize from the contract allotted size. 
        long totalUsedFileSize = objAdModel.checkContractAdSize(Integer.parseInt(arrAdDetails.get(5)));
        System.out.println("TotalUsed File Size in Contract: "+ totalUsedFileSize);
        
        String tempFileSize="";
        if(arrAdDetails.get(8).contains("MB")){
        	tempFileSize = arrAdDetails.get(8).replace("MB", "");
        }
        contractFileSize = Integer.parseInt(tempFileSize) * 1024;
        System.out.println("contractfileSize==="+contractFileSize);
        if(totalUsedFileSize < contractFileSize){
        	validFileSizeFlag = true; 
        }
        else{
        	validFileSizeFlag = false;
        	
        }
        
		return validFileSizeFlag;
	}

	public boolean checkFileType(){
		  //Checking file types:
        String[] arrFileType= {"image/jpeg", "image/gif", "image/png", "image/bmp", "video/quicktime", "video/mp4", "audio/x-pn-realaudio", "audio/mpeg"};
        
		for(int i=0; i<arrFileType.length; i++){
			if(item.getContentType().equals(arrFileType[i])){
				validFileTypeFlag=true;
			}else{
    			validFileTypeFlag=false;
    		}
		}
        
		return validFileTypeFlag;
	}
	
	public boolean checkDimension(){
		boolean flag = false;
		//  The file dimension is a bit skeptical. I am not able to get the exact dimension of the uploaded image
            DataInput dis;
			try {
				dis = new DataInputStream(new FileInputStream(file));
				ImageInfo ii = new ImageInfo();
	            ii.setInput(dis);
	            ii.setDetermineImageNumber(true);
	            ii.setCollectComments(true);
	            if (!ii.check()) {
	            	System.err.println("Not a supported image file format.");
	            }
	            System.out.println(ii.getHeight()+"  width"+ ii.getWidth());
	            if((ii.getHeight()>450) && (ii.getWidth()>150)){
	            	flag = true;
	            }else{
	            	flag=false;
	            }
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
		return flag;
	}
}

//==== Stick this code if required. LATER ON ===

/*
	
		try{
			//ServletFileUpload.isMultipartContent(request);
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		    System.out.println("request: "+request+" "+isMultipart);
		    if (!isMultipart) {
		      System.out.println("File Not Uploaded");
		    }else{
		    	
		    	System.out.println("Inside call");	
		    	
		    	FileItemFactory factory = new DiskFileItemFactory();
	            ServletFileUpload upload = new ServletFileUpload(factory);
	            List items = null;

	            try {
	            	System.out.println("Inside call 1");	
	                items = upload.parseRequest(request);
	                System.out.println("items: " + items);
	            } catch (FileUploadException e) {
	                e.printStackTrace();
	            }
	           
	            Iterator itr = items.iterator();
	            while (itr.hasNext()) {
	                FileItem item = (FileItem) itr.next();
	                
	                if (item.isFormField()) {
	                    String name = item.getFieldName();
	                    System.out.println("name: " + name);
	                    String value = item.getString();
	                    System.out.println("value: " + value);
	                } else{
	                	 String itemName = item.getName();
	                        /*Random generator = new Random();
	                        int r = Math.abs(generator.nextInt());
	                        
	                        String reg = "[.*]";
	                        String replacingtext = "";
	                        System.out.println("Text before replacing is:-" + itemName);
	                        Pattern pattern = Pattern.compile(reg);
	                        Matcher matcher = pattern.matcher(itemName);
	                        StringBuffer buffer = new StringBuffer();

	                        while (matcher.find()) {
	                            matcher.appendReplacement(buffer, replacingtext);
	                        }
	                        int IndexOf = itemName.indexOf(".");
	                        String domainName = itemName.substring(IndexOf);
	                        System.out.println("domainName: " + domainName);
	                         
	                        String finalimage = itemName;
	                        System.out.println("Final Image===" + finalimage);

	                        //File savedFile = new File("/Users/nitinkagale/Documents/workspace/AdvertiserLBA/" + finalimage);
	                        //item.write(savedFile);
	                        
	                        System.out.println("<html>");
	                        System.out.println("<body>");
	                        System.out.println("<table><tr><td>");
	                        System.out.println("<img src=" + finalimage + "/>");
	                        System.out.println("</td></tr></table>");

	                       /* DBConnect.connectDB();
	                        
	                        Statement stmt = DBConnect.con.createStatement();
	                        int res = stmt.executeUpdate("INSERT INTO images Values ('"+finalimage +"');");
	                        if(res==1){
	                        	System.out.println("Query Executed Successfully++++++++++++++");
	                            System.out.println("image inserted successfully");
	                            
	                        }else{
	                        	System.out.println("Query Executed UNSUCCESSFULLY++++++++++++++");
	                            System.out.println("image not inserted");
	                            
	                        }
	                        System.out.println("</body>");
                            System.out.println("</html>");
                            	
                            DBConnect.disconnectDB();

	                }
	            }
	        }
		}catch(Exception ex){
			
			System.out.println(ex.getMessage());
		}
		
		

*/