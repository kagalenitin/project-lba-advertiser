package com.LBA.Advertiser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.LBA.Advertiser.bean.AdminBean;
import com.LBA.Advertiser.bean.AdvertiserBean;
import com.LBA.Advertiser.model.*;
/**
 * Servlet implementation class UserRegistrationServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AdminModel objModel = new AdminModel();
    AdminBean adminBean = new AdminBean();
    HttpSession session = null;
    public static String globalSession = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
		
		if(postAction.equals("admin_post_login")){
			//Call login fn. in servlet
			adminLoginInServlet(request, response);
		}	 		
	}
	
	/* Trying to define all the detailed functions outside post, just for clean coding */
	public void adminLoginInServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//The user may either set username or email.
		if(request.getParameter("username").contains("@")){
			adminBean.setUserName("");
			adminBean.setEmail(request.getParameter("username"));
		}else {
			adminBean.setUserName(request.getParameter("username"));
			adminBean.setEmail("");
		}
		adminBean.setPassword(request.getParameter("password"));
		
		if(objModel.userLogin(adminBean)){
			//Check whether the user logs in using username or emailID.
			if(adminBean.getUserName().equals("")){
				request.getSession().setAttribute("user_session",adminBean.getEmail());
				session = request.getSession(true);
				globalSession = (String) session.getValue("user_session");
				getServletContext().getRequestDispatcher("/adminhome.jsp").forward(request, response);
			}else if(adminBean.getEmail().equals("")){
				request.getSession().setAttribute("user_session",adminBean.getUserName());
				session = request.getSession(true);
				globalSession = (String) session.getValue("user_session");
				getServletContext().getRequestDispatcher("/adminhome.jsp").forward(request, response);
			}
			
		}else{
			//Still need to handle the error page. We can create an error page !
			response.sendRedirect("./adminlogin.jsp?loginfailed=false");
		}
		
	}
	///Commented by Veenit on 9/15/2010
	/*public void userRegistrationInServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
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
	}*/
	
}