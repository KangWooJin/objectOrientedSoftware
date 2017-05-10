package project.lectureEvaluation;

public class EvaluationResult {
	public String memberId;
	public String processCode;
	public int evaluationQuestionNumber;
	public int fixedChoiceQuestionnaireID;
	public String short_answerQuestion;
	
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
	public int getEvaluationQuestionNumber() {
		return evaluationQuestionNumber;
	}
	public void setEvaluationQuestionNumber(int evaluationQuestionNumber) {
		this.evaluationQuestionNumber = evaluationQuestionNumber;
	}
	public int getFixedChoiceQuestionnaireID() {
		return fixedChoiceQuestionnaireID;
	}
	public void setFixedChoiceQuestionnaireID(int fixedChoiceQuestionnaireID) {
		this.fixedChoiceQuestionnaireID = fixedChoiceQuestionnaireID;
	}
	public String getShort_answerQuestion() {
		return short_answerQuestion;
	}
	public void setShort_answerQuestion(String short_answerQuestion) {
		this.short_answerQuestion = short_answerQuestion;
	}
	
}
