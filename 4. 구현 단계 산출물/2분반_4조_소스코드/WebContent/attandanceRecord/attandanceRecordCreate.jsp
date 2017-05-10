<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <%@ page import="java.util.*"%>
   <%@ page import="project.attandanceRecord.AttandanceRecordControl"%>
   <%@ page import="project.attandanceRecord.AttandanceRecordData"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   System.out.println("111111");
   String id = "";
   String processCode = (String)session.getAttribute("processCode");
   String totalDate2 = (String)session.getAttribute("totalDate");
   String totalPerson2 = (String)session.getAttribute("totalPerson");

   int totalDate = Integer.parseInt(totalDate2);
   int totalPerson = Integer.parseInt(totalPerson2);
   String state = "";
   String record = "";

   AttandanceRecordControl arc = new AttandanceRecordControl();
   
   int check = arc.checkInsert(processCode);
   if(check == 1)
   {
	   %>
	    <script>
	      
	  	alert("등록된 출결대장입니다.");
   		location.href="attandanceRecordProcessView.jsp";
		</script>
<%
   }
   try{
   for(int i = 0; i < totalPerson; i++)
   {
	   id = request.getParameter("id" + i);

	   for(int j = 0; j < totalDate; j++)
	   {
		   state = request.getParameter(i + "/" + j);
		   System.out.println( "ddaa : "+ i + "/" + j);
		   record = record + state + "/";
   
	   }

	   System.out.println( "상태 : "+ state);
	   AttandanceRecordData ard = new AttandanceRecordData();
	   ard.memberID = id;
	   System.out.println( "id : "+ id);
	   ard.processCode = processCode;
	   ard.record = record;
	   arc.insertAR(ard);
	   
	   record = "";
   }
   %>
      <script>
   
   	  alert("출결 대장 등록 성공!");
      location.href="attandanceRecordProcessView.jsp";
   </script>
   <% 

   }
   catch(Exception e)
   {
	
   }
   
   
   %>
   

</body>
</html>