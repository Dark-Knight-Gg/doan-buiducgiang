<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Fashi Template">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<!-- Css Styles -->
	<jsp:include page="/WEB-INF/views/admin/common/css.jsp"></jsp:include>

</head>

<body class="app sidebar-mini">

<jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/common/menu.jsp"></jsp:include>

<main class="app-content">
	<div class="app-title">
		<div>
			<h1><i class="fa fa-th-list"></i> Quản lý sản phẩm</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">Admin</li>
			<li class="breadcrumb-item active"><a href="#">Quản lý sản phẩm</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
							<h2>Bổ sung sản phẩm</h2>
							<div class="my-4">

								<form:form method="post" id="formname" action="/admin/save-product" modelAttribute="product" enctype="multipart/form-data">
									<form:hidden path="id"/>

									<div class="form-group">
										<label>Category</label>
										<form:select class="form-control form-control-line" path="category.id">
											<form:options items="${categories}" itemValue="id" itemLabel="name"/>
										</form:select>
									</div>
									<div class="form-group">
										<label>Mã sản phẩm</label>
										<form:input type="text" class="form-control" path="code" id="code" /><span style="color:red;" id="numloc1"></span><br/>
									</div>
									<div class="form-group">
										<label>Title</label>
										<form:input type="text" class="form-control" path="title" id="title"/><span style="color:red;" id="numloc2"></span><br/>
										<small id="emailHelp" class="form-text text-muted">
											Tối đa 15 kí tự.
										</small>
									</div>
									<div class="form-group">
										<label>Nhà xuất bản</label>
										<form:input type="text" class="form-control" path="size" id="size"/><span style="color:red;" id="numloc7"></span><br/>
									</div>
									<div class="form-group">
										<label>Tác giả</label>
										<form:input type="text" class="form-control" path="style" id="style"/><span style="color:red;" id="numloc8"></span><br/>
									</div>
									<div class="form-group">
										<label>Năm xuất bản</label>
										<form:input type="text" class="form-control" path="year" id="year"/><span style="color:red;" id="numloc9"></span><br/>
									</div>
									<div class="form-group">
										<label>Short Description</label>
										<form:input type="text" class="form-control" path="shortDes" id="shortDes"/><span style="color:red;" id="numloc3"></span><br/>
										<small id="emailHelp" class="form-text text-muted">
											Sẽ hiển thị tại màn hình danh sách sản phẩm.
										</small>
									</div>
									<div class="form-group">
										<label>Giá bán</label>
										<form:input type="text" class="form-control" path="price" id="price"/><span style="color:red;" id="numloc4"></span><br/>
										<small id="emailHelp" class="form-text text-muted">
											Đơn vị tính là VNĐ.
										</small>
									</div>

									<div class="form-group">
										<label>Details description</label>
										<form:textarea id="txtDetailDescription" class="form-control" path="shortDetails" /><span style="color:red;" id="numloc5"></span><br/>
									</div>

									<div class="form-group">
										<label>Avatar</label>
										<input type="file" id="avatar" name="productImage" class="form-control"><span style="color:red;" id="numloc6"></span><br/>
									</div>

									<div class="form-group">
										<label>Status</label>
										<form:checkbox path="status" />
									</div>

									<button type="submit" id="save-product" class="btn btn-primary btn-sm">Save</button>
									<a href="${base }/admin/list-product" class="btn btn-secondary btn-sm">Quay lại</a>
								</form:form>
							</div>
						</main>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- js-->
<jsp:include page="/WEB-INF/views/admin/common/js.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$('#txtDetailDescription').summernote();
	});
	$(document).ready(function() {
		$("#formname").submit(function (e) {
			if ($("#code").val() == "" ) {
				document.getElementById("numloc1").innerHTML="Không được bỏ trống";
				e.preventDefault();
			}else{
				document.getElementById("numloc1").innerHTML="";
			}
			if ($("#title").val() == "" ) {
				document.getElementById("numloc2").innerHTML="Không được bỏ trống";
				e.preventDefault();
			}else{
				document.getElementById("numloc2").innerHTML="";
			}
			if ($("#shortDes").val() == "" ) {
				document.getElementById("numloc3").innerHTML="Không được bỏ trống";
				e.preventDefault();
			}else{
				document.getElementById("numloc3").innerHTML="";
			}
			if ($("#price").val() == "" ) {
				document.getElementById("numloc4").innerHTML="Không được bỏ trống";
				e.preventDefault();
			}else{
				document.getElementById("numloc4").innerHTML="";
			}
			if ($("#txtDetailDescription").val() == "" ) {
				document.getElementById("numloc5").innerHTML="Không được bỏ trống";
				e.preventDefault();
			}else{
				document.getElementById("numloc5").innerHTML="";
			}
			if ($("#avatar").val() == "" ) {
				document.getElementById("numloc6").innerHTML="Không được bỏ trống";
				e.preventDefault();
			}else{
				document.getElementById("numloc6").innerHTML="";
			}
			if ($("#size").val() == "" ) {
				document.getElementById("numloc7").innerHTML="Không được bỏ trống";
				e.preventDefault();
			}else{
				document.getElementById("numloc7").innerHTML="";
			}
			if ($("#style").val() == "" ) {
				document.getElementById("numloc8").innerHTML="Không được bỏ trống";
				e.preventDefault();
			}else{
				document.getElementById("numloc8").innerHTML="";
			}
			if ($("#year").val() == "" ) {
				document.getElementById("numloc9").innerHTML="Không được bỏ trống";
				e.preventDefault();
			}else{
				document.getElementById("numloc9").innerHTML="";
			}
		});
	});
</script>

</body>
</html>