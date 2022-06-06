<%-- 
    Document   : homepage
    Created on : May 30, 2022, 7:18:09 PM
    Author     : To Quyen Phan
--%>

<%@page import="dto.BlogDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
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
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
        %>
        <h1>Hello <%= loginUser.getFullName()%></h1>
        <%

            List<BlogDTO> listAllBlogs = (List<BlogDTO>) request.getAttribute("LIST_ALL_BLOGS");
            if (listAllBlogs != null) { //chỉ hiển thị khi người dùng đã đăng nhập
                if (listAllBlogs.size() > 0) {
                    for (BlogDTO blog : listAllBlogs) {
        %>
        <article class="col-12 col-md-6 tm-post">
            <hr class="tm-hr-primary">
            <a href="post.html" class="effect-lily tm-post-link tm-pt-60">
                <div class="tm-post-link-inner">
                    <img src="img/img-01.jpg" alt="Image" class="img-fluid">                            
                </div>
                <span class="position-absolute tm-new-badge">New</span>
                <h2 class="tm-pt-30 tm-color-primary tm-post-title"><%= blog.getTitle()%></h2>
            </a>                    
            <p class="tm-pt-30">
                <%= blog.getContent()%>
            </p>
            <div class="d-flex justify-content-between tm-pt-45">
                <span class="tm-color-primary">Travel . Events</span>
                <span class="tm-color-primary"><%= blog.getDate()%></span>
            </div>
            <hr>
            <div class="d-flex justify-content-between">
                <span>36 comments</span>
                <span>by Admin Nat</span>
            </div>
        </article>
        <%
                    }
                }
            }
        %>
        <a href="MainController?action=GetFeedbackTypeList">Feedback</a>
    </body>
</html>
