package project.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CommunityParticipantControl {

	static final String id = "root";
	static final String passwd = "7942";
	static final String driverName = "com.mysql.jdbc.Driver";
	static final String dbURL = "jdbc:mysql://localhost:3306/software"; //�뵒鍮꾩뒪�궎留덈�遺꾨떎�뱾留뚮뱾�븣software

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	String dbTable = "communityparticipant";

	public CommunityParticipantControl() {
		try {

			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, id, passwd);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertCommunityParticipant(CommunityParticipant participant) {
		if (participant == null)
			return;

		try {
			String insertQuery = "INSERT INTO `" + dbTable + "` VALUES(?, ?, ?)";

			pstmt = con.prepareStatement(insertQuery);

			pstmt.setInt(1, participant.communityNo);
			pstmt.setString(2, participant.memberID);
			pstmt.setInt(3, participant.participationSeparation);

			pstmt.executeUpdate(); // 荑쇰━瑜� �떎�뻾�븳�떎.

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("CommunityParticipant �뀒�씠釉붿뿉 �깉濡쒖슫 �젅肄붾뱶瑜� 異붽��뻽�뒿�땲�떎."); // �꽦怨듭떆 硫붿떆吏� 異쒕젰
	}

	public void updateCommunityParticipant(CommunityParticipant participant) {

		// 紐⑥엫諛� �슫�쁺�옄媛� 紐⑥엫諛� 李몄뿬�떊泥��옄瑜� 紐⑥엫諛� 李몄뿬�쉶�썝�쑝濡� �벑濡앺븯�뒗 寃쎌슦 - 紐⑥엫諛� 李몄뿬�쉶�썝(1)
		// 紐⑥엫諛� 李몄뿬�쉶�썝�씠 紐⑥엫諛⑹쓣 �깉�눜�븯�뒗 寃쎌슦 - 紐⑥엫諛� �깉�눜�쉶�썝 (2)

		// 紐⑥엫諛� �슫�쁺�옄�뒗 李몄뿬援щ텇 蹂�寃� 遺덇�
		if( participant.participationSeparation == 0 )
			return;
		
		try {

			String updateQuery = "update `" + dbTable + "` set participationSeparation = ?"
					+ " where communityNo = ? and memberID = ?";

			pstmt = con.prepareStatement(updateQuery);

			pstmt.setInt(1, participant.participationSeparation);
			pstmt.setInt(2, participant.communityNo);
			pstmt.setString(3, participant.memberID);

			pstmt.executeUpdate();
			
			System.out.println("紐⑥엫諛� �쉶�썝 �젙蹂� �닔�젙");
		
	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	public ArrayList<CommunityParticipant> selectCommunityParticipants(int communityNo) {
		
		ArrayList<CommunityParticipant> arr = new ArrayList<CommunityParticipant>();
		try {
			String selectQuery = "SELECT * FROM `" + dbTable + "` where communityNo = " + communityNo;

			// 吏덉쓽瑜� �븷 Statement 留뚮뱾湲�
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬

			System.out.println("--- �뀒�씠釉� " + dbTable + " �궡�슜 議고쉶 ---");

			// rs�쓽 �궡�슜�쓣 媛��졇�샂
			while (rs.next()) {
				CommunityParticipant participant = new CommunityParticipant();

				participant.communityNo = rs.getInt(1);
				participant.memberID = rs.getString(2);
				participant.participationSeparation = rs.getInt(3);

				arr.add(participant);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return arr;
	}
	
	public CommunityParticipant selectCommunityOperator(int communityNo){
		CommunityParticipant participant = new CommunityParticipant();
		
		try {
			System.out.println(communityNo);
			String selectQuery = "SELECT * FROM `" + dbTable + "` where communityNo = " + communityNo
					+ " and participationSeparation = 0";

			// 吏덉쓽瑜� �븷 Statement 留뚮뱾湲�
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectQuery); // 議고쉶 荑쇰━寃곌낵瑜� rs�뿉 �꽔�쓬

			// rs�쓽 �궡�슜�쓣 媛��졇�샂
			if (rs.next()) {

				participant.communityNo = rs.getInt(1);
				participant.memberID = rs.getString(2);
				participant.participationSeparation = rs.getInt(3);

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return participant;
	}
	
	public static void main(String[] args) {
		CommunityParticipantControl participantControl = new CommunityParticipantControl();
		
		CommunityParticipant participant = new CommunityParticipant();
		

		/*
		// community 媛� �깮�꽦�맆 �븣 insertCommunity�� �븿猿� �떎�뻾�릺�뼱�빞 �븿
		participant.communityNo = 1;
		participant.memberID = "S0000001"; // �쁽�옱 濡쒓렇�씤�맂 �쉶�썝�쓽 �쉶�썝踰덊샇瑜� 諛쏆븘���빞 �븿
		participant.participationSeparation = 0;
		participantControl.insertCommunityParticipant(participant);
		
		// community�뿉 李몄뿬�떊泥� �뻽�쓣 �븣 
		participant.memberID = "S0000002";
		participant.participationSeparation = 3;
		participantControl.insertCommunityParticipant(participant);
		
		// community�쓽 �슫�쁺�옄媛� �빐�떦 �쉶�썝�쓣 李몄뿬�쉶�썝�쑝濡� �벑濡앺뻽�쓣 �븣
		participant.participationSeparation = 1;
		participantControl.updateCommunityParticipant(participant);
		
		// community�뿉 濡쒓렇�씤 �맂 �쉶�썝�씠 �깉�눜 �뻽�쓣 �븣
		participant.participationSeparation = 2;
		participantControl.updateCommunityParticipant(participant);
		
		// community李몄뿬�쉶�썝 議고쉶 �떆
		ArrayList<CommunityParticipant> participants;
		participants = participantControl.selectCommunityParticipants(1);
		for (CommunityParticipant communityParticipant : participants)
			System.out.println(communityParticipant.communityNo + communityParticipant.memberID + communityParticipant.participationSeparation );
		*/
		// communityparticipant
		participant = participantControl.selectCommunityOperator(1);
		System.out.println(participant.memberID);
	}
}
