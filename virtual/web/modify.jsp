<%-- 
    Document   : modify
    Created on : Apr 9, 2017, 10:15:46 PM
    Author     : chandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String userid=request.getParameter("usr"); 
//session.putValue("userid",userid); 
String pwd=request.getParameter("pwd"); 
String name=request.getParameter("name");
String course=request.getParameter("course");
//String use=request.getParameter("user");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","chandan"); 
Statement sta= con.createStatement(); 
if (request.getParameter("user").equals("teacher"))
{
    if (request.getParameter("mod").equals("insert"))
    {
        int rst=sta.executeUpdate("insert into teacher(username,password,name,course) values('"+userid+"','"+pwd+"','"+name+"','"+course+"')");
        if(rst==1)
        {
            out.println("Login information for teacher sucessfully added");
            out.println("<a href='admin.jsp' align='right' style='text-decoration:none; '><b><h3>BACK</h3></b></a>");
        }
        else
        {
            out.println("we can't insert");
            out.println("<a href='admin.jsp' align='right' style='text-decoration:none; '><b><h3>BACK</h3></b></a>");
        }
    }
    else
    {
        int rst=sta.executeUpdate("delete from teacher where username='"+userid+"'");
        if(rst==1)
        {
            out.println("Login information for teacher sucessfully deleted");
            out.println("<a href='admin.jsp' align='right' style='text-decoration:none; '><b><h3>BACK</h3></b></a>");
        }
        else
        {
            out.println("we can't delete");
            out.println("<a href='admin.jsp' align='right' style='text-decoration:none; '><b><h3>BACK</h3></b></a>");
        }
    }
}
else
{
    if (request.getParameter("mod").equals("insert"))
    {
        int rst=sta.executeUpdate("insert into student(username,password,name,course) values('"+userid+"','"+pwd+"','"+name+"','"+course+"')");
        if(rst==1)
        {
            out.println("Login information for student sucessfully added");
            out.println("<a href='admin.jsp' align='right' style='text-decoration:none; '><b><h3>BACK</h3></b></a>");
        }
        else
        {
            out.println("we can't insert");
            out.println("<a href='admin.jsp' align='right' style='text-decoration:none; '><b><h3>BACK</h3></b></a>");
        }
    }
    else
    {
        int rst=sta.executeUpdate("delete from student where username='"+userid+"'");
        if(rst==1)
        {
            out.println("Login information for student sucessfully deleted");
            out.println("<a href='admin.jsp' align='right' style='text-decoration:none; '><b><h3>BACK</h3></b></a>");
        }
        else
        {
            out.println("we can't delete");
            out.println("<a href='admin.jsp' align='right' style='text-decoration:none; '><b><h3>BACK</h3></b></a>");
        }
    }
}
        %>
    </body>
</html>
