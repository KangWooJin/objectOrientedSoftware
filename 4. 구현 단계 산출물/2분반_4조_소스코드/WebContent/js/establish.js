var oTbl;
//Row 추가
function insRow() {

	oTbl = document.getElementById("addTable");
	var oRow = oTbl.insertRow();
	oRow.onmouseover = function() {
		oTbl.clickedRowIndex = this.rowIndex
	}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
	var oCell = oRow.insertCell();

	//삽입될 Form Tag
	var frmTag = "<input type=text name=addText style=width:350px; height:20px;> ";
	frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
	oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
	oTbl.deleteRow(oTbl.clickedRowIndex);
}

function frmCheck() {
	 var frm = document.getElementById('form2');
	var msg = "";
	for (var i = 0; i <= frm.elements.length - 1; i++) {
		if (frm.elements[i].name == "addText") {
			if (!frm.elements[i].value) {
				alert("텍스트박스에 값을 입력하세요!");
				frm.elements[i].focus();
				return;
			}
			else{
				msg = msg + frm.elements[i].value + "/";
			}
		}
	}
	oTbl = document.getElementById("table1");
	var oRow = oTbl.insertRow();
	oRow.onmouseover = function() {
		oTbl.clickedRowIndex = this.rowIndex
	}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
	var oCell = oRow.insertCell();

	//삽입될 Form Tag
	var frmTag = "<input style=display:none type=text name=detailLectureInfo value='" + msg +"'>";
	oCell.innerHTML = frmTag
}

function checkInputException(establishProcessData){


	var trainingPeriodEnd = establishProcessData.trainingPeriodEnd.value;
	var trainingPeriodStart = establishProcessData.trainingPeriodStart.value;
	var classRoom = establishProcessData.classRoom.value;
	var lecturerID = establishProcessData.lecturerID.value;
	var tuition = establishProcessData.tuition.value;
	//var isApply = $("isApply").is(":checked"); 
	
	var centerName = establishProcessData.centerName.value;
	var refundSort = establishProcessData.refundSort.value;
//	var isAccepted = $("isAccepted").is(":checked");
	var detailLectureInfo = establishProcessData.detailLectureInfo.value;
	var completeStandard = establishProcessData.completeStandard.value;
	var processCode = establishProcessData.processCode.value;
	var subjectCode = establishProcessData.subjectCode.value;
	var processName = establishProcessData.processName.value;
	
	var t1 = trainingPeriodStart;
	var t2 = trainingPeriodEnd;
	
	
	
	
	for(var i=0; i < t1.length; i++) {
		if(!('0' <= t1.charAt(i) && t1.charAt(i) <= '9'))
		{
			alert("훈련일정은 숫자로 입력하세요");
			return false;
			
		}
	}	
	for(var i=0; i < t2.length; i++) {
		if(!('0' <= t2.charAt(i) && t2.charAt(i) <= '9'))
		{
			alert("훈련일정은 숫자로 입력하세요");
			return false;
			
		}
	}	
	
	var t3 = tuition;
	for(var i=0; i < t3.length; i++) {
		if(!('0' <= t3.charAt(i) && t3.charAt(i) <= '9'))
		{
			alert("수강료는 숫자로 입력하세요");
			return false;
			
		}
	}	

	
	if(processName.length == 0) 
	{
		alert("과정명이 비었습니다.");
		return false;		
	}
	else if(centerName.length == 0) 
	{
		alert("센터명 비었습니다.");
		return false;		
	}
	else if(detailLectureInfo.length == 0) 
	{
		alert("세부강의내역 비었습니다.");
		
		return false;		
	}
	else if(processCode.length == 0) 
	{
		alert("과정코드 비었습니다.");
		return false;		
	}
	else if(subjectCode.length == 0) 
	{
		alert("과목코드 비었습니다.");
		return false;		
	}
	

	
	
	if(processName.length > 100){
		alert("과정 명이 100자를 초과했습니다.");
		return false;
	}
	else if( classRoom.length > 10 ){
		alert("강의실 명이 10자를 초과했습니다.");
		return false;
	}
	
	else if( lecturerID.length > 10 ){
		alert("강사명이 10자를 초과했습니다.");
		return false;
	}
		
	else if( centerName.length > 100 ){
		alert("센터명이 100자를 초과했습니다.");
		return false;
	}
	else if( refundSort.length > 100 ){
		alert("환급종류가 100자를 초과했습니다.");
		return false;
	}
	else if( detailLectureInfo.length > 500 ){
		alert("세부강의내역이 500자를 초과했습니다.");
		return false;
	}
	else if( completeStandard.length > 50 ){
		alert("수료기준이 50자를 초과했습니다.");
		return false;
	}
	else if( processCode.length > 10 ){
		alert("과정코드가 10자를 초과했습니다.");
		return false;
	}
	else if( subjectCode.length > 10 ){
		alert("과목코드가 10자를 초과했습니다.");
		return false;
	}
	else if(tuition.length > 10){
		alert("수강료가 10자를 초과했습니다.");
		return false;
	}
	else if(trainingPeriodStart.length > 15){
		alert("훈련기간시작일이 15자를 초과했습니다.");
		return false;
	}
	else if(trainingPeriodEnd.length > 15){
		alert("훈련기간종료일이 15자를 초과했습니다.");
		return false;
	}
	
	
	
	return true;
}




