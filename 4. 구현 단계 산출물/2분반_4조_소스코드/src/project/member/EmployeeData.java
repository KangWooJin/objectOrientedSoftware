package project.member;



public class EmployeeData extends MemberData{

	public String memberID;
	public String centerDepartmentName;
	public String joinedDate;
	public String profilePhoto;
	public String enName;
	public String positionName;
	
	
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getCenterDepartmentName() {
		return centerDepartmentName;
	}
	public void setCenterDepartmentName(String centerDepartmentName) {
		this.centerDepartmentName = centerDepartmentName;
	}
	
	public String getJoinedDate() {
		return joinedDate;
	}
	public void setJoinedDate(String joinedDate) {
		this.joinedDate = joinedDate;
	}
	public String getProfilePhoto() {
		return profilePhoto;
	}
	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}
	public String getEnName() {
		return enName;
	}
	public void setEnName(String enName) {
		this.enName = enName;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
}
