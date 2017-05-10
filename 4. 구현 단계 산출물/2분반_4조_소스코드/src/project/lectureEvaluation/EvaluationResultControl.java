package project.lectureEvaluation;

//import java.io.Console;
import java.sql.*;
import java.util.ArrayList;

//import org.w3c.dom.Document;

public class EvaluationResultControl {

	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; // 디비 스키마 부분 다들 만들때 software

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbTable = "evaluationresult";
	// insert into db테이블명 values(?,?,?); -> ? 갯수는 디비에 애트리뷰트의 갯수와 같아야함
	private static EvaluationResultControl instance;
	public static EvaluationResultControl getInstance(){
		if(instance==null)
			instance=new EvaluationResultControl();
		return instance;
	}

	public EvaluationResultControl() {
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
	public boolean insert(EvaluationResult er)
	{
		boolean flag = true;
		
		try{

			String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(insertQuery); // prepareStatement에서 해당 sql을 미리 컴파일한다.

			//애튜리뷰트에 값을 대입함
			pstmt.setString(1,er.memberId);
			pstmt.setString(2,er.processCode);
			pstmt.setInt(3,er.evaluationQuestionNumber);
			pstmt.setInt(4,er.fixedChoiceQuestionnaireID);
			pstmt.setString(5,er.short_answerQuestion);


			//System.out.println(qCount);
			//System.out.println(leq.evaluationQuestionContent);
			pstmt.executeUpdate(); //쿼리를 실행한다.

			System.out.println("강의 평가 질문 테이블에 새로운 레코드를 추가했습니다.");        // 성공시 메시지 출력
			return flag;


		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return flag;
	}

	public ArrayList<EvaluationResult> select()
	{
		ArrayList<EvaluationResult> arr = new ArrayList<EvaluationResult>();

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
				EvaluationResult er = new EvaluationResult();

				er.memberId = rs.getString(1);
				er.processCode = rs.getString(2);
				er.evaluationQuestionNumber = rs.getInt(3);
				er.fixedChoiceQuestionnaireID = rs.getInt(4);
				er.short_answerQuestion = rs.getString(5);
				
				arr.add(er);
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
