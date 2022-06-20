<%-- 
    Document   : blogdetail
    Created on : Jun 7, 2022, 1:36:08 PM
    Author     : ASUS
--%>

<%@page import="dto.CommentDTO"%>
<%@page import="dto.BlogDTO"%>
<%@page import="java.util.List"%>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
            if (image == null) {
                image = "image/0c3b3adb1a7530892e55ef36d3be6cb8 (1).png";
            }
            String voteValue = (String) request.getAttribute("VOTE_VALUE");
            if (voteValue == null) {
                voteValue = "";
            }
            String numberOfVotes = request.getParameter("numberOfVotes");
            if (numberOfVotes == null) {
                numberOfVotes = "";
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
                        <li class="tm-nav-item"><a href="MainController?action=GetActivityList&userID=<%= loginUser.getUserID()%>" class="tm-nav-link">
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
                            <button type="button" class="edit-button btn btn-primary">
                                <a href="MainController?action=EditBlog&blogID=<%=blogDetail.getBlogID()%>&userID=<%=loginUser.getUserID()%>&subjectID=<%=blogDetail.getSubjectID()%>">Edit</a>
                            </button>
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
                        <%
                            if ("".equals(numberOfVotes)) {
                        %>
                        <div class="form-inline number-blog-detail row">
                            <div class="col-sm-6">
                                <a href="MainController?action=Vote&blogID=<%= blogDetail.getBlogID()%>&numberOfVotes=<%= blogDetail.getNumberOfVotes()%>&userID=<%= loginUser.getUserID()%>">
                                    <%
                                        if ("unvote".equals(voteValue)) {
                                    %>
                                    <i class="fas fa-vote-yea" style="color: black;"></i>
                                    <%
                                    } else {
                                    %>
                                    <i class="fas fa-vote-yea" style="color: #0CC;"></i>
                                    <%
                                        }
                                    %>

                                </a>
                                <a><%= blogDetail.getNumberOfVotes()%></a>
                            </div>
                            <span class="tm-color-primary col-sm-6" style="font-size: 16px">Number of Comments: <%= blogDetail.getNumberOfComments()%></span>               
                        </div>
                        <%
                        } else {
                        %>
                        <div id="vote-part" class="form-inline number-blog-detail row">
                            <div class="col-sm-6">
                                <a href="MainController?action=Vote&blogID=<%= blogDetail.getBlogID()%>&numberOfVotes=<%= blogDetail.getNumberOfVotes()%>&userID=<%= loginUser.getUserID()%>">
                                    <%
                                        if ("unvote".equals(voteValue)) {
                                    %>
                                    <i class="fas fa-vote-yea" style="color: black;"></i>
                                    <%
                                    } else {
                                    %>
                                    <i class="fas fa-vote-yea" style="color: #0CC;"></i>
                                    <%
                                        }
                                    %>

                                </a>
                                <a><%= blogDetail.getNumberOfVotes()%></a>
                            </div>
                            <span class="tm-color-primary col-sm-6" style="font-size: 16px">Number of Comments: <%= blogDetail.getNumberOfComments()%></span>               
                        </div>
                        <%
                            }
                        %>
                        <div class="comment-blog-detail">
                            <form action="MainController" method="POST">
                                <input type="text" name="content" style="width: 45rem;height: 40px" ></br>
                                <!--<%
                                    String notify_comment = (String) request.getAttribute("notifie_comment");
                                    if (notify_comment == null) {
                                        notify_comment = "";
                                    }
                                %>
                                <%= notify_comment%>-->
                                <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">                                 
                                <input type="hidden" name="blogID" value="<%=blogDetail.getBlogID()%>">
                                <input type="hidden" name="subjectID" value="<%=blogDetail.getSubjectID()%>">
                                <input type="submit" name="action" value="Comment">
                            </form>
                        </div>
                        <%
                            List<CommentDTO> commentList = (List<CommentDTO>) request.getAttribute("COMMENT_LIST");
                            if (commentList != null) {
                                if (commentList.size() > 0) {
                                    for (CommentDTO comment : commentList) {
                        %>
                        <div>
                            <h6><%= comment.getContent() %></h6>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                        
                        <a class="return-home-page" href="MainController?action=GetList"><i class="far fa-arrow-alt-circle-left"></i></a>
                    </article>
                    <%
                        }
                    %>
                </div>
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalCenterTitle">Delete</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to delete?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <a href="MainController?action=DeleteBlog&blogID=<%= blogDetail.getBlogID()%>&search=<%= search%>" type="button" class="btn btn-danger">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <script>
            var loc = window.location.href;
            window.location.href = loc + "#vote-part";
        </script>
        <script src="js/jquery.min.js"></script>
        <script src="js/templatemo-script.js"></script>
    </body>

</html>
