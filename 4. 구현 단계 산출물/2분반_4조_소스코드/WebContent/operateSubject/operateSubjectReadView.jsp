<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<OperateSubjectData> list = new ArrayList<OperateSubjectData>(); 
	int size;
%>
<%@ page import="project.operateSubject.OperateSubjectControl"%>
<%@ page import="project.operateSubject.OperateSubjectData"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="operateSubjectData" class="project.operateSubject.OperateSubjectData" />
<jsp:setProperty name="operateSubjectData" property="*" />

<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="nor" property="*" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운영과목조회</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<script >


function readBtn() {
	<%
	OperateSubjectControl osc = new OperateSubjectControl();
	list = osc.readOperateSubject(operateSubjectData);%>
	<%
	size = list.size();

	%>
}

function cancelBtn(){
	location.href = "../main/mainView.jsp";
}

function checkInputException3(){
	
	
	//var subjectProcess = document.getElementById('inputform').subjectProcess.value;
	//var target = document.getElementById('inputform').target.value;	
	var subjectCode = document.getElementById('inputform').subjectCode.value;
	//var subjectName = document.getElementById('inputform').subjectName.value;

	var str = "t";
	

	if( subjectCode.length > 10 ){
		alert("과목코드가 10자를 초과했습니다.");
		location.href = "../opreateSubject/operateSubjectReadView.jsp";
	}
	
	
	readBtn();	
}

function readAll(){
	
	
	
}



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
	<h6>교육센터통합운영관리 - 과목관리 - 운영과목관리 - 운영과목조회</h6>
	<h3>조회 조건</h3>
	<hr size="2" color="gray">
	<p>
	<div id="form">
		<form id="inputform" class="input_form" >
			<table align="center">
				<tr height="">
					<td align="right"></td>
					<td></td>
					<td align="right"></td>
					<td></td>
					<td><input class="myButton" type="submit" value="조회" onclick="checkInputException3()"></td>
				</tr>

				<tr>
					<td align="right">과목코드</td>
					<td><input type="text" name="subjectCode"></td>
					<td align="right"></td>
					<td></td>
					<td align="right"><input class="myButton" type="button" value="등록" onclick="enrollBtn()"></td>
				</tr>
			</table>
			<hr size="2" color="gray">
		</form>
	</div>
	<h3>운영과목편람</h3>
	</section>

	<div>
	
		
		<%  
			String num = request.getParameter("currentNum");
			
			if(num == null){
				num = "0";
			}
			int cNum = Integer.parseInt(num); 
		%>
		<%if(size != 0) {%>
		<form id=operateSubjectForm2 method="post" action="operateSubjectUpdateView.jsp">
			<fieldset>
				<legend>운영과목정보</legend>
				<table border="0" id=operateSubjectTable2 align="center">	
					<tr height="40">
						<td width="200" align="center">과목의특장점</td>
						<td width="200" align="center"><%=list.get(cNum).feature %></td>
						<td width="200" align="center">강의시간</td>
						<td width="200" align="center"><%=list.get(cNum).lectureHour%></td>
						<td width="200" align="center"><input type="submit" class="myButton" value="수정"></td>
					</tr>

					<tr height="40">
						<td width="200" align="center">목표</td>
						<td width="200" align="center"><%=list.get(cNum).purpose%></td>
						<td width="200" align="center">모집인원</td>
						<td width="200" align="center"><%=list.get(cNum).recruitNumber%></td>
						<td width="200" align="center"><input class="myButton" type="button" value="취소" onclick="cancelBtn()"></td>
					</tr>

					<tr height="40">
						<td width="200" align="center">과목코드</td>
						<td width="200" align="center"><%=list.get(cNum).subjectCode%></td>
						<td width="200" align="center">과목명</td>
						<td width="200" align="center"><%=list.get(cNum).subjectName%></td>
					</tr>
					<tr height="40">
						<td width="200" align="center">과정</td>
						<td width="200" align="center"><%=list.get(cNum).subjectProcess%></td>
						<td width="200" align="center"></td>
						<td width="200" align="center"></td>
					</tr>
					<tr height="40">
						<td width="200" align="center">수강대상</td>
						<td width="200" align="center"><%=list.get(cNum).target%></td>
						<td width="200" align="center">총강의일수</td>
						<td width="200" align="center"><%=list.get(cNum).totalDate%></td>
					</tr>
					<tr height="40">
						<td width="200" align="center">총강의시간</td>
						<td width="200" align="center"><%=list.get(cNum).totalHour%></td>
						<td width="200" align="center">수강료</td>
						<td width="200" align="center"><%=list.get(cNum).tuition%></td>
					</tr>
					<tr height="40">
						<td width="200" align="center">변경이력</td>
						<td width="200" align="center"><%=list.get(cNum).changeRecord%></td>
						<td width="200" align="center"></td>
					</tr>
					<tr height="40">
						<td width="200" align="center">세부내역</td>
					</tr>
					</table>
					<table align="center">
						<%if(list.get(cNum).lectureContent != null){ %>
						<%String[] strList = list.get(cNum).lectureContent.split("/"); 
						int len = strList.length;%>
						<%
						for(int i = 0; i < len; i++){%> 
						<tr height="30"><td  width="400" align="left"><%=strList[i]%></td></tr>
						<%}%>
						<%} %>	
					<tr height="30">
						<td width="200" align="center" colspan="4">
						<%for(int i = 0; i < size; i++){ %>
						<a method="get" href="operateSubjectReadView.jsp?currentNum=<%=i%>"><%=i+1%></a>
						<%} %>
					</td>
				</tr>
				</table>
				<table border="0">
					<tr>
					<td><input style="display:none" type="text" name="changeRecord" value="<%=list.get(cNum).changeRecord %>"></td>
					<td><input style="display:none" type="text" name="feature" value="<%=list.get(cNum).feature %>"></td>
					<td><input style="display:none" type="text" name="lectureContent" value="<%=list.get(cNum).lectureContent %>"></td>
					<td><input style="display:none" type="text" name="lectureHour" value="<%=list.get(cNum).lectureHour %>"></td>
					<td><input style="display:none" type="text" name="purpose" value="<%=list.get(cNum).purpose %>"></td>
					<td><input style="display:none" type="text" name="recruitNumber" value="<%=list.get(cNum).recruitNumber %>"></td>
					<td><input style="display:none" type="text" name="subjectCode" value="<%=list.get(cNum).subjectCode %>"></td>
					<td><input style="display:none" type="text" name="subjectName" value="<%=list.get(cNum).subjectName %>"></td>
					<td><input style="display:none" type="text" name="subjectProcess" value="<%=list.get(cNum).subjectProcess %>"></td>
					<td><input style="display:none" type="text" name="target" value="<%=list.get(cNum).target %>"></td>
					<td><input style="display:none" type="text" name="totalDate" value="<%=list.get(cNum).totalDate %>"></td>
					<td><input style="display:none" type="text" name="totalHour" value="<%=list.get(cNum).totalHour %>"></td>
					<td><input style="display:none" type="text" name="tuition" value="<%=list.get(cNum).tuition %>"></td>
					</tr>
				</table>
			</fieldset>

		</form>
	<%} %>
	
	</div>



</body>
</html>