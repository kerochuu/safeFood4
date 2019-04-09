package com.ssafy.web;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.service.UserService;
import com.ssafy.service.UserServiceImpl;
import com.ssafy.vo.PageInfo;
import com.ssafy.vo.User;

public class UserController{
	private static UserController userController = null;
	
	private UserController() {
		
	}
	
	public static UserController getInstance() {
		if(userController == null) {
			userController = new UserController();
		}
		return userController;
	}

	public PageInfo login(HttpServletRequest request, HttpServletResponse response) {
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		
		HashMap<String, String> errorMessages = new HashMap<String, String>();
		
		if(uid == null || uid.trim().length() == 0) {
			errorMessages.put("idError", "아이디가 입력되지 않았습니다.");
		}
		if(upw == null || upw.trim().length() == 0) {
			errorMessages.put("pwError", "비밀번호가 입력되지 않았습니다.");
		}
		if(errorMessages.size() > 0) {
			request.setAttribute("errorMessages", errorMessages);
			return new PageInfo(true, "Login.jsp");
		}
		
		UserService userService = UserServiceImpl.getInstance();
		boolean flag = userService.isMember(uid, upw);
		if(flag) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", uid);
			return new PageInfo(false, "Main.jsp");
		}else {
			request.setAttribute("processMessage", "로그인 실패");
			return new PageInfo(true, "Login.jsp");
		}
	}

	public PageInfo logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return new PageInfo(false, "Main.jsp");
	}

	public PageInfo registerMember(HttpServletRequest request, HttpServletResponse response) {
		UserService userService = UserServiceImpl.getInstance(); 
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String uname = request.getParameter("uname");
		String ubirth = request.getParameter("gender");
		String usex = request.getParameter("usex");
		String uemail = request.getParameter("uemail");
		String uphone = request.getParameter("uphone");
		
		User user = new User(uid, upw, uname, ubirth, usex, uemail, uphone);
		
		userService.registerMember(user);
		
		HttpSession session = request.getSession();
		session.setAttribute("userId", uid);
		
		return new PageInfo(false, "Main.jsp");
	}

	public PageInfo updateMember(HttpServletRequest request, HttpServletResponse response) {
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String uname = request.getParameter("uname");
		String ubirth = request.getParameter("gender");
		String usex = request.getParameter("usex");
		String uemail = request.getParameter("uemail");
		String uphone = request.getParameter("uphone");
		
		UserService userService = UserServiceImpl.getInstance();
		
		User user = new User(uid, upw, uname, ubirth, usex, uemail, uphone);
		
		userService.updateMember(user);
		
		return new PageInfo(false, "Main.jsp");
	}

	public PageInfo deleteMember(HttpServletRequest request, HttpServletResponse response) {
		String uid = request.getParameter("uid");
		UserService userService = UserServiceImpl.getInstance();
		userService.deleteMember(uid);
		request.getSession().invalidate();
		return new PageInfo(false, "Main.jsp");
	}
}
