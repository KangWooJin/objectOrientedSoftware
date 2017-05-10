<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="em" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="../js/function.js"></SCRIPT>
</head>
<body>

	
		<header>
	<%
		
		mem = (project.member.MemberData) session.getAttribute("member");
		Integer o = (Integer) session.getAttribute("login");
		Integer isLogin = -1 ;
		
        //out.println(id + " " + password) ;;
		
	  if ( o != null )
      {      
         isLogin = (Integer)session.getAttribute("login");
         
         if ( isLogin == 0 )
         {
            nor = (project.member.NormalMemberData) session.getAttribute("member");         
         }
         else
         {
            em = (project.member.EmployeeData) session.getAttribute("member");     
         }
      }
      
   
      
      if ( isLogin == 0 || isLogin == 1) {
         if ( isLogin == 0)
         {
               
	%>
   <div align="right">
      <table clsss="innor" id="innor">
         <tr align=center>
            <td colspan=3> <%= nor.name %> <% out.println( "( " + nor.ID + " ) 환영합니다.") ;%></td>
            
         </tr>
         <form action="../member/logout.jsp">
         <tr align=center>
            <td colspan=1 ><input class="myButton" type="submit" value="로그아웃"></td>
         </form>
         <form action="../member/NormalMemberReadView.jsp">
            <td colspan=1 ><input class="myButton" type="submit" value="마이페이지"></td>
         </form>
         </tr>
         
      </table>
   </div>
   <%      }
         else
         {
            %>
   <div align="right">
      <table clsss="innor" id="innor">
         <tr align=center>
            <td colspan=3> <%= em.name %> <% out.println( "( " + em.ID + " ) 환영합니다.") ;%></td>
            
         </tr>
         <form action="../member/logout.jsp">
         <tr align=center>
            <td colspan=1 ><input class="myButton" type="submit" value="로그아웃"></td>
         </form>
         <form action="../member/EmployeeMemberReadView.jsp">
            <td colspan=1 ><input class="myButton" type="submit" value="마이페이지"></td>
         </form>
         </tr>
         
      </table>
   </div>
            <%
         }
      }
      else {
   %>
      <div align="right">
      
      <table>
      <form action="../member/loginView2.jsp">
         <tr>
            <td>아이디</td>
            <td><input type="text" name="ID" value="s0001"></td>
            <td><input class="myButton" type="submit" value="로그인"></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><input type="password" name="password" value="1234"></td>
      </form>
      <form action="../member/RealNameAuthenticationTypeView.jsp">
            <td><input class="myButton" type="submit" value="회원가입"></td>
      </form>
         </tr>
      </table>
   </div>
   <% }
   %>
   </header>
	
	<nav>
		<%  
	
		if ( isLogin == 0 || isLogin == 1) {
			int type = 1;
			if(isLogin == 0){
				type = memberControl.getMemberType(nor.memberID);		
			}
			else if(isLogin == 1){
				type = memberControl.getMemberType(em.memberID);
			}
			if(type == 1){
	%>
		<%@ include file="../navStyle/navStyle.jsp"%>

	<%}
			else if(type == 0){
	%>			
		<%@ include file="../navStyle/navStyle2.jsp"%>
	<%		} 
		}
	else {%>
		<%@ include file="../navStyle/navStyle3.jsp"%>
	
	<%} %>
	</nav> </header>
	
	<h6>교육센터 통합 운영관리 시스템 - 회원정보관리 - 직원정보 수정</h6>

	<h3>직원 정보 수정</h3>

	<div align=center>

		<div align=center>
			<form id=memberCreateForm action="EmployeeMemberUpdate.jsp" onSubmit="return employeeFormUpdateCheck(this)">
				<fieldset>
					<legend>비밀번호변경</legend>
					<table width=600px>

						<tr>
							<th>로그인 아이디</th>
							<td><input type="text" name=ID value=<%=em.ID%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name=password></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td><input type="password" name=checkPassword></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</fieldset>

				<fieldset id=contact>
					<legend>개인정보</legend>
					<table width=800px>

						<tr>
							<th>한글성명</th>
							<td><input type="text" name=name value=<%=em.name%>></td>
							<th>영문 성명</th>
							<td><input type="text" name=enName value=<%=em.enName%>></td>
						</tr>

						<tr>
							<th>성별</th>
							<td colspan=2><input type="radio" id=genderStatus value=1
								name=genderStatus
								<%if (em.genderStatus == 1) {
				out.write("checked");
			}%>>
								남자 <input type="radio" id=genderStatus name=genderStatus value=0
								<%if (em.genderStatus == 0) {
				out.write("checked");
			}%>>
								여자</td>
							<td></td>

						</tr>

						<tr>
							<th>주민등록지주소</th>
							<td colspan=3><input type="text" name=truthResidence
								style="width: 500px;" value=<%=em.truthResidence%>></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<th>거주지주소</th>
							<td colspan=3><input type="text" name=address
								style="width: 500px;" value=<%=em.address%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>집 전화번호</th>
							<td><input type="text" name=homePhoneNo
								value=<%=em.homePhoneNo%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="text" name=phoneNo value=<%=em.phoneNo%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>비상연락 전화번호번호</th>
							<td><input type="text" name=emergencyContact
								value=<%=em.emergencyContact%>></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<th>이메일</th>
							<td colspan=2><input type="text" name=email
								style="width: 300px;" value=<%=em.email%>></td>
							<td><SELECT id="emailList">
									<OPTION selected>직접입력</OPTION>
									<OPTION>naver.com</OPTION>
									<OPTION>daum.net</OPTION>
									<OPTION>gmail.com</OPTION>
							</SELECT></td>
							<td></td>
						</tr>

					</table>
				</fieldset>


				<fieldset>
					<legend>계좌정보변경</legend>
					<table width=600px>
						<tr>
							<th>은행코드</th>
							<td><input type="text" name=bankCode></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>계좌번호</th>
							<td><input type="text" name=accountNumber></td>
							<td></td>
							<td></td>
						</tr>

					</table>
				</fieldset>
				<fieldset>
					<legend>추가정보변경</legend>


					<table width=600px>

						<tr>
							<th>근무센터명</th>
							<td><input type="text" name=centerName
								value=<%=em.centerDepartmentName%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>강의과목명</th>
							<td><input type="text" name=responsibilitySubject></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>경력명</th>
							<th>경력 유형구분</th>
							<th>경력설명</th>
							<td></td>
						</tr>
						<tr>
							<td>정보처리기사</th>
							<td>자격증</th>
							<td>-</td>
							<td></td>
						</tr>


						<tr>
						<td colspan=2 align=center>
						<input type="submit" class=myButton value="수정"> 
						<input type="button" class=myButton value="취소" onclick="cancleBtn()">
						</td>
						</tr>
					</table>

				</fieldset>
				
			</form>
		</div>
	</div>
</body>
</html>