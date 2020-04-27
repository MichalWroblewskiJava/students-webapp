<%--dzięki poniższej linii możliwe jest wywoływanie funkcji/tagów html z jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--dzięki lini poniżej możliwe jest wykonywanie dyrektyw z użyciem zmiennych adresując je przez ${}--%>
<%@ page isELIgnored="false" %>
<table>
    <tr>
        <td>
            <a href="${pageContext.request.contextPath}/index.jsp">Home page</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="${pageContext.request.contextPath}/student/add">Formularz dodawania nowego studenta</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="${pageContext.request.contextPath}/student/list">Lista studentow</a>
        </td>
    </tr>
</table>