<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="nor" property="*" />

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
	<h6>교육센터 통합 운영관리 시스템 - 회원정보관리 - 회원정보 수정</h6>

	<h3>회원 정보 수정</h3>

	<%
		nor = (project.member.NormalMemberData) session.getAttribute("member");
	%>


	<div align=center>

		<div width=1000>
			<form id=memberCreateForm action="NormalMemberUpdate.jsp" method=post onSubmit="return memberFormUpdateCheck( this )">
				<fieldset>
					<legend>비밀번호변경</legend>
					<table width=600px>
						<tr>
							<th colspan=3>회원정보입력</th>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>회원 아이디</th>
							<td><input type="text" name=ID value=<%=nor.ID%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="password"></td>
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
				<fieldset>
					<legend>개인정보</legend>
					<table width="600px">
						<tr>
							<th>*성명</th>
							<td><input type="text" name=name value=<%=nor.name%>>
							</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>*거주지주소</th>
							<td colspan=3><input type="text" name=address
								style="width: 500px;" value=<%=nor.address%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>*이메일</th>
							<td colspan=2><input type="text" name=email
								style="width: 300px;" value=<%=nor.email%>></td>
							<td><SELECT id="emailList">
									<OPTION selected>직접입력</OPTION>
									<OPTION>naver.com</OPTION>
									<OPTION>daum.net</OPTION>
									<OPTION>gmail.com</OPTION>
							</SELECT></td>
							<td></td>
						</tr>
						<tr>
							<th>*휴대폰 번호</th>
							<td><input type="text" name=phoneNo style="width: 300px;"
								value=<%=nor.phoneNo%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>근무회사명</th>
							<td><input type="text" name=centerName
								value=<%=nor.centerName%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>부서명</th>
							<td><input type="text" name=department
								value=<%=nor.department%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>직위</th>
							<td><input type="text" name=position
								value=<%=nor.position%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>직무</th>
							<td><input type="text" name=duty value=<%=nor.duty%>></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
						<td colspan=2 align=center>
						<input type="submit" class=myButton value="수정"> <input
						type="button" class=myButton value="취소" onclick="cancleBtn()">
						</td>
						</tr>
					</table>

				</fieldset>
				<div align=right>
					
				</div>
			</form>
		</div>
	</div>
</body>
</html>