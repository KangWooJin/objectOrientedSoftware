package project.lecture;

import java.sql.*;
import java.util.ArrayList;

import project.establishProcess.EstablishProcessData;
import java.util.ArrayList;

public class LectureControl {

	static final String id = "root";
	static final String passwd = "7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software"; // 디비

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbTable = "lecture";

	public LectureControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, id, passwd);
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public int signup(LectureData o) {
		int msgType = -1;
		try {
			String selectQuery = "select processCode, processName from establishProcess where processCode = ? and processName = ?";

			pstmt = con.prepareStatement(selectQuery);

			pstmt.setString(1, o.processCode);
			pstmt.setString(2, o.processName);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				selectQuery = "select processCode, memberID from lecture where processCode = ? and memberID = ?";

				pstmt = con.prepareStatement(selectQuery);
				pstmt.setString(1, o.processCode);
				pstmt.setString(2, o.memberID);
				rs = pstmt.executeQuery();

				if (!rs.next()) {

					dbTable = "lecture";
					String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?, ?, ?, ?)";

					pstmt = con.prepareStatement(insertQuery);

					pstmt.setString(1, o.processCode);
					pstmt.setString(2, o.memberID);
					pstmt.setInt(3, o.processStep);
					pstmt.setString(4, o.personnelCardNumber);
					pstmt.setString(5, o.processName);
					pstmt.setString(6, o.companyName);
					System.out.print(insertQuery);

					pstmt.executeUpdate(); // 쿼리를 실행한다.

					System.out.println("lecture 테이블에 새로운 레코드를 추가했습니다."); // 성공시
					msgType = 1;
					return msgType;// 메시지
				} else {
					msgType = 3; // 해당 과정을 이미 수강 신청
				}
			} else {
				msgType = 2; // 해당 과정 코드나 과정 명이 틀렸음
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return msgType;
	}

	public int cancelLecture(String memberID, String processCode) {
		int msgType = -1;

		try {
			String deleteQuery = "delete from `" + dbTable + "` where memberID = ? and processCode = ?";

			pstmt = con.prepareStatement(deleteQuery);

			pstmt.setString(1, memberID);
			pstmt.setString(2, processCode);

			pstmt.executeUpdate();
			msgType = 1;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return msgType;
	}
	
	public int[] selectProcessTuition(ArrayList<LectureData> lectureList) {
		int[] tuition = new int[lectureList.size()]; 
		int count = 0;
		String processTable = "establishProcess";
		try {
			while (count < lectureList.size()) {
				String selectQuery = "SELECT * FROM `" + processTable + "` WHERE processCode = ?";
				pstmt = con.prepareStatement(selectQuery);
				pstmt.setString(1, lectureList.get(count).processCode);
				rs = pstmt.executeQuery();

			
				while (rs.next()) {
					
					tuition[count] = rs.getInt(6);
				}
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return tuition;
	}
	
	public ArrayList<LectureData> showSignupInfo(String memberID) {
		ArrayList<LectureData> list = new ArrayList<LectureData>();

		try {

			if (memberID == null) {
				LectureData d = new LectureData();// 수강 조회할려면 로그인을 하십시오.
				d.companyName = "없음";
				d.memberID = "없음1"; // 로그인 안한상태해서 조회하므로 경고창띄우고 메인으로 돌아감
				d.personnelCardNumber = "없음";
				d.processCode = "없음";
				d.processName = "없음";
				d.processStep = 0;
				list.add(d);
				return list;
			}

			String selectQuery = "SELECT * FROM `" + dbTable + "` WHERE memberID = ?";
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, memberID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				LectureData d = new LectureData();
				d.processCode = rs.getString(1);
				d.memberID = rs.getString(2);
				d.processStep = rs.getInt(3);
				d.personnelCardNumber = rs.getString(4);
				d.processName = rs.getString(5);
				d.companyName = rs.getString(6);
				System.out.println(d.processCode);
				list.add(d);
			}

			if (list.size() == 0) {

				LectureData d = new LectureData();// 수강 조회할려면 로그인을 하십시오.
				d.companyName = "없음";
				d.memberID = "없음"; // 로그인한상태에서 수강 조회했으므로 정보가 없어도 없음으로 출력
				d.personnelCardNumber = "없음";
				d.processCode = "없음";
				d.processName = "없음";
				d.processStep = 0;
				list.add(d);

				return list;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return list;
	}
/*
	public int[] selectProcessTuition(ArrayList<LectureData> lectureList) {
		int[] tuition = new int[lectureList.size()]; 
		int count = 0;
		String processTable = "establishProcess";
		try {
			while (count < lectureList.size()) {
				String selectQuery = "SELECT * FROM `" + processTable + "` WHERE processCode = ?";
				pstmt = con.prepareStatement(selectQuery);
				pstmt.setString(1, lectureList.get(count).processCode);
				rs = pstmt.executeQuery();

			
				while (rs.next()) {
					
					tuition[count] = rs.getInt(6);
				}
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return tuition;
	}
	*/
	
	public int payTuition(LectureData o){
		int msgType = -1;
		try {
			String updateQuery = "UPDATE `" + dbTable + "` SET processStep = 2" 
					+ " WHERE processCode = '" + o.processCode + "'AND memberID = '" + o.memberID + "'";
			pstmt = con.prepareStatement(updateQuery);
			
			System.out.println(updateQuery);
			
			pstmt.executeUpdate();
			msgType = 1;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			msgType = 2; //수정실패
		}
		return msgType;
	}
	/*
	  public static void main(String[] args){
	  
	  LectureControl osc = new LectureControl();
	  LectureData d = new LectureData();
	  d.processCode = "P004";
	  d.memberID = "E0000001";
	  
	  int t = osc.payTuition(d);
	  System.out.println(t);

	  }
	*/
}