package com.LBA.Advertiser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LBA.Advertiser.bean.GlobalBean;
import com.LBA.Advertiser.bean.ProductBean;
import com.LBA.Advertiser.model.ProductModel;
import org.apache.commons.lang.StringEscapeUtils;
/**
 * Servlet implementation class ProductServlet
 */
public class ProductServlet extends HttpServlet {
	ProductBean productBeanObj = new ProductBean();
	ProductModel objProductModel = new ProductModel();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
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
		try {
			String postAction = request.getParameter("page");

			if (postAction.equals("post_product")) {
				setProductFromServlet(request, response);
			} else if (postAction.equals("editid")) {
				// From view all products to editproduct
				String productID = request.getParameter("productid");
				objProductModel.editProductDetail(Integer.parseInt(productID));
				request.setAttribute("editdelete", objProductModel);
				getServletContext().getRequestDispatcher("/editProduct.jsp").forward(request, response);
			} else if (postAction.equals("editsave")) {
				// To edit the product
				editProductFromServlet(request, response);
			} else if (postAction.equals("delconfirm")) {
				// Transfer data from editProduct.jsp to deleteProduct.jsp to
				// confirm if user wants to delete.
				productBeanObj.setCount(Integer.parseInt(request
						.getParameter("productid")));
				objProductModel.editProductDetail(productBeanObj.getCount());
				request.setAttribute("confirmdelete", objProductModel);
				getServletContext().getRequestDispatcher("/deleteProduct.jsp").forward(request, response);
			} else if (postAction.equals("backtoall")) {
				// From deleteProduct.jsp to viewallProduct.jsp
				request.setAttribute("viewall", objProductModel);
				objProductModel.viewAllProducts();
				getServletContext().getRequestDispatcher("/viewallProduct.jsp").forward(request, response);
			} else if (postAction.equals("backtoedit")) {
				// From deleteProduct.jsp to editProduct.jsp page.
				String productID = request.getParameter("productid");
				objProductModel.editProductDetail(Integer.parseInt(productID));
				request.setAttribute("editdelete", objProductModel);
				getServletContext().getRequestDispatcher("/editProduct.jsp").forward(request, response);
			} else if (postAction.equals("deldata")) {
				deleteProductFromServlet(request, response);
			}

		} catch (Exception ex) {
			getServletContext().getRequestDispatcher("/errorhandle.jsp")
					.forward(request, response);
		}
	}

	public void setProductFromServlet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		productBeanObj.setAdvertiserName(GlobalBean.getUsersession());
		productBeanObj.setProductName(StringEscapeUtils.escapeSql(request.getParameter("productname")));
		productBeanObj.setProductdescription(StringEscapeUtils.escapeSql(request.getParameter("productdesc")));
		productBeanObj.setPrice(Double.parseDouble(request.getParameter("price")));
		objProductModel.setProductDetails(productBeanObj);

		request.setAttribute("createproduct", objProductModel);
		request.setAttribute("productsuccess", "true");

		getServletContext().getRequestDispatcher("/createproduct.jsp").forward(
				request, response);
	}

	public void editProductFromServlet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		productBeanObj.setCount(Integer.parseInt(request
				.getParameter("productid")));
		productBeanObj.setAdvertiserName(GlobalBean.getUsersession());
		productBeanObj.setProductName(request.getParameter("productname"));
		productBeanObj.setProductdescription(request
				.getParameter("productdesc"));
		productBeanObj.setPrice(Double.parseDouble(request
				.getParameter("productprice")));

		if (objProductModel.updateProduct(productBeanObj)) {
			request.setAttribute("editdelete", objProductModel);
			request.setAttribute("change", "true");
			getServletContext().getRequestDispatcher("/editProduct.jsp")
					.forward(request, response);

		} else {
			getServletContext().getRequestDispatcher("/editProduct.jsp")
					.forward(request, response);
		}

	}

	public void deleteProductFromServlet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in servlet");
		productBeanObj.setCount(Integer.parseInt(request
				.getParameter("productid")));
		System.out.println(request.getParameter("productid"));
		boolean val = objProductModel.deleteProduct(productBeanObj);
		if (val) {
			request.setAttribute("viewall", objProductModel);
			request.setAttribute("deleteproduct", "true");
			getServletContext().getRequestDispatcher("/viewallProduct.jsp")
					.forward(request, response);
		} else {
			getServletContext().getRequestDispatcher("/home.jsp").forward(
					request, response);
		}

	}

}
