<%@ page import="java.io.*"%>
<html><head>
          <link rel="stylesheet" type="text/css" href="css1.css">
    </head>
    <body  background="image/asss.jpg">
    <marquee><i>Virtual Classroom</i></marquee>
    <a href="index.html" align="right" style="text-decoration:none; "><b><h3>LOGOUT</h3></b></a>
    
    <table  width='100%' border='0' cellpadding='0' cellspacing='4' bgcolor='#f2ffff'>
        <tr>
            <td align='center' style='word-spacing:180px;font-size:150%;padding-right:30px;color:#888888;white-space:nowrap;'> 
                    <a href='viewFiles.jsp'style="text-decoration:none"> Subject-1 </a>
                    <a href='viewFiles2.jsp'style="text-decoration:none"> Subject-2 </a>
                    <a href='viewFiles3.jsp'style="text-decoration:none"> Subject-3 </a> 
                    <a href='viewFiles4.jsp'style="text-decoration:none"> Subject-4 </a> 
                    <a href='viewFiles5.jsp'style="text-decoration:none"> Subject-5 </a>
            </td>
        </tr>
    </table>
    <br>
    <h2><center><u><b>SUBJECT-1</u></b></center></h2>
    <br>
    <table align="center" border="1" width="90%">
        <tr><th>File Name</th><th>Download File</th></tr>
<%
File f = new File("C:/upload/sub1");
        File[] files = f.listFiles();
        for(int i=0;i<files.length;i++){
            String name=files[i].getName();
            String path=files[i].getPath();
%>
        <tr>
            <td><center><%=name%><center></td>
            <td><center><a href="download.jsp?f=<%=path%>">Download File</center></a></td>
        
        </tr>
     <%
        }
%>
</table>
</body>
</html>