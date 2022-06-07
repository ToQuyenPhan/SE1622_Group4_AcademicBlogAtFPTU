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
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <!--
            
        TemplateMo 553 Xtra Blog
        
        https://templatemo.com/tm-553-xtra-blog
        
        -->
    </head>
    <body class="body-blog-detail">
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
            String image = loginUser.getImage();
            if(image == null){
                image = "image/0c3b3adb1a7530892e55ef36d3be6cb8 (1).png";
            }
        %>
        <header class="tm-header" id="tm-header">
            <div class="tm-header-wrapper">
                <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="tm-site-header">
                    <a href="profile.jsp">
                        <div class="mb-3 mx-auto tm-site-logo">
                                <img src="<%= image %>">

                        </div>            
                        <h2 class="text-center"><%= loginUser.getFullName()%></h2>
                    </a>
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
                        <li class="tm-nav-item"><a href="MainController?action=GetFeedbackTypeList" class="tm-nav-link">
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
                        BlogDTO blogDetail = (BlogDTO) request.getAttribute("BLOG_DETAIL");
                        if (blogDetail != null) {
                    %>

                    <article class="col-12 blog-detail justify-content-center">
                        <%
                            if (loginUser.getUserID() == blogDetail.getUserID()) {
                        %>
                        <div class="form-inline button-blog-detail">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Delete</button>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Edit</button>
                        </div>
                        <%
                            }
                        %>
                        <div class="title-blog-detail">              
                            <h1 class="tm-pt-60 tm-color-primary tm-post-title" style="font-size: 4rem"><%= blogDetail.getTitle()%></h1>                           
                        </div>
                        <div class="blog-detail-image">
                            <img src="<%= blogDetail.getImage()%>" style="width:40rem;height:20rem;" readonly=""/>
                        </div>
                        <div class="justify-content-center">
                            <p class="form-inline tm-mb-80" style="color: black; font-size: 22px">
                                <%= blogDetail.getContent()%>
                            </p>
                        </div>
                        <div class="by-blog-detail">
                            <span>
                                By <%= blogDetail.getFullName()%>
                            </span>
                            <br>
                            <cite><%= blogDetail.getDate()%></cite>
                        </div>
                        <div class="form-inline number-blog-detail">
                            <span class="tm-color-primary col-sm-6">Number of Vote: <%= blogDetail.getNumberOfVotes()%></span>
                            <span class="tm-color-primary col-sm-6" style="font-size: 16px">Number of Comments: <%= blogDetail.getNumberOfComments()%></span>               
                        </div>
                        <div class="comment-blog-detail">
                            <form action="MainController" method="POST">
                                <input type="text" name="comment" style="width: 45rem;height: 40px" ></br>
                                <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">                                 
                                <input type="hidden" name="blogID" value="<%=blogDetail.getBlogID()%>">
                                <input type="hidden" name="subjectID" value="<%=blogDetail.getSubjectID()%>">
                                <input type="submit" name="action" value="Comment">
                            </form>
                        </div> 
                        <a href="MainController?action=GetList"><i class='far fa-arrow-alt-circle-left'></i></a>
                    </article>
                    <%
                        }
                    %>      
                </div>
            </main>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/templatemo-script.js"></script>
    </body>

</html>
