package com.LBA.Advertiser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;

import com.LBA.Advertiser.bean.ChannelBean;
import com.LBA.Advertiser.model.ChannelModel;

public class ChannelCreateServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ChannelModel objModel = new ChannelModel();
	ChannelBean channelBean = new ChannelBean();

	public ChannelCreateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			String postAction = request.getParameter("page");
			if (postAction.equals("create_channel")) {
				// getServletContext().getRequestDispatcher("/createchannel.jsp").forward(request,
				// response);;
				channelBean.setChannelname(StringEscapeUtils.escapeSql(request
						.getParameter("channelname")));
				channelBean.setChanneldescription(StringEscapeUtils
						.escapeSql(request.getParameter("channeldescription")));
				objModel.setChannel(channelBean);
				// request.setAttribute("registrationDone", objModel);
				// request.setAttribute("createchannel", "true");
				// getServletContext().getRequestDispatcher("/createchannel.jsp").forward(request,
				// response);;
				if (objModel.getChannel()) {
					// request.setAttribute("registrationDone", objModel);
					request.setAttribute("createchannel", objModel);
					getServletContext().getRequestDispatcher(
							"/createchannel.jsp").forward(request, response);
				} else {
					getServletContext().getRequestDispatcher(
							"/createchannel.jsp?crtfail=false").forward(
							request, response);
				}

			}
		} catch (Exception ex) {
			getServletContext().getRequestDispatcher("/errorhandle.jsp")
					.forward(request, response);
		}

	}
}