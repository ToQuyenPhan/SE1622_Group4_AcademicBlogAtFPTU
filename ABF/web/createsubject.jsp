<%-- 
    Document   : createmajor
    Created on : Jul 7, 2022, 11:21:49 AM
    Author     : hotan
--%>

<%@page import="java.util.List"%>
<%@page import="dao.MajorDAO"%>
<%@page import="dto.MajorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Major</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            <input name="subjectName" type="text">
            Subject
            <select name="subjectID" class="form-control" >
                <%
                    List<MajorDTO> listc = MajorDAO.getAllMajors();
                    if (listc != null && !listc.isEmpty()) {
                        for (MajorDTO c : listc) {

                %>
                <option value="<%=c.getMajorID() %>"><%= c.getMajorName() %> </option>
                <%
                        }
                    }
                %>
            </select>


            <input type="submit" name="action" value="CreateSubject"
                   <button class="tm-btn tm-btn-primary tm-btn-small"></button> 
        </form>
    </body>
</html>
