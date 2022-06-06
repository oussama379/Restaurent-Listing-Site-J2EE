<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <%@ include file = "admin/admin_head.jsp"%>
</head>

<body class="fixed-nav sticky-footer" id="page-top">
 <!-- Navigation-->
 <%@ include file = "admin/admin_navigation.jsp"%>
<!-- /Navigation-->
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
<%--      <ol class="breadcrumb">--%>
<%--        <li class="breadcrumb-item">--%>
<%--          <a href="#">Manage Users</a>--%>
<%--        </li>--%>
<%--        <li class="breadcrumb-item active">List of Users</li>--%>
<%--      </ol>--%>
      <div class="mb-4"></div>
		<!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> List of Users</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>First name</th>
                  <th>Last name</th>
                  <th>Username</th>
                  <th>Email</th>
                  <th>Role</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>First name</th>
                  <th>Last name</th>
                  <th>Username</th>
                  <th>Email</th>
                  <th>Role</th>
                </tr>
              </tfoot>
              <tbody>
              <c:forEach items="${modelUser.getUsers()}" var="u">
                <tr>
                  <td>${u.firstname}</td>
                  <td>${u.lastname}</td>
                  <td>${u.username}</td>
                  <td>${u.email}</td>
                  <td>${u.role}</td>
                  <td><a href="editUser.php?id=${u.id}" class="btn_1 small">Edit</a></td>
                  <td><a href="deleteUser.php?id=${u.id}" class="btn_1 small">Delete</a></td>
                </tr>
              </c:forEach>
              <c:if test="${modelUser.getUsers().isEmpty()}">
                <div class="alert alert-warning mb-2 text-center" role="alert">
                  No records found
                </div>
              </c:if>
              </tbody>
            </table>
          </div>
        </div>
      </div>
	  <!-- /tables-->
       <br>
      <br>

      <c:choose>
        <c:when test="${confirmation == true}">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card dashboard text-white bg-success o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fa fa-fw fa-check"></i>
                </div>
                <div class="mr-5"><h5>Successfully deleted</h5></div>
              </div>
            </div>
          </div>
        </c:when>
        <c:when test="${confirmation == false}">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card dashboard text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fa fa-exclamation-triangle"></i>
                </div>
                <div class="mr-5"><h5>Unsuccessfully deleted</h5></div>
              </div>
            </div>
          </div>
        </c:when>
      </c:choose>
	  </div>
	  <!-- /container-fluid-->
   	</div>
    <!-- /container-wrapper-->

 <%@ include file = "admin/admin_footer.jsp"%>
	<!-- Custom scripts for this page-->
    <script src="resources/js_admin/admin-datatables.js"></script>
 <script src="resources/js_admin/toastr.min.js"></script>
 <script>
   window.onload = function() {
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

     if ("${errorMessage}" == "Deleted Successfully" || "${errorMessage}" == "Saved Successfully"){
       toastr["success"]("", "${errorMessage}")
     }
     if ("${errorMessage}" == "Error while Deleting"){
       toastr["error"]("", "${errorMessage}")
     }
   }
 </script>
</body>
</html>
