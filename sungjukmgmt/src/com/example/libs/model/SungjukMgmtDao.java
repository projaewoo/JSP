package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SungjukMgmtDao {

	public static ArrayList<StudentVO> select() throws SQLException{
		Connection conn = DBConnection.getConnection();		//2, 3step.		//Apache DBCP 사용해서 간단해짐.
		String sql = "{  call sp_select_all(?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);		//4step.
		cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); 		//DB에서 여기로 나오는 OUT변수를 받음 ... regiesterOutParameter().	//프로시저에서 CURSOR가 나오므로 여기서 CURSOR로 받음.
		//실행
		cstmt.execute();		//매우 주의! : SELECT일때만 executeQuery()
		cstmt.getObject(1);
		ResultSet rs = (ResultSet)cstmt.getObject(1);
		//rs 오픈.
		ArrayList<StudentVO> list = new ArrayList<StudentVO>();		//기본 생성자 = 10개 방 만듬.

		if(rs.next() ) {		//resultSet : 데이터가 있으면 next() 됨.
			do {					//첫번째 레코드 읽었으므로(24행) do while사용	//여기서 while(rs.next()) 사용하면 다시 next되므로 첫번째 레코드 생략됨.
				String hakbun = rs.getString("hakbun");
				String name = rs.getString("name");
				int kor = rs.getInt("kor");
				int eng = rs.getInt("eng");
				int mat = rs.getInt("mat");
				StudentVO student = new StudentVO(hakbun, name, kor, eng, mat);
				list.add(student);		//학생을 list에  담음.
			}while(rs.next());
		}else {		//데이터가 없다면 next() 안됨.
			list = null;
		}
		
		DBClose.close(conn, cstmt, rs);		//7step.
		return list;
	}

	public static int insert(StudentVO student) throws SQLException{
		Connection conn = DBConnection.getConnection();		//2, 3step.		//Apache DBCP 사용해서 간단해짐.
		
		String sql = "{ call sp_student_insert(?, ?, ?, ?, ?) }";	
		CallableStatement cstmt = conn.prepareCall(sql);	//4step //exception 발생
		cstmt.setString(1, student.getHakbun());
		cstmt.setString(2, student.getName());
		cstmt.setInt(3, student.getKor());
		cstmt.setInt(4, student.getEng());
		cstmt.setInt(5, student.getMat());
		//실행
		int row = cstmt.executeUpdate();	 	//5step.	//영향받은 row의 갯수 반환 //Update된 행의 갯수 반환 : update성공하면 1 반환, 실패하면 0 반환.	//SELECT가 아니므로 executeUpdate().
		DBClose.close(conn, cstmt);		//6step.
		return row;
	}
	
	public static StudentVO selectOne(String hakbun) throws SQLException{
		Connection conn = DBConnection.getConnection();		//2, 3step.		//Apache DBCP 사용해서 간단해짐.
		String sql = "{  call sp_select(?, ?) }";		//IN모드 1개, OUT모드 1개	// 총 2개의 ? 생성.
		CallableStatement cstmt = conn.prepareCall(sql);		//4step.
		cstmt.setString(1, hakbun); 		//첫번째 물음표에 hakbun 들어감.
		cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); 		//DB에서 여기로 나오는 OUT변수를 받음 ... registerOutParameter() 사용.	//DB에서 커서를 여기로 보내주므로 CURSOR로 받음.
		cstmt.execute();		//5step.
		//꺼내기
		ResultSet rs = (ResultSet)cstmt.getObject(2);		//오라클의 커서를 자바는 Object로 받아야함	//Object로 받아서 ResultSet으로 강제 형변환.
		rs.next(); 			//웹에서 학번이 있기 때문에 href타고 들어왔으므로 next가 무조건 true.
		//넣기.
		StudentVO student = new StudentVO(rs.getString("hakbun"), rs.getString("name"),	//프로시저에서 SELECT * 이므로 8개가 담겨있음.
																	rs.getInt("kor"), rs.getInt("eng"), rs.getInt("mat"));
		student.setTot(rs.getInt("tot"));
		student.setAvg(rs.getDouble("avg"));
		student.setGrade(rs.getString("grade"));

		DBClose.close(conn, cstmt);		//6step.
		//넘기기
		return student;
	}
	  
	//service에서 hakbun, path받아옴.		//delete된 행의 갯수를 service에게 반환.
	public static int delete(String hakbun) throws SQLException{		
		Connection conn = DBConnection.getConnection();		//2, 3step.		//Apache DBCP 사용해서 간단해짐.
		String sql = "{ call sp_delete(?)}";		//IN모드의 변수 하나여서 물음표 1개
		CallableStatement cstmt = conn.prepareCall(sql);		//4step.
		//불완전한 SQL 완성하려면
		cstmt.setString(1, hakbun); //완전한 SQL문장.
		int row = cstmt.executeUpdate();		//5step		//영향받은 row의 갯수 반환
		
		DBClose.close(conn, cstmt);		//6step.
		return row;
	}
	
	//update할 student, path를 service에서 받음
	public static int update(StudentVO student) throws SQLException{		
		Connection conn = DBConnection.getConnection();		//2, 3step.		//Apache DBCP 사용해서 간단해짐.
		String sql = "{ call sp_update(?, ?, ?, ?)}";		//IN모드의 변수 4개여서 물음표 4개
		CallableStatement cstmt = conn.prepareCall(sql);		//4step.
		//불완전한 SQL 완성하려면
		cstmt.setString(1, student.getHakbun()); 
		cstmt.setInt(2, student.getKor());
		cstmt.setInt(3, student.getEng());
		cstmt.setInt(4, student.getMat());	//완전한 SQL문장.
		
		int row = cstmt.executeUpdate();		//5step		//영향받은 row의 갯수 반환
		
		DBClose.close(conn, cstmt);		//6step.
		return row;
	}
}