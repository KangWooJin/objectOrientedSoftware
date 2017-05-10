package project.operateSubject;

import java.sql.*;
import java.util.ArrayList;

import project.establishProcess.EstablishProcessData;

public class OperateSubjectControl {

	static final String id = "root";
	static final String passwd = "7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software"; // 디비
																		// 스키마
																		// 부분 다들
																		// 만들때
																		// software
																		// ?useSSL=false
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbTable = "OperateSubject";
	// insert into db테이블명 values(?,?,?); -> ? 갯수는 디비에 애트리뷰트의 갯수와 같아야함

	public OperateSubjectControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, id, passwd);
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public boolean createOperateSubject(OperateSubjectData o) {
		boolean flag = true;
		try {
			String selectQuery = "select subjectCode from operatesubject where subjectCode = ?";

			pstmt = con.prepareStatement(selectQuery);
			if (o.subjectCode == null) {
				flag = false;
				return flag;
			}
			pstmt.setString(1, o.subjectCode);
			rs = pstmt.executeQuery();

			if (!rs.next()) {

				String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

				pstmt = con.prepareStatement(insertQuery); // prepareStatement에서
															// 해당
															// sql을 미리
															// 컴파일한다.
				System.out.println(o.subjectProcess);
				System.out.println(o.feature);
				System.out.println(o.lectureContent);
				System.out.println(o.lectureHour);
				System.out.println(o.purpose);
				System.out.println(o.recruitNumber);
				System.out.println(o.subjectCode);
				System.out.println(o.subjectName);
				System.out.println(o.subjectProcess);
				System.out.println(o.target);
				System.out.println(o.totalDate);
				System.out.println(o.totalHour);
				System.out.println(o.tuition);

				// 애튜리뷰트에 값을 대입함
				
				pstmt.setString(1, o.subjectProcess);
				pstmt.setString(2, o.target);
				pstmt.setString(3, o.feature);
				pstmt.setInt(4, o.recruitNumber);
				pstmt.setInt(5, o.tuition);
				pstmt.setString(6, o.subjectCode);
				pstmt.setString(7, o.purpose);
				pstmt.setString(8, "없음");
				pstmt.setString(9, o.subjectName);
				pstmt.setInt(10, o.totalDate);
				pstmt.setInt(11, o.totalHour);
				pstmt.setInt(12, o.lectureHour);
				pstmt.setString(13, o.lectureContent);
			
				pstmt.executeUpdate(); // 쿼리를 실행한다.

				System.out.println("operateSubject 테이블에 새로운 레코드를 추가했습니다."); // 성공시
				return flag;// 메시지
			} else {
				flag = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			flag= false;
		}
		return flag;
	}

	public boolean updateOperateSubject(OperateSubjectData o) {
		boolean flag = true;

		try {
			
			String sql = "select subjectCode from operateSubject where subjectCode = ?";
			System.out.println("aaaaaa");
			System.out.println(o.subjectCode);
			pstmt = con.prepareStatement(sql);
			if (o.subjectCode == null || o.changeRecord.equals("없음")) {
				flag = false;
				return flag;
			
			}
			
			pstmt.setString(1, o.subjectCode);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String updateQuery = "UPDATE `" + dbTable + "` SET subjectProcess = ?, target = ?, feature = ?,"
						+ " recruitNumber = ?, tuition = ?, purpose = ?, changeRecord = ?, subjectName = ?,"
						+ " totalDate = ?, totalHour = ?, lectureHour = ?, lectureContent = ? WHERE subjectCode = ?";
			
				pstmt = con.prepareStatement(updateQuery); // prepareStatement에서
															// 해당
															// sql을 미리
				System.out.println("bbb");											// 컴파일한다.
				System.out.println(o.subjectProcess);
				System.out.println(o.feature);
				System.out.println(o.lectureContent);
				System.out.println(o.lectureHour);
				System.out.println(o.purpose);
				System.out.println(o.recruitNumber);
				System.out.println(o.subjectCode);
				System.out.println(o.subjectName);
				System.out.println(o.subjectProcess);
				System.out.println(o.target);
				System.out.println(o.totalDate);
				System.out.println(o.totalHour);
				System.out.println(o.tuition);

				pstmt.setString(1, o.subjectProcess);
				pstmt.setString(2, o.target);
				pstmt.setString(3, o.feature);
				pstmt.setInt(4, o.recruitNumber);
				pstmt.setInt(5, o.tuition);
				//pstmt.setString(6, o.subjectCode);
				pstmt.setString(6, o.purpose);
				pstmt.setString(7, o.changeRecord);
				pstmt.setString(8, o.subjectName);
				pstmt.setInt(9, o.totalDate);
				pstmt.setInt(10, o.totalHour);
				pstmt.setInt(11, o.lectureHour);
				pstmt.setString(12, o.lectureContent);
				pstmt.setString(13, o.subjectCode);
				
				pstmt.executeUpdate(); // 쿼리를 실행한다.
				System.out.println("operateSubject 테이블을 수정했습니다."); // 성공시
				// 메시지
				// 출력

				return flag;
			} 
			else {
				flag = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return flag;
	}

	public ArrayList<OperateSubjectData> readOperateSubject(OperateSubjectData o) {
		ArrayList<OperateSubjectData> list = new ArrayList<OperateSubjectData>();
		
		
		try {
			String selectQuery;
			if(o.subjectCode == null){
				selectQuery = "SELECT * FROM `" + dbTable + "`";
			}
			else {
				selectQuery = "SELECT * FROM `" + dbTable + "` WHERE ";
				selectQuery = selectQuery + "subjectCode = '" + o.subjectCode + "';";
			}
		
			
			//selectQuery = selectQuery + "and subjectProcess = '" + o.subjectProcess + "'";
			//selectQuery = selectQuery + "and subjectName = '" + o.subjectName + "'";
			//selectQuery = selectQuery + "and target = '" + o.target + "';";

			// 질의를 할 Statement 만들기
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 조회 쿼리결과를 rs에 넣음

			while (rs.next()) {
				OperateSubjectData osd = new OperateSubjectData();
				osd.subjectProcess = rs.getString(1);
				//System.out.println(rs.getString(1));
				osd.target = rs.getString(2);
				//System.out.println(rs.getString(2));
				osd.feature = rs.getString(3);
				//System.out.println(rs.getString(3));
				osd.recruitNumber = rs.getInt(4);
				//System.out.println(rs.getString(4));
				osd.tuition = rs.getInt(5);
				//System.out.println(rs.getString(5));
				osd.subjectCode = rs.getString(6);
				//System.out.println(rs.getString(6));
				osd.purpose = rs.getString(7);
				//System.out.println(rs.getString(7));
				osd.changeRecord = rs.getString(8);
				//System.out.println(rs.getString(8));
				osd.subjectName = rs.getString(9);
				//System.out.println(rs.getString(9));
				osd.totalDate = rs.getInt(10);
				//System.out.println(rs.getString(10));
				osd.totalHour = rs.getInt(11);
				//System.out.println(rs.getString(11));
				osd.lectureHour = rs.getInt(12);
				//System.out.println(rs.getString(12));
				osd.lectureContent = rs.getString(13);
				//System.out.println(rs.getString(13));
				// 여러 데이터 타입이 가능함
				// blob도 잇음
				list.add(osd);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return list;
	}
	
	public ArrayList<OperateSubjectData> selectAll(){
		ArrayList<OperateSubjectData> list = new ArrayList<OperateSubjectData>();
		try {
			String selectQuery = "SELECT * FROM `" + dbTable + "`";

		
			// 질의를 할 Statement 만들기
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 조회 쿼리결과를 rs에 넣음

			while (rs.next()) {
				OperateSubjectData data = new OperateSubjectData();
				data.subjectProcess = rs.getString(1);
				data.target = rs.getString(2);
				data.feature = rs.getString(3);
				data.recruitNumber = rs.getInt(4);
				data.tuition = rs.getInt(5);
				data.subjectCode = rs.getString(6);				
				data.purpose = rs.getString(7);
				data.changeRecord = rs.getString(8);
				data.subjectName = rs.getString(9);
				data.totalDate = rs.getInt(10);
				data.totalHour = rs.getInt(11);
				data.lectureHour = rs.getInt(12);
				data.lectureContent = rs.getString(13);
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	public OperateSubjectData selectSubjectCode(String subjectCode) {
		OperateSubjectData osd = new OperateSubjectData();

		try {

			String selectQuery = "SELECT * FROM `" + dbTable + "` WHERE ";

			selectQuery = selectQuery + "subjectCode = '" + subjectCode + "'";

			// 질의를 할 Statement 만들기
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 조회 쿼리결과를 rs에 넣음

			while (rs.next()) {
				osd.subjectProcess = rs.getString(1);
				System.out.println(rs.getString(1));
				osd.target = rs.getString(2);
				System.out.println(rs.getString(2));
				osd.feature = rs.getString(3);
				System.out.println(rs.getString(3));
				osd.recruitNumber = rs.getInt(4);
				System.out.println(rs.getString(4));
				osd.tuition = rs.getInt(5);
				System.out.println(rs.getString(5));
				osd.subjectCode = rs.getString(6);
				System.out.println(rs.getString(6));
				osd.purpose = rs.getString(7);
				System.out.println(rs.getString(7));
				osd.changeRecord = rs.getString(8);
				System.out.println(rs.getString(8));
				osd.subjectName = rs.getString(9);
				System.out.println(rs.getString(9));
				osd.totalDate = rs.getInt(10);
				System.out.println(rs.getString(10));
				osd.totalHour = rs.getInt(11);
				System.out.println(rs.getString(11));
				osd.lectureHour = rs.getInt(12);
				System.out.println(rs.getString(12));
				osd.lectureContent = rs.getString(13);
				System.out.println(rs.getString(13));
				// 여러 데이터 타입이 가능함
				// blob도 잇음
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return osd;
	}

	public String selectSubjectName(String subjectCode)
	{
		OperateSubjectData osd = new OperateSubjectData();
		try {

			String selectQuery = "SELECT * FROM `" + dbTable + "` WHERE ";

			selectQuery = selectQuery + "subjectCode = '" + subjectCode + "'";

			// 질의를 할 Statement 만들기
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 조회 쿼리결과를 rs에 넣음

			while (rs.next()) {
				osd.subjectProcess = rs.getString(1);
				//System.out.println(rs.getString(1));
				osd.target = rs.getString(2);
				//System.out.println(rs.getString(2));
				osd.feature = rs.getString(3);
				//System.out.println(rs.getString(3));
				osd.recruitNumber = rs.getInt(4);
				//System.out.println(rs.getString(4));
				osd.tuition = rs.getInt(5);
				//System.out.println(rs.getString(5));
				osd.subjectCode = rs.getString(6);
				//System.out.println(rs.getString(6));
				osd.purpose = rs.getString(7);
				//System.out.println(rs.getString(7));
				osd.changeRecord = rs.getString(8);
				//System.out.println(rs.getString(8));
				osd.subjectName = rs.getString(9);
				//System.out.println(rs.getString(9));
				osd.totalDate = rs.getInt(10);
				//System.out.println(rs.getString(10));
				osd.totalHour = rs.getInt(11);
				//System.out.println(rs.getString(11));
				osd.lectureHour = rs.getInt(12);
				//System.out.println(rs.getString(12));
				osd.lectureContent = rs.getString(13);
				System.out.println(rs.getString(13));
				// 여러 데이터 타입이 가능함
				// blob도 잇음
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return osd.subjectCode;
		
	}
	public void close() {
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException sqle) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			} // PreparedStatement 객체 해제

		if (con != null)
			try {
				con.close();
			} catch (SQLException sqle) {
			} // Connection 해제

	}

}