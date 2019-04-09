package com.ssafy.service;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.vo.User;

public class UserServiceImpl implements UserService{
	private List<User> userList;
	private static UserServiceImpl userServiceImpl; 
	
	private UserServiceImpl() {
		userList = new ArrayList<User>();
	}
	
	public static UserServiceImpl getInstance() {
		if(userServiceImpl == null) {
			userServiceImpl = new UserServiceImpl();
		}
		return userServiceImpl;
	}
	
	@Override
	public boolean isMember(String uid, String upw) {
		for(int i = 0; i < userList.size(); i++) {
			if(userList.get(i).getId().equals(uid) && userList.get(i).getPassword().equals(upw)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void registerMember(User user) {
		userList.add(user);
	}

	@Override
	public void updateMember(User user) {
		for(int i = 0; i < userList.size(); i++) {
			if(userList.get(i).getId().equals(user.getId())) {
				userList.get(i).setPassword(user.getPassword());
				userList.get(i).setBirth(user.getBirth());
				userList.get(i).setSex(user.getSex());
				userList.get(i).setEmail(user.getEmail());
				userList.get(i).setPhone(user.getPhone());
				break;
			}
		}
	}

	@Override
	public void deleteMember(String uid) {
		for(int i = 0; i < userList.size(); i++) {
			if(userList.get(i).getId().equals(uid)) {
				userList.remove(i);
				break;
			}
		}
	}

}
