<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="project.lectureEvaluation.LectureEvaluationQuestion"%>
<%@ page
	import="project.lectureEvaluation.LectureEvaluationQuestionControl"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*"%>
<jsp:useBean id="leq"
	class="project.lectureEvaluation.LectureEvaluationQuestion" />
<jsp:useBean id="leqControl"
	class="project.lectureEvaluation.LectureEvaluationQuestionControl" />
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="leq" property="*" />
<jsp:setProperty name="nor" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 평가 결과 조회</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="../js/function.js"></SCRIPT>

<script type="text/javascript">
	function deleteBtn() {
		location.href = "lectureEvaluationQuestionDeleteView.jsp";
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



	<h6>교육센터 통합 운영관리 시스템 - 강의 평가 질문 관리 - 강의 평가 질문 조회</h6>

	<h3>강의 평가 질문 조회</h3>

	<div>
		<div>
			<form id=LectureEvaluationQuestionReadForm>
				<fieldset>

					<table width="900" cellpadding=10
						id=LectureEvaluationQuestionReadTable>

						<tr>
							<td>번호</td>
							<td>질문 대상</td>
							<td>질문 항목</td>
							<td>유효기간 시작일자</td>
							<td>유효기간 종료일자</td>
						</tr>
						<%
							ArrayList<project.lectureEvaluation.LectureEvaluationQuestion> arr = leqControl.select();

							for (int i = 0; i < arr.size(); ++i) {
						%>
						<tr>
							<td><%=arr.get(i).evaluationQuestionNumber%></td>
							<td><%=arr.get(i).evaluationQuestionContent%></td>
							<td><%=arr.get(i).evaluandDivision%></td>
							<td><%=arr.get(i).effectiveStartDate%></td>
							<td><%=arr.get(i).effectiveFinishDate%></td>

						</tr>
						<%
							}
						%>


					</table>
				</fieldset>
				<div align=right>
					<input class="myButton" type="submit" id=leqDeleteBtn value="삭제">
				</div>
			</form>
		</div>
	</div>
</body>
</html>