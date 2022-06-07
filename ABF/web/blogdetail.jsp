<%-- 
    Document   : blogdetail
    Created on : Jun 7, 2022, 1:36:08 PM
    Author     : ASUS
--%>

<%@page import="dto.BlogDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Blog Details</title>
        <link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/templatemo-xtra-blog.css" rel="stylesheet">
        <!--
            
        TemplateMo 553 Xtra Blog
        
        https://templatemo.com/tm-553-xtra-blog
        
        -->
    </head>
    <body>
        <%
            //Hiển thị Full Name của user
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <header class="tm-header" id="tm-header">
            <div class="tm-header-wrapper">
                <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="tm-site-header">
                    <div class="mb-3 mx-auto tm-site-logo"><i class="fas fa-times fa-2x"></i></div>            
                    <h2 class="text-center"><%= loginUser.getFullName()%></h2>
                </div>
                <nav class="tm-nav" id="tm-nav">            
                    <ul>
                        <li class="tm-nav-item active tm-nav-link postblog-page-tm-nav"><a href="MainController?action=GetList" class="">
                                <i class="fas fa-home"></i>
                                Blog Home
                            </a></li>
                        <li class="tm-nav-item"><a href="post.html" class="tm-nav-link">
                                <i class="fas fa-users"></i>
                                Majors
                            </a></li>
                        <li class="tm-nav-item"><a href="about.html" class="tm-nav-link">
                                <i class="fas fa-users"></i>
                                Subjects
                            </a></li>
                        <li class="tm-nav-item"><a href="contact.html" class="tm-nav-link">
                                <i class="far fa-comments"></i>
                                Feedback
                            </a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="container-fluid">
            <main class="tm-main">
                <div class="row tm-row">

                    <%
                        List<BlogDTO> listAllBlogs = (List<BlogDTO>) request.getAttribute("LIST_ALL_BLOGS");
                        if (listAllBlogs != null) { //chỉ hiển thị khi người dùng đã đăng nhập
                            if (listAllBlogs.size() > 0) {
                                for (BlogDTO blog : listAllBlogs) {
                    %>

                    <article class="col-12">
                        <div class="form-inline">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Delete</button>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Edit</button>
                        </div>
                        <a class="form-inline">               
                            <h1 class="tm-pt-60 tm-color-primary tm-post-title" style="font-size: 4rem"><%= blog.getTitle()%></h1>                           
                        </a>                    
                        <p class="form-inline tm-mb-80" style="color: black; font-size: 22px">
                            <%= blog.getContent()%>
                        </p>
                        <p class="form-inline tm-mb-80">
                            <img src="<%= blog.getImage()%>" style="width:40rem;height:20rem;" readonly=""/>
                        </p>
                        <div class="form-inline tm-mb-80">
                            <span class="tm-color-primary col-sm-6"><a>Number of Vote: </a><%= blog.getNumberOfVotes()%></span>
                            <span class="tm-color-primary col-sm-6" style="font-size: 16px"><a>Number of Comments: </a><%= blog.getNumberOfComments()%></span>               
                        </div>

                        <div class="form-inline tm-mb-80">
                            <form action="MainController" method="POST">
                                <input type="text" name="comment" style="width: 32rem;height: 30px" ></br>
                                <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">                                 
                                <input type="hidden" name="blogID" value="<%=blog.getBlogID()%>">
                                <input type="hidden" name="subjectID" value="<%=blog.getSubjectID()%>">
                                <input type="submit" name="action" value="Comment">
                            </form>
                        </div>                   
                    </article>
                    <%
                                }
                            }
                        }
                    %>      
                </div>
            </main>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/templatemo-script.js"></script>
    </body>

</html>
