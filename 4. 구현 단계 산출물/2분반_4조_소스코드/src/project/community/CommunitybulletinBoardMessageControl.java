package project.community;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

public class CommunitybulletinBoardMessageControl {
	
	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; // 디비 스키마 부분 다들 만들때 software
	
	int count = 1;
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String dbTable = "communitybulletinboardmessage";
	
	public CommunitybulletinBoardMessageControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName); 
			con = DriverManager.getConnection(dbURL,id, passwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertCommunityBulletinBoardMessage(CommunityBulletinBoardMessage cbm)
	{
		if ( cbm == null ) 
			return ;
		
		try {
            String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;
            
            stmt = con.createStatement();
            rs = stmt.executeQuery(selectQuery);
            
            while(rs.next())
            {
            	if (cbm.communityBulletinBoardNo == rs.getInt(1))
            		count++;
            }
            
         } catch (Exception e) {            
            System.out.println(e.getMessage());
            e.printStackTrace();
         }
		
		try {
			
			String insertQuery = "INSERT INTO `"+ dbTable + "` VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(insertQuery);
			
			pstmt.setInt(1,cbm.communityBulletinBoardNo);
			pstmt.setInt(2,count);
			pstmt.setString(3,cbm.communityKindOfbulletinBoardMessage);
			pstmt.setString(4,cbm.title);
			pstmt.setString(5,cbm.bulletinBoardMessageContentcontent);
			pstmt.setString(6,cbm.name);
			pstmt.setString(7,cbm.searchContent);
			pstmt.setString(8,cbm.wholeNoticeSatus);
			pstmt.setString(9,cbm.attachment);

			pstmt.executeUpdate(); //쿼리를 실행한다.
			count++;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("CommunityBulletinBoardMessage 테이블에 새로운 레코드를 추가했습니다.");        // 성공시 메시지 출력
	}
	
	public void updateCommunityBulletinBoardMessage(CommunityBulletinBoardMessage cbm)
	{
		
		try {
			
			String sql = "select communityBulletinBoardNo from `" + dbTable +"` where communityBulletinBoardNo = ? and communityBulletinBoardMessageNo = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cbm.communityBulletinBoardNo);
			pstmt.setInt(2, cbm.communityBulletinBoardMessageNo);

			rs = pstmt.executeQuery();

			
			if( rs.next() )
			{
				int rId1 = rs.getInt("communityBulletinBoardNo");
				int rId2 = rs.getInt("communityBulletinBoardMessageNo");
						
				if ( rId1 == (cbm.communityBulletinBoardNo) && rId2 == (cbm.communityBulletinBoardMessageNo) )
				{
					String updateQuery = "update `"+ dbTable +"` set communityKindOfbulletinBoardMessage = ?"
							+ ", title = ?, bulletinBoardMessageContentcontent = ?, name = ?, searchContent = ?"
							+ ", wholeNoticeSatus = ?, centerNoticeSatus = ? "
							+ "where communityBulletinBoardNo = ? and communityBulletinBoardMessageNo = ? ";
					
					pstmt = con.prepareStatement(updateQuery);
					
					pstmt.setString(1,cbm.communityKindOfbulletinBoardMessage);
					pstmt.setString(2,cbm.title);
					pstmt.setString(3,cbm.bulletinBoardMessageContentcontent);
					pstmt.setString(4,cbm.name);
					pstmt.setString(5,cbm.searchContent);
					pstmt.setString(6,cbm.wholeNoticeSatus);
					
					pstmt.setString(7,cbm.attachment);
					pstmt.setInt(8,cbm.communityBulletinBoardNo);
					pstmt.setInt(9,cbm.communityBulletinBoardMessageNo);
		
					int count = pstmt.executeUpdate();
					
					count = pstmt.executeUpdate();
					System.out.println(count);
					System.out.println("모임방 게시글 수정 완료");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void deleteCommunityBulletinBoardMessage(int communityBulletinBoardNo, int communityBulletinBoardMessageNo) 
	{
		if(communityBulletinBoardNo == 0 || communityBulletinBoardMessageNo == 0)
		{
			return;
		}
		
		try {
			String deleteQuery = "delete from `" + dbTable + "` where communityBulletinBoardNo = ? and communityBulletinBoardMessageNo = ?";
			
			pstmt = con.prepareStatement(deleteQuery);
			pstmt.setInt(1, communityBulletinBoardNo);
			pstmt.setInt(2, communityBulletinBoardMessageNo);
			
			pstmt.executeUpdate();
			System.out.println("게시글 삭제 성공");
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
	    }

	}
	
	public ArrayList<CommunityBulletinBoardMessage> selectCommunityBulletinBoardMessage()
	{
		ArrayList<CommunityBulletinBoardMessage> arr = new ArrayList<CommunityBulletinBoardMessage>();
		
		try {
			String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;
			
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //조회 쿼리결과를 rs에 넣음
            
            System.out.println("--- 테이블 table 내용 조회 ---");
            
            //rs의 내용을 가져옴
            while (rs.next())
            {
            	CommunityBulletinBoardMessage cbm = new CommunityBulletinBoardMessage() ;
            
            	cbm.communityBulletinBoardNo = rs.getInt(1);
            	cbm.communityBulletinBoardMessageNo = rs.getInt(2);
            	cbm.communityKindOfbulletinBoardMessage = rs.getString(3);
            	cbm.title = rs.getString(4);
            	cbm.bulletinBoardMessageContentcontent = rs.getString(5);
            	cbm.name = rs.getString(6);
            	cbm.searchContent = rs.getString(7);
            	cbm.wholeNoticeSatus = rs.getString(8);
            	
            	cbm.attachment = rs.getString(9);

            	arr.add(cbm);
            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return arr;
	}
	
	public CommunityBulletinBoardMessage selectCommunityBulletinBoardMessage(String communityBulletinBoardNo, String communityBulletinBoardMessageNo)
	{
		CommunityBulletinBoardMessage cbm = new CommunityBulletinBoardMessage();
		try
        {
			String selectQuery = "SELECT * FROM `"+ dbTable + "` where communityBulletinBoardNo = '" + communityBulletinBoardNo + "' and communityBulletinBoardMessageNo = '" + communityBulletinBoardMessageNo + "'";

			
            //질의를 할 Statement 만들기 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery);
            
            System.out.println("--- 테이블 student 내용 조회 ---");
            
            if (rs.next())
            {
            	cbm.communityBulletinBoardNo = rs.getInt(1);
            	cbm.communityBulletinBoardMessageNo = rs.getInt(2);
            	cbm.communityKindOfbulletinBoardMessage = rs.getString(3);
            	cbm.title = rs.getString(4);
            	cbm.bulletinBoardMessageContentcontent = rs.getString(5);
            	cbm.name = rs.getString(6);
            	cbm.searchContent = rs.getString(7);
            	cbm.wholeNoticeSatus = rs.getString(8);
            	
            	cbm.attachment = rs.getString(9);
            }
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return cbm;
	}
}
