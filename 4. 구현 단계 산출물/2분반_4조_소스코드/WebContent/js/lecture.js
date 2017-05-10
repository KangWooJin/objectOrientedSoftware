

function cancelBtn() {
	location.href = "../main/mainView.jsp";
}


function checkInputException(lecture){

	var processCode = lecture.processCode.value;
	var memberID = lecture.memberID.value;
	var processStep = lecture.processStep.value;
	var personnelCardNumber = lecture.personnelCardNumber.value;
	var processName = lecture.processName.value;
	var companyName = lecture.companyName.value;
	
	
	if( processCode.lenghth == 0 ){
		alert("과정코드가 비었습니다.");
		return false;
	}		
	else if( memberID == 0 ){
		alert("회원아이디가 존재하지 않습니다.");
		return false;
	}
			
	if( processCode.length > 10 ){
		alert("과정코드가 10자리를 초과했습니다.");
		return false;
	}
	else if( processName.length > 100 ){
		alert("과정명이 100자리를 초과했습니다.");
		return false;
	}
	else if( personnelCardNumber.length > 16 ){
		alert("개인능력개발카드번호가 16자리를 초과했습니다.");
		return false;
	}
	else if( companyName.length > 20 ){
		alert("사업주 회사명이 20자리를 초과했습니다.");
		return false;
	}
	
	var p = personnelCardNumber;
	
	for(var i=0; i < p.length; i++) {
		if(!('0' <= p.charAt(i) && p.charAt(i) <= '9'))
		{
			alert("개인능력개발카드번호는  숫자로 입력하세요");
			return false;
			
		}
	}	
	
	return true;
}