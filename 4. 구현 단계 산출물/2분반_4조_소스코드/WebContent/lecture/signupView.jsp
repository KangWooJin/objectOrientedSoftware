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
<jsp:useBean id="lectureControl" class="project.lecture.LectureControl" />
<jsp:useBean id="lectureData" class="project.lecture.LectureData" />
<%@ page import="project.establishProcess.EstablishProcessControl" %>
<%@ page import="project.establishProcess.EstablishProcessData"%>
<%@ page import="java.util.ArrayList" %>

<%
EstablishProcessControl osc = new EstablishProcessControl();

ArrayList<EstablishProcessData> epd = new ArrayList<EstablishProcessData>();
epd = osc.readEstablishProcess();
int size = epd.size();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->
<title>수강신청</title>

<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="../js/lecture.js">

</SCRIPT>

<SCRIPT type="text/javascript">
function addLecture(code,name){
	
	var c = document.getElementById('processCode');
	var n = document.getElementById('processName');

	c.value = code;
	n.value = name;
}
	
</SCRIPT>
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
	<h6 class=subTitle>교육센터 통합 운영관리 시스템 - 수강관리 - 수강 신청</h6>

	<h3 class=mainTitle>수강 신청</h3>
	
	
	

		<fieldset>
		<legend>개설 과정 정보</legend>
		</fieldset>
		<table align="center" border="1" >
			<tr height="30">
				<td width="180" align="center">과정 코드</td>
				<td width="180" align="center">과정 명</td>
				<td width="180" align="center">추가</td>
			</tr>
			<%for(int i = 0; i < size; i++){
			%>
			<tr height="30">	
				<td width="180" align="center"><%=epd.get(i).processCode%></td>
				<td width="180" align="center"><%=epd.get(i).processName%></td>	
				<td width="180" align="center"><input type="button" class="myButton" value="추가" onclick="addLecture('<%=epd.get(i).processCode%>','<%=epd.get(i).processName%>')"></td>
			</tr>	
			<%}%>
		
			
		
		</table>
		
		
		
		<fieldset>
		<legend>수강 신청란</legend>
		</fieldset>
		<form name="inputform" class="input_form" action="signup.jsp" onSubmit="return checkInputException( this )">
			<table align="center" border="0">
				<tr>
					<td align="right">과정코드</td>
					<td><input type="text" id="processCode" name="processCode"></td>
					<td align="right">과목 명</td>
					<td><input type="text" id="processName" name="processName"></td>
					<td><input class="myButton" type="submit" value="신청"></td>
				</tr>

				<tr>
					<td align="right">사업주회사명</td>
					<td><input type="text" name="companyName"></td>
					<td align="right">근로자능력개발카드번호</td>
					<td><input type="text" name="personnelCardNumber"></td>
					<td align="right"><input class="myButton" type="button" value="취소" onclick="cancelBtn()"></td>
				</tr>
				<tr>
					<%String memID = null; %>
					<%if(isLogin == 0){ 
						memID = nor.memberID; 
					} else {
						memID = em.memberID;
					}%>
					<td><input style="display:none" type="text" name="memberID" value=<%=memID%>></td>
					<td><input style="display:none" type="text" name="processStep" value=1></td>
				</tr>
			</table>
			<hr size="2" color="gray">
		</form>
	
	
	</section>
</body>
</html>