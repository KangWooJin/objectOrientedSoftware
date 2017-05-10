function checkInputException(center){

	var flag = center.flag.value;
	var centerName = center.centerName.value;
	var localCode = center.localCode.value;
	var memberID = center.memberID.value;
	
	if( centerName == "" || localCode == "" || memberID == "" ){
		alert("센터 이름, 소재지역, 회원번호 중 하나가 입력되지 않았습니다.");
		return false;
	}
		
	else if( centerName.length > 30 ){
		alert("센터 이름이 30자를 초과했습니다.");
		return false;
	}
	
	else if( localCode.length > 5 ){
		alert("소재지역이 4자를 초과했습니다.");
		return false;
	}
		
	
	else if( memberID.length > 8 ){
		alert("잘못된 직원번호를 입력했습니다.");
		return false;
	}
	
	return true;
}