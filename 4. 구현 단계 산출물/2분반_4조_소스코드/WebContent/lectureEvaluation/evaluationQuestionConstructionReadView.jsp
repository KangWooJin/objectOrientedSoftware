<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="project.lectureEvaluation.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*"%>
<jsp:useBean id="eqc"
	class="project.lectureEvaluation.EvaluationQuestionConstruction" />
<jsp:useBean id="eqcControl"
	class="project.lectureEvaluation.EvaluationQuestionConstructionControl" />

<jsp:setProperty name="eqc" property="*" />
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />

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


	<h6>교육센터 통합 운영관리 시스템 - 강의 평가 관리 - 평가 질문 구성 조회</h6>

	<h3>평가 질문 구성 조회</h3>

	<div>
		<div>
			<form name=eqcReadForm>
				<table width="1250" cellpadding="15" cellspacing="15"
					id=eqcReadTable align=center>
					<tr height="70">
						<td colspan="15"><hr width=450></td>
						<td colspan="5" align=center><h4><b>※ 강의 평가지 ※</b></h4></td>
						<td align=center><hr width=165></td>
						<td align=center><hr width=165></td>
					</tr>
					<tr height="70">
						<td colspan="22">&nbsp;</td>
					</tr>
					<tr height="70">
						<th align=center colspan="15">질문</th>
						<th colspan="5" align=center>답안 선택</th>
						<th align=center>유효 시작 일자</th>
						<th align=center>유효 종료 일자</th>
					</tr>
					<%
					session.setAttribute("evaluationQuestionNumber", null);
					session.setAttribute("fixedChoiceQuestionnaireID", null);
						ArrayList<project.lectureEvaluation.EvaluationQuestionConstruction> arr = eqcControl.select();

						for (int i = 0; i < arr.size(); ++i) {
							int qNum = arr.get(i).evaluationQuestionNumber;
							int cNum = arr.get(i).fixedChoiceQuestionnaireID;
							String grade;
							String fc = eqcControl.getFixedChoiceContent(cNum);
							String[] content = fc.split("/");
							if (eqcControl.getFixedChoiceDivision(cNum) == null) {
								grade = "n";
							} else {
								grade = eqcControl.getFixedChoiceDivision(cNum);
							}

							grade = grade.substring(0, 1);
							String division = eqcControl.getDivision(qNum);

							if (grade.equals("2") && division.equals("강의")) {
					%>

					<tr height="70">
						<td colspan="15"><%=eqcControl.getQuestionContent(qNum)%></td>
						<td>&nbsp;</td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[0]%></center>
							<input type="radio" name="result<%=i%>" value="Y"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[1]%></center>
							<input type="radio" name="result<%=i%>" value="N"></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td align=center><%=arr.get(i).effectiveStartDate%></td>
						<td align=center><%=arr.get(i).effectiveFinishDate%></td>

					</tr>
					<%
						}
						}
						for (int i = 0; i < arr.size(); ++i) {
							int qNum = arr.get(i).evaluationQuestionNumber;
							int cNum = arr.get(i).fixedChoiceQuestionnaireID;
							String grade;
							String fc = eqcControl.getFixedChoiceContent(cNum);
							String[] content = fc.split("/");
							if (eqcControl.getFixedChoiceDivision(cNum) == null) {
								grade = "n";
							} else {
								grade = eqcControl.getFixedChoiceDivision(cNum);
							}

							grade = grade.substring(0, 1);
							String division = eqcControl.getDivision(qNum);

							if (grade.equals("3") && division.equals("강의")) {
					%>
					<tr height="70">
						<td colspan="15"><%=eqcControl.getQuestionContent(qNum)%></td>
						<td>&nbsp;</td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[0]%></center>
							<input type="radio" name="result<%=i%>" value="g"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[1]%></center>
							<input type="radio" name="result<%=i%>" value="n"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[2]%></center>
							<input type="radio" name="result<%=i%>" value="b"></td>
						<td>&nbsp;</td>
						<td align=center><%=arr.get(i).effectiveStartDate%></td>
						<td align=center><%=arr.get(i).effectiveFinishDate%></td>

					</tr>
					<%
						}
						}
						for (int i = 0; i < arr.size(); ++i) {
							int qNum = arr.get(i).evaluationQuestionNumber;
							int cNum = arr.get(i).fixedChoiceQuestionnaireID;
							String grade;
							String fc = eqcControl.getFixedChoiceContent(cNum);
							String[] content = fc.split("/");
							if (eqcControl.getFixedChoiceDivision(cNum) == null) {
								grade = "n";
							} else {
								grade = eqcControl.getFixedChoiceDivision(cNum);
							}

							grade = grade.substring(0, 1);
							String division = eqcControl.getDivision(qNum);

							if (grade.equals("5") && division.equals("강의")) {
					%>

					<tr height="70">
						<td colspan="15"><%=eqcControl.getQuestionContent(qNum)%></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[0]%></center>
							<input type="radio" name="result<%=i%>" value="vg"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[1]%></center>
							<input type="radio" name="result<%=i%>" value="g"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[2]%></center>
							<input type="radio" name="result<%=i%>" value="n"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[3]%></center>
							<input type="radio" name="result<%=i%>" value="b"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[4]%></center>
							<input type="radio" name="result<%=i%>" value="vb"></td>
						<td align=center><%=arr.get(i).effectiveStartDate%></td>
						<td align=center><%=arr.get(i).effectiveFinishDate%></td>

					</tr>
					<%
						}
						}
					%>
					<%
						for (int i = 0; i < arr.size(); ++i) {
							int qNum = arr.get(i).evaluationQuestionNumber;
							int cNum = arr.get(i).fixedChoiceQuestionnaireID;
							String grade;
							if (eqcControl.getFixedChoiceDivision(cNum) == null) {
								grade = "n";
							} else {
								grade = eqcControl.getFixedChoiceDivision(cNum);
							}

							grade = grade.substring(0, 1);
							String division = eqcControl.getDivision(qNum);

							if (grade.equals("n") && division.equals("강의")) {
					%>
					<tr height="70">
						<td colspan="15"><%=eqcControl.getQuestionContent(qNum)%></td>
						<td colspan="5"><center>주관식 답안</center> <textarea
								name=essayResult cols=78 rows=3 placeholder="200자 이내"></textarea></td>
						<td align=center><%=arr.get(i).effectiveStartDate%></td>
						<td align=center><%=arr.get(i).effectiveFinishDate%></td>
					</tr>
					<%
						}

						}
					%>
				</table>
				<hr width=100%>
				<table width="1150" cellpadding="15" cellspacing="15"
					id=eqcReadTable align=center>
					<tr height="70">
						<td colspan="15"><hr width=450></td>
						<td colspan="5" align=center><h4><b>※ 강사 평가지 ※</b></h4></td>
						<td align=center><hr width=165></td>
						<td align=center><hr width=165></td>
					</tr>
					<tr height="70">
						<td colspan="22">&nbsp;</td>
					</tr>
					<tr height="70">
						<th colspan="15">질문</th>
						<th colspan="5">답안 선택</th>
						<th>유효 시작 일자</th>
						<th>유효 종료 일자</th>
					</tr>

					<%
						for (int i = 0; i < arr.size(); ++i) {
							int qNum = arr.get(i).evaluationQuestionNumber;
							int cNum = arr.get(i).fixedChoiceQuestionnaireID;
							String grade;
							String fc = eqcControl.getFixedChoiceContent(cNum);
							String[] content = fc.split("/");
							if (eqcControl.getFixedChoiceDivision(cNum) == null) {
								grade = "n";
							} else {
								grade = eqcControl.getFixedChoiceDivision(cNum);
							}

							grade = grade.substring(0, 1);
							String division = eqcControl.getDivision(qNum);

							if (grade.equals("2") && division.equals("강사")) {
					%>

					<tr height="70">
						<td colspan="15"><%=eqcControl.getQuestionContent(qNum)%></td>
						<td>&nbsp;</td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[0]%><input
									type="radio" name="result<%=i%>" value="Y"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[1]%><input
									type="radio" name="result<%=i%>" value="N"></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td align=center><%=arr.get(i).effectiveStartDate%></td>
						<td align=center><%=arr.get(i).effectiveFinishDate%></td>

					</tr>
					<%
						}
						}

						for (int i = 0; i < arr.size(); ++i) {
							int qNum = arr.get(i).evaluationQuestionNumber;
							int cNum = arr.get(i).fixedChoiceQuestionnaireID;
							String grade;
							String fc = eqcControl.getFixedChoiceContent(cNum);
							String[] content = fc.split("/");
							if (eqcControl.getFixedChoiceDivision(cNum) == null) {
								grade = "n";
							} else {
								grade = eqcControl.getFixedChoiceDivision(cNum);
							}

							grade = grade.substring(0, 1);
							String division = eqcControl.getDivision(qNum);

							if (grade.equals("3") && division.equals("강사")) {
					%>
					<tr height="70">
						<td colspan="15"><%=eqcControl.getQuestionContent(qNum)%></td>
						<td>&nbsp;</td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[0]%><input
									type="radio" name="result<%=i%>" value="g"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[1]%><input
									type="radio" name="result<%=i%>" value="n"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[2]%><input
									type="radio" name="result<%=i%>" value="b"></td>
						<td>&nbsp;</td>
						<td align=center><%=arr.get(i).effectiveStartDate%></td>
						<td align=center><%=arr.get(i).effectiveFinishDate%></td>

					</tr>
					<%
						}
						}

						for (int i = 0; i < arr.size(); ++i) {
							int qNum = arr.get(i).evaluationQuestionNumber;
							int cNum = arr.get(i).fixedChoiceQuestionnaireID;
							String grade;
							String fc = eqcControl.getFixedChoiceContent(cNum);
							String[] content = fc.split("/");
							if (eqcControl.getFixedChoiceDivision(cNum) == null) {
								grade = "n";
							} else {
								grade = eqcControl.getFixedChoiceDivision(cNum);
							}

							grade = grade.substring(0, 1);
							String division = eqcControl.getDivision(qNum);

							if (grade.equals("5") && division.equals("강사")) {
					%>

					<tr height="70">
						<td colspan="15"><%=eqcControl.getQuestionContent(qNum)%></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[0]%><input
									type="radio" name="result<%=i%>" value="vg"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[1]%><input
									type="radio" name="result<%=i%>" value="g"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[2]%><input
									type="radio" name="result<%=i%>" value="n"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[3]%><input
									type="radio" name="result<%=i%>" value="b"></td>
						<td><center><%=eqcControl.getFixedChoiceContent(cNum).split("/")[4]%><input
									type="radio" name="result<%=i%>" value="vb"></td>
						<td align=center><%=arr.get(i).effectiveStartDate%></td>
						<td align=center><%=arr.get(i).effectiveFinishDate%></td>

					</tr>
					<%
						}
						}
						for (int i = 0; i < arr.size(); ++i) {
							int qNum = arr.get(i).evaluationQuestionNumber;
							int cNum = arr.get(i).fixedChoiceQuestionnaireID;
							String grade;
							String fc = eqcControl.getFixedChoiceContent(cNum);
							String[] content = fc.split("/");
							if (eqcControl.getFixedChoiceDivision(cNum) == null) {
								grade = "n";
							} else {
								grade = eqcControl.getFixedChoiceDivision(cNum);
							}

							grade = grade.substring(0, 1);
							String division = eqcControl.getDivision(qNum);

							if (grade.equals("n") && division.equals("강사")) {
					%>
					<tr height="70">
						<td colspan="15"><%=eqcControl.getQuestionContent(qNum)%></td>
						<td colspan="5"><center>주관식 답안</center>
							<textarea name=essayResult cols=78 rows=3
								placeholder="200자 이내"></textarea></td>
						<td align=center><%=arr.get(i).effectiveStartDate%></td>
						<td align=center><%=arr.get(i).effectiveFinishDate%></td>
					</tr>
					<%
						}

						}
					%>
				</table>

			</form>
		</div>
	</div>
</body>
</html>