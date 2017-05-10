package project.bulletinBoard;

public class BulletinBoardMessageData {
	public int bulletinBoardNum;
	public int bulletinBoardMessageNum; 
	public String bulletinBoardMessageType;
	public String bulletinBoardMessage;
	public int createDate;
	public String name;
	public String attachment;
	public String bulletinBoardMessageContent;
	
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
	public String getBulletinBoardMessageType() {
		return bulletinBoardMessageType;
	}
	public void setBulletinBoardMessageType(String bulletinBoardMessageType) {
		this.bulletinBoardMessageType = bulletinBoardMessageType;
	}
	public String getBulletinBoardMessage() {
		return bulletinBoardMessage;
	}
	public void setBulletinBoardMessage(String bulletinBoardMessage) {
		this.bulletinBoardMessage = bulletinBoardMessage;
	}
	public int getCreateDate() {
		return createDate;
	}
	public void setCreateDate(int createDate) {
		this.createDate = createDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getBulletinBoardMessageContent() {
		return bulletinBoardMessageContent;
	}
	public void setBulletinBoardMessageContent(String bulletinBoardMessageContent) {
		this.bulletinBoardMessageContent = bulletinBoardMessageContent;
	}
	
}