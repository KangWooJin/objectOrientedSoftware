package project.establishProcess;

import java.sql.*;
import java.util.ArrayList;

public class EstablishProcessControl {

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

	String dbTable = "EstablishProcess";
	// insert into db테이블명 values(?,?,?); -> ? 갯수는 디비에 애트리뷰트의 갯수와 같아야함

	public EstablishProcessControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, id, passwd);
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public int createEstablishProcess(EstablishProcessData o, String isApply, String isAccepted) {
		int msgType = -1;
		System.out.println("Asdfasdf");

		try {
			String selectQuery = "select subjectCode from operateSubject where subjectCode = ?";
		
			pstmt = con.prepareStatement(selectQuery);
			if (o.subjectCode == null || o.processCode == null) {
				msgType = 0;
				return msgType;
			}
			
			pstmt.setString(1, o.subjectCode);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				selectQuery = "select processCode from establishProcess where processCode = ?";

				pstmt = con.prepareStatement(selectQuery);
				pstmt.setString(1, o.processCode);
				rs = pstmt.executeQuery();

				if (!rs.next()) {
					
					String lecturerIDCheckQuery =  "select memberID from memberData where memberID = ?";
					pstmt = con.prepareStatement(lecturerIDCheckQuery);
					pstmt.setString(1, o.lecturerID);
					rs = pstmt.executeQuery();
					
					
					if(rs.next()){
						
						String lecturerid = rs.getString(1);
						if(lecturerid.charAt(0) != 'e' && lecturerid.charAt(0) != 'E' )
						{
							msgType = 5;
							return msgType;
						}
						
						String insertQuery = "INSERT INTO `" + dbTable
								+ "` VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
						
						pstmt = con.prepareStatement(insertQuery); // prepareStatement에서
						
						
						pstmt.setString(1, o.processName);
						pstmt.setInt(2, o.trainingPeriodEnd);
						pstmt.setInt(3, o.trainingPeriodStart);
						pstmt.setString(4, o.classRoom);
						pstmt.setString(5, o.lecturerID);
						pstmt.setInt(6, o.tuition);
						if (isApply.equals("t")) {
							pstmt.setInt(7, 1);
						} else {
							pstmt.setInt(7, 0);
						}
					
						pstmt.setString(8, o.centerName);
						pstmt.setString(9, o.refundSort);
						pstmt.setString(10, o.detailLectureInfo);
						if (isAccepted.equals("t")) {
							pstmt.setInt(11, 1);
						} else {
							pstmt.setInt(11, 0);
						}
						pstmt.setString(12, o.completeStandard);
						pstmt.setString(13, o.processCode);
						pstmt.setString(14, o.subjectCode);
					

						pstmt.executeUpdate(); // 쿼리를 실행한다.

						System.out.println("EstablishProcess 테이블에 새로운 레코드를 추가했습니다."); // 성공시
						msgType = 1;
						return msgType;// 메시지
						
					}
					else{
						msgType = 4;
					}
					
					
				}
				else {
					msgType = 2;
				}
			}
			else {
				msgType = 3;
			}	

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return msgType;
	}

	public ArrayList<EstablishProcessData> readEstablishProcess() {
		ArrayList<EstablishProcessData> list = new ArrayList<EstablishProcessData>();

		try {
			String selectQuery = "SELECT * FROM `" + dbTable + "`";

		
			// 질의를 할 Statement 만들기
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 조회 쿼리결과를 rs에 넣음

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
				data.detailLectureInfo = rs.getString(10);
				if(rs.getInt(11) == 1){
					data.isAccepted = true;	
				}
				else{
					data.isAccepted = false;
				}
				data.completeStandard = rs.getString(12);
				data.processCode = rs.getString(13);
				data.subjectCode = rs.getString(14);
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}

	public EstablishProcessData selectSubjectCode(String subjectCode) {
		EstablishProcessData osd = new EstablishProcessData();

		try {

			String selectQuery = "SELECT * FROM `" + dbTable + "` WHERE ";

			selectQuery = selectQuery + "subjectCode = '" + subjectCode + "'";

			// 질의를 할 Statement 만들기
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 조회 쿼리결과를 rs에 넣음

			while (rs.next()) {
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return osd;
	}

	public String selectSubjectName(String subjectCode)
	{
		EstablishProcessData osd = new EstablishProcessData();
		try {

			String selectQuery = "SELECT * FROM `" + dbTable + "` WHERE ";

			selectQuery = selectQuery + "subjectCode = '" + subjectCode + "'";

			// 질의를 할 Statement 만들기
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 조회 쿼리결과를 rs에 넣음

			while (rs.next()) {
				
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