package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.StudentVO;
import com.example.libs.model.SungjukMgmtDao;
   
public class UpdateService {
	/*
	 * private String path;
	 * 
	 * public String getPath() { return path; }
	 * 
	 * public void setPath(String path) { this.path = path; }
	 */
	

	public int updateStudent(StudentVO student) {		//jsp에서 업데이트할 학생 넘어옴.
		int row = 0;
		try {
			row = SungjukMgmtDao.update(student);		//dao의 update에게 학생, path 넘김.
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;		//service에게 row 반환.
	}
	
}
