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
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Academic Blog</title>
        <link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="css/templatemo-xtra-blog.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <!--
            
        TemplateMo 553 Xtra Blog
        
        https://templatemo.com/tm-553-xtra-blog
        
        -->
    </head>
    <body class="body-homepage">
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
        %>
        <header class="tm-header" id="tm-header">
            <div class="tm-header-wrapper">
                <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="logo">
                    <a href="#">
                        <div class="logo">
                            <img src="image/logo.png">
                        </div>            
                        <!--<h2 class="text-center"><%= loginUser.getFullName()%></h2>-->
                    </a>
                </div>
                <nav class="tm-nav" id="tm-nav">            
                    <ul>
                        <li class="tm-nav-item active"><a href="#" class="tm-nav-link">
                                <i class="fas fa-home"></i>
                                Blog Home
                            </a></li>
                            <%
                                String roleUser = (String) session.getAttribute("ROLE");
                                if (roleUser == null) {
                                    roleUser = "";
                                }
                                if ("Mentor".equals(roleUser)) {
                            %>
                            <li class="tm-nav-item"><a href="MainController?action=GetApproveList" class="tm-nav-link">
                                <i class="fa fa-check"></i>
                                Approve Blog List
                            </a></li>
                            <%
                                }
                            %>     
                        <li class="tm-nav-item"><a href="MainController?action=GetActivityList&userID=<%= loginUser.getUserID()%>" class="tm-nav-link">
                                <i class="fas fa-tasks"></i>
                                Activity
                            </a></li>
                        <li class="tm-nav-item"><a href="MainController?action=ViewPersonalPage&userID=<%= loginUser.getUserID()%>" class="tm-nav-link">
                                <i class="fas fa-tasks"></i>
                                Personal List
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
                    <div class="col-12 row">
                        <form class="form-inline tm-mb-80 tm-search-form col-sm-9 row" action="MainController">                
                            <input class="form-control tm-search-input col-sm-9" name="search" type="text" placeholder="Search..." aria-label="Search" value="<%= search%>">
                            <button class="tm-search-button col-sm-1" type="submit" name="action" value="Search">
                                <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                            </button>                                
                        </form>
                        <a href="MainController?action=GoToPostBlogPage" class="tm-nav-link col-sm-3">
                            <i class="fas fa-pen"></i>
                            New Post
                        </a>
                    </div>    
                    <div class="form-sort">
                        <%
                            String selectedOption = (String) request.getAttribute("OPTION");
                            if (selectedOption == null) {
                                selectedOption = "None";
                            }
                        %>
                        <form action="MainController">
                            Sort By: <select class="sort-by-date" name="sortBy">
                                <%
                                    if (selectedOption.equals("Date")) {
                                %>
                                <option value="vote">Vote</option>
                                <option value="none">None</option>
                                <%
                                } else if (selectedOption.equals("Vote")) {
                                %>
                                <option value="vote">Date</option>
                                <option value="none">None</option>
                                <%
                                } else {
                                %>
                                <option value="date">Date</option>
                                <option value="vote">Vote</option>
                                <%
                                    }
                                %>
                                <option value="<%= selectedOption.toLowerCase()%>" selected=""><%= selectedOption%></option>
                            </select>
                            <%
                                String selectedOrderOption = (String) request.getAttribute("ORDER_OPTION");
                                if (selectedOrderOption == null) {
                                    selectedOrderOption = "None";
                                }
                            %>
                            Sort Order: <select class="sort-by-vote" name="sortOrder">
                                <%
                                    if (selectedOrderOption.equals("Ascending")) {
                                %>
                                <option value="descending">Descending</option>
                                <option value="none">None</option>
                                <%
                                } else if (selectedOrderOption.equals("Descending")) {
                                %>
                                <option value="ascending">Ascending</option>
                                <option value="none">None</option>
                                <%
                                } else {
                                %>
                                <option value="ascending">Ascending</option>
                                <option value="descending">Descending</option>
                                <%
                                    }
                                %>
                                <option value="<%= selectedOrderOption.toLowerCase()%>" selected=""><%= selectedOrderOption%></option>
                            </select>
                            <input type="hidden" name="search" value="<%= search%>">
                            <input class="sort-button" type="submit" name="action" value="Sort">
                        </form>
                    </div>
                </div>            
                <div class="row tm-row">
                    <%

                        List<BlogDTO> listAllBlogs = (List<BlogDTO>) request.getAttribute("LIST_ALL_BLOGS");
                        if (listAllBlogs != null) { //chỉ hiển thị khi người dùng đã đăng nhập
                            if (listAllBlogs.size() > 0) {
                                for (BlogDTO blog : listAllBlogs) {
                    %> 
                    <article class="col-12 col-md-6 tm-post">
                        <hr class="tm-hr-primary">
                        <a href="MainController?action=ViewBlogDetails&blogID=<%= blog.getBlogID()%>&userID=<%= blog.getUserID()%>" class="effect-lily tm-post-link tm-pt-60">
                            <%
                                if (blog.getImage() != null) {
                            %>
                            <div class="tm-post-link-inner">
                                <img src="<%= blog.getImage()%>" alt="Image" class="img-fluid">                            
                            </div>
                            <%
                                }
                            %>
                            <h2 class="tm-pt-30 tm-color-primary tm-post-title"><%= blog.getTitle()%></h2>
                        </a>                    
                        <p class="tm-pt-30">
                            <%= blog.getContent()%>
                        </p>
                        <div class="d-flex justify-content-between tm-pt-45">
                            <span class="tm-color-primary">By <%= blog.getFullName()%></span>
                            <span class="tm-color-primary"><%= blog.getDate()%></span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between">
                            <span>36 comments</span>
                            <span><%= blog.getNumberOfVotes()%> votes</span>
                        </div>
                    </article>
                    <%
                            }
                        }
                    } else {
                        String message = (String) request.getAttribute("MESSAGE");
                        if (message == null) {
                            message = "";
                        }
                    %>
                    <div class="search-home-page justify-content-center">

                        <h1><%= message%></h1>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>   
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="row tm-row tm-mt-100 tm-mb-75">
                    <div class="tm-prev-next-wrapper">
                        <a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
                        <a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
                    </div>
                    <div class="tm-paging-wrapper">
                        <span class="d-inline-block mr-3">Page</span>
                        <nav class="tm-paging-nav d-inline-block">
                            <ul>
                                <li class="tm-paging-item active">
                                    <a href="#" class="mb-2 tm-btn tm-paging-link">1</a>
                                </li>
                                <li class="tm-paging-item">
                                    <a href="#" class="mb-2 tm-btn tm-paging-link">2</a>
                                </li>
                                <li class="tm-paging-item">
                                    <a href="#" class="mb-2 tm-btn tm-paging-link">3</a>
                                </li>
                                <li class="tm-paging-item">
                                    <a href="#" class="mb-2 tm-btn tm-paging-link">4</a>
                                </li>
                            </ul>
                        </nav>
                    </div>                
                </div>            
                <footer class="row tm-row">
                </footer>
            </main>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/templatemo-script.js"></script>
    </body>
</html>