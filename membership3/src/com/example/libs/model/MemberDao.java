package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.jdbc.OracleTypes;

public class MemberDao {
	public static int register(MemberVO member) throws SQLException {
		Connection conn = DBConnection.getConnection(); //2,3
		String sql = "{ call sp_member_insert(?,?,?,?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);      //4
		cstmt.setString(1, member.getUserid());
		cstmt.setString(2, member.getPasswd());
		cstmt.setString(3, member.getName());
		cstmt.setString(4, member.getEmail());
		cstmt.setString(5, member.getGender());
		cstmt.setString(6, member.getCity());
		cstmt.setInt(7, member.getAge());
		int row = cstmt.executeUpdate();                          //5
		DBClose.close(conn, cstmt);   //6
		return row;
	}
	
	//-1 : 존재하지 않는 아이디이다.    0 : 아이디는 있으나 비밀번호가 일치하지 않는다.    1 : 모두 일치한다.
	public static int login(String userid, String passwd) throws SQLException{
		Connection conn = DBConnection.getConnection();  //2, 3
		String sql = "{ call sp_member_login(?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.setString(1, userid);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();   //매우 주의하자.
		Object obj = cstmt.getObject(2);
		ResultSet rs = (ResultSet)obj;
		int key = -2;
		if(rs.next()) {   //아이디에 맞는 비밀번호를 가져왔다면
			String db_passwd = rs.getString("passwd");
			if(db_passwd.trim().equals(passwd.trim())) {
				key = 1;   //모두 일치
			}else {
				key = 0;  //비밀번호 불일치
			}
		}else {   //아예 그런 아이디가 없다면
			key = -1;
		}
		DBClose.close(conn, cstmt);   //7
		return key;
	}
	
	public static MemberVO select(String userid) throws SQLException{
		Connection conn = DBConnection.getConnection();  //2,3 
		String sql = "{ call sp_member_select(?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.setString(1, userid);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();   //5. 매우 주의하자.
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();             //6
		MemberVO member = new MemberVO(userid, null, 
				  rs.getString("name"), rs.getString("email"), rs.getString("gender"),
				  rs.getString("city"), rs.getInt("age"), rs.getInt("flag"));
		DBClose.close(conn, cstmt, rs);  //7
		return member;
	}
	
	
	//회원정보를 출력하는 메소드
	public static ArrayList<MemberVO> selectAll() throws SQLException {
		Connection conn = DBConnection.getConnection();  //2,3 step
		String sql = "{ call sp_member_select_all(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.registerOutParameter(1, OracleTypes.CURSOR);		//오라클의 커서를 받음.	//받으므로 registerOutParameter()
		cstmt.execute(); 	//매우 주의!!  5step.
		
		ResultSet rs = (ResultSet)cstmt.getObject(1); 		//커서를 Object로 받아서, 최종적으로 ResultSet으로 강제 형변환.
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();		//기본적으로 방 10개 생성.
		
		while(rs.next()) {		//몇명이 회원인지 몰라서 while()
			//n번째 회원을 member에 넣어서
			MemberVO member = 
					new MemberVO(rs.getString("userid"), "",		//passwd : null로 지정. 
												rs.getString("name"), rs.getString("email"),
												rs.getString("gender"));
			member.setCity(rs.getString("city"));
			member.setAge(rs.getInt("age"));
			//n번째 회원이 담긴 member를 list에 추가.
			list.add(member);
		}
		
		DBClose.close(conn, cstmt, rs);   //7step
		return list;
	}
	
	
	public static int delete(String userid) throws SQLException{
		Connection conn = DBConnection.getConnection();  //2,3
		String sql = "{ call sp_member_delete(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.setString(1, userid);
		int row = cstmt.executeUpdate();
		DBClose.close(conn, cstmt);   //6
		return row;
	}
	
	//update하는 메소드
	//파라미터를 MemberVO로 때려넣고 (email, city, age, .. 모든 변수 들어있음), 필요한 email, city, age만 업데이트! 
	public static int update(MemberVO member) throws SQLException{
		Connection conn = DBConnection.getConnection();  //2,3
		String sql = "{ call sp_member_update(?, ?, ?, ?) }";		
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.setString(1, member.getUserid());
		cstmt.setString(2, member.getEmail());
		cstmt.setString(3, member.getCity());
		cstmt.setInt(4, member.getAge());		//완전한 sQL문장
		int row = cstmt.executeUpdate();			//5step : 실행.
		
		DBClose.close(conn, cstmt);   //6
		return row;
	}
	
}




