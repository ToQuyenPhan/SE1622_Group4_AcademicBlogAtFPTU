<%-- 
    Document   : manageaccount
    Created on : Jun 12, 2022, 4:25:52 PM
    Author     : hotan
--%>

<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="CSS/style_1.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/style.css">

        <title>Manage Account</title>
    </head>

    <body>
        <h5 class="card-header">Manage Account</h5>
        <div class="card-body p-0">
            <div class="table-responsive">
                <%
                    UserDAO dao = new UserDAO();
                    List<UserDTO> listAllUser = dao.getAllUser();
                    if (listAllUser.size() > 0) {


                %>
                <table class="table">
                    <thead class="bg-light">
                        <tr class="border-0">
                            <th class="border-0">#</th>
                            <th class="border-0">ID</th>
                            <th class="border-0">Full Name</th>
                            <th class="border-0">Role Id</th>
                            <th class="border-0">Email</th>
                            <th class="border-0">Number of Blogs</th>
                            <th class="border-0">Address</th>
                            <th class="border-0">Status</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <%                            int count = 1;
                            for (UserDTO user : listAllUser) {
                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                if (loginUser == null) {
                                    loginUser = new UserDTO();
                                }
                                String image = loginUser.getImage();
                                if (image == null) {
                                    image = "image/avatar.png";
                                }

                        %>
                        <tr style="text-align: center">
                            <td><%= count++ %></td>
                            <td>
                                <a href="profile.jsp"><%= user.getUserID()%></a>
                            </td>
                            <td class="mb-3 mx-auto tm-site-logo">
                                <a href="profile.jsp">
                                    <img src="<%= image%>">
                                </a>
                            </td>
                            <td><%= user.getFullName()%></td>
                            <td><%= user.getRoleID()%></td>
                            <td><%= user.getEmail()%></td>
                            <td><%= user.getNumberOfBlogs()%></td>
                            <td><%= user.getGender()%></td>
                            <td><%= user.getDateOfBirth()%></td>
                            <td><%= user.getAddress()%></td>
                            <td><%= user.getContact()%></td>
                            <td><%= user.getAboutme()%> </td>
                            <td><%= user.isStatus()%></td>
                            <%
                                    }
                                }
                            %>

                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


    </body>
</html>

