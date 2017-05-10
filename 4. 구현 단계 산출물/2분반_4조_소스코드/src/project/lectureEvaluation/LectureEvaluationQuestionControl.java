package project.lectureEvaluation;

//import java.io.Console;
import java.sql.*;
import java.util.ArrayList;

//import org.w3c.dom.Document;

public class LectureEvaluationQuestionControl {

	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; // 디비 스키마 부분 다들 만들때 software

	public static int qCount = 1 ;
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbTable = "lectureevaluationquestion";
	// insert into db테이블명 values(?,?,?); -> ? 갯수는 디비에 애트리뷰트의 갯수와 같아야함
	private static LectureEvaluationQuestionControl instance;
	public static LectureEvaluationQuestionControl getInstance(){
		if(instance==null)
			instance=new LectureEvaluationQuestionControl();
		return instance;
	}

	public LectureEvaluationQuestionControl() {
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

	               if ( max < rs.getInt("evaluationQuestionNumber"))
	               {
	                  max = rs.getInt("evaluationQuestionNumber");
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
	public boolean insert(LectureEvaluationQuestion leq)
	{
		boolean flag = true;
		
		try{

			String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(insertQuery); // prepareStatement에서 해당 sql을 미리 컴파일한다.

			//애튜리뷰트에 값을 대입함
			pstmt.setInt(1,leq.evaluationQuestionNumber);
			pstmt.setString(2,leq.effectiveStartDate);
			pstmt.setString(3,leq.effectiveFinishDate);
			pstmt.setString(4,leq.evaluandDivision);
			pstmt.setString(5,leq.evaluationQuestionContent);


			//System.out.println(qCount);
			System.out.println(leq.evaluationQuestionContent);
			pstmt.executeUpdate(); //쿼리를 실행한다.

			System.out.println("강의 평가 질문 테이블에 새로운 레코드를 추가했습니다.");        // 성공시 메시지 출력
			return flag;


		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		qCount++;
		return flag;
	}

	public void delete(String pk)
	{
		try {
			String deleteQuery = "delete from "+ dbTable +" where evaluationQuestionNumber = ? ";

			pstmt = con.prepareStatement(deleteQuery); 

			pstmt.setString(1,pk);

			pstmt.executeUpdate();

			System.out.println("삭제 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	public ArrayList<LectureEvaluationQuestion> select()
	{
		ArrayList<LectureEvaluationQuestion> arr = new ArrayList<LectureEvaluationQuestion>();

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
				LectureEvaluationQuestion leq = new LectureEvaluationQuestion();

				leq.evaluationQuestionNumber = rs.getInt(1);
				leq.effectiveStartDate = rs.getString(2);
				leq.effectiveFinishDate = rs.getString(3);
				leq.evaluandDivision = rs.getString(4);
				leq.evaluationQuestionContent = rs.getString(5);
				
				arr.add(leq);
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
		LectureEvaluationQuestionControl leqc = new LectureEvaluationQuestionControl();
		LectureEvaluationQuestion m1 = new LectureEvaluationQuestion();


		//leqc.delete("1");
		//leqc.insert(m1);
		leqc.select();
	}
}
