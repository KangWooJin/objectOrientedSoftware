package project.lecture;

public class LectureData {

	

	
	public LectureData(){
		
	}
	
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public int getProcessStep() {
		return processStep;
	}
	public void setProcessStep(int processStep) {
		this.processStep = processStep;
	}
	public String getPersonnelCardNumber() {
		return personnelCardNumber;
	}
	public void setPersonnelCardNumber(String personnelCardNumber) {
		this.personnelCardNumber = personnelCardNumber;
	}
	public String getProcessName() {
		return processName;
	}
	public void setProcessName(String processName) {
		this.processName = processName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getProcessCode() {
		return processCode;
	}
	public void setProcessCode(String processCode) {
		this.processCode = processCode;
	}
	public int processStep;
	public String personnelCardNumber;
	public String processName;
	public String companyName;
	public String processCode;
	public String memberID;
}



