
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.czw.bean"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改</title>
</head>
<body>
<%
    Object message = request.getAttribute("message");
    if (message != null && !"".equals(message)) {
%>
<script type="text/javascript">
    alert("<%=request.getAttribute("message")%>"); //弹出对话框
</script>
<%
    }
%>
<div align="center">
    <h1>修改信息</h1>
    <% bean bean=(bean) request.getAttribute("bean"); %>
    <form action="servlet?method=update" method="post">
        <div>
            id<input type="text" id="id" name="id" <%=bean.getId()%>/>
        </div>
        <div>
            name<input type="text" id="name" name="name" value=${bean.name}/>
        </div>
        <div>
            password<input type="text" id="password" name="password" value="${bean.password}"/>
        </div>
        <div>
            sex<input type="text" id="sex" name="sex" value="${bean.sex}"/>

        </div>
        <div>
            <button type="submit">修改  </button>
        </div>
    </form>
</div>
</body>
</html>
