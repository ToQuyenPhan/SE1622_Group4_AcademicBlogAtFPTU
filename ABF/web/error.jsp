<%-- 
    Document   : error
    Created on : May 31, 2022, 11:04:34 PM
    Author     : To Quyen Phan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error page</title>
        
    </head>
    <body>
        <%
            String error = (String) request.getAttribute("ERROR");
            if(error == null){
                error = "";
            }
        %>
        <h1><%= error %></h1>
    </body>
</html>
