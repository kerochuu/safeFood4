package com.ssafy.service;

import com.ssafy.vo.User;

public interface UserService {
	boolean isMember(String uid, String upw);
	
	void registerMember(User user);

	void updateMember(User user);

	void deleteMember(String uid);
}
