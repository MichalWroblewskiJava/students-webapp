<%--
  Created by IntelliJ IDEA.
  User: mWroblewski
  Date: 26.04.2020
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--dzięki poniższej linii możliwe jest wywoływanie funkcji/tagów html z jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--dzięki lini poniżej możliwe jest wykonywanie dyrektyw z użyciem zmiennych adresując je przez ${}--%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Student details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/main.css">
</head>
<body>
<h1>Detailed information about a student with id: <c:out value="${requestScope.studentDetails.id}"/></h1>
<jsp:include page="/menu.jsp"/>
<br/>
<table>
    <tr>
        <td>Imie:</td>
        <td><c:out value="${requestScope.studentDetails.imie}"/></td>
    </tr>
    <tr>
        <td>Nazwisko:</td>
        <td><c:out value="${requestScope.studentDetails.nazwisko}"/></td>
    </tr>
    <tr>
        <td>Wzrost:</td>
        <td><c:out value="${requestScope.studentDetails.wzrost}"/></td>
    </tr>
    <tr>
        <td>Pełnoletni:</td>
        <td><c:out value="${requestScope.studentDetails.pelnoletni}"/></td>
    </tr>
</table>
<br/>

<%--Link do strony dodawania ocen - możemy przesłać dane o studencie.--%>
<a href="/grade/add?studentId=<c:out value="${requestScope.studentDetails.id}"/>">Dodaj ocenę (temu studentowi)</a>

<br/>


<table style="border: 1px solid">
    <thead>
    <tr>
        <td class="td_item">Id</td>
        <td class="td_item">Przedmiot</td>
        <td class="td_item">Ocena</td>
        <td class="td_item">Data dodania</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="ocena" items="${requestScope.studentDetails.gradeList}">
        <tr>
            <td class="td_item"><c:out value="${ocena.id}"/></td>
            <td class="td_item"><c:out value="${ocena.przedmiot}"/></td>
            <td class="td_item"><c:out value="${ocena.ocena}"/></td>
            <td class="td_item"><c:out value="${ocena.dataDodania}"/></td>

            <td class="td_item">
                <a href="/grade/delete?gradeId=<c:out value="${ocena.id}"/>">Usun</a>
            </td>
            <td class="td_item">
                <a href="/grade/edit?gradeId=<c:out value="${ocena.id}"/>">Edytuj</a>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
