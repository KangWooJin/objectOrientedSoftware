<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기는 기본셋팅이라 건들지 말것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="operateSubjectControl" class="project.operateSubject.OperateSubjectControl" />
<jsp:useBean id="operateSubjectData" class="project.operateSubject.OperateSubjectData" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->
<title>운영과목등록</title>

<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="../js/operate.js">
	
</script>
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
	<section>
	<h6 class=subTitle> 교육센터 통합 운영관리 시스템 - 운영과목관리 - 운영과목등록</h6>

	<h3 class=mainTitle>운영과목 등록</h3>
	<div>
	<form action="operateSubjectCreate.jsp" id="operateSubjectForm" method="post" onSubmit="return checkInputException1( this )">
	<table align="center" border="0" cellpadding=4 cellspacing=0 id="table1">
		<tr>
			<td width="200" align="center">과목코드</td>
			<td width="200" align="center"><input type="text" name="subjectCode"></td>	
			<td width="200" align="center">과정</td>	
			<td width="200" align="center"><input type="text" size="70" name="subjectProcess"></td>
			<td width="200" align="center"><input class="myButton" type="submit" value="등록"></td>
		</tr>
		<tr>
			<td width="200" align="center">과목명</td>
			<td width="200" align="center"><input type="text" size="70" name="subjectName"></td>
			<td></td>
			<td></td>
			<td width="200" align="center"><input class="myButton" type="button" value="취소" onclick="cancelBtn()"></td>
		</tr>
		<tr>
			<td width="200" align="center">학습목표</td>
			<td  width="200" align="center"'><input type="text" size="70" name="purpose"></td>
	
		</tr>
		<tr>
			<td width="200" align="center">수강대상</td>
			<td  width="200" align="center"><input type="text" size="70" name="target"></td>		
		</tr>
		<tr>
			<td width="200" align="center">과목의특장점</td>
			<td  width="200" align="center"><input type="text" size="70" name="feature"></td>		
		</tr>
		<tr>
			<td width="200" align="center">총강의일수</td>
			<td width="200" align="center"><input type="text" name="totalDate"></td>		
			<td width="200" align="center">총강의시간</td>
			<td width="200" align="center"><input type="text" name="totalHour"></td>	
		</tr>
		<tr>
			<td width="200" align="center">강의시간</td>
			<td width="200" align="center"><input type="text" name="lectureHour"></td>	
			<td width="200" align="center">모집인원</td>
			<td width="200" align="center"><input type="text" name="recruitNumber"></td>
		</tr>
		<tr>
			<td width="200" align="center">수강료</td>
			<td  width="200" align="center"><input type="text" name="tuition"></td>
		</tr>
		
		<tr>
			<td style="display:none" >변경이력<p></p></td>
			<td><textarea style="display:none"   class="myTextarea" cols="60" rows="6" name="changeRecord"></textarea></td>
		</tr>
		<tr>
			<td width="200" align="center" >강의내용</td>
		</tr>
		
	</table>
	</form>
	
	<form id="form2">
		<table align="center" width="400" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="200" align="center" colspan="2" bgcolor="#e8e8e8">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="200" align="center" colspan="5" bgcolor="#e8e8e8" height="25">
								<input name="addButton" type="button" style="cursor: hand"
								onClick="insRow()" value="+"> <font color="#e8e8e8">*</font>추가버튼을
								클릭해 보세요.
							</td>
						</tr>
						<tr>
							<td width="200" align="center" height="25">
								<table id="addTable" width="400" cellspacing="0" cellpadding="0"
									bgcolor="#e8e8e8" border="0">
									<tr>
										<td width="200" align="right"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table align="center" border="0">
			<tr>
				<td width="200" align="center"><input class="myButton" type="button" name="button"value="강의내역확인" onClick="frmCheck()"></td>
			</tr>
		</table>


	</form>
	</div>
	</section>
</body>
</html>