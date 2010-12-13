package com.LBA.Advertiser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LBA.Advertiser.bean.AdMerchantBean;
import com.LBA.Advertiser.model.AdvertisementModel;

/**
 * Servlet implementation class SetADMerchant
 */
public class SetADMerchant extends HttpServlet {
	AdMerchantBean objAdMBean = new AdMerchantBean();
	AdvertisementModel objAdModel = new AdvertisementModel();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SetADMerchant() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String postAction = request.getParameter("page");
		if (postAction.equals("adset")) {
			objAdMBean.setAdID(request.getParameter("ad"));
			objAdMBean.setAddress(request.getParameter("address"));
			objAdMBean.setCity(request.getParameter("city"));
			objAdMBean.setState(request.getParameter("state"));
			objAdMBean.setZip(request.getParameter("zip"));
			objAdMBean.setLatitude(request.getParameter("latitude"));
			objAdMBean.setLongitude(request.getParameter("longitude"));
			try {
				objAdModel.addMerchantLocationToAd(objAdMBean);
				if (objAdModel.getAdMerchantResult()) {
					request.setAttribute("success", objAdModel);
					getServletContext()
							.getRequestDispatcher("/setlocation.jsp").forward(
									request, response);
					;
				} else {
					request.setAttribute("unsuccess",
							"Sorry ! Ad location was not set.");
					getServletContext()
							.getRequestDispatcher("/setlocation.jsp").forward(
									request, response);
					;
				}
			} catch (Exception ex) {
				getServletContext().getRequestDispatcher("/errorhandle.jsp")
						.forward(request, response);
			}
		}

	}

}
