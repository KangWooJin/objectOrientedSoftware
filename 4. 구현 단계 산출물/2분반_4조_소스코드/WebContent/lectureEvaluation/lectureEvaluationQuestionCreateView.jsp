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
<jsp:useBean id="leqc"
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
	function regist() {
		//LectureEvaluationQuestionControl leqc = LectureEvaluationQuestionControl.getInstance();
<%LectureEvaluationQuestionControl control = new LectureEvaluationQuestionControl();%>
	
<%control.insert(leq);%>
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
	<body>
		<h6>교육센터 통합 운영관리 시스템 - 강의 평가 관리 - 강의 평가 질문 등록</h6>
		<%
session.setAttribute("evaluationQuestionNumber", null);
session.setAttribute("fixedChoiceQuestionnaireID", null);
%>
		<h3>강의 평가 질문 등록</h3>
		<form name="form1" method="post"
			action="lectureEvaluationQuestionCreate.jsp" name=form2>
			<table width="1200px" cellpadding="15" align="center">
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan=4>&nbsp; ▶ 개설 과정 평가 문항</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr align=center>
					<th>질문 대상</th>
					<th>질문 내용</th>
					<th colspan=2>유효기간</th>
				</tr>
				<tr align=center>
					<td><select name=evaluandDivision>
							<option value="강의">강의</option>
							<option value="강사">강사</option>
					</select></td>
					<input type="hidden" name="evaluationQuestionNumber"
						value="<%=leqc.getCount()+1%>">
					<td><input type="text" name="evaluationQuestionContent"
						style="width: 700px"></td>
					<td><input type="text" name="effectiveStartDate"
						style="width: 100px"></td>
					<td><input type="text" name="effectiveFinishDate"
						style="width: 100px"></td>
				</tr>
				<tr>
					<td colspan=4>&nbsp;</td>
				</tr>
				<tr align=center>
					<td colspan=4><input class="myButton" type="submit" value="등록"
						onclick="regist()">&nbsp;<input class="myButton"
						type="reset" value=취소></td>
				</tr>
			</table>
		</form>

	</body>
</html>