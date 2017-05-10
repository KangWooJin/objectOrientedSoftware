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
		var frmTag = "<input style=display:none type=text name=lectureContent value='" + msg +"'>";
		oCell.innerHTML = frmTag
		alert("asd");
	}
	function cancelBtn(){
		location.href="../main/mainView.jsp";
	}

	
	function enrollBtn() {
		location.href = "operateSubjectCreateView.jsp";
	}
	
	
function checkInputException1(operateSubjectData){

	var subjectProcess = operateSubjectData.subjectProcess.value;
	var target = operateSubjectData.target.value;
	var feature = operateSubjectData.feature.value;
	var recruitNumber = operateSubjectData.recruitNumber.value;
	var tuition = operateSubjectData.tuition.value;
	var subjectCode = operateSubjectData.subjectCode.value;
	var purpose = operateSubjectData.purpose.value;
	var changeRecord = operateSubjectData.changeRecord.value;
	var subjectName = operateSubjectData.subjectName.value;
	var totalDate = operateSubjectData.totalDate.value;
	var totalHour = operateSubjectData.totalHour.value;
	var lectureHour = operateSubjectData.lectureHour.value;
	var lectureContent = operateSubjectData.lectureContent.value;

	
	
	if(subjectProcess.length == 0) 
	{
		alert("과정이 비었습니다.");
		return false;		
	}
	else if(subjectCode.length == 0) 
	{
		alert("과목코드이 비었습니다.");
		return false;		
	}
	else if(subjectName.length == 0) 
	{
		alert("과목명이 비었습니다.");
		return false;		
	}
	
	if(subjectProcess.length > 10){
		alert("과정이 10자를 초과했습니다.");
		return false;
	}
	else if( target.length > 300 ){
		alert("수강대상이 300자를 초과했습니다.");
		return false;
	}
	
	else if( feature.length > 300 ){
		alert("과목 특장점이 300자를 초과했습니다.");
		return false;
	}
		
	else if( subjectCode.length > 10 ){
		alert("과목코드가 10자를 초과했습니다.");
		return false;
	}
	else if( purpose.length > 100 ){
		alert("학습목표가 100자를 초과했습니다.");
		return false;
	}
	else if( subjectName.length > 20 ){
		alert("과목 명이 20자를 초과했습니다.");
		return false;
	}
	else if( lectureContent.length > 500 ){
		alert("세부강의내역이 500자를 초과했습니다.");
		return false;
	}
	else if( recruitNumber.length > 4 ){
		alert("모집인원이 4자를 초과했습니다.");
		return false;
	}
	else if( tuition.length > 7 ){
		alert("수강료가 7자를 초과했습니다.");
		return false;
	}
	else if( totalDate.length > 5 ){
		alert("총강의일수이 5자를 초과했습니다.");
		return false;
	}
	else if( totalHour.length > 5 ){
		alert("총강의시간이 5자를 초과했습니다.");
		return false;
	}
	else if( lectureHour.length > 5 ){
		alert("강의시간이 5자를 초과했습니다.");
		return false;
	}

	
	var r = recruitNumber;
	
	for(var i=0; i < r.length; i++) {
		if(!('0' <= r.charAt(i) && r.charAt(i) <= '9'))
		{
			alert("모집인원은 숫자로 입력하세요");
			return false;
			
		}
	}	
	
	var t = tuition;
	
	for(var i=0; i < t.length; i++) {
		if(!('0' <= t.charAt(i) && t.charAt(i) <= '9'))
		{
			alert("수강료는 숫자로 입력하세요");
			return false;
			
		}
	}	
	
	
	var td = totalDate;
	
	for(var i=0; i < td.length; i++) {
		if(!('0' <= td.charAt(i) && td.charAt(i) <= '9'))
		{
			alert("총강의일수는 숫자로 입력하세요");
			return false;
			
		}
	}	
	
	var th = totalHour;
	
	for(var i=0; i < th.length; i++) {
		if(!('0' <= th.charAt(i) && th.charAt(i) <= '9'))
		{
			alert("총강의시간은 숫자로 입력하세요");
			return false;
			
		}
	}	
	var lh = lectureHour;
	
	for(var i=0; i < lh.length; i++) {
		if(!('0' <= lh.charAt(i) && lh.charAt(i) <= '9'))
		{
			alert("강의시간은 숫자로 입력하세요");
			return false;
			
		}
	}	
	

	return true;
}


