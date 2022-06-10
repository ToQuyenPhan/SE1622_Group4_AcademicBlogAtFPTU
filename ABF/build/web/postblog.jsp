<%-- 
    Document   : postBlog
    Created on : Jun 6, 2022, 12:54:48 AM
    Author     : hotan
--%>

<%@page import="dao.SubjectDAO"%>
<%@page import="dto.SubjectDTO"%>
<%@page import="dto.SubjectDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.BlogError"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create New Blog</title>
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
    <body class="body-postblog-page">
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
            if (image == null) {
                image = "image/0c3b3adb1a7530892e55ef36d3be6cb8 (1).png";
            }
            BlogError blogError = (BlogError) request.getAttribute("BLOG_ERROR");
            if(blogError == null){
                blogError = new BlogError();
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
                            <img src="<%= image%>">

                        </div>            
                        <h2 class="text-center"><%= loginUser.getFullName()%></h2>
                    </a>
                </div>
                <nav class="tm-nav" id="tm-nav">            
                    <ul>
                        <li class="tm-nav-item"><a href="MainController?action=GetList" class="tm-nav-link">
                                <i class="fas fa-home"></i>
                                Blog Home
                            </a></li>
                        <li class="tm-nav-item"><a href="MainController?action=GetActivityList&userID=<%= loginUser.getUserID() %>" class="tm-nav-link">
                                <i class="fas fa-tasks"></i>
                                Activity
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
                <!-- Search form -->

                <div class="row tm-row">
                    <div class="col-12">
                        <hr class="tm-hr-primary tm-mb-45">
                        <form action="MainController" method="POST">
                            <h2 class="tm-color-primary tm-post-title mb-4">Your Post</h2>
                            <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>" readonly="">

                            <div class="mb-4">
                                Title<input class="form-control" name="title" type="text" required="">
                                <%
                                    String titleError = blogError.getTitleError();
                                    if (titleError == null) {
                                        titleError= "";
                                    }
                                %>
                                <%= titleError %>
                            </div>

                            <div class="mb-4">
                                <!--
                                <p class="tm-mb-40">Subject<input type="text" name="subjectID" required=""></p></br>
                                -->
                                Subject <select class="form-control" name="subjectID" required="">
                                    <%
                                        ArrayList<SubjectDTO> listc = SubjectDAO.getSubject();
                                        if (listc != null && !listc.isEmpty()) {
                                            for (SubjectDTO c : listc) {

                                    %>
                                    <option value="<%=c.getSubjectID()%>"><%= c.getSubjectName()%> </option>
                                    <%
                                            }
                                        }
                                    %>
                                </select> 
                                <%
                                    String subjectError = blogError.getSubjectIDError();
                                    if (subjectError == null) {
                                        subjectError= "";
                                    }
                                %>
                                <%= subjectError %>
                            </div>
                            <div class="mb-4">
                                Details<textarea class="form-control" name="content" rows="6" required=""></textarea>
                                <%
                                    String contentError = blogError.getContentError();
                                    if (contentError == null) {
                                        contentError= "";
                                    }
                                %>
                                <%= contentError %>
                            </div>
                            <div class="mb-4">
                                <!--
                                Image: ${requestScope.BLOG_ERROR.imageError}<input type="text" name="image" required=""></br></br>
                                -->
                                <form method="post" action="MainController" enctype="multipart/form-data">
                                    Image<input class="form-control" name="file" type="file" required=""></br>
                                    <!--
                                    <input type="submit" value="Upload" name="action"
                                           <button class="tm-btn tm-btn-primary tm-btn-small"></button>
                                    <%
                                    String imageError = blogError.getImageError();
                                    if (imageError == null) {
                                        imageError= "";
                                    }
                                    %>
                                    <%= imageError %>
                                        </form>-->
                                    </div>
                                    <div class="text-right">
                                        <input type="submit" name="action" value="Post"
                                               <button class="tm-btn tm-btn-primary tm-btn-small"></button>                        
                                    </div>                                
                                </form>
                            </div>
                    </div>
                    <footer class="row tm-row">
                        <div class="col-md-6 col-12 tm-color-gray">
                            FPT University
                        </div>
                        <div class="col-md-6 col-12 tm-color-gray tm-copyright">
                            ACADEMIC BLOG
                        </div>

                    </footer>
            </main>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/templatemo-script.js"></script>
    </body>
</html>