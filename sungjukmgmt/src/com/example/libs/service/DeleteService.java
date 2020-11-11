package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.SungjukMgmtDao;
  
public class DeleteService {
	/*
	 * private String path;
	 * 
	 * public String getPath() { return path; }
	 * 
	 * public void setPath(String path) { this.path = path; }
	 */
	
	public int deleteStudent(String hakbun) {		//jsp에서 삭제할 학생의 학번 넘어옴.
		int row = 0;
		try {
			row = SungjukMgmtDao.delete(hakbun);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
	
}
