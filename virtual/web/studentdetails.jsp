<%-- 
    Document   : studentdetails
    Created on : Apr 10, 2017, 5:07:28 PM
    Author     : chandan
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>Student Details</title>
<link rel="stylesheet" type="text/css" href="css1.css">
</head>
<body background="image/asss.jpg">
<marquee><i>Virtual Classroom</i></marquee>
<br><a href="index.html" align="right" style="text-decoration:none; "><b><h3>LOGOUT</h3></b></a>
<table  width='100%' border='0' cellpadding='0' cellspacing='4' bgcolor='#f2ffff'>
        <tr>
            <td align='center' style='word-spacing:180px;font-size:150%;padding-right:30px;color:#888888;white-space:nowrap;'> 
                    <a href='admin.jsp'style="text-decoration:none"> Modify </a>
                    <a href='studentdetails.jsp'style="text-decoration:none"> Student-Details </a>
                    <a href='teacherdetails.jsp'style="text-decoration:none"> Faculty-Details </a> 
                   
            </td>
        </tr>
    </table>
    <h2><center><u>Student Details</u></center></h2><br>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/login"
     user="root"  password="chandan"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from student;
</sql:query>
 
<table border="1" width="90%" align="center" bgcolor="#ecf0f1">
<tr color="#d3d3d3">
   <th>Student ID</th>
   <th>Password</th>
   <th>Name</th>
   <th>Course</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
    <td><center><c:out value="${row.username}"/></center></td>
    <td><center><c:out value="${row.password}"/></center></td>
    <td><center><c:out value="${row.name}"/></center></td> 
    <td><center><c:out value="${row.course}"/></center></td>
</tr>
</c:forEach>
</table>
 
</body>
</html>
