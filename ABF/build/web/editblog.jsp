<%-- 
    Document   : editBlog
    Created on : Jun 3, 2022, 10:08:21 PM
    Author     : Bat
--%>

<%@page import="dao.BlogDAO"%>
<%@page import="dto.BlogDTO"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="dto.SubjectDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Blog</title>
        <link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/templatemo-xtra-blog.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/style.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <script>
        function validation() {
             var myForm = document.forms["MainController"];

             var t = myForm["title"].value;
             var c = myForm["content"].value;
              var i = myForm["image"].value;
             
            if (t.length === 0 || t.length > 100) {
                alert("Title is invalid");
                myForm["title"].focus();
                return false;
            }
            if (c === null || c === " " || c.length <= 0) {
                alert("Content is invalid");
                myForm["content"].focus();
                return false;
            }
            return true;
            alert(t);
        }
        function thongbaosuccess() {
            alert("Edit success!");
        }
    </script>
    <body class="body-edit-blog">
        <header class="tm-header" id="tm-header">
            <div class="tm-header-wrapper">
                <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="tm-site-header">
                    <div class="mb-3 mx-auto tm-site-logo"><img src="img/logo.png"><i class="fas fa-times fa-2x"></i></div>            
                </div>
                <nav class="tm-nav" id="tm-nav">            
                    <ul>
                        <li class="tm-nav-item"><a href="homepage.jsp" class="tm-nav-link">
                                <i class="fas fa-home"></i>
                                Home
                            </a></li>
                        <li class="tm-nav-item active"><a href="postBlog.jsp" class="tm-nav-link">
                                <i class="fas fa-pen"></i>
                                Post Blog
                            </a></li>
                        <li class="tm-nav-item"><a href="about.html" class="tm-nav-link">
                                <i class="fas fa-users"></i>
                                My profile
                            </a></li>
                        <li class="tm-nav-item"><a href="feedback.jsp" class="tm-nav-link">
                                <i class="far fa-comments"></i>
                                Feedback
                            </a></li>
                    </ul>
                </nav>
                <div class="tm-mb-65">
                    <a href="https://facebook.com" class="tm-social-link">
                        <i class="fab fa-facebook tm-social-icon"></i>
                    </a>
                    <a href="https://twitter.com" class="tm-social-link">
                        <i class="fab fa-twitter tm-social-icon"></i>
                    </a>
                    <a href="https://instagram.com" class="tm-social-link">
                        <i class="fab fa-instagram tm-social-icon"></i>
                    </a>
                    <a href="https://linkedin.com" class="tm-social-link">
                        <i class="fab fa-linkedin tm-social-icon"></i>
                    </a>
                </div>
                <p class="tm-mb-80 pr-5 text-white">
                    <%
                        //Hiển thị Full Name của user
                        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                        if (loginUser == null) {
                            loginUser = new UserDTO();
                        }
                    %>
                    Hello <%= loginUser.getFullName()%> 
                </p>
            </div>
        </header>
        <div class="container-fluid">
            <main class="tm-main">
                <!-- Search form -->
                <div class="row tm-row">
                    <div class="col-12">
                        <form method="GET" class="form-inline tm-mb-80 tm-search-form">                
                            <input class="form-control tm-search-input" name="query" type="text" placeholder="Search..." aria-label="Search">
                            <button class="tm-search-button" type="submit">
                                <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                            </button>                                
                        </form>
                    </div>                
                </div>            
                <div class="row tm-row">
                    <div class="col-12">
                        <hr class="tm-hr-primary tm-mb-55">
                    </div>
                </div>
                <%
                    BlogDTO blog = (BlogDTO) request.getAttribute("BLOG_EDIT");
                    if (blog != null) {
                %>
                <div class="row tm-row">
                    <div class="col-lg-8 tm-post-col">
                        <div class="tm-post-full">
                            <form action="MainController" method="POST" onsubmit = "return validation() >
                                <div class="mb-4">
                                    <!--HERE-->
                                    <input type="hidden" name="blogID" value="<%=blog.getSubjectID()%>" readonly="">
                                    <input type="hidden" name="UserID" value="<%=blog.getUserID()%>"  readonly="">
                                    <div class="mb-4">
                                        Title<input class="form-control" name="title" type="text" value="<%=blog.getTitle()%>"><span id="e1"></span>
                                    </div>
                                    <div class="mb-4">
                                        <p>Subject<select name="subjectID" >
                                                <%
                                                    ArrayList<SubjectDTO> listc = SubjectDAO.getSubject();
                                                    if (listc != null && !listc.isEmpty()) {
                                                        for (SubjectDTO c : listc) {
                                                            if (blog.getSubjectID() == c.getSubjectID()) {
                                                %>
                                                <option value="<%=c.getSubjectID()%>" selected="<%= c.getSubjectName()%>"><%= c.getSubjectName()%> </option>
                                                <% } else {
                                                %>
                                                <option value="<%=c.getSubjectID()%>"><%= c.getSubjectName()%> </option>
                                                <%}
                                                        }
                                                    }%>
                                            </select>
                                            </br>
                                            <p class="mb-4">
                                            <img src="<%= blog.getImage()%>" style="width:300px;height:200px;" class="form-control" readonly=""/>
                                            <input type="text" name="image" value="<%= blog.getImage()%>" class="form-control">
                                        </p>
                                        
                                        <div class="mb-4">
                                            Details<textarea class="form-control" name="content" value="<%=blog.getContent()%>" rows="6"></textarea><span id="e2"></span>
                                        </div>
                                        
                                        <%
                                            }
                                        %>
                                        </br>
                                    </div>

                                </div>
                                <div class="text-right">
                                    <input type="submit" name="action" value="Edit" onclick="return validation()"
                                           <button class="tm-btn tm-btn-primary tm-btn-small"></button>                        
                                </div>
                            </form>
                            <script src="js/jquery.min.js"></script>
                            <script src="js/templatemo-script.js"></script>
                            </body>
                            </html>
