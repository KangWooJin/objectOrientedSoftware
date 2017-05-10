<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <%@ page import="java.util.*"%>
   <%@ page import="project.attandanceRecord.AttandanceRecordControl"%>
   <%@ page import="project.attandanceRecord.AttandanceRecordData"%>
	<%@ page import="project.certifycateIssue.CertifycateIssueData"%>
	<%@ page import="project.certifycateIssue.CertifycateIssueControl"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   String memberId = (String)session.getAttribute("member8");
   String processCode = (String)session.getAttribute("process8");
   int issueNum = (Integer)session.getAttribute("num8");
   String date = (String)session.getAttribute("date8");

   System.out.println(memberId);
   System.out.println(processCode);
   System.out.println(issueNum);

   CertifycateIssueControl cic = new CertifycateIssueControl();
   CertifycateIssueData cid = new CertifycateIssueData();
   cid.issueNum = issueNum;
   cid.memberId = memberId;
   cid.processCode = processCode;
   cid.date = date;

   try{
	   int i = cic.insertCI(cid);

	   if(i == 1)
	   {
   %>
      <script>
   
   	  alert("출결 대장 등록 성공!");
      location.href="attandanceRecordProcessView.jsp";
   </script>
   <% }

   }
   catch(Exception e)
   {
	
   }
   
   
   %>
   

</body>
</html>