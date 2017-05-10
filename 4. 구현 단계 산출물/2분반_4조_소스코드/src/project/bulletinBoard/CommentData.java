package project.bulletinBoard;

public class CommentData {
	public int bulletinBoardNum;
	public int bulletinBoardMessageNum;
	public int commentNum;
	public String commentContent;
	public String privacyScope;
	public String creator;
	public String attachFile;
	public int openingDate;
	
	public int getBulletinBoardNum() {
		return bulletinBoardNum;
	}
	public void setBulletinBoardNum(int bulletinBoardNum) {
		this.bulletinBoardNum = bulletinBoardNum;
	}
	public int getBulletinBoardMessageNum() {
		return bulletinBoardMessageNum;
	}
	public void setBulletinBoardMessageNum(int bulletinBoardMessageNum) {
		this.bulletinBoardMessageNum = bulletinBoardMessageNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getPrivacyScope() {
		return privacyScope;
	}
	public void setPrivacyScope(String privacyScope) {
		this.privacyScope = privacyScope;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}
	public int getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(int openingDate) {
		this.openingDate = openingDate;
	}
}