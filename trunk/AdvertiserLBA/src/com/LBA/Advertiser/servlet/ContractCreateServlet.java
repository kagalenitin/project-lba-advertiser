package com.LBA.Advertiser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LBA.Advertiser.bean.ContractBean;
import com.LBA.Advertiser.model.ContractModel;

public class ContractCreateServlet extends HttpServlet
{

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
    	
    	/*if(postAction.equals("viewcontract")){
    		request.setAttribute("viewcontract", objModel);
    		getServletContext().getRequestDispatcher("/viewContract.jsp").forward(request, response);}
    	
    	else*/ if(postAction.equals("contract")){
        	getServletContext().getRequestDispatcher("/contract.jsp").forward(request, response);;

    	}else if(postAction.equals("post_contract")){
    		
			contractBean.setSpace(request.getParameter("space"));
			contractBean.setStartdate(request.getParameter("startdate"));
			contractBean.setDuration(request.getParameter("duration"));
		
			objModel.setContract(contractBean);
			request.setAttribute("registrationDone", objModel);
			getServletContext().getRequestDispatcher("/contract.jsp").forward(request, response);;
    	}else if(postAction.equals("editid")){
    		//Infact only show him the view page.
    	}
    	
    	
    }	 
}