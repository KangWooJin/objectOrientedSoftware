package project.bulletinBoard;

public class BulletinBoardData {
	public int bulletinBoardNum;
	public String bulletinBoard;
	public int openingDate;
	public int closingDate;
	public String kindOfbulletinBoard;
	public String creator;
	public String closer;
	
	public int getBulletinBoardNum() {
		return bulletinBoardNum;
	}
	public void setBulletinBoardNum(int bulletinBoardNum) {
		this.bulletinBoardNum = bulletinBoardNum;
	}
	public String getBulletinBoard() {
		return bulletinBoard;
	}
	public void setBulletinBoard(String bulletinBoard) {
		this.bulletinBoard = bulletinBoard;
	}
	public int getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(int openingDate) {
		this.openingDate = openingDate;
	}
	public int getClosingDate() {
		return closingDate;
	}
	public void setClosingDate(int closingDate) {
		this.closingDate = closingDate;
	}
	public String getKindOfbulletinBoard() {
		return kindOfbulletinBoard;
	}
	public void setKindOfbulletinBoard(String kindOfbulletinBoard) {
		this.kindOfbulletinBoard = kindOfbulletinBoard;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getCloser() {
		return closer;
	}
	public void setCloser(String closer) {
		this.closer = closer;
	}
}