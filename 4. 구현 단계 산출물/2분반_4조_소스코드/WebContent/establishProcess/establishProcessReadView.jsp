<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
%>
<%@ page import="project.establishProcess.EstablishProcessControl" %>
<%@ page import="project.establishProcess.EstablishProcessData"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="nor" property="*" />

<html>
<head>
<title>개설과정조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<script>
function enrollBtn(){
	location.href="establishProcessCreateView.jsp";
}

function cancelBtn(){
	history.go(-1);
}

</script>

</head>
<%

	
	EstablishProcessControl osc = new EstablishProcessControl();
	
	ArrayList<EstablishProcessData> epd = new ArrayList<EstablishProcessData>();
	epd = osc.readEstablishProcess();
	int size = epd.size();
%>

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

<% 
	String num = request.getParameter("currentNum");
	if(num == null){
		num = "1";
	}
	int cNum = Integer.parseInt(num);
	%>


	<h6>교육센터통합운영관리 - 과목관리 - 개설과정관리 - 개설과정조회</h6>

	<fieldset>
	<legend>개설 과정 열람</legend>
	</fieldset>
	
		<form>
			<table align="center" border="0" cellpadding=15 cellspacing=15 id="table1">
				<tr height="30">
					<td width="200" align="center">과정코드</td>
					<td width="200" align="center"><%=epd.get(cNum).processCode %></td>
					<td width="200" align="center">과정 명</td>
					<td width="200" align="center"><%=epd.get(cNum).processName %></td>
					<td width="200" align="center"><input class="myButton" type="button" value="등록" onclick="enrollBtn()"></td>
				</tr>
				<tr height="30">
					<td width="200" align="center">강사ID</td>
					<td width="200" align="center"><%=epd.get(cNum).lecturerID %></td>
					<td width="200" align="center">강의실</td>
					<td width="200" align="center"><%=epd.get(cNum).classRoom %></td>
					<td width="200" align="center"><input class="myButton" type="submit" value="취소" onclick="cancelBtn()"></td>
				</tr>
				<tr height="30">
					<td width="200" align="center">과목코드</td>
					<td width="200" align="center"><%=epd.get(cNum).subjectCode %></td>
					<td width="200" align="center">센터명</td>
					<td width="200" align="center"><%=epd.get(cNum).centerName %></td>
				</tr>
				<tr height="30">
					<td width="200" align="center">훈련일정</td>
					<td width="200" align="center"><%=epd.get(cNum).trainingPeriodStart %></td>
					<td width="200" align="center">~</td>
					<td width="200" align="center"><%=epd.get(cNum).trainingPeriodEnd %></td>
				</tr>
				<tr height="30">
					<td width="200" align="center">수료기준</td>
					<td width="200" align="center"><%=epd.get(cNum).completeStandard %></td>
					<td width="200" align="center">수강료</td>
					<td width="200" align="center"><%=epd.get(cNum).tuition %></td>
				</tr>
				<tr height="30">
					<td width="200" align="center">수강신청</td>
					<td width="200" align="center">
					<%
					if(epd.get(cNum).isApply == true){%>
					<%out.print("수강신청가능"); %>
					<%}
					else{%>
					<%out.print("수강신청불가능");%>
					<%} %>
					
					
					</td>
					
				</tr>
				<tr height="30">
					<td width="200" align="center">접수마감</td>
					<td width="200" align="center">
					<%
					if(epd.get(cNum).isAccepted == true){%>
					<%out.print("접수 중"); %>
					<%}
					else{%>
					<%out.print("마감");%>
					<%} %>
					
					</td>
				</tr>
				<tr height="30">
					<td width="200" align="center">환급종류</td>
					<td width="200" align="center"><%=epd.get(cNum).refundSort %></td>
				</tr>
				
				<tr height="30">
					<td width="200" align="center"colspan="4">세부강의내용</td>
				</tr>
				<%String[] strList = epd.get(cNum).detailLectureInfo.split("/"); 
				int len = strList.length;%>
				
					<%
					for(int i = 0; i < len; i++){%> 
					<tr><td width="200" align="center" colspan='4'><%=strList[i]%></td></tr>
					<%}%>	
				
		
				<tr height="30">
					<td width="200" align="center" colspan="4">
					<%for(int i = 0; i < size; i++){ %>
					<a method="get" href="establishProcessReadView.jsp?currentNum=<%=i%>"><%=i+1%></a>
					<%} %>
				</td>
				</tr>
				</table>	
			
		</form>
</body>
</html>