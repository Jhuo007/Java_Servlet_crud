<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加</title>
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
    <h1>添加信息</h1>
    <a href="index.jsp">返回主页</a>
    <form action="servlet?method=insert" method="post">
        <div>
            id<input type="text" id="id" name="id" />
        </div>
        <div>
            name<input type="text" id="name" name="name" />
        </div>
        <div>
            password<input type="text" id="password" name="password" />
        </div>
        <div>
            sex<input type="text" id="sex" name="sex"/>

        </div>
        <div>
            <button type="submit">添   加</button>
        </div>
    </form>
</div>
</body>
</html>