function checkInputException2(operateSubjectData){

	var subjectProcess = operateSubjectData.subjectProcess.value;
	var target = operateSubjectData.target.value;
	var feature = operateSubjectData.feature.value;
	var recruitNumber = operateSubjectData.recruitNumber.value;
	var tuition = operateSubjectData.tuition.value;
	var subjectCode = operateSubjectData.subjectCode.value;
	var purpose = operateSubjectData.purpose.value;
	var changeRecord = operateSubjectData.changeRecord.value;
	var subjectName = operateSubjectData.subjectName.value;
	var totalDate = operateSubjectData.totalDate.value;
	var totalHour = operateSubjectData.totalHour.value;
	var lectureHour = operateSubjectData.lectureHour.value;
	var lectureContent = operateSubjectData.lectureContent.value;

	
	
	if(subjectProcess.length == 0) 
	{
		alert("과정이 비었습니다.");
		return false;		
	}
	else if(subjectCode.length == 0) 
	{
		alert("과목코드가 비었습니다.");
		return false;		
	}
	else if(subjectName.length == 0) 
	{
		alert("과목명이 비었습니다.");
		return false;		
	}
	else if(changeRecord.length == 0) 
	{
		alert("변경이력이 비었습니다.");
		return false;		
	}
	
	
	if(subjectProcess.length > 10){
		alert("과목 명이 10자를 초과했습니다.");
		return false;
	}
	else if( target.length > 300 ){
		alert("강의실 명이 10자를 초과했습니다.");
		return false;
	}
	
	else if( feature.length > 300 ){
		alert("과목 특장점이 300자를 초과했습니다.");
		return false;
	}
		
	else if( subjectCode.length > 10 ){
		alert("과목코드가 10자를 초과했습니다.");
		return false;
	}
	else if( purpose.length > 100 ){
		alert("학습목표가 100자를 초과했습니다.");
		return false;
	}
	else if( subjectName.length > 20 ){
		alert("과목 명이 20자를 초과했습니다.");
		return false;
	}
	else if( lectureContent.length > 500 ){
		alert("세부강의내역이 500자를 초과했습니다.");
		return false;
	}
	else if( recruitNumber.length > 4 ){
		alert("모집인원이 4자를 초과했습니다.");
		return false;
	}
	else if( tuition.length > 7 ){
		alert("수강료가 7자를 초과했습니다.");
		return false;
	}
	else if( totalDate.length > 5 ){
		alert("총강의일수이 5자를 초과했습니다.");
		return false;
	}
	else if( totalHour.length > 5 ){
		alert("총강의시간이 5자를 초과했습니다.");
		return false;
	}
	else if( lectureHour.length > 5 ){
		alert("강의시간이 5자를 초과했습니다.");
		return false;
	}
	else if( changeRecord.length > 100 ){
		alert("변경이력이 100자를 초과했습니다.");
		return false;
	}
	
	
	var r = recruitNumber;
	
	for(var i=0; i < r.length; i++) {
		if(!('0' <= r.charAt(i) && r.charAt(i) <= '9'))
		{
			alert("모집인원은 숫자로 입력하세요");
			return false;
			
		}
	}	
	
	var t = tuition;
	
	for(var i=0; i < t.length; i++) {
		if(!('0' <= t.charAt(i) && t.charAt(i) <= '9'))
		{
			alert("수강료는 숫자로 입력하세요");
			return false;
			
		}
	}	
	
	
	var td = totalDate;
	
	for(var i=0; i < td.length; i++) {
		if(!('0' <= td.charAt(i) && td.charAt(i) <= '9'))
		{
			alert("총강의일수는 숫자로 입력하세요");
			return false;
			
		}
	}	
	
	var th = totalHour;
	
	for(var i=0; i < th.length; i++) {
		if(!('0' <= th.charAt(i) && th.charAt(i) <= '9'))
		{
			alert("총강의시간은 숫자로 입력하세요");
			return false;
			
		}
	}	
	var lh = lectureHour;
	
	for(var i=0; i < lh.length; i++) {
		if(!('0' <= lh.charAt(i) && lh.charAt(i) <= '9'))
		{
			alert("강의시간은 숫자로 입력하세요");
			return false;
			
		}
	}	
	

	return true;
}




function checkInputException3(operateSubjectData){

	var subjectProcess = operateSubjectData.subjectProcess.value;
	var target = operateSubjectData.target.value;	
	var subjectCode = operateSubjectData.subjectCode.value;	
	var subjectName = operateSubjectData.subjectName.value;
	
	
	if(subjectProcess.value.length == 0) 
	{
		alert("과정이 비었습니다.");
		return false;		
	}
	else if(subjectCode.value.length == 0) 
	{
		alert("과목코드가 비었습니다.");
		return false;		
	}
	else if(subjectName.value.length == 0) 
	{
		alert("과목명이 비었습니다.");
		return false;		
	}
	else if(target.value.length == 0)
	{
		alert("수강대상이 비었습니다.");
		return false;
	}
		
	
	if(subjectProcess.length > 10){
		alert("과목 명이 10자를 초과했습니다.");
		return false;
	}
	else if( target.length > 300 ){
		alert("수강대상이 300자를 초과했습니다.");
		return false;
	}	
	else if( subjectCode.length > 10 ){
		alert("과목코드가 10자를 초과했습니다.");
		return false;
	}
	else if( subjectName.length > 20 ){
		alert("과목 명이 20자를 초과했습니다.");
		return false;
	}
	
	return true;
}




