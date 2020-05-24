<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    Object message = request.getAttribute("message");
    Object grade_list = request.getAttribute("grade_list");
    if(message!=null && !"".equals(message)){

%>
<script type="text/javascript">
    alert("<%=request.getAttribute("message")%>");
</script>
<%} %>
<div align="center">
    <h1 >信息列表</h1>
    <a href="index.jsp">返回主页</a>
    <table >
        <tr>
            <td>id</td>
            <td>姓名</td>
            <td>密码</td>
            <td>性别</td>
            <td align="center" colspan="2">操作</td>
        </tr>
        <c:forEach items="${list}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.password}</td>
                <td>${item.sex}</td>
                <td><a href="update.jsp?id=${item.id}&name=${item.name}&password=${item.password}&sex=${item.sex}">修改</a></td>
                <td><a href="servlet?method=delete&id=${item.id}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>