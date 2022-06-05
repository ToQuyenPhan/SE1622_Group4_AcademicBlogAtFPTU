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

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <style>
            .fa {
                font-size: 50px;
                cursor: pointer;
                user-select: none;
            }

            .fa:hover {
                color: darkblue;
            }
            <!-- vote css -->
            .number {
                display: inline-block;
                text-align: center;
            }

            .vote {
                display: flex;
                flex-direction: column;
                text-align: center;
            }

            .up-vote {
                color: dimgray;
                cursor: pointer;
            }

            .down-vote {
                cursor: pointer;
                color: dimgray;
            }
        </style>
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
        <h1>Hello <%= loginUser.getFullName()%></h1>
        <form action="MainController">
            Search<input type="text" name="search" value="<%=search%>" required=""/>
            <input type="submit" name="action" value="Search"/>
        </form>

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
            <a href="blogDetail.jsp">View Blog Detail</a></br




            <div class="vote">
                <span class="up-vote"><i class="fas fa-angle-up"></i></span>
                <span class="down-vote"><i class="fas fa-angle-down"></i></span>
                <span class="number"><%= blog.getNumberOfVotes()%></span>
            </div>
            
            <div>
                <a href="MainController?action=Delete&blogID=<%= blog.getBlogID()%>&search=<%= search%>"> Delete </a>
            </div>
        </article>
            <script>
                // function vote
                const up_vote_span = document.querySelector('.up-vote');
                const down_vote_span = document.querySelector('.down-vote');
                let count = document.querySelector('.number');

                let upVote = false;
                let downVote = false;

                up_vote_span.addEventListener('click', function () {

                    if (downVote === true) {

                        up_vote_span.style.color = "#3CBC8D";
                        down_vote_span.style.color = "dimgray";
                        count.innerHTML = parseInt(count.innerHTML) + 2;
                        upVote = true;
                        downVote = false;

                    } else if (upVote === false) {
                        up_vote_span.style.color = "#3CBC8D";
                        count.innerHTML = parseInt(count.innerHTML) + 1;
                        upVote = true;
                    } else if (upVote === true) {
                        up_vote_span.style.color = "dimgray";
                        count.innerHTML = parseInt(count.innerHTML) - 1;
                        upVote = false;
                    }
                });

                down_vote_span.addEventListener('click', function () {

                    if (upVote === true) {
                        up_vote_span.style.color = "dimgray";
                        down_vote_span.style.color = "#3CBC8D";
                        count.innerHTML = parseInt(count.innerHTML) - 2;
                        downVote = true;
                        upVote = false;
                    } else if (downVote === false) {
                        down_vote_span.style.color = "#3CBC8D";
                        count.innerHTML = parseInt(count.innerHTML) - 1;
                        downVote = true;
                    } else if (downVote === true) {
                        down_vote_span.style.color = "dimgray";
                        count.innerHTML = parseInt(count.innerHTML) + 1;
                        downVote = false;
                    }
                });
            </script>
        <%
                    }
                }
            }
        %>
        <a href="feedback.jsp">Feedback</a>
    </body>
</html>
