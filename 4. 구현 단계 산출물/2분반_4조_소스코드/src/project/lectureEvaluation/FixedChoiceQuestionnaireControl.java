package project.lectureEvaluation;

import java.sql.*;
import java.util.ArrayList;

public class FixedChoiceQuestionnaireControl {

	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; // 디비 스키마 부분 다들 만들때 software

	public static int cCount = 1 ;
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbTable = "fixedchoicequestionnaire";
	// insert into db테이블명 values(?,?,?); -> ? 갯수는 디비에 애트리뷰트의 갯수와 같아야함

	public FixedChoiceQuestionnaireControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName); 
			con = DriverManager.getConnection(dbURL,id, passwd);

		} catch (Exception e) {
			e.printStackTrace();

		} 
	}
	public int getCount() {
	      int count = 0 ;
	      int max = -1 ;
	      try
	        {
	         String selectQuery = "SELECT * FROM `"+ dbTable + "` " ;
	         
	            //질의를 할 Statement 만들기 
	            stmt = con.createStatement();
	            
	            rs = stmt.executeQuery(selectQuery); //조회 쿼리결과를 rs에 넣음
	            
	            System.out.println("--- 테이블 student 내용 조회 ---");
	            
	            //rs의 내용을 가져옴
	            while (rs.next())
	            {

	               if ( max < rs.getInt("fixedChoiceQuestionnaireID"))
	               {
	                  max = rs.getInt("fixedChoiceQuestionnaireID");
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
	public boolean insert(FixedChoiceQuestionnaire fcq)
	{
		boolean flag = true;
		try{

			String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?, ?)";

			pstmt = con.prepareStatement(insertQuery); // prepareStatement에서 해당 sql을 미리 컴파일한다.

			//애튜리뷰트에 값을 대입함
			pstmt.setInt(1,fcq.fixedChoiceQuestionnaireID);
			pstmt.setString(2,fcq.fixedChoiceQuestionTypeID);
			pstmt.setString(3,fcq.fixedChoiceQuestionDivision);
			pstmt.setString(4,fcq.fixedChoiceQuestionnaireContent);

			pstmt.executeUpdate(); //쿼리를 실행한다.
			System.out.println("강의 평가 질문 테이블에 새로운 레코드를 추가했습니다.");        // 성공시 메시지 출력



			return flag;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		cCount++;
		return flag;
	}

	public void delete(FixedChoiceQuestionnaire fcq)
	{
		try {
			String deleteQuery = "delete from `"+ dbTable +"` where fixedChoiceQuestionnaireID = ? ";

			pstmt = con.prepareStatement(deleteQuery); 

			pstmt.setString(1,"3");

			pstmt.executeUpdate();

			System.out.println("삭제 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}


	public ArrayList<FixedChoiceQuestionnaire> select()
	{
		ArrayList<FixedChoiceQuestionnaire> arr = new ArrayList<FixedChoiceQuestionnaire>();

		try
		{
			String selectQuery = "SELECT * FROM " + dbTable ;

			//질의를 할 Statement 만들기 
			stmt = con.createStatement();

			rs = stmt.executeQuery(selectQuery); //조회 쿼리결과를 rs에 넣음

			System.out.println("--- 내용 조회 ---");

			//rs의 내용을 가져옴
			while (rs.next())
			{
				FixedChoiceQuestionnaire fcq = new FixedChoiceQuestionnaire();

				fcq.fixedChoiceQuestionnaireID = rs.getInt(1);
				fcq.fixedChoiceQuestionTypeID = rs.getString(2);
				fcq.fixedChoiceQuestionDivision = rs.getString(3);
				fcq.fixedChoiceQuestionnaireContent = rs.getString(4);

				//여러 데이터 타입이 가능함
				//blob도 잇음 
				System.out.print(fcq.fixedChoiceQuestionnaireID + " ");
				System.out.print(fcq.fixedChoiceQuestionTypeID  + " ");
				System.out.print(fcq.fixedChoiceQuestionDivision  + " ");
				System.out.println(fcq.fixedChoiceQuestionnaireContent );
				//System.out.println(leq.evaluationQuestionContent);

				//return leq;
				arr.add(fcq);
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
		if ( stmt != null ) try{stmt.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}            // PreparedStatement 객체 해제

		if(con != null) try{con.close();}catch(SQLException sqle){}            // Connection 해제

	}

	public static void main(String[] args)
	{
		FixedChoiceQuestionnaire m1 = new FixedChoiceQuestionnaire();
		FixedChoiceQuestionnaireControl leqc = new FixedChoiceQuestionnaireControl();

		leqc.select();
		leqc.close();
	}
}
