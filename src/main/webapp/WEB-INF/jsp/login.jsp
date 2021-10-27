<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>电影在线订票系统</title>
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
<body class="hold-transition login-page">


<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>电影在线订票</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">登录您的用户</p>
  <!-- 表单提交 -->
      <form action="${pageContext.request.contextPath}/login.do">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="uname" id="uname" placeholder="用户名">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fa fa-user-circle"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="passwd" id="passwd" placeholder="密码">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="rememberMe" name="rememberMe" onclick="remember()">
              <label for="rememberMe">
              	 记住密码
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">登录</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <!-- /.social-auth-links -->
	
      <p class="mb-1 btn btn-block btn-outline-secondary btn-xs" style="margin:10px 0 0 0 ;">
        <a href="#">忘记密码</a>
      </p>
      <p class="mb-0 btn btn-block btn-outline-secondary btn-xs">
        <a href="toRegister.do" class="text-center">注册用户</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="./assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="./assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="./assets/dist/js/adminlte.min.js"></script>

</body>
<script type="text/javascript">
  $(function(){
    //cookie数据保存格式是key=value;key=value;形式，loginInfo为保存在cookie中的key值
    var str = getCookie("loginInfo");
    str = str.substring(0,str.length);
    var username = str.split("+")[0];
    var password = str.split("+")[1];
    //自动填充用户名和密码
    $("#uname").val(username);
    $("#passwd").val(password);
  })

  function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0)==' ') c = c.substring(1);
      if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
  }
  //选中记住密码触发事件，如果选中就赋值为1 ，否则赋值为0
  function remember(){
    var remFlag = $("input:checkbox").is(':checked');
    if(remFlag){
      //cookie存用户名和密码,回显的是真实的用户名和密码,存在安全问题.
      var conFlag = confirm("记录密码功能不宜在公共场所使用,以防密码泄露.您确定要使用此功能吗?");
      if(conFlag){
        //确认标志
        $("#rememberMe").val("1");
      }else{
        $("input:checkbox").removeAttr('checked');
        $("#rememberMe").val("0");
      }
    }else{
      //如果没选中设置remFlag为""
      $("#rememberMe").val("0");
    }
  }
</script>
</html>