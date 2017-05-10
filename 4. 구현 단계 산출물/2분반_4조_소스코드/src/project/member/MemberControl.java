package project.member;

import java.sql.*;
import java.util.ArrayList;




public class MemberControl {

	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; // �뵒鍮� �뒪�궎留� 遺�遺� �떎�뱾 留뚮뱾�븣 software
	
	public static int aCount = 10 ;
	public static int sCount = 10 ;
	public static int eCount = 10 ;
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String dbTable = "memberdata";
	
	// insert into db�뀒�씠釉붾챸 values(?,?,?); -> ? 媛��닔�뒗 �뵒鍮꾩뿉 �븷�듃由щ럭�듃�쓽 媛��닔�� 媛숈븘�빞�븿
	
	
	public MemberControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName); 
			con = DriverManager.getConnection(dbURL,id, passwd);
			
		} catch (Exception e) {
			e.printStackTrace();

		} 
	}
	
	
	
	
	public void insertEmployee(EmployeeData m)
	{
		if ( m == null ) 
			return ;
		try{
			
			String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(insertQuery); // prepareStatement�뿉�꽌 �빐�떦 sql�쓣 誘몃━ 而댄뙆�씪�븳�떎.
			
			//�븷�뒠由щ럭�듃�뿉 媛믪쓣 ���엯�븿
			
			pstmt.setString(1,m.memberID);
			pstmt.setString(2,m.ID);
			pstmt.setString(3,m.password);
			pstmt.setString(4,m.name);
			pstmt.setInt(5,m.genderStatus);
			pstmt.setString(6,m.truthResidence);
			pstmt.setString(7,m.homePhoneNo);
			pstmt.setString(8,m.phoneNo);
			pstmt.setString(9,m.emergencyContact);
			pstmt.setString(10,m.email);
			pstmt.setString(11,m.address);
			
		
			pstmt.executeUpdate(); //荑쇰━瑜� �떎�뻾�븳�떎.
			
				String employeeQuery = "INSERT INTO employeedata  VALUES(?, ?, ?, ?, ?, ?)";
				
				pstmt = con.prepareStatement(employeeQuery); // prepareStatement�뿉�꽌 �빐�떦 sql�쓣 誘몃━ 而댄뙆�씪�븳�떎.
				
				//�븷�뒠由щ럭�듃�뿉 媛믪쓣 ���엯�븿
				
				pstmt.setString(1,m.memberID);
				pstmt.setString(2,m.centerDepartmentName);
				pstmt.setString(3,new java.util.Date().toString());
				pstmt.setString(4,"");
				pstmt.setString(5,m.enName);
				pstmt.setString(6,m.positionName);
				
				pstmt.executeUpdate(); //荑쇰━瑜� �떎�뻾�븳�떎.
			
			
			

			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
				

	}
	
	public void insertNormalMember(NormalMemberData m)
	{
		if ( m == null ) 
			return ;
		String normalQuery = "INSERT INTO normalmemberdata VALUES(?, ?, ?, ?, ?)";
		
		try {
			
			String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(insertQuery); // prepareStatement�뿉�꽌 �빐�떦 sql�쓣 誘몃━ 而댄뙆�씪�븳�떎.
			
			//�븷�뒠由щ럭�듃�뿉 媛믪쓣 ���엯�븿
			
			pstmt.setString(1,m.memberID);
			pstmt.setString(2,m.ID);
			pstmt.setString(3,m.password);
			pstmt.setString(4,m.name);
			pstmt.setInt(5,m.genderStatus);
			pstmt.setString(6,m.truthResidence);
			pstmt.setString(7,m.homePhoneNo);
			pstmt.setString(8,m.phoneNo);
			pstmt.setString(9,m.emergencyContact);
			pstmt.setString(10,m.email);
			pstmt.setString(11,m.address);
			
			pstmt.executeUpdate(); //荑쇰━瑜� �떎�뻾�븳�떎.
			
			pstmt.close();
			
			pstmt = con.prepareStatement(normalQuery); // prepareStatement�뿉�꽌 �빐�떦 sql�쓣 誘몃━ 而댄뙆�씪�븳�떎.
			
			pstmt.setString(1,m.memberID);
			pstmt.setString(2,m.centerName);
			pstmt.setString(3,m.department);
			pstmt.setString(4,m.duty);
			pstmt.setString(5,m.position);
			
			pstmt.executeUpdate(); //荑쇰━瑜� �떎�뻾�븳�떎.
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("employee �뀒�씠釉붿뿉 �깉濡쒖슫 �젅肄붾뱶瑜� 異붽��뻽�뒿�땲�떎.");        // �꽦怨듭떆 硫붿떆吏� 異쒕젰
		
		return  ;
	
	}
	
	public void insertAccount(Account a)
	{
		if ( a == null ) 
			return ;
		try {
			
			String insertQuery = "INSERT INTO account VALUES(?, ?, ?)";
			
			pstmt = con.prepareStatement(insertQuery); // prepareStatement�뿉�꽌 �빐�떦 sql�쓣 誘몃━ 而댄뙆�씪�븳�떎.
			
			pstmt.setString(1,a.accountNumber);
			pstmt.setString(2,a.bankCode);
			pstmt.setString(3,a.memberID);
			
			pstmt.executeUpdate(); //荑쇰━瑜� �떎�뻾�븳�떎.
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("account �뀒�씠釉붿뿉 �깉濡쒖슫 �젅肄붾뱶瑜� 異붽��뻽�뒿�땲�떎.");        // �꽦怨듭떆 硫붿떆吏� 異쒕젰
	}
	
	public void insertCareer(Career c)
	{
		if ( c == null ) 
			return ;
		try {
			
			String insertQuery = "INSERT INTO career VALUES(?, ?, ?,?,?)";
			
			pstmt = con.prepareStatement(insertQuery); // prepareStatement�뿉�꽌 �빐�떦 sql�쓣 誘몃━ 而댄뙆�씪�븳�떎.
			
			pstmt.setInt(1,c.careerNo);
			pstmt.setInt(2,c.careerType);
			pstmt.setString(3,c.career);
			pstmt.setString(4,c.careerName);
			pstmt.setString(3,c.memberID);
			
			pstmt.executeUpdate(); //荑쇰━瑜� �떎�뻾�븳�떎.
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("career �뀒�씠釉붿뿉 �깉濡쒖슫 �젅肄붾뱶瑜� 異붽��뻽�뒿�땲�떎.");        // �꽦怨듭떆 硫붿떆吏� 異쒕젰
	}
	
	public void insertResponsibilitySubject(ResponsibilitySubject r)
	{
		if ( r == null ) 
			return ;
		try {
			
			String insertQuery = "INSERT INTO responsibilitysubject VALUES(?, ?)";
			
			pstmt = con.prepareStatement(insertQuery); // prepareStatement�뿉�꽌 �빐�떦 sql�쓣 誘몃━ 而댄뙆�씪�븳�떎.
			
			pstmt.setString(1,r.responsibilitySubject);
			pstmt.setString(2,r.memberID);
			
			
			pstmt.executeUpdate(); //荑쇰━瑜� �떎�뻾�븳�떎.
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("ResponsibilitySubject �뀒�씠釉붿뿉 �깉濡쒖슫 �젅肄붾뱶瑜� 異붽��뻽�뒿�땲�떎.");        // �꽦怨듭떆 硫붿떆吏� 異쒕젰		
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
			 
			 System.out.println("�궘�젣 �꽦怨�");
			 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	   
	}
	
	public void updateEmployee(EmployeeData m)
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
					
					
					//諛붽씀怨� �떢�� �븷�듃由щ럭�듃�뒗 set �떎�쓬�뿉 紐낆떆�맂寃�
					//where �븷�듃由щ럭�듃媛� 諛붽씀怨� �떢�� �뻾�쓣 李얜뒗 寃�
					//updateQuery = "update memberdata set 諛붽��븘�뱶紐� = ? where 湲곕낯PK = ?"; 
		
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
					
					String updateNormalMemberQuery = "update employeedata set centerDepartmentName = ?"
							+ ", enName = ?, positionName = ?  where memberID = ? ";
					pstmt.close();
					
					pstmt = con.prepareStatement(updateNormalMemberQuery);
					
					
					pstmt.setString(1,m.centerDepartmentName);
					pstmt.setString(2,m.enName);
					pstmt.setString(3,m.positionName);
					pstmt.setString(4,m.memberID);
					
					count = pstmt.executeUpdate();
					System.out.println(count);
					System.out.println("吏곸썝�젙蹂� 蹂�寃쎌셿猷�");
				}
			}
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
					
					
					//諛붽씀怨� �떢�� �븷�듃由щ럭�듃�뒗 set �떎�쓬�뿉 紐낆떆�맂寃�
					//where �븷�듃由щ럭�듃媛� 諛붽씀怨� �떢�� �뻾�쓣 李얜뒗 寃�
					//updateQuery = "update memberdata set 諛붽��븘�뱶紐� = ? where 湲곕낯PK = ?"; 
		
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
					System.out.println("蹂�寃쎌셿猷�");
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
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
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
            	
                
                //�뿬�윭 �뜲�씠�꽣 ���엯�씠 媛��뒫�븿
                //blob�룄 �엲�쓬 
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
	
	public MemberData selectMemberData(String memberID)
	{
		try
        {
			String selectQuery = "SELECT * FROM `" + dbTable +"` where memberID = '" + memberID + "'";
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
            if (rs.next())
            {
            	
            	MemberData em = new MemberData();
            	
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
	
	public EmployeeData selectEmployeeData(String memberID)
	{
		try
        {
			String selectQuery = "SELECT * FROM `" + dbTable +"` where memberID = '" + memberID + "'";
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
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
            	
            	
            	
                
                //�뿬�윭 �뜲�씠�꽣 ���엯�씠 媛��뒫�븿
                //blob�룄 �엲�쓬 
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
	
	public ArrayList<EmployeeData> selectEmployeeDatas()
	{
		ArrayList<EmployeeData> arr = new ArrayList<EmployeeData>();
		
		try
        {
			String selectQuery = "SELECT * FROM `" + dbTable +"`" ;
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
            while (rs.next())
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
            	
            	String subSql = "SELECT * FROM employeedata where memberID = '" + em.memberID +"'";
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
            	
            	
            	
                
                //�뿬�윭 �뜲�씠�꽣 ���엯�씠 媛��뒫�븿
                //blob�룄 �엲�쓬 
            	 arr.add(em);
            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return arr;

	}
	
	public ArrayList<EmployeeData> selectEmployeeDatas(String name)
	{
		ArrayList<EmployeeData> arr = new ArrayList<EmployeeData>();
		
		try
        {
			String selectQuery = "SELECT * FROM `" + dbTable +"` where name = '" + name + "'" ;
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
            while (rs.next())
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
            	
            	String subSql = "SELECT * FROM employeedata where memberID = '" + em.memberID +"'";
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
            	
            	
            	
                
                //�뿬�윭 �뜲�씠�꽣 ���엯�씠 媛��뒫�븿
                //blob�룄 �엲�쓬 
            	 arr.add(em);
            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return arr;

	}
	
	public ArrayList<Account> selectAccount(String memberID)
	{
		ArrayList<Account> arr = new ArrayList<Account>();
		try
        {
			String selectQuery = "SELECT * FROM account where memberID = '" + memberID + "'";
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
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
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
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
	
	public ArrayList<ResponsibilitySubject> selectResponsibilitySubject(String memberID)
	{
		ArrayList<ResponsibilitySubject> arr = new ArrayList<ResponsibilitySubject>();
		try
        {
			String selectQuery = "SELECT * FROM career where memberID = '" + memberID + "'";
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
            while (rs.next())
            {
            	
            	
            	ResponsibilitySubject a = new ResponsibilitySubject() ;
            	
            	a.responsibilitySubject = rs.getString(1);
            	a.memberID = rs.getString(2);

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
	
	public String login(String id, String password)
	{
		try
        {
			String selectQuery = "SELECT * FROM `" + dbTable +"` where ID = '" + id + "' and password = '" + password + "'";
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            System.out.println(id + " " + password);
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
            if (rs.next())
            {
            	String memberID = rs.getString(1);
            	return memberID;
            	
            
            }
        } catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
		
		return null ;
	}
	public ArrayList<EmployeeData> findMember(String name, String phoneNo)
	{
		ArrayList<EmployeeData> arr = new ArrayList<EmployeeData>();
		try
        {
			String selectQuery = "SELECT * FROM memberdata where name = '" + name + "' AND phoneNo= '" + phoneNo +"'";
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� memberdata �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
            //arr = new ArrayList<EmployeeData>();
            
            while (rs.next())
            {
            	
            
            	
            	EmployeeData a = new EmployeeData() ;
            	
            	a.memberID = rs.getString("memberID");
            	
            	if ( a.memberID.charAt(0) == 'S' || a.memberID.charAt(0) == 'A')
            		continue ;
            	
            	
            	a.name = rs.getString("name");
            	a.phoneNo = rs.getString("phoneNo");
            	
            	System.out.println(a.name);
            	selectQuery = "SELECT * FROM employeedata where memberID = '" + a.memberID + "'";
    			
                //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
                stmt = con.createStatement();
                
                rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
                
                if ( rs.next() ){
                	
                	a.centerDepartmentName = rs.getString("centerDepartmentName");
                	a.positionName = rs.getString("positionName");
                	a.joinedDate = rs.getString("joinedDate");
                }
                
                System.out.println("--- �뀒�씠釉� memberdata �궡�슜 議고쉶 ---");
            	
              
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
	
	public boolean isID(String id)
	{
		try
        {
			String selectQuery = "SELECT * FROM memberdata where id = '" + id + "' ";
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� memberdata �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
            if (rs.next())
            {
            	return true ;
            	
            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
			
		return false;
	}
	public void close()
	{
		if(stmt != null) try{stmt.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}            // PreparedStatement 媛앹껜 �빐�젣

		if(con != null) try{con.close();}catch(SQLException sqle){}            // Connection �빐�젣

	}
	
	public static void main(String[] args)
	{
		MemberControl m = new MemberControl();
		MemberData m1 = new MemberData();
		EmployeeData m2 = new EmployeeData();
		
		System.out.println(m.findMember("asd", "01098114021"));
	}

	
}
