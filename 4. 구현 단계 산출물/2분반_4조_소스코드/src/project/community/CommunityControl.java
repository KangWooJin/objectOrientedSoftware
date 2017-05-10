package project.community;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class CommunityControl {

	static final String id = "root";
	static final String passwd = "7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software"; // �뵒鍮꾩뒪�궎留덈�遺꾨떎�뱾留뚮뱾�븣software
	public int communityNo = 1;

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbTable = "community";

	public CommunityControl() {
		try {

			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, id, passwd);
			setCommunityNo();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setCommunityNo() {
		int max = -1;
		String selectQuery = "SELECT * FROM `" + dbTable + "`";
		try {
		// 吏덉쓽瑜� �븷 Statement 留뚮뱾湲�
		stmt = con.createStatement();

		rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬

		// rs�쓽 �궡�슜�쓣 媛��졇�샂
		while (rs.next()) {
			if (max < rs.getInt("communityNo")) {
				max = rs.getInt("communityNo");
			}
		}

		if (max == -1)
			communityNo = 1;
		else
			communityNo = ++max;
		System.out.println("communityNo : " + communityNo);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getCommunityNo(){
		setCommunityNo();
		
		return communityNo;
	}
	/*
	 * �떎�젣 community �깮�꽦�븷 �븣�뿏 communityControl�뿉�꽌 異붽��빐二쇨퀬, 紐⑥엫諛� �슫�쁺�옄 李멸��쉶�썝 異붽��빐二쇨퀬, 紐⑥엫諛� 寃뚯떆�뙋
	 * 異붽��빐二쇨린
	 */
	public void insertCommunity(Community community) {
		if (community == null)
			return;

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Calendar c1 = Calendar.getInstance();
			String today = sdf.format(c1.getTime());

			String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(insertQuery);

			pstmt.setInt(1, community.communityNo);
			pstmt.setString(2, community.communityName);
			pstmt.setString(3, today);
			pstmt.setString(4, community.closingDate);
			pstmt.setString(5, community.communityExplanation);

			pstmt.executeUpdate(); // 荑쇰━瑜� �떎�뻾�븳�떎.

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("Community �뀒�씠釉붿뿉 �깉濡쒖슫 �젅肄붾뱶瑜� 異붽��뻽�뒿�땲�떎."); // �꽦怨듭떆 硫붿떆吏� 異쒕젰
	}

	public void updateCommunity(Community community) {

		try {

			if (community.closingDate != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				Calendar c1 = Calendar.getInstance();
				String today = sdf.format(c1.getTime());

				String closingDateSettingQuery = "update `" + dbTable + "` set closingDate = ? "
						+ "where communityNo = ?";
				pstmt = con.prepareStatement(closingDateSettingQuery);

				pstmt.setString(1, today);
				pstmt.setInt(2, community.communityNo);

				int count = pstmt.executeUpdate();

				System.out.println(count);
				return;
			}

			String updateQuery = "update `" + dbTable + "` set communityName = ?, openingDate = ?"
					+ ", communityExplanation = ? where communityNo = ? ";

			pstmt = con.prepareStatement(updateQuery);

			pstmt.setString(1, community.communityName);
			pstmt.setString(2, community.openingDate);
			pstmt.setString(3, community.communityExplanation);
			pstmt.setInt(4, community.communityNo);

			pstmt.executeUpdate();

			System.out.println("紐⑥엫諛� �젙蹂� �닔�젙");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	public ArrayList<Community> selectCommunity() {

		ArrayList<Community> arr = new ArrayList<Community>();
		try {
			String selectQuery = "SELECT * FROM `" + dbTable + "`";

			// 吏덉쓽瑜� �븷 Statement 留뚮뱾湲�
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬

			System.out.println("--- �뀒�씠釉� " + dbTable + " �궡�슜 議고쉶 ---");

			// rs�쓽 �궡�슜�쓣 媛��졇�샂
			while (rs.next()) {
				Community community = new Community();

				community.communityNo = rs.getInt(1);
				community.communityName = rs.getString(2);
				community.openingDate = rs.getString(3);
				community.closingDate = rs.getString(4);
				community.communityExplanation = rs.getString(5);
				
				if( community.closingDate == null){
					arr.add(community);
				System.out.println(arr.size());
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		System.out.println(arr.size());
		return arr;
	}

	public Community selectCommunity(String communityNo) {
		Community community = new Community();

		try {
			String selectQuery = "SELECT * FROM `" + dbTable + "` where communityNo = '" + communityNo + "'";

			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery);

			while (rs.next()) {

				community.communityNo = rs.getInt(1);
				community.communityName = rs.getString(2);
				community.openingDate = rs.getString(3);
				community.closingDate = rs.getString(4);
				community.communityExplanation = rs.getString(5);

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return community;
	}

	public static void main(String[] args) {
		CommunityControl communityControl = new CommunityControl();
		Community community = new Community();

		community.communityNo = communityControl.getCommunityNo();
		community.communityName = "紐⑥엫諛⑹씠由�";
		community.openingDate = "20161210";
		community.closingDate = null;
		community.communityExplanation = "紐⑥엫諛� �꽕紐�~~";

		// 紐⑥엫諛� 異붽�
		communityControl.insertCommunity(community);
		// 1. 紐⑥엫諛� �슫�쁺�옄 異붽��빐二쇨린
		// 2. 紐⑥엫諛� 寃뚯떆�뙋 異붽��빐二쇨린

		// 紐⑥엫諛� �씠由� �샊�� �꽕紐� �닔�젙
		community.communityExplanation = "紐⑥엫諛� �꽕紐�6";
		communityControl.updateCommunity(community);

		// community �룓吏� - 紐⑥엫諛� �슫�쁺�옄 �쉶�썝 �깉�눜 �떆
		community.closingDate = "�룓吏�";
		communityControl.updateCommunity(community);

		// selectCommunity
		ArrayList<Community> communityList;
		communityList = communityControl.selectCommunity();
		for (Community com : communityList) {
			System.out.println(com.communityName);
		}

	}
}
