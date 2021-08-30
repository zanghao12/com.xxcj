<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body class="hold-transition sidebar-mini">
<script type="text/javascript">
	function update(id,name,description,actor,num,price) {
		sessionStorage.setItem("movieId", id); 
		sessionStorage.setItem("mName", name); 
		sessionStorage.setItem("description", description); 
		sessionStorage.setItem("actor", actor);
		sessionStorage.setItem("num", num); 
		sessionStorage.setItem("price", price); 
		$(location).attr("href","${pageContext.request.contextPath }/bymovie.do");
	}
	
	function movieUpdate() {
		var movieId = sessionStorage.getItem("movieId"); 
		var mName = $('#mName').val();
		var description = $('#description').val();
		var actor = $('#actor').val();
		var price = $('#price').val();
		var num = $('#num').val();
		$.ajax({
			  url:"${pageContext.request.contextPath }/movieUpdate.do",
			  method:"get",
			  contentType: 'text/json,charset=utf-8',
			  datatype:"json",
			  data:{"movieId":movieId,
					"mName":mName,
					"description":description,
					"actor":actor,
					"price":price,
					"num":num
					},
			  success:function(result){
			        if(result>0){
			        	alert("修改成功");
			        	location.reload(true);
			        }else{
			        	alert("修改失败");
			        }
			 		 
				}
		  });
	
	}
</script>
 <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">电影信息</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>电影名</th>
                    <th>电影介绍</th>
                    <th>主演</th>
                    <th>目前票数</th>
                    <th>票价</th>
                    <th>是否订票</th>
                  </tr>
                  </thead>
                  <tbody>
			      <c:forEach items="${movies}" var="movie" varStatus="status">
				      <c:if test="${status.index % 2 == 0 }">
					      <tr>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.mName}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.description}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.actor}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.num}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.price}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default" onclick="update('${movie.movieId}','${movie.mName}','${movie.description }','${movie.actor}','${movie.num}','${movie.price}')">订票</button></td>
					      </tr>
				      </c:if>
				      <c:if test="${status.index % 2 != 0 }">
					      <tr>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.mName}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.description}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.actor}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.num}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.price}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default" onclick="update('${movie.movieId}','${movie.mName}','${movie.description }','${movie.actor}','${movie.num}','${movie.price}')">订票</button></td>
					      </tr>
				      </c:if>
			      </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0" class="page-link">6</a></li><li class="paginate_button page-item next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li></ul></div>
  
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
<div class="modal fade show" id="modal-default" style="display: none; padding-right: 17px;" aria-modal="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">修改电影信息</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            
            <div class="modal-body">
              <form>
        <div class="input-group mb-3">
        电影名：
          <input type="text" class="form-control" id="mName" name="mName">
        </div>
        <div class="input-group mb-3">
         电影介绍：
          <input type="text" class="form-control" id="description" name="description">
        </div>
        <div class="input-group mb-3">
          主演：
          <input type="text" class="form-control" id="actor" name="actor">
        </div>
        <div class="input-group mb-3">
          票数：
          <input type="text" class="form-control" id="num" name="num">
        </div>
        <div class="input-group mb-3">
          票价：
          <input type="text" class="form-control" id="price" name="price">
        </div>
      </form>
            </div>
            
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" onclick="movieUpdate()">确认修改</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
</div>

</body>
</html>