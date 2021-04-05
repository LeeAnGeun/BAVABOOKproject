package mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import book.BookDto;
import club.ClubDto;
import db.DBClose;
import db.DBConnection;
import login.MemberDto;

public class MypageDao {

	
private static MypageDao dao = new MypageDao();
	
	private MypageDao() {
		
	}
	
	public static MypageDao getInstance() {
		return dao;
	}
	
	// 마이페이지 위시리스트
	public List<BookDto> getwishList(String choice, String search, int page, int membernum ) {
		String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
				+ "	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
                + " FROM ";
        
        sql += " (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM, " 
        		+  "    BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
        		+ " 	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE  " 
        		+  "    FROM MYLIBRARY M, BOOK B "
                + "   WHERE M.WISHBOOK = B.BOOKNUM ";
        
        String sWord = "";
        if(choice.equals("title")) {
            sWord = " AND B.BOOKTITLE LIKE '%" + search + "%' ";
        }
	 	else if(choice.equals("writer")) {
         sWord = " AND AUTHOR LIKE '%" + search + "%' ";
	 	} 
        sql = sql + sWord;
        
        sql += " AND M.MEMBERNUM = ? ) ";
        
        sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
        
        int start, end;
        start = 1 + 10*page;
        end = 10+ 10*page;
        System.out.println("start = " + start + "end = " + end);
        
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        
        List<BookDto> list = new ArrayList<BookDto>();
        
        try {
            conn = DBConnection.getConnection();
            System.out.println("1/4 getwishList success");
                
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, membernum);
            psmt.setInt(2, start);
            psmt.setInt(3, end);
            System.out.println("2/4 getwishList success");
        
            
            rs = psmt.executeQuery();
            
            System.out.println("3/4 getwishList success");
            
            while(rs.next()) {
            	int i=1;
            	BookDto dto = new BookDto(rs.getInt(i++),
            							  rs.getString(i++),
            							  rs.getInt(i++),
            							  rs.getInt(i++),
            							  rs.getInt(i++),
            							  rs.getInt(i++),
            							  rs.getString(i++),
            							  rs.getString(i++),
            							  rs.getString(i++),
            							  rs.getString(i++),
            							  rs.getString(i++));
            	
                list.add(dto);
            }            
            System.out.println("4/4 getwishList success");
            
        } catch (SQLException e) {    
            System.out.println("getwishList fail");
            e.printStackTrace();
        } finally {            
            DBClose.close(conn, psmt, rs);            
        }
        
