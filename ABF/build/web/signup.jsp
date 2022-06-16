<%-- 
    Document   : signup
    Created on : Jun 10, 2022, 2:54:28 PM
    Author     : ASUS
--%>

<%@page import="error.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Registration Page</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="CSS/style_create.css">
    </head>
    <body>

        <div class="main">

            <section class="signup" <img src="image/signup-bg.jpg" alt="">>

                <div class="container">
                    <div class="signup-content">
                        <%
                            UserError userError = (UserError) request.getAttribute("USER_ERROR");
                            if (userError == null) {
                                userError = new UserError();
                            }
                        %>
                        <form action="MainController" method="POST" id="signup-form" class="signup-form">
                            <h2 class="form-title">Create account</h2>
                            <div class="form-group">
                                <input type="text" class="form-input" name="fullName" id="name" placeholder="Your Full Name" required=""/>
                                 <%= userError.getFullNameError()%>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-input" name="email" id="email" placeholder="Your Email" required=""/>
                                <%= userError.getEmailError()%>
                            </div>                           
                            <div class="form-group">
                                <input type="password" class="form-input" name="password" id="password" placeholder="Password" required=""/>
                                <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-input" name="confirm" id="re_password" placeholder="Confirm your password" required=""/>
                                <%= userError.getConfirmError() %>
                            </div>                  
                            <div class="form-group">
                                <input type="submit" name="action" id="submit" class="form-submit" value="Create"/>
                            </div>
                        </form>
                        <%
                            String message = (String) request.getAttribute("MESSAGE");
                            if (message == null) {
                                message = "";
                            }
                        %>
                        <h1><%= message%></h1>
                        <p class="loginhere">
                            Have already an account ? <a href="index.jsp" class="loginhere-link">Login here</a>
                        </p>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            (function ($) {

                $(".toggle-password").click(function () {

                    $(this).toggleClass("zmdi-eye zmdi-eye-off");
                    var input = $($(this).attr("toggle"));
                    if (input.attr("type") == "password") {
                        input.attr("type", "text");
                    } else {
                        input.attr("type", "password");
                    }
                });

            })(jQuery);
        </script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>