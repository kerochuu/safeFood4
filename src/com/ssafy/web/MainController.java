package com.ssafy.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.vo.PageInfo;

import java.io.IOException;

@WebServlet("/main.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private FoodController foodController = FoodController.getInstance();
	private UserController userController = UserController.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		PageInfo page = null;

		try {
			switch (action) {
			case "login": page = userController.login(request, response);break;
			case "logout": page = userController.logout(request, response);break;
			case "searchBookList": page = foodController.searchAll(request, response);break;
			case "registerMember": page = userController.registerMember(request, response); break;
			case "updateMember": page = userController.updateMember(request, response); break;
			case "deleteMember": page = userController.deleteMember(request, response); break;
			}

			if (page.isForward()) {
				request.getRequestDispatcher(page.getUrl()).forward(request, response);
				return;
			} else {
				response.sendRedirect(page.getUrl());
				return;
			}
		} catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		}
	}

}
