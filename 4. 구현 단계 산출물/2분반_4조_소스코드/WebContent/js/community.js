
function checkInputException(community) {

	var flag = community.flag.value;
	var comName = community.communityName.value;
	var comExp = community.communityExplanation.value;
	
	if( comName == "" || comExp == "" ){
		alert("모임방 이름 혹은 모임방 설명이 입력되지 않았습니다.");
		return false;
	}
		
	else if( comName.length > 30 ){
		alert("모임방 이름이 30자를 초과했습니다.");
		return false;
	}
		
	
	else if( comExp.length > 100 ){
		alert("모임방 설명이 100자를 초과했습니다.");
		return false;
	}
	
	return true;
}


function communityParticipantReadView(){
	location.href = "CommunityParticipantReadView.jsp";
}
