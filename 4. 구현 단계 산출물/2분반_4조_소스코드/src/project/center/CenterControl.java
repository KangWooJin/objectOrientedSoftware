package project.center;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

public class CenterControl {
	static final String id = "root";
	static final String passwd = "7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software";

	public static int centerNo = 1;
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbTable = "center";

	public CenterControl() {
		// TODO Auto-generated constructor stub
		try {

			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, id, passwd);

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	
	public void setCenterNo() {
		int max = -1;
		String selectQuery = "SELECT * FROM `" + dbTable + "`";
		try {
		// 질의를 할 Statement 만들기
		stmt = con.createStatement();

		rs = stmt.executeQuery(selectQuery); // 조회 쿼리결과를 rs에 넣음

		// rs의 내용을 가져옴
		while (rs.next()) {
			if (max < rs.getInt("centerNo")) {
				max = rs.getInt("centerNo");
			}
		}

		if (max == -1)
			centerNo = 1;
		else
			centerNo = ++max;
		System.out.println("centerNo : " + centerNo);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getCenterNo(){
		setCenterNo();
		
		return centerNo;
	}

	public void insertCenter(Center center) {
		if (center == null)
			return;

		try {

			String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?, ?)";

			pstmt = con.prepareStatement(insertQuery);

			pstmt.setString(1, center.centerNo);
			pstmt.setString(2, center.memberID);
			pstmt.setString(3, center.centerName);
			pstmt.setString(4, center.localCode);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("Center 테이블에 새로운 레코드를 추가했습니다.");
	}

	public void deleteCenter(String centerNo) {
		if (centerNo == null || centerNo.equals(""))
			return;

		try {
			String deleteQuery = "delete from `" + dbTable + "` where centerNo = ? ";

			System.out.println(centerNo);
			pstmt = con.prepareStatement(deleteQuery);
			pstmt.setString(1, centerNo);

			pstmt.executeUpdate();

			System.out.println("Center 삭제");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

	}

	public void updateCenter(Center center) {

		try {

			String updateQuery = "update `" + dbTable + "` set directorMemberID = ?"
					+ " where centerNo = ? ";

			pstmt = con.prepareStatement(updateQuery);

			pstmt.setString(1, center.memberID);
			pstmt.setString(2, center.centerNo);
			
			int count = pstmt.executeUpdate();

			System.out.println(count);
			System.out.println("현 센터장 수정 완료");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	public ArrayList<Center> selectCenter() {
		ArrayList<Center> arr = new ArrayList<Center>();
		try {
			String selectQuery = "SELECT * FROM `" + dbTable + "`";

			// 吏덉쓽瑜� �븷 Statement 留뚮뱾湲�
			stmt = con.createStatement();

			rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬

			System.out.println("--- 테이블 " + dbTable + " 내용 조회 ---");

			// rs�쓽 �궡�슜�쓣 媛��졇�샂
			while (rs.next()) {

				Center center = new Center();

				center.centerNo = rs.getString(1);
				center.memberID = rs.getString(2);
				center.centerName = rs.getString(3);
				center.localCode = rs.getString(4);

				arr.add(center);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return arr;
	}
	
	public Center selectCenter(String centerNo) {
		Center center = new Center();
		try {
			String selectQuery = "SELECT * FROM `" + dbTable + "` where centerNo = '" + centerNo + "'";

			System.out.println(centerNo);
			stmt = con.createStatement();

			rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬
			
			if ( rs.next())
			{
				center.centerNo = rs.getString(1);
				center.memberID = rs.getString(2);
				center.centerName = rs.getString(3);
				center.localCode = rs.getString(4);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return center;
	}

	public static void main(String[] args) {
		CenterControl centerControl = new CenterControl();
		Center center = new Center();
		/*
		center.centerNo = "1";
		center.memberID = "E0000001";
		center.centerName = "알파아카데미쓰";
		center.localCode = "001";
		centerControl.insertCenter(center);
		
		center.memberID = "E0000002";
		centerControl.updateCenter(center);
		
		ArrayList<Center> centerList = centerControl.selectCenter();
		for (Center center1 : centerList) {
			System.out.println(center1.centerName);
		}
		*/
		center = centerControl.selectCenter("2");
		System.out.println(center.centerName);
	}
}
