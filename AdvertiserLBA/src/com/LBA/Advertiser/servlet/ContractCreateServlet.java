package com.LBA.Advertiser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LBA.Advertiser.bean.AdvertiserBean;
import com.LBA.Advertiser.bean.ContractBean;
import com.LBA.Advertiser.model.ContractModel;
import com.LBA.Advertiser.model.RegistrationModel;

public class ContractCreateServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ContractModel objModel = new ContractModel();
    ContractBean objBean = new ContractBean();
    
    public ContractCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void doGet(HttpServletRequest request,HttpServletResponse response){
/*String action = request.getParameter("page");
		
		if(action.equals("newuser")){
			//Redirects to new user registration.jsp
			request.setAttribute("maxid", objModel);
			try {
				getServletContext().getRequestDispatcher("/registration.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (action.equals("forgotpassword")){
			//Redirects to forgot password .jsp.
		}
		*/
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	
    	ContractBean contractBean = new ContractBean();
    	contractBean.setEmail(request.getParameter("emailID"));
    	contractBean.setDescription(request.getParameter("description"));
    	contractBean.setContractID(request.getParameter("contractID"));
    	contractBean.setContractname(request.getParameter("contractname"));
    	contractBean.setSpace(request.getParameter("lastname"));
    	contractBean.setStartdate(request.getParameter("startdate"));
    	contractBean.setEnddate(request.getParameter("enddate"));
		 
		 
		
    	objModel.setContract(contractBean);
    	request.setAttribute("registrationDone", objModel);
    	
    	getServletContext().getRequestDispatcher("/contractconfirmation.jsp").forward(request, response);
        }
}