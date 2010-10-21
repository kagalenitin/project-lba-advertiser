package com.LBA.Advertiser.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LBA.Advertiser.bean.GlobalBean;
import com.LBA.Advertiser.model.AdminModel;
import com.LBA.Advertiser.model.AdvertisementModel;
import com.LBA.Advertiser.model.ChannelModel;
import com.LBA.Advertiser.model.ContractModel;
import com.LBA.Advertiser.model.ProductModel;
import com.LBA.Advertiser.model.RegistrationModel;
import com.itextpdf.text.DocumentException;

/**
 * Servlet implementation class NavigationServlet
 */
public class NavigationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RegistrationModel objReg = new RegistrationModel();
    ProductModel objProduct = new ProductModel();
    ContractModel objContract = new ContractModel();
    AdvertisementModel objAdModel = new AdvertisementModel();
    ChannelModel objChannel = new ChannelModel();
    AdminModel objAdminProduct = new AdminModel();


    /**
     * @see HttpServlet#HttpServlet()
     */
    public NavigationServlet() {
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
		
		String postAction = request.getParameter("page"); 
		
		if(postAction.equals("unregistereduser")){
			//Redirects to NEW USER registration.jsp
			getServletContext().getRequestDispatcher("/registration.jsp").forward(request, response);
		}else if(postAction.equals("forgotpassword")){
			//Redirects to forgot password .jsp.
			getServletContext().getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
		}else if(postAction.equals("logout")){
			//unsets user_session variable and logout user. I am not sure how to unset the session var.
			request.setAttribute("user_session", "");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}else if(postAction.equals("newlogin")){
			//New REGISTERED user login.
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}else if(postAction.equals("userhome")){
			//Send user to homepage after login.
			getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
		}else if(postAction.equals("edituser")){
			//Send user to editUserpage.
			request.setAttribute("editadvertiser", objReg);
			getServletContext().getRequestDispatcher("/editUserDetails.jsp").forward(request, response);
		}else if(postAction.equals("viewcontract")){
			//View all contract
			objContract.viewContractDetails();
    		request.setAttribute("viewcontract1", objContract);
    		getServletContext().getRequestDispatcher("/viewContract.jsp").forward(request, response);
    	}else if(postAction.equals("contract")){
        	getServletContext().getRequestDispatcher("/contract.jsp").forward(request, response);;
    	}else if(postAction.equals("createad")){
    		request.setAttribute("loadproduct", objAdModel);
    		getServletContext().getRequestDispatcher("/createadvertisement.jsp").forward(request, response);;
    	}else if(postAction.equals("createproduct")){
    		getServletContext().getRequestDispatcher("/createproduct.jsp").forward(request, response);;
    	}else if(postAction.equals("viewproducts")){
    		request.setAttribute("viewall", objProduct);
    		objProduct.viewAllProducts();
    		getServletContext().getRequestDispatcher("/viewallProduct.jsp").forward(request, response);;
    	}else if(postAction.equals("adminuser")){
    		//request.setAttribute("viewall", objProduct);
    		//objProduct.viewAllProducts();
    		getServletContext().getRequestDispatcher("/adminlogin.jsp").forward(request, response);;
    	}else if(postAction.equals("editcontract")){
    		getServletContext().getRequestDispatcher("/viewContract.jsp").forward(request, response);;
    	}else if(postAction.equals("createchannel")){
    		getServletContext().getRequestDispatcher("/createchannel.jsp").forward(request, response);;
    	}
    	else if(postAction.equals("viewchannel")){
    		request.setAttribute("viewchannel", objChannel);
    		objChannel.viewChannelDetails();
    		getServletContext().getRequestDispatcher("/viewallchannel.jsp").forward(request, response);;
    	}
    	else if(postAction.equals("admin_product")){
    		request.setAttribute("viewall", objAdminProduct);
    		objAdminProduct.viewAllProducts();
    		getServletContext().getRequestDispatcher("/adminviewallproducts.jsp").forward(request, response);;
    	}else if(postAction.equals("createpdf")){
    		//PDF Generation of the contract created.
    		try {
				objContract.GeneratePDF();
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		getServletContext().getRequestDispatcher("/pdf.jsp").forward(request, response);
    	}else if(postAction.equals("admerchant")){
    		request.setAttribute("loadad", objAdModel);
    		getServletContext().getRequestDispatcher("/admerchant.jsp").forward(request, response);
    	}else if(postAction.equals("viewcatalog")){
    		request.setAttribute("viewallads", objAdModel);
    		objAdModel.viewAllAds();
    		//System.out.println("error not found");
    		getServletContext().getRequestDispatcher("/viewallads.jsp").forward(request, response);
    	}

	}
}
