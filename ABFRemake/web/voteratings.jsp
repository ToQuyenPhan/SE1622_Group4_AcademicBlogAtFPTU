<%-- 
    Document   : voterating
    Created on : Jun 19, 2022, 3:50:18 PM
    Author     : hotan
--%>

<%@page import="dao.BlogDAO"%>
<%@page import="dto.BlogDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Vote Rating</title>
        <link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="css/templatemo-xtra-blog.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link href="../vendor/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="../vendor/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../vendor/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </head>

    <body id="page-top" class="body-homepage">
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
//            BlogNotify blogNotify = (BlogNotify) request.getAttribute("GIVE_AWARD");
//            if (blogNotify == null) {
//                blogNotify = new BlogNotify();
//            }
        %>
        
        <div class="container-fluid activity-page">
            <main class="tm-main activity-list">                
                <div id="wrapper">
                    <!-- Sidebar -->
                    <div id="content-wrapper" class="d-flex flex-column">
                        <div id="content">
                            <div class="container-fluid" id="container-wrapper">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card mb-4">
                                            <div class="table-responsive p-3">
                                                <%
                                                    BlogDAO dao = new BlogDAO();
                                                    int blogID = 0;
                                                    List<BlogDTO> listAllBlogs = dao.getAllBlogs();
                                                    if (listAllBlogs.size() > 0) {
                                                %>                                                
                                                <table class="table align-items-center table-flush" id="dataTable">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th class="border-0">#</th>                                    
                                                            <th class="border-0">Blog ID</th>
                                                            <th class="border-0">Title</th>
                                                            <th class="border-0">By</th>                                   
                                                            <th class="border-0">Date</th>
                                                            <th class="border-0">Number of vote</th>
                                                            <th class="border-0">Awards</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%  int count = 1;
                                                            for (BlogDTO blog : listAllBlogs) {
                                                                if (loginUser == null) {
                                                                    loginUser = new UserDTO();
                                                                }

                                                        %>
                                                        <tr>
                                                            <td><%= count++%></td>
                                                            <td><%= blog.getBlogID()%></td>
                                                            <td><%= blog.getTitle()%></td>
                                                            <td><%= blog.getFullName()%></td>
                                                            <td><%= blog.getDate()%></td>
                                                            <td><%= blog.getNumberOfVotes()%></td>

                                                            <td>
                                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="width: 7rem">Give Award</button>                                                                   
                                                            </td>


                                                            <%
                                                                blogID = blog.getBlogID();
                                                                    }
                                                                }
                                                            %>
                                                        </tr>
                                                    </tbody>
                                                </table>  

                                            </div>
                                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalCenterTitle">Give Award</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>You gave a gift to a student</p>
                                                        </div>    
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>  
                                                            <a href="MainController?action=GiveAward&blogID=<%= blogID %>" type="button" class="btn btn-danger">Give Award</a>
                                                        </div>                                    
                                                    </div>
                                                </div>
                                            </div>
                                        </div>




                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                
            </main>
        </div>

        <script src="../vendor/vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../vendor/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="../vendor/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="../vendor/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTable').DataTable(); // ID From dataTable 
                $('#dataTableHover').DataTable(); // ID From dataTable with Hover
            });
        </script>
        <script>
            var time_in_sec = 0;
            var start_calling = '';
            function showPopUp(item, size) {
                for (var i = 0; i <= size; i++) {
                    if (i == item) {
                        document.getElementById(item).style.display = "block";
                    }
                }
            }
            function countdownTime() {
                time_in_sec++;
                html_tag.innerHTML = time_in_sec; // show time in html tag
                if (time_in_sec == 10) {
                    clearInterval(start_calling) // stop calling
                    ClosePopUp();
                }
            }
            function closePopUpConfirm(item, size) {
                for (var i = 0; i <= size; i++) {
                    if (i == item) {
                        document.getElementById(item).style.display = "none";
                    }
                }
            }

            function closePopUp() {
                document.getElementById('delete-activity-message-popup').style.display = 'none';
            }
        </script>
        <script src="js/jquery.min.js"></script>
        <script src="js/templatemo-script.js"></script>

    </body>
</html>