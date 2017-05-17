<%-- 
    Document   : login
    Created on : Apr 8, 2017, 9:48:57 PM
    Author     : chandan
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>virtual classroom login</title>
</head>
<body  background="image/asss.jpg">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String userid=request.getParameter("usr"); 

String pwd=request.getParameter("pwd"); 

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","chandan"); 
Statement st= con.createStatement(); 
if (request.getParameter("user").equals("admin")){
    if(userid.equals("chandan"))
    {
        if(pwd.equals("chandan123"))
        {
            out.println("<br><h2><marquee behavior='alternate' direction='right'>### Welcome Admin ###</marquee></h2>"); 
            out.println("<a href='index.html' align='right' style='text-decoration:none; '><b><h3>LOGOUT</h3></b></a>");
            out.print("<table align='center' border='0'><tr><td><img src='image/a1.jpg' width='240px' height='200px'></td>");
            out.print("<td><center><h2>Insert Or Delete Users<br> <a href='admin.jsp'>Modify</a></h2></center></td></tr>");
            out.print("<tr><td><center><h2>Details Of Student Login<br> <a href='studentdetails.jsp'>Student Details</a></h2></center></td>");
            out.print("<td><image src='image/a2.jpg' width='240px' height='200px'></td></tr>");
            out.print("<tr><td><image src='image/a3.jpg' width='240px' height='200px'></td>");
            out.print("<td><center><h2>Details Of Teacher Login<br> <a href='teacherdetails.jsp'>Teacher Details</a></h2></center></td></tr></table>");
 
        }
        else 
        { 
            out.println("<marquee behavior='alternate' direction='right'><h3>Invalid Password Try Again</h3></marquee>"); 
            out.println("<a href='index.html' align='center' style='text-decoration:none; '><b><h2> GO BACK </h2></b></a>");
        }
    }
    else 
    { 
        out.println("<marquee behavior='alternate' direction='right'><h3>Invalid Password Try Again</h3></marquee>"); 
         out.println("<a href='index.html' align='center' style='text-decoration:none; '><b><h2> GO BACK </h2></b></a>");
    }
}
else if(request.getParameter("user").equals("student")){
ResultSet rs=st.executeQuery("select * from student where username='"+userid+"' and password='"+pwd+"'"); 
if(rs.next()) 
{ 
out.println("<h2><marquee>*** Welcome "+userid+" ***</marquee></h2>"); 
out.println("<a href='index.html' align='right' style='text-decoration:none; '><b><h3>LOGOUT</h3></b></a>");
out.println("<table  width='100%' border='0' cellpadding='0' cellspacing='4' bgcolor='#f2ffff'><tr><td><center><img src='image/back.jpg' width='100%'height='350px' ></center></td></tr><tr><td align='center' style='word-spacing:180px;font-size:150%;padding-right:30px;color:#888888;white-space:nowrap;'> <a href='viewFiles.jsp'style=text-decoration:none;> Subject-1 </a><a href='viewFiles2.jsp'style=text-decoration:none;> Subject-2 </a><a href='viewFiles3.jsp'style=text-decoration:none;> Subject-3 </a> <a href='viewFiles4.jsp'style=text-decoration:none;> Subject-4 </a> <a href='viewFiles5.jsp'style=text-decoration:none;> Subject-5 </a></td></tr></table>");
out.println("<h3><marquee behavior='alternate'>To Generate New Id-Password Please Contect To Administrator(Admin) </marquee></h3>");
out.println("<h4><marquee direction='right'><i>Virtual Classroom</i></marquee></h4>");
} 
else 
{ 
out.println("<marquee behavior='alternate' direction='right'><h3>Invalid Password Try Again</h3></marquee>"); 
            out.println("<a href='index.html' align='center' style='text-decoration:none; '><b><h2> GO BACK </h2></b></a>");
} }
else
{
    ResultSet rs=st.executeQuery("select * from teacher where username='"+userid+"' and password='"+pwd+"'"); 
if(rs.next()) 
{ 
    String subject = rs.getString("course");
out.println("<h2><marquee>*** Welcome "+userid+" ***</marquee></h2>"); 
out.println("<a href='index.html' align='right' style='text-decoration:none; '><b><h3>LOGOUT</h3></b></a>");
if(subject.equals("sub1"))
{
out.print("<table align='center' border='0'><tr><td><img src='image/123.jpg' width='400px' height='300px'></td><td><center>");
out.print("<h2> UPLOAD STUDY MATERIALS </h2> <a href='teacher.jsp' style=text-decoration:none;>UPLOAD</a></center></td></tr><tr><td><center>");
out.print("<h2>VIEW STUDY MATERIALS</h2><a href='viewFiles.jsp'style=text-decoration:none;> VIEW </a>");
out.print("</center></td><td><img src='image/1233.png' width='400px' height='300px'></td></tr></table>");
}
else if(subject.equals("sub2"))
{
out.print("<table align='center' border='0'><tr><td><img src='image/123.jpg' width='400px' height='300px'></td><td><center>");
out.print("<h2> UPLOAD STUDY MATERIALS </h2> <a href='teacher2.jsp' style=text-decoration:none;>UPLOAD</a></center></td></tr><tr><td><center>");
out.print("<h2>VIEW STUDY MATERIALS</h2><a href='viewFiles2.jsp'style=text-decoration:none;> VIEW </a>");
out.print("</center></td><td><img src='image/1233.png' width='400px' height='300px'></td></tr></table>");
}
else if(subject.equals("sub3"))
{
out.print("<table align='center' border='0'><tr><td><img src='image/123.jpg' width='400px' height='300px'></td><td><center>");
out.print("<h2> UPLOAD STUDY MATERIALS </h2> <a href='teacher3.jsp' style=text-decoration:none;>UPLOAD</a></center></td></tr><tr><td><center>");
out.print("<h2>VIEW STUDY MATERIALS</h2><a href='viewFiles3.jsp'style=text-decoration:none;> VIEW </a>");
out.print("</center></td><td><img src='image/1233.png' width='400px' height='300px'></td></tr></table>");
}
else if(subject.equals("sub4"))
{
out.print("<table align='center' border='0'><tr><td><img src='image/123.jpg' width='400px' height='300px'></td><td><center>");
out.print("<h2> UPLOAD STUDY MATERIALS </h2> <a href='teacher4.jsp' style=text-decoration:none;>UPLOAD</a></center></td></tr><tr><td><center>");
out.print("<h2>VIEW STUDY MATERIALS</h2><a href='viewFiles4.jsp'style=text-decoration:none;> VIEW </a>");
out.print("</center></td><td><img src='image/1233.png' width='400px' height='300px'></td></tr></table>");
}
else if(subject.equals("sub5"))
{
out.print("<table align='center' border='0'><tr><td><img src='image/123.jpg' width='400px' height='300px'></td><td><center>");
out.print("<h2> UPLOAD STUDY MATERIALS </h2> <a href='teacher5.jsp' style=text-decoration:none;>UPLOAD</a></center></td></tr><tr><td><center>");
out.print("<h2>VIEW STUDY MATERIALS</h2><a href='viewFiles5.jsp'style=text-decoration:none;> VIEW </a>");
out.print("</center></td><td><img src='image/1233.png' width='400px' height='300px'></td></tr></table>");
}
} 
else 
{ 
out.println("<marquee behavior='alternate' direction='right'><h3>Invalid Password Try Again</h3></marquee>"); 
out.println("<a href='index.html' align='center' style='text-decoration:none; '><b><h2> GO BACK </h2></b></a>");
}
}
%>