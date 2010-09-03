package com.LBA.Advertiser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.LBA.Advertiser.bean.AdvertiserBean;
import com.LBA.Advertiser.model.*;
/**
 * Servlet implementation class UserRegistrationServlet
 */
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RegistrationModel objModel = new RegistrationModel();
    AdvertiserBean objBean = new AdvertiserBean();
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
		/*Receive the page request from the "index.jsp" and redirect according to the requested page.
		 * 
		 */
		String action = request.getParameter("page");
		
		if(action.equals("newuser")){
			//Redirects to new user registration.jsp
			request.setAttribute("maxid", objModel);
			getServletContext().getRequestDispatcher("/registration.jsp").forward(request, response);
		}else if (action.equals("forgotpassword")){
			//Redirects to forgot password .jsp.
		}
		else if (action.equals("login"))
		{
			objBean.setUserName(request.getParameter("username"));
			objBean.setPassword(request.getParameter("password"));
			if (objModel.Login(objBean))
					{request.getSession().setAttribute("username",request.getParameter("username"));
					 //Session.
				     getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
				
			}
			else
			{
				response.sendRedirect("./index.jsp?login=false");
			}
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*I need to figure out a way to handle javascript + not 
		 *repeating the request.getParameter() everytime.
		 *For registration of new advertiser.*/  
		
		
			 AdvertiserBean advertiserBean = new AdvertiserBean();
			 advertiserBean.setAdvertiserID(request.getParameter("advertiserID"));
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
		
		getServletContext().getRequestDispatcher("/showResult.jsp").forward(request, response);
		
	}

}
