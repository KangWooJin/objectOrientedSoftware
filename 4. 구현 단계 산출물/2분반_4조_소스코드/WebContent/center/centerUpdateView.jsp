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
<jsp:useBean id="centerControl" class="project.center.CenterControl" />
<jsp:useBean id="center" class="project.center.Center" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->
<title>센터등록</title>

<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
<SCRIPT type="text/javascript" src="../js/function.js"></SCRIPT>
<SCRIPT type="text/javascript" src="../js/center.js"></SCRIPT>
<!-- 자신의 javascript를 추가하는 곳 -->

</head>


<body>
	<!-- 여기서부터 jsp화면 출력하는 부분 건들지 말것  header에서 부터 드래그해서 복사할것-->

	
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

	<!--  여기까지 화면의 목록!!!!!! -->

	<!-- 여기는 자신의 관리와 기능을 적을것 -->
	<h6>교육센터 통합 운영관리 시스템 - 센터관리 - 센터수정</h6>

	<!-- 여기는 자신의 기능을 적을것-->
	<h3>센터 수정</h3>

	<!-- 여기서부터 jsp화면 출력하는 부분 건들지 말것  header에서 부터 드래그해서 복사할것-->
	<%
	String centerNo = request.getParameter("value");
	center = centerControl.selectCenter(centerNo);
	%>

	<div align="center">
		<form action="centerUpdate.jsp" onSubmit="return checkInputException( this )">
		
			<table width="400px">
							
				<tr align=center> <td colspan=4>&nbsp;</td> </tr>
				<tr align=center> <td colspan=4>&nbsp;</td> </tr>
				<tr align=center> <td colspan=4>&nbsp;</td> </tr>
						
				<tr>
					<td colspan=2 align="right">교육센터명</td>
					<td colspan=2 align="center"><input type="hidden" name=centerName value=<%=center.centerName%>><%=center.centerName%></td>
				</tr>
				
				<tr>
					<td colspan=2 align="right">소재지역코드</td>
					<td colspan=2 align="center"><input type="hidden" name=localCode value=<%=center.localCode%>><%=center.localCode%></td>
				</tr>
				
				<tr>
					<td colspan=2 align="right">현 센터장 번호</td>
					<td colspan=2 align="center"><input type="text" name=memberID></td>
				</tr>
				
				<tr align="center"> <td colspan=4>&nbsp;</td> </tr>
				<tr align="center"> <td colspan=4>&nbsp;</td> </tr>
				<tr align="center"> <td colspan=4>&nbsp;</td> </tr>
								
				<tr>
					<td colspan=4 align="center" >
						<input type="hidden" name=flag id="flag" value="update">
						<input type="hidden" name=centerNo value=<%=centerNo %>>
						<input type="submit" class="myButton" value="등록"> 
						<input type="button" onclick="cancleBtn()" class="myButton" value="취소">
					</td>
				</tr>
				
			</table>

		</form>
	</div>
</body>
</html>