package main;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import book.BookDto;
import db.DBClose;
import db.DBConnection;
import login.MemberDto;

public class MainDao {
	
private static MainDao dao = new MainDao();
	
	private MainDao() {
		
	}
	
	public static MainDao getInstance() {
		return dao;
	}
	
		//유저 활동 순위 리스트
		public List<MemberDto> getActivityList(){
			
			String sql = " SELECT MEMBERNUM, USERID, PWD, EMAIL, GENDER, PHONE, BIRTH, ACTIVITY, WEBMANAGER, CLUBMASTER USERIMAGE "
					+ " FROM (SELECT ROW_NUMBER()OVER(ORDER BY ACTIVITY DESC) AS RNUM, MEMBERNUM, USERID, PWD, EMAIL, GENDER, PHONE, BIRTH, ACTIVITY, WEBMANAGER, CLUBMASTER "
						 + " FROM MEMBERS) " 
					+ " WHERE RNUM BETWEEN 1 AND 5 ";
		
			System.out.println("sql = " + sql);		
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<MemberDto> list = new ArrayList<MemberDto>();
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 S getActivityList");
				
				psmt = conn.prepareStatement(sql);
				System.out.println("2/4 S getActivityList");
				
				rs = psmt.executeQuery();
				System.out.println("3/4 S getActivityList");
				
				while(rs.next()) {
					int i = 1;
			
				MemberDto dto = new MemberDto(rs.getInt(i++),
										      rs.getString(i++),
										      rs.getString(i++), 
										      rs.getString(i++),
											  rs.getInt(i++),
											  rs.getString(i++), 
											  rs.getString(i++), 
											  rs.getInt(i++),
											  rs.getInt(i++),
											  rs.getInt(i++),
											  rs.getString(i++));
					list.add(dto);
					
				}
				System.out.println("4/4 S getActivityList");
			} catch (SQLException e) {
				System.out.println("getActivityList fail");
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}
			
			return list;
		}
}
