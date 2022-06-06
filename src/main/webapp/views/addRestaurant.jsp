<%@ page import="com.example.restaurantmanagement.utils.AppUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="r" value="${modelRestaurant.getRestaurantToEdit()}"/>
<c:set var="blocks" value='${["Medina", "Oudayas", "Hassan", "Océan", "Les Orangers", "Diour Jamaa", "Aakkari", "Yacoub El Mansour", "Massira", "Hay el Fath", "Youssoufia", "Douar el Hajja", "Mabella", "Taqaddoum", "Hay Nahda", "Aviation", "Rommani", "Agdal", "Hay Riad", "Souissi", "Les Ambassadeurs"]}'/>
<c:set var="hours" value='${["1 AM", "2 AM", "3 AM", "4 AM", "5 AM", "6 AM", "7 AM", "8 AM", "9 AM", "10 AM", "11 AM", "12 AM", "1 PM", "2 PM", "3 PM", "4 PM", "5 PM", "6 PM", "7 PM", "8 PM", "9 PM", "10 PM", "11 PM", "12 PM"]}'/>
<%
	String loggedUserRole = AppUtils.getLoginedUser(request.getSession()).getRole();
	String removeMargin = "";
	if (!loggedUserRole.equals("ADMIN")) removeMargin = "margin-right: 250px;";
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file = "admin/admin_head.jsp"%>
	<style>
		.horizontal-scrollable > .row {
			overflow-x: auto;
			flex-wrap: nowrap;
		}

		.horizontal-scrollable > .row > .card{
			display: inline-table;
			float: none;
		}
		.pic-container {
			height: 10rem;
			overflow-y: auto;
			overflow-x:hidden;
		}
		.card {
			min-height: 11rem;
			min-width: 18rem;
			width: 18rem;
			height: 11rem;
			margin-right: 5px;
		}
		.required:after {
			content:" *";
			font-weight:bold;
			color: red;
		}
	</style>
</head>

<body class="fixed-nav sticky-footer" id="page-top">
<!-- Navigation-->
  <%@ include file = "admin/admin_navigation.jsp"%>
<!-- /Navigation-->

  <form class="content-wrapper" action="saveRestaurant.phpp" method="post" onsubmit="getTags()"
		enctype="multipart/form-data" style="<%= removeMargin %>">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
<%--      <ol class="breadcrumb">--%>
<%--	  	<li class="breadcrumb-item">Manage Restaurant</li>--%>
<%--        <li class="breadcrumb-item active">--%>
<%--          <a href="addRestaurant.phpp">Add Restaurant</a>--%>
<%--        </li>--%>
<%--      </ol>--%>
		<div class="mb-4"></div>
	  	<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-file"></i>Restaurant Informations</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Listing Title</label>
						<input type="text" class="form-control" placeholder="Restaurant Title" name="name"
							   value="${r.name}" required>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>Description</label>
						<textarea id="description" name="description" class="form-control">${r.description}</textarea>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Cuisine Type</label>
						<input type="text" class="form-control" placeholder="Ex. Traditional dishes " name="typeCuisine" value="${r.typeCuisine}" required>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Tags</label>
						<input type="text" id="tags" name="tags" class="form-control" placeholder="Tags should be separated by commas. Ex: Wifi, Alcohol, ...." hidden value="${r.tags}">
						<div id="example" class="form-control"></div>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>Phone (Optional)</label>
						<input type="text" class="form-control" name="phone" value="${r.phone}">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Web site (Optional)</label>
						<input type="text" class="form-control" placeholder="Ex. https://google.com" name="webSite" value="${r.webSite}">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Email (Optional)</label>
						<input type="text" class="form-control" name="email" value="${r.email}">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>Facebook link (Optional)</label>
						<input type="text" class="form-control" placeholder="Ex. https://facebook.com/..." name="facebook" value="${r.facebook}">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Instagram link (Optional)</label>
						<input type="text" class="form-control" placeholder="Ex. https://instagram.com/..." name="instagram" value="${r.instagram}">
					</div>
				</div>
			</div>
			<!-- /row-->
	  </div>
		<!-- /box_general-->

		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-camera"></i>Pictures</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Restaurant pictures</label>
						<c:if test="${r != null}">
							<div class="container-fluid py-2" style="overflow-x: auto; border: 1px solid #ced4da; margin-bottom: 5px">
								<div class="d-flex flex-row flex-nowrap">
									<c:set var="i" value="0"/>
									<c:forEach var = "image" items="${r.images.split(':')}" >
										<div id="${r.id}PIC${i}" class="card">
											<div class="pic-container">
												<img src="upload/restaurants/${image}" class="card-img-top" alt="Not Found">
											</div>
											<div class="card-body d-flex align-items-end" style="padding: 0.1rem 0 0 0">
												<a href="#" onclick="setMainPicture(${r.id}, ${i})" class="btn col-6 btn-success">Principale</a>
												<a href="#" onclick="deletePicture(${r.id}, ${i}, '${r.id}PIC${i}', 'PIC')" class="btn col-6 btn-danger">Delete</a>
											</div>
										</div>
										<c:set var="i" value="${i+1}"/>
									</c:forEach>
								</div>
							</div>
							<label>Add new pictures</label>
						</c:if>
						<input class="form-control form-control-lg" id="pictures" name="pictures" type="file" multiple <c:if test="${r == null}">required</c:if> >
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Menu pictures</label>
						<c:if test="${r != null}">
							<div class="container-fluid py-2" style="overflow-x: auto; border: 1px solid #ced4da; margin-bottom: 5px">
								<div class="d-flex flex-row flex-nowrap">
									<c:set var="i" value="0"/>
									<c:forEach var = "image" items="${r.menuImages.split(':')}" >
										<div id="${r.id}MENU${i}" class="card">
											<div class="pic-container">
												<img src="upload/restaurants/${image}" class="card-img-top" alt="Not Found">
											</div>
											<div class="card-body d-flex align-items-end" style="padding: 0.1rem 0 0 0">