        return list;
	}
	
	// 마이페이지 읽은 책 리스트
	public List<BookDto> getreadList(String choice, String search, int page, int membernum ){
		String sql = " SELECT BOOKNUMS, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
				+ "		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
                + " FROM ";
		
		sql += " (SELECT ROW_NUMBER()OVER(ORDER BY REVSEQ DESC) AS RNUM, " 
        		+  "    BO.BOOKNUM AS BOOKNUMS, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
        		+ " 	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE " 
        		+  "    FROM REVIEW RE, BOOK BO "
                + "   WHERE RE.BOOKNUM = BO.BOOKNUM ";
       
		  String sWord = "";
	        if(choice.equals("title")) {
	            sWord = " AND BOOKTITLE LIKE '%" + search + "%' ";
	        }
		 	else if(choice.equals("writer")) {
		 		sWord = " AND AUTHOR LIKE '%" + search + "%' ";
		 	} 
	        sql = sql + sWord;
	        
	        sql += " AND RE.MEMBERNUM = ? ) ";
	        
	        sql += " WHERE RNUM >= ? AND RNUM <= ? ";
	        
	        int start, end;
	        start = 1 + 10*page;
	        end = 10+ 10*page;
	        
	        Connection conn = null;
	        PreparedStatement psmt = null;
	        ResultSet rs = null;
	        
	        List<BookDto> list = new ArrayList<BookDto>();
	        
	        try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/4 getreadList success");
	                
	            psmt = conn.prepareStatement(sql);
	            System.out.println("2/4 getreadList success");
	            psmt.setInt(1, membernum);
	            psmt.setInt(2, start);
	            psmt.setInt(3, end);
	            
	            rs = psmt.executeQuery();
	            
	            System.out.println("3/4 getreadList success");
	            
	            while(rs.next()) {
	            	int i=1;
	            	BookDto dto = new BookDto(rs.getInt(i++),
	            							  rs.getString(i++),
	            							  rs.getInt(i++),
	            							  rs.getInt(i++),
	            							  rs.getInt(i++),
	            							  rs.getInt(i++),
	            							  rs.getString(i++),
	            							  rs.getString(i++),
	            							  rs.getString(i++),
	            							  rs.getString(i++),
	            							  rs.getString(i++));
	            	
	                list.add(dto);
	            }            
	            System.out.println("4/4 getreadList success");
	            
	        } catch (SQLException e) {    
	            System.out.println("getreadList fail");
	            e.printStackTrace();
	        } finally {            
	            DBClose.close(conn, psmt, rs);            
	        }
	        
	        return list;
	}
	
	// 위시전체 총수
	public int getAllWish(String choice, String search, int membernum) {
			String sql = " SELECT COUNT(*) "
			   + " FROM ";
	        
	        sql += " (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM, " 
	        		+  "    BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
	        		+ " 	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE  " 
	        		+  "    FROM MYLIBRARY M, BOOK B "
	                + "   WHERE M.WISHBOOK = B.BOOKNUM ";
	        
	        String sWord = "";
	        if(choice.equals("title")) {
	            sWord = " AND B.BOOKTITLE LIKE '%" + search + "%' ";
	        }
		 	else if(choice.equals("writer")) {
	         sWord = " AND AUTHOR LIKE '%" + search + "%' ";
		 	} 
	        sql = sql + sWord;
	        
	        sql += " AND M.MEMBERNUM = ?) ";
		         
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      int len = 0; //return 해줄 글의 총수
	      
	      
	      try {
	         conn = DBConnection.getConnection();
	         System.out.println("1/3 S getAllWish");
	         
	         psmt= conn.prepareStatement(sql);
	         psmt.setInt(1, membernum);
	         System.out.println("2/3 S getAllWish");
	         
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            len = rs.getInt(1);
	         }
	         System.out.println("3/3 S getAllWish");	         
	      } catch (SQLException e) {
	         System.out.println("Fail getAllWish");
	         e.printStackTrace();
	      } finally {
	         DBClose.close(conn, psmt, rs);
	      }
	      
	      return len;	    
	}
	
	// 읽은 책 총수
	public int getAllRead(String choice, String search, int membernum) {
		String sql = " SELECT COUNT(*)"
                + " FROM ";
		
		sql += " (SELECT ROW_NUMBER()OVER(ORDER BY REVSEQ DESC) AS RNUM, " 
        		+  "    BO.BOOKNUM AS BOOKNUMS, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
        		+ " 	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE " 
        		+  "    FROM REVIEW RE, BOOK BO "
                + "   WHERE RE.BOOKNUM = BO.BOOKNUM ";
       
		  String sWord = "";
	        if(choice.equals("title")) {
	            sWord = " AND BOOKTITLE LIKE '%" + search + "%' ";
	        }
		 	else if(choice.equals("writer")) {
		 		sWord = " AND AUTHOR LIKE '%" + search + "%' ";
		 	} 
	        sql = sql + sWord;
	        
	        sql += " AND RE.MEMBERNUM = ?) ";
	        
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      int len = 0; //return 해줄 글의 총수
	      
	      
	      try {
	         conn = DBConnection.getConnection();
	         System.out.println("1/3 S getAllRead");
	         
	         psmt= conn.prepareStatement(sql);
	         psmt.setInt(1, membernum);
	         System.out.println("2/3 S getAllRead");
	         
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            len = rs.getInt(1);
	         }
	         System.out.println("3/3 S getAllRead");	         
	      } catch (SQLException e) {
	         System.out.println("Fail getAllRead");
	         e.printStackTrace();
	      } finally {
	         DBClose.close(conn, psmt, rs);
	      }
	      
	      return len;	    
	}
	
	//클럽리스트 불러오기
	public List<ClubDto> getClubList(int page, int membernum) {
		
		String sql = " SELECT CLUBSEQS, CLUBTITLE, CLUBTEXT, CLUBIMAGE, RNUM "
                    + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY CL.CLUBSEQ DESC) AS RNUM, CL.CLUBSEQ AS CLUBSEQS, CLUBTITLE, CLUBTEXT, CLUBIMAGE  " 
                			+ " FROM CLUBLINK CL, CLUB C "
                			+ " WHERE CL.CLUBSEQ = C.CLUBSEQ "
                			+ " AND CL.MEMBERNUM = ? )"
                	
                + " WHERE RNUM >= ? AND RNUM <= ? ";
	        
	        int start, end;
	        start = 1 + 3*page;
	        end = 3+ 3*page;
	        
	        Connection conn = null;
	        PreparedStatement psmt = null;
	        ResultSet rs = null;
	        
	        List<ClubDto> list = new ArrayList<ClubDto>();
	        
	        try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/4 getClubList success");
	                
	            psmt = conn.prepareStatement(sql);
	            System.out.println("2/4 getClubList success");
	            psmt.setInt(1, membernum);
	            psmt.setInt(2, start);
	            psmt.setInt(3, end);
	            
	            rs = psmt.executeQuery();
	            
	            System.out.println("3/4 getClubList success");
	            
	            while(rs.next()) {
	            	int i=1;
	            	ClubDto dto = new ClubDto(rs.getInt(i++), 
					            			rs.getString(i++), 
					            			rs.getString(i++), 
					            			rs.getString(i++)); 
	            	
	            	
	            	
	                list.add(dto);
	            }            
	            System.out.println("4/4 getClubList success");
	            
	        } catch (SQLException e) {    
	            System.out.println("getClubList fail");
	            e.printStackTrace();
	        } finally {            
	            DBClose.close(conn, psmt, rs);            
	        }
	        
	        return list;
	}
	
	//클럽리스트 총수
	public int getAllClub(int membernum) {
		String sql = " SELECT COUNT(*)"
	                + " FROM CLUBLINK"
	                + "   WHERE MEMBERNUM = ? ";
       
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      int len = 0; //return 해줄 글의 총수
	      
	      try {
	         conn = DBConnection.getConnection();
	         System.out.println("1/3 S getAllClub");
	         
	         psmt= conn.prepareStatement(sql);
	         psmt.setInt(1, membernum);
	         System.out.println("2/3 S getAllClub");
	         
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            len = rs.getInt(1);
	         }
	         System.out.println("3/3 S getAllClub");	         
	      } catch (SQLException e) {
	         System.out.println("Fail getAllClub");
	         e.printStackTrace();
	      } finally {
	         DBClose.close(conn, psmt, rs);
	      }
	      
	      return len;	    
	}
	
	// 나의 정보가져오기
	public MemberDto getMyInfo(int membernum) {
			String sql = " SELECT USERID, PWD, EMAIL, GENDER, PHONE, BIRTH, USERIMAGE "
					+ " FROM MEMBERS "
					+ " WHERE MEMBERNUM = ? ";		
		
		    Connection conn = null;
	        PreparedStatement psmt = null;
	        ResultSet rs = null;
	        
	        MemberDto dto = null;
	        
	        try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/3 getMyInfo success");
	                
	            psmt = conn.prepareStatement(sql);
	            System.out.println("2/3 getMyInfo success");
	            
	            
	            psmt.setInt(1, membernum);
	            rs = psmt.executeQuery();

		        while(rs.next()) {
		        	int i=1;
		        	dto = new MemberDto(rs.getString(i++), 
					    				rs.getString(i++), 
					    				rs.getString(i++), 
					    				rs.getInt(i++), 
					    				rs.getString(i++), 
					    				rs.getString(i++),
					    				rs.getString(i));
		        		
		        }            
		        System.out.println("3/3 getMyInfo success");
		        
		    } catch (SQLException e) {    
		        System.out.println("getMyInfo fail");
		        e.printStackTrace();
		    } finally {            
		        DBClose.close(conn, psmt, rs);            
		    }
	        return dto;
		    }
	
	
	public boolean updateMember(MemberDto dto) {
		 String sql = " UPDATE MEMBERS SET "
	                + " PWD= ? , EMAIL= ? , PHONE= ? , BIRTH= ?  "
	                + " WHERE USERID = ? ";
	        
	        Connection conn = null;
	        PreparedStatement psmt = null;
	        int count = 0;
	        
	        try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/3 S updateMember");
	            
	            psmt = conn.prepareStatement(sql);
	            psmt.setString(1, dto.getPwd());
	            psmt.setString(2, dto.getEmail());
	            psmt.setString(3, dto.getPhone());
	            psmt.setString(4, dto.getBirth());
	            psmt.setInt(5, dto.getMembernum());
	            
	            
	            System.out.println("2/3 S updateMember");
	            
	            count = psmt.executeUpdate();
	            System.out.println("3/3 S updateMember");
	            
	        } catch (Exception e) {            
	            e.printStackTrace();
	        } finally{
	            DBClose.close(conn, psmt, null);            
	        }        
	        
	        return count>0?true:false;
	    }
	    
	    
	
	}
	

