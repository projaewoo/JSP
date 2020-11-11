package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.StudentVO;
import com.example.libs.model.SungjukMgmtDao;
  
public class InsertService {
	/*
	 * private String path;
	 * 
	 * public String getPath() { return path; }
	 * 
	 * public void setPath(String path) { this.path = path; }
	 */
	
	public int insertStudent(StudentVO student) {		//jsp에서 service로  //student를 파라미터로 넘어옴.
		int row = 0;
		try {
			row = SungjukMgmtDao.insert(student);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
