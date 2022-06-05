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
<%--        <ol class="breadcrumb">--%>
<%--            <li class="breadcrumb-item">--%>
<%--                <a href="#">Dashboard</a>--%>
<%--            </li>--%>
<%--            <li class="breadcrumb-item active">List of Restaurants</li>--%>
<%--        </ol>--%>
        <div class="mb-4"></div>
        <!-- Example DataTables Card-->
        <div class="box_general">
            <div class="header_box">
                <h2 class="d-inline-block">Restaurant add requests</h2>
<%--                <div class="filter">--%>
<%--                    <select name="orderby" class="selectbox">--%>
<%--                        <option value="Any status">Any status</option>--%>
<%--                        <option value="Pending">Pending</option>--%>
<%--                        <option value="Cancelled">Cancelled</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
            </div>
            <div class="list_general">
                <ul>
                    <c:forEach items="${modelRestaurant.getRestaurants()}" var="r">
                        <a href="restaurantDetail.phpp?id=${r.id}">
                            <li>
                                <figure><img src="upload/restaurants/${r.images.split(":")[0]}" alt=""></figure>
                                <h4>${r.name} <i class="pending">Pending</i></h4>
                                <p>Address : ${r.address}</p>
                                <ul class="buttons">
                                    <li><a href="editRestaurant.phpp?id=${r.id} " class="btn_1 gray mr-3">Edit</a></li>
                                    <li><a href="approveRestaurant.phpp?id=${r.id} " class="btn_1 gray approve">Approve</a></li>
                                    <li><a href="cancelRestaurant.phpp?id=${r.id} " class="btn_1 gray delete">Cancel</a></li>
                                </ul>
                            </li>
                        </a>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <!-- /box_general-->
        <br>
        <br>
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

        if ("${successMessage}" !== ""){
            toastr["success"]("", "${successMessage}")
        }
        if ("${errorMessage}" !== ""){
            toastr["error"]("", "${errorMessage}")
        }
    }
</script>
</body>
</html>
