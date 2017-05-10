

function createNormalMember() {
	location.href = "NormalMemberCreateView.jsp";	   
}

function createEmployeeMember() {
	location.href = "EmployeeMemberCreateView.jsp";	   
}



function cancleBtn()
{
	history.go(-1);
}


function normalMemberUpdateBtn() {
	location.href = "NormalMemberUpdateView.jsp";
}

function memberDeleteBtn() {
	location.href = "MemberDeleteView.jsp";
}

function getMemberType() {
	location.href = "MemberTypeView.jsp";	   
}

function employeeUpdateBtn() {
	location.href = "EmployeeMemberUpdateView.jsp";	
}

function idCheck() {
	var id = document.getElementById("ID").value;
	
	location.href="memberIdCheck.jsp";
}

function memberFormCheck( obj ) {
	
	if ( obj.ID.value.length == 0 )
	{
		alert("아이디가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.password.value.length == 0 )
	{
		alert("비밀번호가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.name.value.length == 0 )
	{
		alert("이름이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.address.value.length == 0 )
	{
		alert("주소가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.phoneNo.value.length == 0 )
	{
		alert("폰번호가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.email.value.length == 0 )
	{
		alert("이메일이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	
	if ( obj.ID.value.length > 20 || obj.password.value.length  > 20 || obj.checkPassword.value.length  > 20 ||
			obj.name.value.length  > 20 || 
			obj.address.value.length  > 500 || obj.phoneNo.value.length  > 11 || obj.email.value.length  > 20)
	{
		alert("범위를 초과합니다.");
		return false;
	}
	
	
	
	
	var password = obj.password.value;
	var checkpassword = obj.checkPassword.value;
	
	if(password == checkpassword)
	{
		return true;
	}
	else
	{
		alert("비밀번호와 비밀번호 확인이 다릅니다.");
		return false;
	}
	
	var email = obj.email.value;
	
	var i = email.indexOf("@");
	if(i < 0)
		return false;

	i = email.indexOf(".");
	if(i < 0)
		return false;
	
	
	return true;
}

function memberFormUpdateCheck( obj ) {
	
	
	
	
	if (obj.name.value.length == 0 )
	{
		alert("이름이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.address.value.length == 0 )
	{
		alert("주소가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.phoneNo.value.length == 0 )
	{
		alert("폰번호가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.email.value.length == 0 )
	{
		alert("이메일이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	
	if ( obj.ID.value.length > 20 || obj.password.value.length  > 20 || obj.checkPassword.value.length  > 20 ||
			obj.name.value.length  > 20 || 
			obj.address.value.length  > 500 || obj.phoneNo.value.length  > 11 || obj.email.value.length  > 20)
	{
		alert("범위를 초과합니다.");
		return false;
	}
	
	
	
	
	var password = obj.password.value;
	var checkpassword = obj.checkPassword.value;
	
	if(password == checkpassword)
	{
		return true;
	}
	else
	{
		alert("비밀번호와 비밀번호 확인이 다릅니다.");
		return false;
	}
	
	var email = obj.email.value;
	
	var i = email.indexOf("@");
	if(i < 0)
		return false;

	i = email.indexOf(".");
	if(i < 0)
		return false;
	
	
	return true;
}

function employeeFormCheck( obj ) {
	
	
	
	if ( obj.ID.value.length == 0 )
	{
		alert("아이디가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.password.value.length == 0 )
	{
		alert("비밀번호가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.name.value.length == 0 )
	{
		alert("이름이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.address.value.length == 0 )
	{
		alert("주소가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.phoneNo.value.length == 0 )
	{
		alert("폰번호가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.email.value.length == 0 )
	{
		alert("이메일이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.enName.value.length == 0 )
	{
		alert("영어이름이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	var accountNumber = obj.accountNumber.value;
	
	for(var i=0; i < accountNumber.length; i++) {
		if(!('0' <= accountNumber.charAt(i) && accountNumber.charAt(i) <= '9'))
		{
			alert("계좌번호는 숫자로 입력하세요");
			return false;
			
		}
	}	
	
	if ( obj.ID.value.length > 20 || obj.password.value.length  > 20 || obj.checkPassword.value.length  > 20 ||
			obj.name.value.length  > 20 || 
			obj.address.value.length  > 500 || obj.phoneNo.value.length  > 11 || obj.email.value.length  > 20)
	{
		alert("범위를 초과합니다.");
		return false;
	}
	
	
	
	
	var password = obj.password.value;
	var checkpassword = obj.checkPassword.value;
	
	if(password == checkpassword)
	{
		return true;
	}
	else
	{
		alert("비밀번호와 비밀번호 확인이 다릅니다.");
		return false;
	}
	
	var email = obj.email.value;
	
	var i = email.indexOf("@");
	if(i < 0)
		return false;

	i = email.indexOf(".");
	if(i < 0)
		return false;
	
	alert("이상없");
	return true;
}


function employeeFormUpdateCheck( obj ) {
	
	
	
	
	
	if (obj.name.value.length == 0 )
	{
		alert("이름이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.address.value.length == 0 )
	{
		alert("주소가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.phoneNo.value.length == 0 )
	{
		alert("폰번호가 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.email.value.length == 0 )
	{
		alert("이메일이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	if (obj.enName.value.length == 0 )
	{
		alert("영어이름이 비어있습니다.");
		obj.focus();
		return false;
	}
	
	var accountNumber = obj.accountNumber.value;
	
	for(var i=0; i < accountNumber.length; i++) {
		if(!('0' <= accountNumber.charAt(i) && accountNumber.charAt(i) <= '9'))
		{
			alert("계좌번호는 숫자로 입력하세요");
			return false;
			
		}
	}	
	
	if ( obj.ID.value.length > 20 || obj.password.value.length  > 20 || obj.checkPassword.value.length  > 20 ||
			obj.name.value.length  > 20 || 
			obj.address.value.length  > 500 || obj.phoneNo.value.length  > 11 || obj.email.value.length  > 20)
	{
		alert("범위를 초과합니다.");
		return false;
	}
	
	
	
	
	var password = obj.password.value;
	var checkpassword = obj.checkPassword.value;
	
	if(password == checkpassword)
	{
		return true;
	}
	else
	{
		alert("비밀번호와 비밀번호 확인이 다릅니다.");
		return false;
	}
	
	var email = obj.email.value;
	
	var i = email.indexOf("@");
	if(i < 0)
		return false;

	i = email.indexOf(".");
	if(i < 0)
		return false;
	
	alert("이상없음");
	return true;
}

