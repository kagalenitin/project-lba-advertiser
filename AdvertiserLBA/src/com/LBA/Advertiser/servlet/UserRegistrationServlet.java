package com.LBA.Advertiser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.LBA.Advertiser.bean.AdvertiserBean;
import com.LBA.Advertiser.model.*;
/**
 * Servlet implementation class UserRegistrationServlet
 */
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RegistrationModel objModel = new RegistrationModel();
    AdvertiserBean advertiserBean = new AdvertiserBean();
    HttpSession session = null;
    public static String globalSession = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*Redirect any by mistake calls of doGet to doPost method.
		 * 
		 */
		doPost(request, response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*I need to figure out a way to handle javascript + not 
		 *repeating the request.getParameter() everytime.
		 *For registration of new advertiser.*/  
		String postAction = request.getParameter("page"); 
		if(postAction.equals("post_login")){
			//Call login fn. in servlet
			userLoginInServlet(request, response);
		}else if(postAction.equals("post_register")){
			//Call registration fn. in servlet.
			userRegistrationInServlet(request, response);
		}else if(postAction.equals("post_editdetails")){
			//Edit user details.
			editRegistrationInServlet(request, response);
		}else if(postAction.equals("post_forgot")){
			// Post forgot password event.
			forgotPasswordInServlet(request, response);
		}
		 		
	}
	
	/* Trying to define all the detailed functions outside post, just for clean coding */
	public void userLoginInServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//The user may either set username or email.
		if(request.getParameter("username").contains("@")){
			advertiserBean.setUserName("");
			advertiserBean.setEmail(request.getParameter("username"));
		}else {
			advertiserBean.setUserName(request.getParameter("username"));
			advertiserBean.setEmail("");
		}
		advertiserBean.setPassword(request.getParameter("password"));
		
		if(objModel.userLogin(advertiserBean)){
			//Check whether the user logs in using username or emailID.
			if(advertiserBean.getUserName().equals("")){
				request.getSession().setAttribute("user_session",advertiserBean.getEmail());
				getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
			}else if(advertiserBean.getEmail().equals("")){
				request.getSession().setAttribute("user_session",advertiserBean.getUserName());
				getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
			}
			session = request.getSession(true);
			globalSession = (String) session.getValue("user_session");
			
		}else{
			//Still need to handle the error page. We can create an error page !
			response.sendRedirect("./index.jsp?loginfailed=false");
		}
		
	}
	
	public void userRegistrationInServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		 advertiserBean.setUserName(request.getParameter("username"));
		 advertiserBean.setPassword(request.getParameter("password"));
		 advertiserBean.setFirstName(request.getParameter("firstname"));
		 advertiserBean.setLastName(request.getParameter("lastname"));
		 advertiserBean.setCompanyName(request.getParameter("companyname"));
		 advertiserBean.setAddress(request.getParameter("address"));
		 advertiserBean.setPhone(request.getParameter("phone"));
		 advertiserBean.setEmail(request.getParameter("email"));
			
		objModel.setUserRegistration(advertiserBean);
		request.setAttribute("registrationDone", objModel);
		request.setAttribute("success", "true");	
		getServletContext().getRequestDispatcher("/registration.jsp").forward(request, response);
	}
	
	public void editRegistrationInServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		 
		 advertiserBean.setUserName(request.getParameter("username"));
		 advertiserBean.setPassword(request.getParameter("password"));
		 advertiserBean.setFirstName(request.getParameter("firstname"));
		 advertiserBean.setLastName(request.getParameter("lastname"));
		 advertiserBean.setCompanyName(request.getParameter("companyname"));
		 advertiserBean.setAddress(request.getParameter("address"));
		 advertiserBean.setPhone(request.getParameter("phone"));
		 advertiserBean.setEmail(request.getParameter("email"));
			
		objModel.setEditRegistration(advertiserBean);
		request.setAttribute("editadvertiser", objModel);
		request.setAttribute("saveddetails", "true");
			
		getServletContext().getRequestDispatcher("/editUserDetails.jsp").forward(request, response);
	}
	
	public void forgotPasswordInServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		advertiserBean.setUserName(request.getParameter("username"));
		advertiserBean.setEmail(request.getParameter("email"));
		objModel.getRandomString();
		
		if(objModel.validateretrivedetails(advertiserBean)){
			if(objModel.retrievePassword(advertiserBean)){
				objModel.setPassword(advertiserBean);
				objModel.getRandomString();
				//objModel.setPassword(advertiserBean);
				//Redirect the user to login page. and print a message the mail is sent to you.
				getServletContext().getRequestDispatcher("/index.jsp?forgot=true").forward(request, response);
			} else {
					getServletContext().getRequestDispatcher("/index.jsp?forgot=false").forward(request, response);
				}
			}
		else{
			response.sendRedirect("./forgotpassword.jsp?success=false");
		}
		
				
	}
	
}