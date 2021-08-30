<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
     <!-- Font Awesome -->
  <link rel="stylesheet" href="./assets/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="./assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="./assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./assets/dist/css/adminlte.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="hold-transition login-page">
<script src="./assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="./assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="./assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="./assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="./assets/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="./assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- jQuery -->
<script src="./assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="./assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- SweetAlert2 -->
<script src="./assets/plugins/sweetalert2/sweetalert2.min.js"></script>



<div class="content-wrapper" style="min-height: 16.81px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">E-commerce</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body">
          <div class="row">
            <div class="col-12 col-sm-6">
              <h3 class="d-inline-block d-sm-none">LOWA Men’s Renegade GTX Mid Hiking Boots Review</h3>
              <div class="col-12">
                <img src="./assets/dist/img/prod-1.jpg" class="product-image" alt="Product Image">
              </div>
              
            </div>
            <div class="col-12 col-sm-6">
              <h3 class="my-3" id="mName"></h3>
              <hr>
              <div class="bg-gray py-2 px-3 mt-4">
                <h2 class="mb-0" >
                价格：<span id="prices"></span>
                </h2>
              </div>
              <div class="bg-gray py-2 px-3 mt-4">
                <h2 class="mb-0" >
                主演：<span id="actor"></span>
                </h2>
              </div>
			<div class="bg-gray py-2 px-3 mt-4">
                <h2 class="mb-0" >
                目前票数：<span id="num"></span>
                </h2>
              </div>
              <div class="mt-4">
                <div id="toOrdersdi" class="btn btn-primary btn-lg btn-flat">
                  <i class="fas fa-cart-plus fa-lg mr-2"></i> 
                  	添加订单
                </div>
              </div>
            </div>
          </div>
          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">描述：</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent">
              <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"><span id="description"></span></div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>

</body>
<script type="text/javascript">
$(document).ready(function(){
		var mName = sessionStorage.getItem("mName");
		var description = sessionStorage.getItem("description"); 
		var actor = sessionStorage.getItem("actor"); 
		var price = sessionStorage.getItem("price"); 
		var num = sessionStorage.getItem("num"); 
		document.getElementById('mName').innerHTML= mName;
		document.getElementById('prices').innerHTML= price;
		document.getElementById('description').innerHTML= description;
		document.getElementById('actor').innerHTML= actor;
		document.getElementById('num').innerHTML= num;
	})
	
	$('#toOrdersdi').click(
		function () {
			var movieId = sessionStorage.getItem("movieId"); 
			var cout = 1;
			if(cout>sessionStorage.getItem("num")){
				return;
			}
			$.ajax({
				  url:"${pageContext.request.contextPath }/ordersdi.do",
				  method:"get",
				  contentType: 'text/json,charset=utf-8',
				  datatype:"json",
				  data:{"movieId":movieId,
						"cout":cout 
				  },
				  success:function(result){
				        if(result==1){
				        	alert("此用户已被注册");
				        	$("#name").val("");
				        }else{
				        	$("#ts").text("该用户可以使用");
				        }
					},
					failed:function(result){}
			  });
		}		
	)
	
</script>
</html>