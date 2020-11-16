package com.example.libs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetEmployee {
	
	public static String getEmp(String ename) {
		Connection conn = DBConnection.getConnection();		//2, 3 step
		
		String sql = " SELECT ename, sal, job, hiredate, dname, loc "
							+ " FROM emp INNER JOIN dept ON emp.deptno = dept.deptno "
							+ " WHERE emp.ename = (?) ";
		String str = "<ul>";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql); 		//불완전한 SQL문장.
			pstmt.setString(1, ename.toUpperCase());
			//실행한 뒤, ResultSet에 담기.
			rs = pstmt.executeQuery();		//5step.
			rs.next();
			//누적
			str += "<li>이름 : " + ename + "</li>" +
						"<li>월급 : " + rs.getDouble("sal") + "</li>" +
						"<li>직무 : " + rs.getString("job") + "</li>" +
						"<li>입사일 : " + rs.getDate("hiredate") + "</li>" +
						"<li>소속 부서명 : " + rs.getString("dname") + "</li>" +
						"<li>근무지 : " + rs.getString("loc") + "</li>" +
						"</ul>";
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn, pstmt);
		return str;
	}
	
}