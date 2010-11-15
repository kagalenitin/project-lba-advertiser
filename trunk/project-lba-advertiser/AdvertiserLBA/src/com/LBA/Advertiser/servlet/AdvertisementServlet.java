package com.LBA.Advertiser.servlet;

import java.io.DataInput;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	public static boolean find = false;
	static File file = null;

	long contractFileSize = 0;

	boolean validFileTypeFlag = false;
	boolean validFileSizeFlag = false;
	FileItem item = null;

	AdvertisementBean objAdBean = new AdvertisementBean();
	AdvertisementModel objAdModel = new AdvertisementModel();
	static String contType = "";

	public String entireMsg = "";
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdvertisementServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		uploadImageFromServlet(request, response);
	}

	public void uploadImageFromServlet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int adIDCount = objAdModel.getAdvertisementIDCount() + 1;

		String reg = "[.*]";
		String replacingtext = "";
		String fileType = "";
		String fileSize = "";

		Pattern pattern = Pattern.compile(reg);
		Matcher matcher;
		StringBuffer buffer = new StringBuffer();
		String finalImage = null;
		String domainName = null;

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		try {
			if (!isMultipart) {
				// System.out.println("File Not Uploaded");
				getServletContext().getRequestDispatcher("/errorhandle.jsp")
						.forward(request, response);
			} else {

				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List items = null;
				try {

					items = upload.parseRequest(request);
					System.out.println("items: " + items + " \n");
				} catch (FileUploadException e) {
					e.printStackTrace();
				}

				Iterator itr = items.iterator();
				while (itr.hasNext()) {
					item = (FileItem) itr.next();
					if (item.isFormField()) {
						String value = item.getString();
						arrAdDetails.add(value);

					} else {
						String itemName = item.getName();
						matcher = pattern.matcher(itemName);

						while (matcher.find()) {
							matcher.appendReplacement(buffer, replacingtext);
						}

						if (checkFileType()) {
							System.out.println("Valid file format");
						} else {
							System.out.println("Invalid file format");
							entireMsg = entireMsg.concat("Invalid file format");
						}

						int indexOf = itemName.indexOf(".");
						domainName = itemName.substring(indexOf);
						fileSize = String.valueOf(item.getSize());
						// System.out.println("Filesize: "+fileSize);
						contType = item.getContentType();
						// System.out.println("ContTpe: "+contType);
					}

				}

				/*
				 * for(int i=0; i<arrAdDetails.size(); i++){
				 * System.out.println("i: "+i +" "+arrAdDetails.get(i)); }
				 */

				if (checkTotalUsedSpace()) {
					// System.out.println("OK You have space available to upload.");
				} else {
					System.out.println("Not enough space to upload.");
					entireMsg = entireMsg.concat("Not enough space to upload.");
				}

				// Save the image file in the images folder of the application.
				finalImage = buffer.toString() + String.valueOf(adIDCount)
						+ arrAdDetails.get(2) + domainName;
				// Remember to change the location
				// String destinationDir =
				// "/Users/nitinkagale/Documents/workspace/AdvertiserLBA/WebContent/images/userUploadedImages/";
				String strDirectoy = request.getSession().getServletContext()
						.getRealPath("/images/");
				boolean success = (new File(strDirectoy)).mkdir();
				if (success) {
					System.out
							.println("Directory:  created");
				}
				File dir = new File(strDirectoy);

				// String destinationDir =
				// "/Stuff/LBAProject/AdvertiserLBA/WebContent/images/";
				// String destinationDir = request.getContextPath().toString()
				// +"/images/userUploadedImages/";
				// System.out.println("Servlet : " + destinationDir);

				itr = items.iterator();
				while (itr.hasNext()) {
					item = (FileItem) itr.next();
					/*
					 * Handle Form Fields.
					 */
					if (item.isFormField()) {
						// System.out.println("File Name = "+item.getFieldName()+", Value = "+item.getString());
					} else {
						// Handle Uploaded files.
						// System.out.println("Field Name = "+item.getFieldName()+
						// ", File Name = "+item.getName()+
						// ", Content type = "+item.getContentType()+
						// ", File Size = "+item.getSize());
						/*
						 * Write file to the ultimate location.
						 */
						file = new File(dir, finalImage);
						try {
							item.write(file);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					// out.close();
				}

				boolean retValue = checkDimension();
				System.out.println("retValue;" + retValue);
				if (find == true) {
					System.out.println("Video format, no dimension check");
				} else if (retValue) {
					System.out.println("Dimension looks good");
				} else {
					entireMsg = entireMsg.concat("Dimensions are not good");
				}

				if ((validFileSizeFlag == true) && (validFileTypeFlag == true)
						&& ((find == true) || (retValue == true))) {
					// Insert everything in the arrAdDetails.

					objAdBean.setAdName(arrAdDetails.get(0));
					objAdBean.setAdDesc(arrAdDetails.get(1));
					objAdBean.setProductID(arrAdDetails.get(2));
					objAdBean.setContractID(arrAdDetails.get(5));
					objAdBean.setAdStartDate(arrAdDetails.get(11));
					objAdBean.setAdEndDate(arrAdDetails.get(12));
					objAdBean.setChannelID(arrAdDetails.get(13));
					objAdBean.setFileName(finalImage);
					String filePath = "/AdvertiserLBA/images/" + finalImage;
					objAdBean.setFileLocation(filePath);
					objAdBean.setFileSize(fileSize);
					System.out.println(arrAdDetails.size() + " is the size.");
					arrAdDetails.clear();

					objAdModel.addAdvertisement(objAdBean);
					request.setAttribute("adcreated", objAdModel);
					getServletContext().getRequestDispatcher("/resultofad.jsp")
							.forward(request, response);
				} else {
					// Traverse the item and delete the file which is been
					// created at the location.
					// System.out.println("Something went wrong");
					System.out.println(strDirectoy + finalImage);
					itr = items.iterator();
					while (itr.hasNext()) {
						item = (FileItem) itr.next();
						/*
						 * Handle Form Fields.
						 */
						if (item.isFormField()) {
							System.out.println("File Name = "
									+ item.getFieldName() + ", Value = "
									+ item.getString());
						} else {
							// Handle Uploaded files.
							// System.out.println("Field Name = "+item.getFieldName()+
							// ", File Name = "+item.getName()+
							// ", Content type = "+item.getContentType()+
							// ", File Size = "+item.getSize());
							/*
							 * Write file to the ultimate location.
							 */
							file = new File(dir, finalImage);
							try {
								if (file.delete())
									System.out.println("File deleted");
								else
									System.out.println("File not deleted.");
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

						}

					}
					request.setAttribute("witherror", entireMsg);
					getServletContext().getRequestDispatcher("/resultofad.jsp")
							.forward(request, response);

				}
			}

		} catch (Exception ex) {
			getServletContext().getRequestDispatcher("/errorhandle.jsp")
					.forward(request, response);
		}

	}

	public boolean checkTotalUsedSpace() {
		// Check the totalUsedSize from the contract allotted size.
		System.out.println("Arr add L: " + arrAdDetails.get(5));
		long totalUsedFileSize = objAdModel.checkContractAdSize(Integer
				.parseInt(arrAdDetails.get(5)));
		// System.out.println("TotalUsed File Size in Contract: "+
		// totalUsedFileSize);

		String tempFileSize = "";
		if (arrAdDetails.get(8).contains("MB")) {
			tempFileSize = arrAdDetails.get(8).replace("MB", "");
		}
		contractFileSize = Integer.parseInt(tempFileSize) * 1024;
		// System.out.println("contractfileSize==="+contractFileSize);
		if (totalUsedFileSize < contractFileSize) {
			validFileSizeFlag = true;
		} else {
			validFileSizeFlag = false;
		}

		return validFileSizeFlag;
	}

	public boolean checkFileType() {
		// Checking file types:
		String[] arrFileType = { "image/jpeg", "image/gif", "image/png",
				"image/bmp", "video/quicktime", "video/mp4",
				"audio/x-pn-realaudio", "audio/mpeg" };
		System.out.println("ContTpe" + item.getContentType());
		for (int i = 0; i < arrFileType.length; i++) {
			if (item.getContentType().equals(arrFileType[i])) {
				// System.out.println("Matches the file");
				validFileTypeFlag = true;
				break;
			} else {
				validFileTypeFlag = false;
			}
		}
		// System.out.println("ValidFlagType:"+validFileTypeFlag);
		return validFileTypeFlag;
	}

	public static boolean checkDimension() {
		boolean flag = false;

		DataInput dis;
		// The file dimension is a bit skeptical. I am not able to get the exact
		// dimension of the uploaded image
		String arrFile[] = { "video/quicktime", "video/mp4",
				"audio/x-pn-realaudio", "audio/mpeg" };
		for (int i = 0; i < arrFile.length; i++) {
			if (contType.equals(arrFile[i])) {
				// System.out.println("The video format is not supported for dimension checking");
				find = true;
				break;
			}
		}

		if (find == true) {
			return false;
		} else {

			try {
				dis = new DataInputStream(new FileInputStream(file));
				ImageInfo ii = new ImageInfo();
				ii.setInput(dis);
				ii.setDetermineImageNumber(true);
				ii.setCollectComments(true);
				if (!ii.check()) {
					// System.err.println("Not a supported image file format.");
					return false;
				}
				// System.out.println(ii.getHeight()+"  width"+ ii.getWidth());
				// if(((ii.getWidth()>=350) && (ii.getWidth()<=400)) &&
				// ((ii.getHeight()>=400) && (ii.getHeight()<=500))){
				if ((ii.getWidth() > 50) && (ii.getHeight() > 50)) {
					flag = true;
				} else {
					flag = false;
				}
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
}