package com.example.libs.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.example.libs.model.StudentVO;
import com.example.libs.model.SungjukMgmtDao;
   
public class SelectService {
	/*
	 * private String path; //property
	 * 
	 * public String getPath() { return path; }
	 * 
	 * public void setPath(String path) { this.path = path; }
	 */
	
	public ArrayList<StudentVO> selectAll() {		//list.jsp에 뿌려줄 한 명 이상의 학생.	//DB에서 가져온 학생들을 담음.
		ArrayList<StudentVO> list = null;
		try {
			list = SungjukMgmtDao.select();
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return list;
	}
	
	public StudentVO select(String hakbun) {		//view.jsp에게 hakbun받고
		StudentVO student = null;
		try {
			student = SungjukMgmtDao.selectOne(hakbun);		//DAO에게 hakbun 넘겨줌.
		} catch (SQLException e) {
			System.out.println(e);
		}
		return student;		//view에게 student 넘겨줌.
	}
}