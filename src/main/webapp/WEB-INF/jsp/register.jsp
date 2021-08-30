<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>注册</title>
  
  <script type="text/javascript" src="./js/jquery-1.9.1.min.js"></script>
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="./assets/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="./assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./assets/dist/css/adminlte.css">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="">用户注册</a>
  </div>

  <div class="card">
    <div class="card-body register-card-body">

      <form>
        <div class="input-group mb-3">
          <input type="text" id="name" class="form-control" name="uname" placeholder="用户名">
          <span form-control id="ts"></span><br>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" id="pass" class="form-control" name="passwd" placeholder="密码">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" id="pass2" class="form-control" placeholder="确认密码">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
             <span form-control id="ts"></span>
            </div>
          </div>
          <!-- /.col -->
         
          <!-- /.col -->
        </div>
      </form>
      <button type="submit" id="submit" class="btn btn-primary btn-block">Register</button>
<!--
      <div class="social-auth-links text-center">
        <p>- OR -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i>
          Sign up using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i>
          Sign up using Google+
        </a>
      </div>
-->
      <a href="login.jsp" class="text-center">我已经有账号</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->
<script type="text/javascript">
  $(document).ready(function(){
	  $('#name').blur(function(){
		  var uname = $("#name").val();
		  if(uname==null||uname==""){
			  $("#ts").text("用户名不能为空");
				return;
			}
		  $.ajax({
			  url:"${pageContext.request.contextPath }/quname.do",
			  method:"get",
			  contentType: 'text/json,charset=utf-8',
			  datatype:"json",
			  data:{"uname":uname},
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
	  })
	  
	  $("#submit").click(function(){
			var uname=$("#name").val();
			var passwd=$("#pass").val();
			var passwd2=$("#pass2").val();
			if(uname=="" || passwd=="" || passwd2=="" ){
				alert("请勿输入空值");
				return;
			}else if (passwd != passwd2){
				alert("请保持密码和确认密码一致");
				return;
			}
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath }/register.do",
				data:{
					"uname":uname,
					"passwd":passwd
				},
				success:function(result){
				if(result==1){
					alert("注册成功");
					$(location).attr("href","${pageContext.request.contextPath }/userlist.do");
					/*换地址  */
				}else{
					alert("注册失败");
				}
				}
			})
		});
	 
	  
  });

  </script>
<!-- jQuery -->
<script src="./assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="./assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="./assets/dist/js/adminlte.min.js"></script>
</body>
</html>
