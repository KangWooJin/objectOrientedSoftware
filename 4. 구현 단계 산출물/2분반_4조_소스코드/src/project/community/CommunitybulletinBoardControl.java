package project.community;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

public class CommunitybulletinBoardControl {
	
	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; // 디비 스키마 부분 다들 만들때 software
	
	public static int count = 1;
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String dbTable = "communitybulletinboard";
	
	Calendar nowTime = Calendar.getInstance();
    int time = (10000*nowTime.get(Calendar.YEAR)) + (100*(nowTime.get(Calendar.MONTH)+1)) + nowTime.get(Calendar.DAY_OF_MONTH);
	// insert into db테이블명 values(?,?,?); -> ? 갯수는 디비에 애트리뷰트의 갯수와 같아야함
	
	public CommunitybulletinBoardControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName); 
			con = DriverManager.getConnection(dbURL,id, passwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		if(count == 1)
		{
			try {
	            String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;
	            
	            stmt = con.createStatement();
	            rs = stmt.executeQuery(selectQuery);
	            
	            while (rs.next()) {
	               count++;
	            } 
	         } catch (Exception e) {            
	            System.out.println(e.getMessage());
	            e.printStackTrace();
	         }
		}
	}
	
	public void insertCommunityBulletinBoard(CommunityBulletinBoard a)
	{
		if ( a == null ) 
			return ;
		
		try {
			
			String insertQuery = "INSERT INTO `"+ dbTable + "` VALUES(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(insertQuery);
			
			pstmt.setInt(1,count);
			pstmt.setString(2,a.communityBulletinBoardName);
			pstmt.setString(3,a.communityKindOfbulletinBoard);
			pstmt.setInt(4,time);
			pstmt.setInt(5,20491231);
			pstmt.setString(6,a.creator);
			pstmt.setString(7,a.closer);
			
			pstmt.executeUpdate(); //쿼리를 실행한다.
			count++;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("CommunityBulletinBoard 테이블에 새로운 레코드를 추가했습니다.");        // 성공시 메시지 출력
	}
	
	public void updateCommunityBulletinBoard(CommunityBulletinBoard a)
	{
		
		try {
			
			String sql = "select communityBulletinBoardNo from `" + dbTable +"` where communityBulletinBoardNo = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, a.communityBulletinBoardNo);
			rs = pstmt.executeQuery();

			
			if( rs.next() )
			{
				int rId= rs.getInt("communityBulletinBoardNo");
				
				if ( rId == (a.communityBulletinBoardNo) )
				{
					String updateQuery = "update `"+ dbTable +"` set communityBulletinBoardName = ?"
							+ ", communityKindOfbulletinBoard = ?, openingDate = ?, closingDate = ?, creator = ?"
							+ ", closer = ? where communityBulletinBoardNo = ? ";
					
					pstmt = con.prepareStatement(updateQuery);

					pstmt.setString(1, a.communityBulletinBoardName);
					pstmt.setString(2,a.communityKindOfbulletinBoard);
					pstmt.setInt(3,time);
					pstmt.setInt(4,a.closingDate);
					pstmt.setString(5,a.creator);
					pstmt.setString(6,a.closer);
					pstmt.setInt(7,a.communityBulletinBoardNo);
		
					int count = pstmt.executeUpdate();
					
					count = pstmt.executeUpdate();
					System.out.println(count);
					System.out.println("모임방 게시판 수정 완료");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public ArrayList<CommunityBulletinBoard> selectCommunityBulletinBoard()
	{
		ArrayList<CommunityBulletinBoard> arr = new ArrayList<CommunityBulletinBoard>();
		
		try {
			String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;
			
            //질의를 할 Statement 만들기 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //조회 쿼리결과를 rs에 넣음
            
            System.out.println("--- 테이블 table 내용 조회 ---");
            
            //rs의 내용을 가져옴
            while (rs.next())
            {
            	CommunityBulletinBoard a = new CommunityBulletinBoard() ;
            
            	a.communityBulletinBoardNo = rs.getInt(1);
            	a.communityBulletinBoardName = rs.getString(2);
            	a.communityKindOfbulletinBoard = rs.getString(3);
            	a.openingDate = rs.getInt(4);
            	a.closingDate = rs.getInt(5);
            	a.creator = rs.getString(6);
            	a.closer = rs.getString(7);

            	arr.add(a);
            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return arr;
	}
	
	public CommunityBulletinBoard selectCommunityBulletinBoard(String communityBulletinBoardNo)
	{
		CommunityBulletinBoard a = new CommunityBulletinBoard();
		try
        {
			String selectQuery = "SELECT * FROM `"+ dbTable + "` where communityBulletinBoardNo = '" + communityBulletinBoardNo + "'";
			
            //질의를 할 Statement 만들기 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery);
            
            System.out.println("--- 테이블 student 내용 조회 ---");
            
            if (rs.next())
            {
            	a.communityBulletinBoardNo = rs.getInt(1);
            	a.communityBulletinBoardName = rs.getString(2);
            	a.communityKindOfbulletinBoard = rs.getString(3);
            	a.openingDate = rs.getInt(4);
            	a.closingDate = rs.getInt(5);
            	a.creator = rs.getString(6);
            	a.closer = rs.getString(7);
            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return a;
	}
}
