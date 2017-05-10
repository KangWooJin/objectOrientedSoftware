package project.workresult;

import java.sql.*;
import java.util.ArrayList;



public class WorkResultControl {
	
	static final String id = "root";
	static final String passwd="1234";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; // �뵒鍮� �뒪�궎留� 遺�遺� �떎�뱾 留뚮뱾�븣 software
	
	public static int count = 1;
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String dbTable = "workresult";
	
	// insert into db�뀒�씠釉붾챸 values(?,?,?); -> ? 媛��닔�뒗 �뵒鍮꾩뿉 �븷�듃由щ럭�듃�쓽 媛��닔�� 媛숈븘�빞�븿
	
	public WorkResultControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName); 
			con = DriverManager.getConnection(dbURL,id, passwd);
			
		} catch (Exception e) {
			e.printStackTrace();

		} 
	}
	
	public void insertWorkResult(WorkResult a)
	{
		if ( a == null ) 
			return ;
		
		try {
			
			String insertQuery = "INSERT INTO `"+ dbTable + "` VALUES(?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(insertQuery); // prepareStatement�뿉�꽌 �빐�떦 sql�쓣 誘몃━ 而댄뙆�씪�븳�떎.
			
			pstmt.setInt(1,a.resultNo);
			pstmt.setInt(2,a.workResult);
			pstmt.setString(3,a.workData);
			pstmt.setString(4,a.resultDate);
			pstmt.setString(5,a.memberID);
			
			
			pstmt.executeUpdate(); //荑쇰━瑜� �떎�뻾�븳�떎.
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("workResult �뀒�씠釉붿뿉 �깉濡쒖슫 �젅肄붾뱶瑜� 異붽��뻽�뒿�땲�떎.");        // �꽦怨듭떆 硫붿떆吏� 異쒕젰
	}
	
	public void delete(int resultNo)
	{
		if (resultNo == 0 )
			return ;
		
		try {
			
			
			String deleteQuery = "delete from `"+ dbTable +"` where resultNo = ? ";
			
			System.out.println(resultNo);
			 pstmt = con.prepareStatement(deleteQuery); 
			 pstmt.setInt(1,resultNo);
			 
			 pstmt.executeUpdate();
			 
			 System.out.println("�뾽臾댄룊媛� �궘�젣 �꽦怨�");
			 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	   
	}
	
	
	
	
	
	public ArrayList<WorkResult> selectWorkResult(String memberID)
	{
		ArrayList<WorkResult> arr = null;
		try
        {
			String selectQuery = "SELECT * FROM `"+ dbTable + "` where memberID = '" + memberID + "'";
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            arr = new ArrayList<WorkResult>();
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
            while (rs.next())
            {
            	WorkResult a = new WorkResult();
            	a.resultNo = rs.getInt(1);
            	a.workResult = rs.getInt(2);
            	a.workData = rs.getString(3);
            	a.resultDate = rs.getString(4);
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
	
	public int getCount(String memberID) {
		int count = 0 ;
		int max = -1 ;
		try
        {
			String selectQuery = "SELECT * FROM `"+ dbTable + "` where memberID = '" + memberID + "'";
			
            //吏덉쓽瑜� �븷 Statement 留뚮뱾湲� 
            stmt = con.createStatement();
            
            rs = stmt.executeQuery(selectQuery); //議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
            
            System.out.println("--- �뀒�씠釉� student �궡�슜 議고쉶 ---");
            
            //rs�쓽 �궡�슜�쓣 媛��졇�샂
            while (rs.next())
            {

            	if ( max < rs.getInt("resultNo"))
            	{
            		max = rs.getInt("resultNo");
            	}
            	

            }
           
            
        }
        catch (Exception e)
        {            
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
		
		if ( max != -1 )
			count = max ;
		
		return count;
	}
	
	public static void main(String[] args)
	{
		WorkResultControl wc = new WorkResultControl();
		int count = wc.getCount("E0000001");
		
		System.out.println(count+1);
	}
}
