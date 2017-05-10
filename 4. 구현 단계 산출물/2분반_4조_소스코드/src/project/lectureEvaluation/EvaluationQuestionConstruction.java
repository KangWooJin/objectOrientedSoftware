package project.lectureEvaluation;

public class EvaluationQuestionConstruction {
	public int evaluationQuestionNumber;
	public int fixedChoiceQuestionnaireID;
	public String effectiveStartDate;
	public String effectiveFinishDate;
	
	public EvaluationQuestionConstruction(){}

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
	
	
}
