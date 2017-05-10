<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>

<%@ page import = "java.util.*" %>
<%@ page import = "project.community.*" %>

<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData"/>

<jsp:useBean id="communityBulletinBoardControl" class="project.community.CommunitybulletinBoardControl" />
<jsp:useBean id="communityBulletinBoard" class="project.community.CommunityBulletinBoard" />
<jsp:setProperty property="*" name="communityBulletinBoard"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<h6 class=subTitle> 교육센터 통합 운영관리 시스템 - 모임방 - 모임방 게시판 등록</h6>

<h3 class=mainTitle> 모임방 게시판 등록</h3>

<form method ="post" action ="communityBulletinBoardCreate.jsp">
	<fieldset>
		<legend>
			모임방 게시판 등록
		</legend>
		
		<table border="1" cellspacing=0 align="center" width = "700">
			<tr align = "center">
				<td colspan = "2">게시판 명</td>
				<td colspan = "2" bgcolor=F2F2F2> <input type = "text" name = "communityBulletinBoardName" style="width:300px"> </td>
			</tr>
			<tr align = "center">
				<td rowspan = "2" height = "100"> 모임방 게시판 유형 </td>
				<td height = "50" bgcolor=CDCDCD> 직접 입력 </td>
				<td bgcolor=F2F2F2> <input type = "text" name = "communityKindOfbulletinBoard" style="width:200px"> </td>
			</tr>
			<tr align = "center">
				<td height = "50" bgcolor=CDCDCD> 선택 입력 </td>
				<td bgcolor=F2F2F2>
					<SELECT id="communityKindOfbulletinBoard1">
						<OPTION selected> N (공지사항) </OPTION>
						<OPTION> F (자유게시판) </OPTION>
						<OPTION> D (자료실) </OPTION>
						<OPTION> Q (질문과 답변) </OPTION>
					</SELECT>
				</td>
			</tr>
			<tr align = "center">
				<td colspan = "2"> 작성자  </td>
				<td colspan = "2" bgcolor=F2F2F2> <input type = "text" name = "creator">  </td>
			</tr>
		</table>
		
		<div align = "center">
		<form action="communityBulletinBoardCreate.jsp">
			<input type="submit" class="myButton" id=addBtn value="등록">
		</form>
		
		<form action="communityBulletinBoardReadView.jsp">
			<input type="submit" class="myButton" id="cancleBtn" value="취소">
		</form>
		</div>
	</fieldset>
</form>
</body>
</html>