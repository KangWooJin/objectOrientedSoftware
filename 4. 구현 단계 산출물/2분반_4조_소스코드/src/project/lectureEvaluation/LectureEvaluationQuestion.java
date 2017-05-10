package project.lectureEvaluation;

public class LectureEvaluationQuestion {
	public int evaluationQuestionNumber;
	public String effectiveStartDate;
	public String effectiveFinishDate;
	public String evaluandDivision;
	public String evaluationQuestionContent;
	
	public LectureEvaluationQuestion(){}

	public int getEvaluationQuestionNumber() {
		return evaluationQuestionNumber;
	}

	public void setEvaluationQuestionNumber(int evaluationQuestionNumber) {
		this.evaluationQuestionNumber = evaluationQuestionNumber;
	}

	public String getEffectiveStartDate() {
		return effectiveStartDate;
	}

	public void setEffectiveStartDate(String effectiveStartDate) {
		this.effectiveStartDate = effectiveStartDate;
	}

	public String getEffectiveFinishDate() {
		return effectiveFinishDate;
	}

	public void setEffectiveFinishDate(String effectiveFinishDate) {
		this.effectiveFinishDate = effectiveFinishDate;
	}

	public String getEvaluandDivision() {
		return evaluandDivision;
	}

	public void setEvaluandDivision(String evaluandDivision) {
		this.evaluandDivision = evaluandDivision;
	}

	public String getEvaluationQuestionContent() {
		return evaluationQuestionContent;
	}

	public void setEvaluationQuestionContent(String evaluationQuestionContent) {
		this.evaluationQuestionContent = evaluationQuestionContent;
	}
	
	
}
