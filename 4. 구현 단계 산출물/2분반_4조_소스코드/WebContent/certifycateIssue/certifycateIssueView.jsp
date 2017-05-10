<%@page import="project.member.NormalMemberData"%>
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
<jsp:useBean id="arData"
	class="project.attandanceRecord.AttandanceRecordData" />
<jsp:useBean id="arControl"
	class="project.attandanceRecord.AttandanceRecordControl" />
<jsp:useBean id="ciData"
	class="project.certifycateIssue.CertifycateIssueData" />
<jsp:useBean id="ciControl"
	class="project.certifycateIssue.CertifycateIssueControl" />
<%@ page import="java.util.*"%>
<%@ page import="project.attandanceRecord.AttandanceRecordControl"%>
<%@ page import="project.attandanceRecord.AttandanceRecordData"%>
<%@ page import="project.establishProcess.EstablishProcessData"%>
<%@ page import="project.certifycateIssue.CertifycateIssueData"%>
<%@ page import="project.certifycateIssue.CertifycateIssueControl"%>
<%@ page import="project.lecture.LectureData"%>
<%@ page import="project.member.MemberData"%>
<%@ page import="project.member.MemberControl"%>
<%@ page import="project.establishProcess.EstablishProcessData"%>
<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="establishProcessControl"
	class="project.establishProcess.EstablishProcessControl" />
<jsp:useBean id="establishProcessData"
	class="project.establishProcess.EstablishProcessData" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script   src="https://code.jquery.com/jquery-3.1.1.js"   integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="   crossorigin="anonymous"></script> 
<script>
function print(printArea)
{
	$.get( "/sogong/certifycateIssue/issue.jsp" )

	  .done(function( data ) {
		console.log(data);
		win = window.open(); 
		self.focus(); 
		win.document.open();
		win.document.write('<html><head><title></title><style>');
		win.document.write('body, td {font-falmily: Verdana; font-size: 10pt;}');
		win.document.write('</style></haed><body>');
		win.document.write(printArea);
 		win.document.write('</body></html>');
		win.document.close();
		win.print();
		win.close();
		window.location.replace("/sogong/certifycateIssue/certifycateIssueListView.jsp");
	  });

}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->
<title>개설과정등록</title>

<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />



</head>


<body>
	<!-- 여기서부터 jsp화면 출력하는 부분 건들지 말것  header에서 부터 드래그해서 복사할것-->
	<header> <%
		
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
				<td colspan=3><%= nor.name %> <% out.println( "( " + nor.ID + " ) 환영합니다.") ;%></td>

			</tr>
			<form action="../member/logout.jsp">
				<tr align=center>
					<td colspan=1><input class="myButton" type="submit"
						value="로그아웃"></td>
			</form>
			<form action="../member/NormalMemberReadView.jsp">
				<td colspan=1><input class="myButton" type="submit"
					value="마이페이지"></td>
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
				<td colspan=3><%= em.name %> <% out.println( "( " + em.ID + " ) 환영합니다.") ;%></td>

			</tr>
			<form action="../member/logout.jsp">
				<tr align=center>
					<td colspan=1><input class="myButton" type="submit"
						value="로그아웃"></td>
			</form>
			<form action="../member/EmployeeMemberReadView.jsp">
				<td colspan=1><input class="myButton" type="submit"
					value="마이페이지"></td>
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
   %> <nav> <%  
	
		if ( isLogin == 0 || isLogin == 1) {
			int type = 1;
			if(isLogin == 0){
				type = memberControl.getMemberType(nor.memberID);		
			}
			else if(isLogin == 1){
				type = memberControl.getMemberType(em.memberID);
			}
			if(type == 1){
	%> <%@ include file="../navStyle/navStyle.jsp"%>

	<%}
			else if(type == 0){
	%> <%@ include file="../navStyle/navStyle2.jsp"%>
	<%		} 
		}
	else {%> <%@ include file="../navStyle/navStyle3.jsp"%>

	<%} %> </nav> </header>


	<h6 class=subTitle>교육센터 통합 운영관리 시스템 - 수료증 - 수료증 발급</h6>

	<h3 class=mainTitle>수료증 발급</h3>
	<%
      String processCode = request.getParameter("processCode");
      String memberId = request.getParameter("memberId");
      
      CertifycateIssueControl cic = new CertifycateIssueControl();
      MemberControl mc = new MemberControl();
      int num = cic.checkNum(memberId, processCode);
      String name = mc.selectMemberData(memberId).name;
      EstablishProcessData epd = cic.selectProcess(processCode);
      String center = epd.centerName;
      String pName = epd.processName;
      Calendar cal = Calendar.getInstance();
      int year = cal.get(Calendar.YEAR);
      int month = cal.get(Calendar.MONTH) + 1;
      int date = cal.get(Calendar.DATE);
      
      String d = year + "/" + month + "/" + date;
      
      session.setAttribute("member8", memberId);
      session.setAttribute("process8", processCode);
      session.setAttribute("num8", num);
      session.setAttribute("date8", d);
%>
	<div id="printArea">
		<table
			style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid;"
			width="555" align="center">
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<td align="left"><%=num %>호</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">수료증</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="right">강의명 : <%=pName  %>
				</td>
			</tr>

			<tr>
				<td align="right">성명 : <%=name  %>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">위 수강생은 <%=pName %> 과목을 우수하게 수료하였음을 인증함.
				</td>
			</tr>

			<tr>
				<td align="center">위에 대하여 이 증서를 수여함.</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td align="center"><%=center %> 교육센터</td>
			</tr>

			<tr>
				<td align="center"><%=year %>년 <%=month %>월 <%=date %>일</td>
			</tr>

			<tr>
				<td colspan=5 align="center">&nbsp;</td>
			</tr>

		</table>


	</div>
<center>
	<input type="button" class=myButton value="발급" OnClick="print(document.getElementById('printArea').innerHTML)" /> 
</center>








</body>
</html>