<%--												<a href="#" onclick="setMainPicture(${r.id}, ${i})" class="btn col-6 btn-success">Principale</a>--%>
												<a href="#" onclick="deletePicture(${r.id}, ${i}, '${r.id}MENU${i}', 'MENU')" class="btn col-12 btn-danger">Delete</a>
											</div>
										</div>
										<c:set var="i" value="${i+1}"/>
									</c:forEach>
								</div>
							</div>
							<label>Add new pictures</label>
						</c:if>
						<input class="form-control form-control-lg" id="menu" name="menu" type="file" multiple <c:if test="${r == null}">required</c:if>>
					</div>
				</div>
			</div>
		</div>
		<!-- /box_general-->

		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-map-marker"></i>Location</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>Address</label>
						<input type="text" class="form-control" placeholder="ex. 250, Fifth Avenue..." name="address"
							   value="${r.address}" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Neighborhood</label>
						<div class="styled-select">
							<select name="block" required>
								<option value="" disabled selected>Select</option>
							<c:forEach var="var" items="${blocks}" >
								<option value="${var}" <c:if test="${var.equals(r.block)}">selected</c:if> >${var}</option>
							</c:forEach>
<%--								<option value="" disabled selected>Select</option>--%>
<%--								<option value="Medina">Medina</option>--%>
<%--								<option value="Oudayas">Oudayas</option>--%>
<%--								<option value="Hassan">Hassan</option>--%>
<%--								<option value="Océan">Océan</option>--%>
<%--								<option value="Les Orangers">Les Orangers</option>--%>
<%--								<option value="Diour Jamaa">Diour Jamaa</option>--%>
<%--								<option value="Aakkari">Aakkari</option>--%>
<%--								<option value="Yacoub El Mansour">Yacoub El Mansour</option>--%>
<%--								<option value="Massira">Massira</option>--%>
<%--								<option value="Hay el Fath">Hay el Fath</option>--%>
<%--								<option value="Youssoufia">Youssoufia</option>--%>
<%--								<option value="Douar el Hajja">Douar el Hajja</option>--%>
<%--								<option value="Mabella">Mabella</option>--%>
<%--								<option value="Taqaddoum">Taqaddoum</option>--%>
<%--								<option value="Hay Nahda">Hay Nahda</option>--%>
<%--								<option value="Aviation">Aviation</option>--%>
<%--								<option value="Rommani">Rommani</option>--%>
<%--								<option value="Agdal">Agdal</option>--%>
<%--								<option value="Hay Riad">Hay Riad</option>--%>
<%--								<option value="Souissi">Souissi</option>--%>
<%--								<option value="Les Ambassadeurs">Les Ambassadeurs</option>--%>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Google Maps Link (Optional)</label>
						<input type="text" class="form-control" placeholder="https://maps.google.com/....." name="googleMaps" value="${r.googleMaps}">
					</div>
				</div>
			</div>
		</div>
		<!-- /box_general-->

		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-clock-o"></i>Opening</h2>
			</div>
			<div class="row">
				<div class="col-md-2">
					<label class="fix_spacing">Normal Days</label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<div class="styled-select">
						<select name="openingTime" required>
							<option value="" disabled selected>Opening Time</option>
							<c:forEach var="var" items="${hours}" >
								<option value="${var}" <c:if test="${var.equals(r.openingTime)}">selected</c:if> >${var}</option>
							</c:forEach>
