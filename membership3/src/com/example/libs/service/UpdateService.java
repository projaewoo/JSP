package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.MemberDao;
import com.example.libs.model.MemberVO;

public class UpdateService {

	public int updateMember(MemberVO member) {		//jsp에서 MemberVO를 파라미터로 받아옴.
		int row = -1;
		try {
			row = MemberDao.update(member);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
	
}
