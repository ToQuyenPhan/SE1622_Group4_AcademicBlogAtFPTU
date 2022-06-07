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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <style>
            .fa {
                font-size: 50px;
                cursor: pointer;
                user-select: none;
            }

            .fa:hover {
                color: darkblue;
            } 
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
                        <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Delete</button>

            <!-- Modal -->
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
                            <a href="MainController?action=Delete&blogID=<%= blog.getBlogID()%>&search=<%= search%>" type="button" class="btn btn-primary">Delete</a>
                        </div>
                    </div>
                </div>
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
    </script>
    <%
                }
            }
        }
    %>
    <a href="feedback.jsp">Feedback</a>
</body>
</html>
