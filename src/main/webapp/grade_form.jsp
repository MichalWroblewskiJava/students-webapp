<%--
  Created by IntelliJ IDEA.
  User: mWroblewski
  Date: 26.04.2020
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--dzięki poniższej linii możliwe jest wywoływanie funkcji/tagów html z jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--dzięki lini poniżej możliwe jest wykonywanie dyrektyw z użyciem zmiennych adresując je przez ${}--%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Grade Form</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/main.css">
</head>
<body>
<h1>Formularz oceny dla studenta: <c:out value="${requestScope.student_identifier}"/></h1>
<jsp:include page="/menu.jsp"/>
<br/>
<%--formularz zawiera 3 pola: ocena, przedmiot i identyfikator studenta któremu dodajemy ocenę. --%>
<form action="/grade/add" method="post">
    <input type="hidden" name="studentGraded" value="<c:out value="${requestScope.student_identifier}"/>">
    Przedmiot:
    <select name="przedmiot">
        <option value="J_POLSKI">Język Polski</option>
        <option value="J_ANGIELSKI">Język Angielski</option>
        <option value="INFORMATYKA">Języki programowania</option>
        <option value="MATEMATYKA">Matematyka</option>
        <option value="RELIGIA">Religia</option>
    </select>
    <br/>
    Ocena: <input type="number" name="ocena"/>
    <br/>
    <input type="submit">
</form>
</body>
</html>
