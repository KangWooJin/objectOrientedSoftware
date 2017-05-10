package project.community;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

public class CommunityBulletinBoardMessageCommentControl {
	
	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; // 디비 스키마 부분 다들 만들때 software
	
	int count = 1;
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String dbTable = "communitybulletinboardmessagecomment";
		
	Calendar nowTime = Calendar.getInstance();
    int time = (10000*nowTime.get(Calendar.YEAR)) + (100*(nowTime.get(Calendar.MONTH)+1)) + nowTime.get(Calendar.DAY_OF_MONTH);
		
	public CommunityBulletinBoardMessageCommentControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName); 
			con = DriverManager.getConnection(dbURL,id, passwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertCommunityBulletinBoardMessageComment(CommunityBulletinBoardMessageComment cbmc)
	{
		if ( cbmc == null ) 
			return ;
		
		try {
            String selectQuery = "SELECT * FROM `"+ dbTable +"`" ;
            
            stmt = con.createStatement();
            rs = stmt.executeQuery(selectQuery);
            
            while(rs.next()){
            	if ( cbmc.communityBulletinBoardNo == rs.getInt(1) && cbmc.communityBulletinBoardMessageNo == rs.getInt(2))
            	{
            		count++;
            	}
            }
         } catch (Exception e) {            
            System.out.println(e.getMessage());
            e.printStackTrace();
         }
		
		try {
			
			String insertQuery = "INSERT INTO `"+ dbTable + "` VALUES(?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(insertQuery);
			
			pstmt.setInt(1,cbmc.communityBulletinBoardNo);
			pstmt.setInt(2,cbmc.communityBulletinBoardMessageNo);
			pstmt.setInt(3,count);
			pstmt.setString(4,cbmc.name);
			pstmt.setString(5,cbmc.commentContent);
			pstmt.setInt(6,time);

			pstmt.executeUpdate(); //쿼리를 실행한다.
			count++;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("CommunityBulletinBoardMessageComment 테이블에 새로운 레코드를 추가했습니다.");        // 성공시 메시지 출력
	}
	
	public void updateCommunityBulletinBoardMessageComment(CommunityBulletinBoardMessageComment cbmc)
	{
		try {
			String sql = "select communityBulletinBoardNo from `" + dbTable +"` where communityBulletinBoardNo = ? and communityBulletinBoardMessageNo = ? and communityBulletinBoardMessageCommentNo = ?";
			
			pstmt = con.prepareStatement(sql);
		

			rs = pstmt.executeQuery();

			if( rs.next() )
			{
				int rId1 = rs.getInt("communityBulletinBoardNo");
				int rId2 = rs.getInt("communityBulletinBoardMessageNo");
				int rId3 = rs.getInt("communityBulletBoardMessageCommentNo");
						
				if ( rId1 == (cbmc.communityBulletinBoardNo) && rId2 == (cbmc.communityBulletinBoardMessageNo) && rId3 == (cbmc.communityBulletBoardMessageCommentNo) )
				{
					String updateQuery = "update `"+ dbTable +"` set name = ?"
							+ ", privacyScopeStatus = ?, commentContent = ?, openingDate = ?"
							+ "where communityBulletinBoardNo = ? and communityBulletinBoardMessageNo = ? and communityBulletBoardMessageCommentNo = ?";
					
					pstmt = con.prepareStatement(updateQuery);
					
					pstmt.setInt(1,cbmc.communityBulletinBoardNo);
					pstmt.setInt(2,cbmc.communityBulletinBoardMessageNo);
					pstmt.setInt(3,cbmc.communityBulletBoardMessageCommentNo);
					pstmt.setString(4,cbmc.name);
					pstmt.setString(5,cbmc.commentContent);
					pstmt.setInt(6,cbmc.openingDate);
		
					int count = pstmt.executeUpdate();
					
					count = pstmt.executeUpdate();
					System.out.println(count);
					System.out.println("모임방 게시글 댓글 수정 완료");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void deleteCommunityBulletinBoardMessage(int communityBulletinBoardNo, int communityBulletinBoardMessageNo, int communityBulletBoardMessageCommentNo) 
	{
		if(communityBulletinBoardNo == 0 || communityBulletinBoardMessageNo == 0 || communityBulletBoardMessageCommentNo == 0)
		{
			return;
		}
		
		try {
			String deleteQuery = "delete from `" + dbTable + "` where communityBulletinBoardNo = ? and communityBulletinBoardMessageNo = ? and communityBulletBoardMessageCommentNo = ?";
			
			pstmt = con.prepareStatement(deleteQuery);
			pstmt.setInt(1, communityBulletinBoardNo);
			pstmt.setInt(2, communityBulletinBoardMessageNo);
			pstmt.setInt(3, communityBulletBoardMessageCommentNo);
			
			pstmt.executeUpdate();
			System.out.println("게시글 댓글 삭제 성공");
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
	    }

	}
	
	public ArrayList<CommunityBulletinBoardMessageComment> selectCommunityBulletinBoardMessageComment()
	{
		ArrayList<CommunityBulletinBoardMessageComment> arr = new ArrayList<CommunityBulletinBoardMessageComment>();
		
		try {
			String selectQuery = "SELECT * FROM `"+ dbTable +"`";
			
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //조회 쿼리결과를 rs에 넣음
            
            System.out.println("--- 테이블 table 내용 조회 ---");
            
            //rs의 내용을 가져옴
            while (rs.next())
            {
            	CommunityBulletinBoardMessageComment cbmc = new CommunityBulletinBoardMessageComment() ;
            
            	cbmc.communityBulletinBoardNo = rs.getInt(1);
            	cbmc.communityBulletinBoardMessageNo = rs.getInt(2);
            	cbmc.communityBulletBoardMessageCommentNo = rs.getInt(3);
            	cbmc.name = rs.getString(4);
            	cbmc.commentContent = rs.getString(5);
            	cbmc.openingDate = rs.getInt(6);

            	arr.add(cbmc);
            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return arr;
	}
	
	public CommunityBulletinBoardMessageComment selectCommunityBulletinBoardMessageComment(String communityBulletinBoardNo, String communityBulletinBoardMessageNo, String communityBulletinBoardMessageCommentNo)
	{
		CommunityBulletinBoardMessageComment cbmc = new CommunityBulletinBoardMessageComment();
		try
        {
			//String selectQuery = "SELECT * FROM `"+ dbTable + "` where communityBulletinBoardNo = '" + communityBulletinBoardNo + "' and communityBulletinBoardMessageNo = '" + communityBulletinBoardMessageNo + 
			//		"' and communityBulletinBoardMessageCommentNo = '" + communityBulletinBoardMessageCommentNo;
		
			String selectQuery = "SELECT * FROM `" + dbTable + "` WHERE ";

	         selectQuery = selectQuery + "communityBulletinBoardNo = '" + cbmc.communityBulletinBoardNo + "'";
	         selectQuery = selectQuery + "and communityBulletinBoardMessageNo = '" + cbmc.communityBulletinBoardMessageNo + "'";
	         selectQuery = selectQuery + "and communityBulletinBoardMessageCommentNo = '" + cbmc.communityBulletBoardMessageCommentNo + "'";
	         
            //질의를 할 Statement 만들기 
            stmt = con.createStatement();
            rs = stmt.executeQuery(selectQuery);
            
            System.out.println("--- 테이블 student 내용 조회 ---");
            
            if (rs.next())
            {
            	cbmc.communityBulletinBoardNo = rs.getInt(1);
            	cbmc.communityBulletinBoardMessageNo = rs.getInt(2);
            	cbmc.communityBulletBoardMessageCommentNo = rs.getInt(3);
            	cbmc.name = rs.getString(4);
            	cbmc.commentContent = rs.getString(5);
            	cbmc.openingDate = rs.getInt(6);
            }
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return cbmc;
	}
}
