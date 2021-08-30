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
	function update(id,name,passwd,role) {
		$('#name').val(name);
		$('#passwd').val(passwd);
		$('#role').val(role);
		sessionStorage.setItem("id", id); 
	}
	
	function userdelete(id){
		var userid = id;
		if(confirm("是否删除？")){
		$.ajax({
			  url:"${pageContext.request.contextPath }/userDelete.do",
			  method:"get",
			  contentType: 'text/json,charset=utf-8',
			  datatype:"json",
			  data:{"userId":userid},
			  success:function(result){
			        if(result>0){
			        	alert("删除成功");
			        	location.reload(true);
			        }else{
			        	alert("删除失败");
			        }
			 		 
				}
		  });
		}
	}
	
	function userUpdate() {
		var id = sessionStorage.getItem("id"); 
		var name = $('#name').val();
		var passwd = $('#passwd').val();
		var role = $('#role').val();
		$.ajax({
			  url:"${pageContext.request.contextPath }/userUpdate.do",
			  method:"get",
			  contentType: 'text/json,charset=utf-8',
			  datatype:"json",
			  data:{"userId":id,
					"uname":name,
					"passwd":passwd,
					"urole":role
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
                <h3 class="card-title">DataTable with minimal features & hover style</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>用户名</th>
                    <th>用户密码</th>
                    <th>订票数量</th>
                    <th>角色</th>
                    <th>修改</th>
                    <th>删除</th>
                  </tr>
                  </thead>
                  <tbody>
			      <c:forEach items="${users}" var="user" varStatus="status">
				      <c:if test="${status.index % 2 == 0 }">
					      <tr>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${user.uname}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${user.passwd}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${user.cout}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">
					        <c:choose>  
							   <c:when test="${user.urole ==1}"> 
							       <span>普通用户</span>
							   </c:when> 
							   <c:when test="${user.urole ==2}"> 
							       <span>会员用户</span>
							   </c:when> 
							</c:choose>
					        </span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default" onclick="update('${user.userId}','${user.uname }','${user.passwd }','${user.urole }')">修改</button></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><button type="button" class="btn btn-danger" onclick="userdelete('${user.userId}')" >删除</button></td>
					      </tr>
				      </c:if>
				      <c:if test="${status.index % 2 != 0 }">
					      <tr>
					        <td width="10%" height="30" align="center" bgcolor="#FFFFFF"><span class="txt">${user.uname}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFFFFF"><span class="txt">${user.passwd}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF"><span class="txt">${user.cout}</span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF"><span class="txt">
					        <c:choose>  
							   <c:when test="${user.urole ==1}"> 
							       <span>普通用户</span>
							   </c:when> 
							   <c:when test="${user.urole ==2}"> 
							       <span>会员用户</span>
							   </c:when> 
							</c:choose>
					        </span></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFFFFF"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default" onclick="update('${user.userId}','${user.uname }','${user.passwd }','${user.urole }')" >修改</button></td>
					        <td width="10%" height="30" align="center" bgcolor="#FFF"><button type="button" class="btn btn-danger" onclick="userdelete('${user.userId}')" >删除</button></td>
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
              <h4 class="modal-title">修改用户信息</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            
            <div class="modal-body">
              <form>
        <div class="input-group mb-3">
        用户名：
          <input type="text" class="form-control" id="name" name="uname">
        </div>
        <div class="input-group mb-3">
         密码：
          <input type="text" class="form-control" id="passwd" name="passwd">
        </div>
        <div class="input-group mb-3">
          角色：
          <input type="text" class="form-control" id="role" name="role">
        </div>
      </form>
            </div>
            
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" onclick="userUpdate()">确认修改</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
</div>

</body>
</html>