<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=path%>/resource/bs/js/jquery-1.11.1.js"></script>	<!-- 引入jquery -->
<link rel="stylesheet" href="<%=path%>/resource/bs/css/bootstrap.css"> <!-- 引入bootstrap.css -->
<script src="<%=path%>/resource/bs/js/bootstrap.min.js"></script><!-- 引入bootstrap.min.js -->
<title>用户列表</title>
</head>

<body>

	<section class="container">
		<div class="row">
			<div class="col-md-3">
				<button class="btn btn-danger" data-toggle="modal"
					data-target="#addModal">新增</button>
			</div>
		</div>
		<table class="table table-striped table-bordered table-hover">
			<th>ID</th>
			<th>用户名</th>
			<th>密码</th>
			<th>操作</th>
			<c:forEach items="${ userList }" var="list">
				<tr>
					<td>${list.id }</td>
					<td>${list.userName }</td>
					<td>${list.passwrod }</td>
					<td colspan="2">
						<button class="btn btn-primary edBtn" data-toggle="modal" data-target="#edModal"
							value="${list.id }" n="${ list.userName}" p="${list.passwrod }">编辑</button>
						<button class="btn btn-danger delBtn" data-toggle="modal" data-target=".delModal"
							value="${list.id }">删除</button></td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>

<div class="modal fade delModal" tabindex="-1" role="dialog"
	aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<h4>确定删除吗?</h4>
			</div>
			<div class="modal-footer">
				<form action="DelServlet">
					<input id="delid" name="id" value="" hidden>
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-danger">删除</button>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- 编辑模态框 -->
<div class="modal fade" id="edModal" tabindex="-1" role="dialog" aria-labelledby="edModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">用户信息</h4>
			</div>
			<form action="UpdateServlet" method="post">
				<div class="modal-body">
					<input id="edId" name="id" value="" hidden>
					<div class="form-group">
						<label for="username" class="control-label">用户名:</label> <input
							type="text" name="username" class="form-control" id="username"
							value="${user.userName }" required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">密 码:</label> <input
							type="password" name="password" class="form-control" id="password"
							value="${user.password }" required>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">更新</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 添加模态框 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
	aria-labelledby="edModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">用户信息</h4>
			</div>
			<form action="addServlet" method="post">
				<div class="modal-body">
					<input id="edId" name="id" value="" hidden>
					<div class="form-group">
						<label for="username" class="control-label">用户名:</label> <input
							type="text" name="username" class="form-control" value="" required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">密 码:</label> <input
							type="password" name="password" class="form-control" value="" required>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">添加</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script type="text/javascript">
	// 删除按钮
	$(".delBtn").on("click", function() {
		$("#delid").val($(this).val());	// 获取当前点击按钮的值value值,并赋值给删除模态框的<input name="id"
	});
	// 编辑按钮
	$(".edBtn").on("click", function() {
		$("#edId").val($(this).val());	// 获取当前点击按钮的值value值,并赋值给编辑模态框的<input name="id"
		$("#username").val($(this).attr("n"));	//取按钮上的自定义属性值
		$("#password").val($(this).attr("p"));	//取按钮上的自定义属性值
	});
</script>


</html>