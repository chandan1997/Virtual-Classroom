<%-- 
    Document   : upload
    Created on : Apr 8, 2017, 11:56:09 PM
    Author     : chandan
--%>
<html>
    <head>
        <title>
            UploadFile
        </title>
    </head>
    <body background="image/asss.jpg">
        <marquee><i>Virtual Classroom</i></marquee>
<br><a href="index.html" align="right" style="text-decoration:none; "><b><h3>LOGOUT</h3></b></a>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<%
      //String subject = request.getParameter("sub");
      //String subject = "sub1";
      String saveFile = "";
      String contentType = request.getContentType();
      if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1, contentType.length());
            int pos;
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
            //String fipath = saveFile;
            saveFile = "C:/upload/sub4/" + saveFile;
            
            File ff = new File(saveFile);
            FileOutputStream fileOut = new FileOutputStream(ff);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
            fileOut.close();
    
%><Br>
<table border="2">
      <tr>
            <td><b>You have successfully upload the file by the name of:  </b>
            <%
                  out.println(saveFile);
                  }
            %>
            </td>
      </tr>
</table>
</body></html>