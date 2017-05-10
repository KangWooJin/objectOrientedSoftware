package project.lectureEvaluation;

//import java.io.Console;
import java.sql.*;
import java.util.ArrayList;

//import org.w3c.dom.Document;

public class EvaluationQuestionConstructionControl {

	static final String id = "root";
	static final String passwd="7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software" ; // 디비 스키마 부분 다들 만들때 software
	//public static int csCount = 1 ;
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbTable = "evaluationquestionconstruction";
	// insert into db테이블명 values(?,?,?); -> ? 갯수는 디비에 애트리뷰트의 갯수와 같아야함
	private static EvaluationQuestionConstructionControl instance;
	public static EvaluationQuestionConstructionControl getInstance(){
		if(instance==null)
			instance=new EvaluationQuestionConstructionControl();
		return instance;
	}

	public EvaluationQuestionConstructionControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName); 
			con = DriverManager.getConnection(dbURL,id, passwd);

		} catch (Exception e) {
			e.printStackTrace();

		} 
	}

	public boolean insert(EvaluationQuestionConstruction eqc)
	{
		boolean flag = true;
		try{

			String insertQuery = "INSERT INTO " + dbTable + " VALUES(?, ?, ?, ?)";

			pstmt = con.prepareStatement(insertQuery); // prepareStatement에서 해당 sql을 미리 컴파일한다.

			//애튜리뷰트에 값을 대입함
			pstmt.setInt(1,eqc.evaluationQuestionNumber);
			pstmt.setInt(2,eqc.fixedChoiceQuestionnaireID);
			pstmt.setString(3,eqc.effectiveStartDate);
			pstmt.setString(4,eqc.effectiveFinishDate);

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
	
	public String getQuestionContent(int qNum)
	{
		String content = null;
		try{

			String selectQuery = "SELECT * FROM lectureevaluationquestion where evaluationQuestionNumber = "+ qNum ;

			stmt = con.createStatement();

			rs = stmt.executeQuery(selectQuery); //조회 쿼리결과를 rs에 넣음

			System.out.println("질문 내용 찾기 성공");        // 성공시 메시지 출력
			while (rs.next())
			{
				content = rs.getString("evaluationQuestionContent");
				
			}

		}
		catch (Exception e)
		{            
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return content;
	}
	
	public String getFixedChoiceDivision(int dNum)
	{
		String grade = null;
		try{

			String selectQuery = "SELECT * FROM fixedchoicequestionnaire where fixedChoiceQuestionnaireID = "+ dNum ;

			stmt = con.createStatement();

			rs = stmt.executeQuery(selectQuery); //조회 쿼리결과를 rs에 넣음

			System.out.println("답안 내용 찾기 성공");        // 성공시 메시지 출력
			while (rs.next())
			{
				grade = rs.getString("fixedChoiceQuestionDivision");
			}

		}
		catch (Exception e)
		{            
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return grade;
	}
	
	public String getDivision(int dNum)
	{
		String div = null;
		try{

			String selectQuery = "SELECT * FROM lectureevaluationquestion where evaluationQuestionNumber = "+ dNum ;

			stmt = con.createStatement();

			rs = stmt.executeQuery(selectQuery); //조회 쿼리결과를 rs에 넣음

			System.out.println("대상 찾기 성공");        // 성공시 메시지 출력
			while (rs.next())
			{
				div = rs.getString("evaluandDivision");
			}

		}
		catch (Exception e)
		{            
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return div;
	}

	public String getFixedChoiceContent(int fcNum)
	{
		String div = null;
		try{

			String selectQuery = "SELECT * FROM fixedchoicequestionnaire where fixedChoiceQuestionnaireID = "+ fcNum ;

			stmt = con.createStatement();

			rs = stmt.executeQuery(selectQuery); //조회 쿼리결과를 rs에 넣음

			System.out.println("대상 찾기 성공");        // 성공시 메시지 출력
			while (rs.next())
			{
				div = rs.getString("fixedChoiceQuestionnaireContent");
			}

		}
		catch (Exception e)
		{            
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return div;
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

	public ArrayList<EvaluationQuestionConstruction> select()
	{
		ArrayList<EvaluationQuestionConstruction> arr = new ArrayList<EvaluationQuestionConstruction>();

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
				EvaluationQuestionConstruction eqc = new EvaluationQuestionConstruction();

				eqc.evaluationQuestionNumber = rs.getInt(1);
				eqc.fixedChoiceQuestionnaireID = rs.getInt(2);
				eqc.effectiveStartDate = rs.getString(3);
				eqc.effectiveFinishDate = rs.getString(4);

				//eqc.evaluationQuestionContent = rs.getString(5);
				//여러 데이터 타입이 가능함
				//blob도 잇음 
				//System.out.print(leq.evaluationQuestionNumber + " ");
				//System.out.print(leq.effectiveStartDate  + " ");
				//System.out.print(leq.effectiveFinishDate  + " ");
				//System.out.print(leq.evaluandDivision  + " ");
				//System.out.println(leq.evaluationQuestionContent);

				//return leq;
				arr.add(eqc);
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
		EvaluationQuestionConstructionControl eqcc = new EvaluationQuestionConstructionControl();
		EvaluationQuestionConstruction m1 = new EvaluationQuestionConstruction();


		//leqc.delete("1");
		//leqc.insert(m1);
		
		System.out.println(eqcc.getQuestionContent(3));
		System.out.println(eqcc.getFixedChoiceContent(1));
		System.out.println(eqcc.getDivision(2));
		eqcc.select();
	}
}