<%--							<option>Closed</option>--%>
<%--							<option>1 AM</option>--%>
<%--							<option>2 AM</option>--%>
<%--							<option>3 AM</option>--%>
<%--							<option>4 AM</option>--%>
<%--							<option>5 AM</option>--%>
<%--							<option>6 AM</option>--%>
<%--							<option>7 AM</option>--%>
<%--							<option>8 AM</option>--%>
<%--							<option>9 AM</option>--%>
<%--							<option>10 AM</option>--%>
<%--							<option>11 AM</option>--%>
<%--							<option>12 AM</option>	--%>
<%--							<option>1 PM</option>--%>
<%--							<option>2 PM</option>--%>
<%--							<option>3 PM</option>--%>
<%--							<option>4 PM</option>--%>
<%--							<option>5 PM</option>--%>
<%--							<option>6 PM</option>--%>
<%--							<option>7 PM</option>--%>
<%--							<option>8 PM</option>--%>
<%--							<option>9 PM</option>--%>
<%--							<option>10 PM</option>--%>
<%--							<option>11 PM</option>--%>
<%--							<option>12 PM</option>--%>
						</select>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<div class="styled-select">
						<select name="closingTime" required>
							<option value="" disabled selected>Closing Time</option>
						<c:forEach var="var" items="${hours}" >
							<option value="${var}" <c:if test="${var.equals(r.closingTime)}">selected</c:if> >${var}</option>
						</c:forEach>
						</select>
						</div>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-2">
					<label class="fix_spacing">The Week-End</label>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<div class="styled-select">
						<select name="openingTimeWeekEnd" required>
							<option value="" disabled selected>Opening Time</option>
							<c:forEach var="var" items="${hours}" >
								<option value="${var}" <c:if test="${var.equals(r.openingTimeWeekEnd)}">selected</c:if> >${var}</option>
							</c:forEach>
						</select>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<div class="styled-select">
						<select name="closingTimeWeekEnd" required>
							<option value="" disabled selected>Closing Time</option>
							<c:forEach var="var" items="${hours}" >
								<option value="${var}" <c:if test="${var.equals(r.closingTimeWeekEnd)}">selected</c:if> >${var}</option>
							</c:forEach>
						</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /box_general-->
		
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-dollar"></i>Cost </h2>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>Average Pricing for One Person</label>
						<input type="text" class="form-control" placeholder="Price in DH" name="averageCost"
							   value="${r.averageCost}" required>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label>Accepted payments methods</label>
						<input type="text" class="form-control" placeholder="Cash, Cards" id="payment" name="payment"
							   value="${r.payment}" hidden>
						<div id="paymentDiv" class="form-control"></div>
					</div>
				</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		<c:if test="${r != null}">
			<input type="hidden" name="id" value="${r.id}">
		</c:if>
	  <button type="submit" class="btn_1 medium">Save</button>
	</div>
<%--	  </form>--%>
  </form>

	  <!-- /.container-fluid-->
    <!-- /.container-wrapper-->

	<%@ include file = "admin/admin_footer.jsp"%>
	<!-- Custom scripts for this page-->
	<script src="resources/vendor_admin/dropzone.min.js"></script>
	<script src="resources/vendor_admin/bootstrap-datepicker.js"></script>
	<script>$('input.date-pick').datepicker();</script>
  	<!-- WYSIWYG Editor -->
  	<script src="resources/js_admin/editor/summernote-bs4.min.js"></script>
	<%-- For Tags --%>
	<script src="resources/js_admin/magicsuggest.js"></script>
	<%-- For Toast --%>
	<script src="resources/js_admin/toastr.min.js"></script>

	<%-- Custom Script --%>
	<script>
		$("input[required]").parent("div").children("label").addClass("required");
	  $('.editor').summernote({
		fontSizes: ['10', '14'],
		toolbar: [
		  // [groupName, [list of button]]
		  ['style', ['bold', 'italic', 'underline', 'clear']],
		  ['font', ['strikethrough']],
		  ['fontsize', ['fontsize']],
		  ['para', ['ul', 'ol', 'paragraph']]
		  ],
			placeholder: 'Write here your description....',
			tabsize: 2,
			height: 200
	  });
	  /*----------------------------------------------------------*/
	  toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": false,
		  "positionClass": "toast-bottom-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
	  }
	  /*----------------------------------------------------------*/
	  var paymentData = ['Cash','Card']
	  var editPaymentData = $("#payment").val()
	  $(function() {
		  var instance = $('#paymentDiv').magicSuggest({
			  data: paymentData,
			  value: (editPaymentData === "")? null : editPaymentData.split(','),
		  });
	  });
	  /*----------------------------------------------------------*/
	  var myData = ['Wifi','Seaside','Outdoor Seating']
	  var editData = $("#tags").val()
	  $(function() {
		  var instance = $('#example').magicSuggest({
			  data: myData,
			  value: (editData === "")? null : editData.split(','),
		  });
	  });
	  function getTags(){
		  var instance = $('#example').magicSuggest({
			  data: myData,
		  });
		  var instance2 = $('#paymentDiv').magicSuggest({
			  data: paymentData,
		  });

		  $("#tags").val(instance.getValue().toString());
		  $("#payment").val(instance2.getValue().toString());
	  }
	  /*----------------------------------------------------------*/
	  function setMainPicture(id, index){
		  $.post( "setMainPicture.phpp",
				  { id: id, index: index },
				  function() {
					  toastr["success"]("", "Picture changed")
				  }
		  ).fail(function() {
			  toastr["error"]("", "Change fail")
		  });
	  }
	  /*----------------------------------------------------------*/
	  function deletePicture(id, index, element, type) {
		  $.post("deletePicture.phpp",
				  {id: id, index: index, type: type},
				  function () {
					  toastr["success"]("", "Picture deleted")
					  $("#"+element).remove()
				  }
		  ).fail(function () {
			  toastr["error"]("", "Delete fail")
		  });
	  }
	</script>
	
</body>
</html>
