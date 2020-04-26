<%@ page import="java.util.List" %>
<%@ page import="pl.sda.javagdy2.database.model.Student" %>
<%@ page import="pl.sda.javagdy2.database.EntityDao" %><%--
  Created by IntelliJ IDEA.
  User: mWroblewski
  Date: 19.04.2020
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Student list</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/main.css">
</head>
<body>
<h1>Student list</h1>
<jsp:include page="/menu.jsp"/>
<br>

<form action="/student/delete" method="get">
    Id: <input type="text" name="identToDelete"/>
    <input type="submit">
</form>

<br>

<table>
    <thead>
        <td class="td_item">id</td>
        <td class="td_item">Imię</td>
        <td class="td_item">Nazwisko</td>
        <td class="td_item">18+</td>
        <td class="td_item">wzrost</td>
        <td class="td_item">/student/delete</td>
        <td class="td_item">/student/detail</td>
    </thead>

    <tbody> <%-- JSTL --%>
    <c:forEach var="student" items="${requestScope.students}">
        <tr>
            <td class="td_item"><c:out value="${student.id}"/></td>
            <td class="td_item"><c:out value="${student.imie}"/></td>
            <td class="td_item"><c:out value="${student.nazwisko}"/></td>
            <td class="td_item"><c:out value="${student.pelnoletni}"/></td>
            <td class="td_item"><c:out value="${student.wzrost}"/></td>
            <td class="td_item">
                <a href="/student/delete?identToDelete=<c:out value="${student.id}"/>">delete</a>
            </td>
            <td class="td_item">
                <a href="/student/detail?identifier=<c:out value="${student.id}"/>">Szczegoly</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--    <%--%>
<%--//        przeniesione do pliku StudentListServlet--%>
<%--//        EntityDao dao = new EntityDao();--%>
<%--//        List<Student> lista = dao.list(Student.class);--%>


<%--        for (Student student : lista) {--%>
<%--            out.print("<tr>");--%>
<%--            out.print("<td class=\"td_item\">" + student.getId() + "</td>");--%>
<%--            out.print("<td class=\"td_item\">" + student.getImie() + "</td>");--%>
<%--            out.print("<td class=\"td_item\">" + student.getNazwisko() + "</td>");--%>
<%--            out.print("<td class=\"td_item\">" + student.isPelnoletni() + "</td>");--%>
<%--            out.print("<td class=\"td_item\">" + student.getWzrost() + "</td>");--%>
<%--            out.print("</tr>");--%>
<%--        }--%>
<%--    %>--%>



</body>
</html>
