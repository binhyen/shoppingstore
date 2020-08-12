<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity"
			enctype="multipart/form-data">
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Id</label>
					<form:input path="id" class="form-control" readonly="${not empty entity.id}"/>
				</div>
				<div class="form-group col-sm-6">
					<label>Password</label>
					<form:input path="password" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>FullName</label>
					<form:input path="fullname" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label>Email</label>
					<form:input path="email" class="form-control" />
				</div>
			</div>
			<div class="row">

				<div class="form-group col-sm-6">
					<label>Activated</label>
					<div class="form-control">
						<form:radiobutton path="activated" value="true" label="Yes" />
						<form:radiobutton path="activated" value="false" label="No" />
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label>Admin</label>
					<div class="form-control">
						<form:radiobutton path="admin" value="true" label="Yes" />
						<form:radiobutton path="admin" value="false" label="No" />
					</div>
				</div>

			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Photo</label> <input type="file" name="photo_file"
						class="form-control">
					<form:hidden path="photo" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<img class="img-responsive img-thumbnail" alt="photo-img"
						src="/static/image/customers/${entity.photo}"
						style="width: 100px; height: 80px" >
				</div>
			</div>



			<div class="form-group">
				<button class="btn btn-sm btn-primary" formaction="${base}/create">Create</button>
				<button class="btn btn-sm btn-warning" formaction="${base}/update">Update</button>
				<button class="btn btn-sm btn-danger" formaction="${base}/delete">Delete</button>
				<a class="btn btn-sm btn-default" href="${base}/index">Reset</a>
			</div>
		</form:form>
	</div>
</div>

