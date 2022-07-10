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
        <nav class="nav" id="header">
            <form action="MainController" method="POST">
                <div class="nav-menu row">
                    <div class="nav-brand col-sm-2">
                        <a href="MainController?action=GetList" class="text-gray">Academic Blog</a>
                    </div>
                    <div class="toggle-collapse">
                        <div class="toggle-icons">
                            <i class="fas fa-bars"></i>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <ul class="nav-items">
                            <li class="nav-link">
                                <a href="MainController?action=GetList">Home</a>
                            </li>
                            <li class="nav-link">
                                <a href="#">Majors</a>
                            </li>
                            <li class="nav-link">
                                <a href="#">Subjects</a>
                            </li>
                            <li class="nav-link">
                                <a href="#">Feedback</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-3">
                        <div class="search-form-search">
                            <input type="text" placeholder="Search..." name="search" type="text">
                            <div class="search-search"><button type="submit" name="action" value="Search"><i class="fas fa-search"></i></button></div>
                        </div>
                    </div>
                    <div class="new col-sm-1"><a href="MainController?action=GoToPostBlogPage"><i class="fas fa-pen"></i></a></div>

                    <div class="profile text-gray col-sm-3">
                        <div class="row">         
                            <a><h6><%= loginUser.getFullName()%></h6></a>
                            <img src="<%= image%>">
                        </div>
                    </div>
                </div>
            </form>
        </nav>
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
                        <%
                            List<CommentDTO> commentList = (List<CommentDTO>) request.getAttribute("COMMENT_LIST");
                            if (commentList != null) {
                                if (commentList.size() > 0) {
                                    for (CommentDTO comment : commentList) {
                        %>
                        <div>
                            <h6>

                                <%= comment.getContent()%>
                            </h6>
                        </div>
                        <%
                                    }
                                }
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
        <footer class="footer">
            <div class="container">
                <div class="about-us" data-aos="fade-right" data-aos-delay="200">
                    <h2>About us</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium quia atque nemo ad modi officiis
                        iure, autem nulla tenetur repellendus.</p>
                </div>
                <div class="newsletter" data-aos="fade-right" data-aos-delay="200">
                    <h2>Newsletter</h2>
                    <p>Stay update with our latest</p>
                    <div class="form-element">
                        <input type="text" placeholder="Email"><span><i class="fas fa-chevron-right"></i></span>
                    </div>
                </div>
                <div class="instagram" data-aos="fade-left" data-aos-delay="200">
                    <h2>Instagram</h2>
                    <div class="flex-row">
                        <img src="./assets/instagram/thumb-card3.png" alt="insta1">
                        <img src="./assets/instagram/thumb-card4.png" alt="insta2">
                        <img src="./assets/instagram/thumb-card5.png" alt="insta3">
                    </div>
                    <div class="flex-row">
                        <img src="./assets/instagram/thumb-card6.png" alt="insta4">
                        <img src="./assets/instagram/thumb-card7.png" alt="insta5">
                        <img src="./assets/instagram/thumb-card8.png" alt="insta6">
                    </div>
                </div>
                <div class="follow" data-aos="fade-left" data-aos-delay="200">
                    <h2>Follow us</h2>
                    <p>Let us be Social</p>
                    <div>
                        <i class="fab fa-facebook-f"></i>
                        <i class="fab fa-twitter"></i>
                        <i class="fab fa-instagram"></i>
                        <i class="fab fa-youtube"></i>
                    </div>
                </div>
            </div>
            <div class="rights flex-row">
                <h4 class="text-gray">
                    Copyright ©2019 All rights reserved | made by
                    <a href="www.youtube.com/c/dailytuition" target="_black">Daily Tuition <i class="fab fa-youtube"></i>
                        Channel</a>
                </h4>
            </div>
            <div class="move-up">
                <span><a href="#header"><i class="fas fa-arrow-circle-up fa-2x"></i></a></span>
            </div>
        </footer>
        <script>
            var loc = window.location.href;
            window.location.href = loc + "#vote-part";
        </script>
        <script src="js/jquery.min.js"></script>
        <script src="js/templatemo-script.js"></script>
    </body>

</html>
