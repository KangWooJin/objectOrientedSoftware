package project.attandanceRecord;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import project.member.Account;
import project.member.Career;
import project.member.EmployeeData;
import project.member.MemberControl;
import project.member.MemberData;
import project.member.NormalMemberData;
import project.member.ResponsibilitySubject;

import project.establishProcess.*;
import project.lecture.*;

public class AttandanceRecordControl {
	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; 
	
	public static int aCount = 10 ;
	public static int sCount = 10 ;
	public static int eCount = 10 ;
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String dbTable = "attandanceRecord";
	
	
	
	public AttandanceRecordControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName); 
			con = DriverManager.getConnection(dbURL,id, passwd);
			
		} catch (Exception e) {
			e.printStackTrace();

		} 
	}
	
	
	
	
	public void insertAR(AttandanceRecordData ar)
	{
		if ( ar == null ) 
			return ;
		try{
			
			String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?)";
			
			pstmt = con.prepareStatement(insertQuery); 
			
			
			pstmt.setString(1,ar.memberID);
			pstmt.setString(2,ar.processCode);
			pstmt.setString(3,ar.record);

			
			System.out.println("蹂대궪占�?鍮꾩셿占�?");
			pstmt.executeUpdate();
			

			System.out.println("蹂대궡湲곗셿占�?");   
			
			

			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
				

	}
	
	public void updateAR(AttandanceRecordData ar)
	{
		if ( ar == null ) 
			return ;
		try{

			String insertQuery = "update " + "attandanceRecord set record=? where memberId=? and processCode=?";
			pstmt = con.prepareStatement(insertQuery); 
			
			pstmt.setString(1,ar.record);
			pstmt.setString(2,ar.memberID);
			pstmt.setString(3,ar.processCode);

			pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	
	
	public ArrayList<EstablishProcessData> selectProcess(String memberId)
	{
		 ArrayList<EstablishProcessData> list = new ArrayList<EstablishProcessData>();
		 if (memberId == null )
				return null;
	      try {
	    	  
	    	  String selectQuery = "SELECT * FROM `" + "establishProcess" + "` WHERE ";
	         selectQuery = selectQuery + "lecturerID = '" + memberId + "'";
	      
	         // 吏덉쓽占�? ?占쏙옙 Statement 留뚮뱾占�?
	         stmt = con.createStatement();
	         rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵占�? rs?占쏙옙 ?占쏙옙?占쏙옙

	         while (rs.next()) {
	            EstablishProcessData data = new EstablishProcessData();
	            data.processName = rs.getString(1);
	            data.trainingPeriodStart = rs.getInt(2);
	            data.trainingPeriodEnd = rs.getInt(3);
	            data.classRoom = rs.getString(4);
	            data.lecturerID = rs.getString(5);
	            data.tuition = rs.getInt(6);
	            if(rs.getInt(7) == 1){
	               data.isApply = true;   
	            }
	            else{
	               data.isApply = false;
	            }
	            
	            data.centerName = rs.getString(8);
	            data.refundSort = rs.getString(9);
	            if(rs.getInt(11) == 1){
	               data.isAccepted = true;   
	            }
	            else{
	               data.isAccepted = false;
	            }
	            data.detailLectureInfo = rs.getString(10);
	            data.completeStandard = rs.getString(12);
	            data.processCode = rs.getString(13);
	            data.subjectCode = rs.getString(14);
	            list.add(data);

	         }
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }

	      return list;
		
	}
	
	public int checkInsert(String processCode)
	{
		try
        {
			String selectQuery = "SELECT * FROM `" + "attandanceRecord" +"` where processCode = '" + processCode + "'";
			
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
	public String getRecord(String memberId, String processCode)
	{
		try
        {
			String selectQuery = "SELECT * FROM `" + "attandanceRecord" +"` where memberId = '" + memberId + "'" + " and processCode = '" + processCode + "'";
			
            //筌욌뜆?占쏙옙?占쏙옙占�? 占쎈막 Statement 筌띾슢諭얏묾占�? 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //鈺곌퀬?占쏙옙 ?占쏙옙?占쏙옙?占쏙옙野껉퀗?占쏙옙?占쏙옙占�? rs占쎈퓠 占쎄퐫占쎌벉
            
            
            
            //rs占쎌벥 占쎄땀占쎌뒠占쎌뱽 揶쏉옙占쎌죬占쎌긾
            if (rs.next())
            {
            	return rs.getString(3);
            }
            return "";

        }

        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
            return e.getMessage();
        }

	}
	public int getTotalDate(String sc)
	{
		if (sc == null )
			return 0;
		try {
	    	  String selectQuery = "SELECT * FROM `" + "operatesubject" + "` WHERE ";
	         selectQuery = selectQuery + "subjectCode = '" + sc + "'";
	         System.out.println(selectQuery);
	         // 吏덉쓽占�? ?占쏙옙 Statement 留뚮뱾占�?
	         stmt = con.createStatement();
	         rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵占�? rs?占쏙옙 ?占쏙옙?占쏙옙

	         if (rs.next()) {
	        	 int totalDate = rs.getInt(10);
	        	 return totalDate;
	        	 
	            }
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	         e.printStackTrace();
	      }
		return 0;
	}
	
	public ArrayList<LectureData> getLecture(String processCode)
	{
		ArrayList<LectureData> list = new ArrayList<LectureData>();
		 if (processCode == null )
				return null;
	      try {
	    	  
	    	  String selectQuery = "SELECT * FROM `" + "lecture" + "` WHERE ";
	         selectQuery = selectQuery + "processCode = '" + processCode + "'";
	      
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
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	         e.printStackTrace();
	      }

	      return list;
	}
	
	
	public void delete(String memberID)
	{
		
		if (memberID == null )
			return ;
		
		try {
			
			
			String deleteQuery = "delete from `"+ dbTable +"` where memberID = ? ";
			
			System.out.println(memberID);
			 pstmt = con.prepareStatement(deleteQuery); 
			 pstmt.setString(1,memberID);
			 
			 pstmt.executeUpdate();
			 
			 System.out.println("占쎄텣占쎌젫 占쎄쉐?占쏙옙");
			 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	   
	}
	
	
	public void updateNormalMember(NormalMemberData m)
	{
		
		try {
			
			String sql = "select memberID from memberdata where memberID = ?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m.memberID);

			
			rs = pstmt.executeQuery();

			
			if( rs.next() )
			{
				
				String rId= rs.getString("memberID");
				
				
				if ( rId.equals(m.memberID)  )
				{
					
					
					//獄쏅떽???占쏙옙 占쎈뼟占쏙옙 占쎈막占쎈뱜?占쏙옙?占쎈윮占쎈뱜占쎈뮉 set 占쎈뼄占쎌벉占쎈퓠 筌뤿굞?占쏙옙占쎈쭆野껓옙
					//where 占쎈막占쎈뱜?占쏙옙?占쎈윮占쎈뱜揶쏉옙 獄쏅떽???占쏙옙 占쎈뼟占쏙옙 占쎈뻬占쎌뱽 筌≪뼔?占쏙옙 野껓옙
					//updateQuery = "update memberdata set 獄쏅떽占쏙옙釉섓옙諭띰쭗占�? = ? where 疫꿸퀡?占쏙옙PK = ?"; 
		
					String updateQuery = "update `"+ dbTable +"` set password = ?, name = ?"
							+ ", genderStatus = ?, truthResidence = ?, homePhoneNo = ?, phoneNo = ?"
							+ ", emergencyContact = ?, email = ?, address = ?  where memberID = ? ";
					
					pstmt = con.prepareStatement(updateQuery);
		
					
					pstmt.setString(1,m.password);
					pstmt.setString(2,m.name);
					pstmt.setInt(3,m.genderStatus);
					pstmt.setString(4,m.truthResidence);
					pstmt.setString(5,m.homePhoneNo);
					pstmt.setString(6,m.phoneNo);
					pstmt.setString(7,m.emergencyContact);
					pstmt.setString(8,m.email);
					pstmt.setString(9,m.address);
					pstmt.setString(10,m.memberID);
					
					
								
					int count = pstmt.executeUpdate();
					
					System.out.println(count);
					
					String updateNormalMemberQuery = "update normalmemberdata set centerName = ?, department = ?"
							+ ", duty = ?, position = ?  where memberID = ? ";
					pstmt.close();
					
					pstmt = con.prepareStatement(updateNormalMemberQuery);
					
					pstmt.setString(1,m.centerName);
					pstmt.setString(2,m.department);
					pstmt.setString(3,m.duty);
					pstmt.setString(4,m.position);
					pstmt.setString(5,m.memberID);
					
					count = pstmt.executeUpdate();
					System.out.println(count);
					System.out.println("癰귨옙野껋럩?占쏙옙?占쏙옙占�?");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public int getMemberType(String memberID)
	{
		if ( memberID.charAt(0) == 'E' ||  memberID.charAt(0) == 'A')
		{
			return 1;
		}
		else if (  memberID.charAt(0) == 'S' )
		{
			return 0 ;
		}
		
		return -1;
	}
	
	public NormalMemberData selectNormalMember(String memberID)
	{
		try
        {
			String selectQuery = "SELECT * FROM `" + dbTable +"` where memberID = '" + memberID + "'";
			
            //筌욌뜆?占쏙옙?占쏙옙占�? 占쎈막 Statement 筌띾슢諭얏묾占�? 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //鈺곌퀬?占쏙옙 ?占쏙옙?占쏙옙?占쏙옙野껉퀗?占쏙옙?占쏙옙占�? rs占쎈퓠 占쎄퐫占쎌벉
            
            System.out.println("--- 占쏙옙?占쏙옙?占쏙옙?占쏙옙占�? student 占쎄땀占쎌뒠 鈺곌퀬?占쏙옙 ---");
            
            //rs占쎌벥 占쎄땀占쎌뒠占쎌뱽 揶쏉옙占쎌죬占쎌긾
            if (rs.next())
            {
            	
            	NormalMemberData nm = new NormalMemberData();
            	
            	nm.memberID = rs.getString(1);
            	nm.ID = rs.getString(2);
            	nm.password = rs.getString(3);
            	nm.name = rs.getString(4);
            	nm.genderStatus = rs.getInt(5);
            	nm.truthResidence = rs.getString(6);
            	nm.homePhoneNo = rs.getString(7);
            	nm.phoneNo = rs.getString(8);
            	nm.emergencyContact = rs.getString(9);
            	nm.email = rs.getString(10);
            	nm.address = rs.getString(11);
            	
            	String subSql = "SELECT * FROM normalmemberdata where memberID = '" + memberID +"'";
            	Statement substmt = con.createStatement();
            	
            	System.out.println(nm.memberID);
            	
            	ResultSet subRs = substmt.executeQuery(subSql);
            	
            	if(subRs.next()){
            		nm.memberID = subRs.getString(1);
            		nm.centerName = subRs.getString(2);
            		nm.department = subRs.getString(3);
            		nm.duty = subRs.getString(4);
            		nm.position = subRs.getString(5);
            	}
            	
            	System.out.println(nm.memberID);
            	
                
                //占쎈연占쎌쑎 占쎈쑓占쎌뵠占쎄숲 占쏙옙占쎌뿯占쎌뵠 揶쏉옙占쎈뮟占쎈맙
                //blob占쎈즲 占쎌뿲占쎌벉 
            	 return nm;
            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return null;

	}
	
	public EmployeeData selectEmployeeData(String memberID)
	{
		try
        {
			String selectQuery = "SELECT * FROM `" + dbTable +"` where memberID = '" + memberID + "'";
			
            //筌욌뜆?占쏙옙?占쏙옙占�? 占쎈막 Statement 筌띾슢諭얏묾占�? 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //鈺곌퀬?占쏙옙 ?占쏙옙?占쏙옙?占쏙옙野껉퀗?占쏙옙?占쏙옙占�? rs占쎈퓠 占쎄퐫占쎌벉
            
            System.out.println("--- 占쏙옙?占쏙옙?占쏙옙?占쏙옙占�? student 占쎄땀占쎌뒠 鈺곌퀬?占쏙옙 ---");
            
            //rs占쎌벥 占쎄땀占쎌뒠占쎌뱽 揶쏉옙占쎌죬占쎌긾
            if (rs.next())
            {
            	
            	EmployeeData em = new EmployeeData();
            	
            	em.memberID = rs.getString(1);
            	em.ID = rs.getString(2);
            	em.password = rs.getString(3);
            	em.name = rs.getString(4);
            	em.genderStatus = rs.getInt(5);
            	em.truthResidence = rs.getString(6);
            	em.homePhoneNo = rs.getString(7);
            	em.phoneNo = rs.getString(8);
            	em.emergencyContact = rs.getString(9);
            	em.email = rs.getString(10);
            	em.address = rs.getString(11);
            	
            	String subSql = "SELECT * FROM employeedata where memberID = '" + memberID +"'";
            	Statement substmt = con.createStatement();
            	
            	
            	ResultSet subRs = substmt.executeQuery(subSql);
            	
            	if(subRs.next()){
            		em.memberID = subRs.getString(1);
            		em.centerDepartmentName = subRs.getString(2);
            		em.joinedDate = subRs.getString(3);
            		em.profilePhoto = subRs.getString(4);
            		em.enName = subRs.getString(5);
            		em.positionName = subRs.getString(5);
            	}
            	
            	
            	
                
                //占쎈연占쎌쑎 占쎈쑓占쎌뵠占쎄숲 占쏙옙占쎌뿯占쎌뵠 揶쏉옙占쎈뮟占쎈맙
                //blob占쎈즲 占쎌뿲占쎌벉 
            	 return em;
            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return null;

	}
	
	public ArrayList<Account> selectAccount(String memberID)
	{
		ArrayList<Account> arr = new ArrayList<Account>();
		try
        {
			String selectQuery = "SELECT * FROM account where memberID = '" + memberID + "'";
			
            //筌욌뜆?占쏙옙?占쏙옙占�? 占쎈막 Statement 筌띾슢諭얏묾占�? 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //鈺곌퀬?占쏙옙 ?占쏙옙?占쏙옙?占쏙옙野껉퀗?占쏙옙?占쏙옙占�? rs占쎈퓠 占쎄퐫占쎌벉
            
            System.out.println("--- 占쏙옙?占쏙옙?占쏙옙?占쏙옙占�? student 占쎄땀占쎌뒠 鈺곌퀬?占쏙옙 ---");
            
            //rs占쎌벥 占쎄땀占쎌뒠占쎌뱽 揶쏉옙占쎌죬占쎌긾
            while (rs.next())
            {
            	
            	
            	Account a = new Account() ;
            	
            	a.accountNumber = rs.getString(1);
            	a.bankCode = rs.getString(2);
            	a.memberID = rs.getString(3);

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
	
	public ArrayList<Career> selectCareer(String memberID)
	{
		ArrayList<Career> arr = new ArrayList<Career>();
		try
        {
			String selectQuery = "SELECT * FROM career where memberID = '" + memberID + "'";
			
            //筌욌뜆?占쏙옙?占쏙옙占�? 占쎈막 Statement 筌띾슢諭얏묾占�? 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //鈺곌퀬?占쏙옙 ?占쏙옙?占쏙옙?占쏙옙野껉퀗?占쏙옙?占쏙옙占�? rs占쎈퓠 占쎄퐫占쎌벉
            
            System.out.println("--- 占쏙옙?占쏙옙?占쏙옙?占쏙옙占�? student 占쎄땀占쎌뒠 鈺곌퀬?占쏙옙 ---");
            
            //rs占쎌벥 占쎄땀占쎌뒠占쎌뱽 揶쏉옙占쎌죬占쎌긾
            while (rs.next())
            {
            	
            	
            	Career a = new Career() ;
            	
            	a.careerNo = rs.getInt(1);
            	a.careerType = rs.getInt(2);
            	a.career = rs.getString(3);
            	a.careerName = rs.getString(4);
            	a.memberID = rs.getString(5);

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
	
	
	public void close()
	{
		if(stmt != null) try{stmt.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}            // PreparedStatement 揶쏆빘占�? 占쎈퉸占쎌젫

		if(con != null) try{con.close();}catch(SQLException sqle){}            // Connection 占쎈퉸占쎌젫

	}
	
	public static void main(String[] args)
	{
		AttandanceRecordControl ac = new AttandanceRecordControl();
		AttandanceRecordData ad = new AttandanceRecordData();

		ac.selectProcess("E0000001");
		/*
		ad.memberID = "A0000002";
		ad.processCode = "P002";
		ad.record = "12354";

		ac.insertAR(ad);
		*/
	}

	
}
