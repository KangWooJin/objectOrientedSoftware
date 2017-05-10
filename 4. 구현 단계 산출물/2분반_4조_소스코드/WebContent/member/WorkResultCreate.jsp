<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="project.member.EmployeeData"%>
<%@ page import="project.workresult.WorkResult"%>

<!-- 여기에 엔티티 클래스 및 컨트롤 클래스 추가할것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="em" property="*" />


<jsp:useBean id="workControl"
	class="project.workresult.WorkResultControl" />



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>

	<!-- 여기서부터 데이터 처리  -->

	<%
	ArrayList<EmployeeData> arr = (ArrayList<EmployeeData>) session.getAttribute("eArr");
	
	
	if ( arr == null)
		return ;
	
	String[] workResult = new String[15]; 
	int sum = 0 ;
	
	String workData = request.getParameter("workData");
	
	SimpleDateFormat t = new SimpleDateFormat("yyyyMMdd");
    Calendar c1 = Calendar.getInstance();
    String today = t.format(c1.getTime());
    
	for ( int i = 0 ; i <= 13; ++i )
	{
		String workName = "workResult" + (i+1) ;
		
		workResult[i] = request.getParameter(workName);
		
		
		sum += Integer.valueOf(workResult[i]);
	}
	WorkResult work = new WorkResult();
	int count = workControl.getCount(arr.get(0).memberID);
	
	
	work.resultNo = count+1;
	work.memberID = arr.get(0).memberID;
	work.resultDate = today;
	work.workData = workData;
	work.workResult = sum ;
	
	workControl.insertWorkResult(work);
	
	
	
	
%>

	<!-- 데이터 처리후 원래의 View로 돌려줄것 -->
	<script type="text/javascript">
	alert("등록완료");
	location.href="WorkResultCreateView.jsp";
</script>

</body>
</html>