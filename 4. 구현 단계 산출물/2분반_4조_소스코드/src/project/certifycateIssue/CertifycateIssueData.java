package project.certifycateIssue;

public class CertifycateIssueData 
{
	public int getIssueNum() {
		return issueNum;
	}
	public void setIssueNum(int issueNum) {
		this.issueNum = issueNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getProcessCode() {
		return processCode;
	}
	public void setProcessCode(String processCode) {
		this.processCode = processCode;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int issueNum;
	public String memberId;
	public String processCode;
	public String date;
}
