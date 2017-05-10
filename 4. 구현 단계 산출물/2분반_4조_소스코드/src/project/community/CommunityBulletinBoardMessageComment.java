package project.community;

public class CommunityBulletinBoardMessageComment { 
	public int communityBulletinBoardNo;
	public int communityBulletinBoardMessageNo;
	public int communityBulletBoardMessageCommentNo;
	public String name;
	public String commentContent;
	public int openingDate;
	
	public int getCommunityBulletinBoardNo() {
		return communityBulletinBoardNo;
	}
	public void setCommunityBulletinBoardNo(int communityBulletinBoardNo) {
		this.communityBulletinBoardNo = communityBulletinBoardNo;
	}
	public int getCommunityBulletinBoardMessageNo() {
		return communityBulletinBoardMessageNo;
	}
	public void setCommunityBulletinBoardMessageNo(int communityBulletinBoardMessageNo) {
		this.communityBulletinBoardMessageNo = communityBulletinBoardMessageNo;
	}
	public int getCommunityBulletBoardMessageCommentNo() {
		return communityBulletBoardMessageCommentNo;
	}
	public void setCommunityBulletBoardMessageCommentNo(int communityBulletBoardMessageCommentNo) {
		this.communityBulletBoardMessageCommentNo = communityBulletBoardMessageCommentNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(int openingDate) {
		this.openingDate = openingDate;
	}
}