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
					<form:input path="id" class="form-control" readonly="true" />
				</div>
				<div class="form-group col-sm-6">
					<label>Name</label>
					<form:input path="name" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Unit Price</label>
					<form:input path="unitPrice" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label>Quantity</label>
					<form:input path="quantity" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Discount</label>
					<form:input path="discount" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label>Product Date</label>
					<form:input path="productDate" class="form-control" placeholder="MM/dd/yyyy"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Special?</label>
					<div class="form-control">
					<form:radiobutton path="special" value="true" label="Yes" />
					<form:radiobutton path="special" value="false" label="No" />
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label>Available?</label>
					<div class="form-control">
					<form:radiobutton path="available" value="true" label="Yes" />
					<form:radiobutton path="available" value="false" label="No" />
					</div>
				</div>
			</div>
			<div class="row">

				<div class="form-group col-sm-6">
					<label>Category</label>
					<form:select path="category.id" class="form-control">
						<form:options items="${cates}" itemLabel="nameVN" itemValue="id" />
					</form:select>
				</div>
				<div class="form-group col-sm-6">
					<label>ViewCount</label>
					<form:input path="viewCount" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Photo</label> <input type="file" name="image_file"
						class="form-control">
					<form:hidden path="image" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<img class="img-responsive img-thumbnail" alt="image-img"
						src="/static/image/products/${entity.image}"
						style="width: 100px; height: 80px" >
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<label>Description</label>
					<form:textarea path="description" class="form-control" />
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

<script type="text/javascript">
//<![CDATA[
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
  //]]>
</script>
