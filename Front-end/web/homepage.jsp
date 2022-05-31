<%-- 
    Document   : homepage
    Created on : May 30, 2022, 7:18:09 PM
    Author     : To Quyen Phan
--%>

<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
    </head>
    <body>
        <%
            //Hiển thị Full Name của user
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if(loginUser == null){
                loginUser = new UserDTO();
            }
        %>
        <h1>Hello <%= loginUser.getFullName() %></h1>
        
    </body>
</html>
