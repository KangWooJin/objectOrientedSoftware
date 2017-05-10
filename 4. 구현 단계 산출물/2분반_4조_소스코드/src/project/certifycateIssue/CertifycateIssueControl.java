package project.certifycateIssue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import project.attandanceRecord.AttandanceRecordData;
import project.establishProcess.EstablishProcessData;
import project.lecture.LectureData;

public class CertifycateIssueControl 
{
	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; 
	
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String dbTable = "attandanceRecord";
	
	
	
	public CertifycateIssueControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName); 
			con = DriverManager.getConnection(dbURL,id, passwd);
			
		} catch (Exception e) {
			e.printStackTrace();

		} 
	}
	
	
	public int checkER(String memberId, String processCode)
	{
		try
        {
			String selectQuery = "SELECT * FROM `" + "evaluationresult" +"` where processCode = '" + processCode + "' and memberId = '" + memberId + "'";
			
            //筌욌뜆?占쏙옙?占쏙옙占�? 占쎈막 Statement 筌띾슢諭얏묾占�? 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //鈺곌퀬?占쏙옙 ?占쏙옙?占쏙옙?占쏙옙野껉퀗?占쏙옙?占쏙옙占�? rs占쎈퓠 占쎄퐫占쎌벉
            
            System.out.println("--- 占쏙옙?占쏙옙?占쏙옙?占쏙옙占�? student 占쎄땀占쎌뒠 鈺곌퀬?占쏙옙 ---");
            
            //rs占쎌벥 占쎄땀占쎌뒠占쎌뱽 揶쏉옙占쎌죬占쎌긾
            if (rs.next())
            {
            	return 1;
            }
            return 0;

        }

        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
            return 0;
        }
	}
	public ArrayList<CertifycateIssueData> getCIDList(String memberId, String processCode)
	{
		ArrayList<CertifycateIssueData> list = new ArrayList<CertifycateIssueData>();
		 if (processCode == null || memberId == null)
				return null;
	      try {
	    	  
	    	  String selectQuery = "SELECT * FROM `" + "certifycateIssue" + "` WHERE ";
	         selectQuery = selectQuery + "processCode = '" + processCode + "' and memberId = '" + memberId + "'";
	      
	         // 吏덉쓽占�? ?占쏙옙 Statement 留뚮뱾占�?
	         stmt = con.createStatement();
	         rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵占�? rs?占쏙옙 ?占쏙옙?占쏙옙

	         while (rs.next()) {
	        	 CertifycateIssueData data = new CertifycateIssueData();
	            data.processCode = rs.getString(2);
	            data.memberId = rs.getString(3);
	            data.issueNum = rs.getInt(1);
	            data.date = rs.getString(4);

	            
	            list.add(data);
	         }
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	         e.printStackTrace();
	         return null;
	      }

	      return list;
	}
	public ArrayList<LectureData> getLecture(String memberId)
	{
		ArrayList<LectureData> list = new ArrayList<LectureData>();
		ArrayList<LectureData> list2 = new ArrayList<LectureData>();
		 if (memberId == null )
				return null;
	      try {
	    	  
	    	  String selectQuery = "SELECT * FROM `" + "lecture" + "` WHERE ";
	         selectQuery = selectQuery + "memberId = '" + memberId + "'";
	      
	         // 吏덉쓽占�? ?占쏙옙 Statement 留뚮뱾占�?
	         stmt = con.createStatement();
	         rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵占�? rs?占쏙옙 ?占쏙옙?占쏙옙

	         while (rs.next()) {
	        	 LectureData data = new LectureData();
	            data.processCode = rs.getString(1);
	            data.memberID = rs.getString(2);
	            data.processStep = rs.getInt(3);
	            data.personnelCardNumber = rs.getString(4);
	            data.processName = rs.getString(5);
	            data.companyName = rs.getString(6);
	            
	            list.add(data);
	            System.out.println(data.memberID);
	         }
	         
	         int arrCount = list.size();
	         
	         for(int i = 0; i < arrCount; i++ )
	         {
	        	 int check = checkER(memberId, list.get(i).processCode);
	        	 if(check == 1)
	        	 {
	        		 list2.add(list.get(i));
	        	 }
	         }
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	         e.printStackTrace();
	      }

	      return list2;
	}
	
	public int checkNum(String memberId, String processCode)
	{
		try
        {
			String selectQuery = "SELECT * FROM `" + "certifycateIssue" +"` where processCode = '" + processCode + "' and memberId = '" + memberId + "'";
			
            //筌욌뜆?占쏙옙?占쏙옙占�? 占쎈막 Statement 筌띾슢諭얏묾占�? 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //鈺곌퀬?占쏙옙 ?占쏙옙?占쏙옙?占쏙옙野껉퀗?占쏙옙?占쏙옙占�? rs占쎈퓠 占쎄퐫占쎌벉
            
            System.out.println("--- 占쏙옙?占쏙옙?占쏙옙?占쏙옙占�? student 占쎄땀占쎌뒠 鈺곌퀬?占쏙옙 ---");
            
            //rs占쎌벥 占쎄땀占쎌뒠占쎌뱽 揶쏉옙占쎌죬占쎌긾
            int count = 1;
           
            while (rs.next())
            {
            	count++;
            }
            return count;

        }

        catch (Exception e)
        {            
        	System.out.println("111111111111111111111111111111111111111111");
            System.out.println(e.getMessage());
            e.printStackTrace();
            return 0;
        }
	}
	
	public EstablishProcessData selectProcess(String processCode) {
		EstablishProcessData osd = new EstablishProcessData();

		try {

			String selectQuery = "SELECT * FROM `" + "establishprocess" + "` WHERE ";

			selectQuery = selectQuery + "processCode = '" + processCode + "'";

			// 吏덉쓽瑜� �븷 Statement 留뚮뱾湲�
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬

			while (rs.next()) {
				osd.processName = rs.getString(1);
				osd.centerName = rs.getString(8);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return osd;
	}
	
	public int insertCI(CertifycateIssueData cid)
	{
		if ( cid == null ) 
			return 0;
		try{
			
			String insertQuery = "INSERT INTO `" + "certifycateIssue" + "` VALUES(?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(insertQuery); 
			
			
			pstmt.setInt(1,cid.issueNum);
			pstmt.setString(2,cid.processCode);
			pstmt.setString(3,cid.memberId);
			pstmt.setString(4,cid.date);

		
			pstmt.executeUpdate();
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return 0;
		}
				

	}
	

}
