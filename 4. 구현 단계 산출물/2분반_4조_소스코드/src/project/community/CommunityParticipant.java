package project.community;
public class CommunityParticipant {
	
	public int communityNo;
	public String memberID;
	public int participationSeparation;
	/*
	 * participationSeparation
	 * 0 : 모임방 운영자
	 * 1 : 모임방 참여회원
	 * 2 : 모임방 탈퇴회원
	 * 3 : 모임방 참여신청자
	 * */
	
	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public int getParticipationSeparation() {
		return participationSeparation;
	}
	public void setParticipationSeparation(int participationSeparation) {
		this.participationSeparation = participationSeparation;
	}
}
