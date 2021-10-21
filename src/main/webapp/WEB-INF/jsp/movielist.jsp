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
        $('#mName').val(name);
        $('#description').val(description);
        $('#actor').val(actor);
        $('#price').val(price);
        $('#num').val(num);
        sessionStorage.setItem("movieId", id);
    }

    function moviedelete(id){
        var movieId = id;
        if(confirm("是否删除？")){
            $.ajax({
                url:"${pageContext.request.contextPath }/movieDelete.do",
                method:"get",
                contentType: 'text/json,charset=utf-8',
                datatype:"json",
                data:{"movieId":movieId},
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
    function openindex(){
        window.location.href="index.do";
    }

    function movieinsert() {
        var mName = $('#mName2').val();
        var description = $('#description2').val();
        var actor = $('#actor2').val();
        var price = $('#price2').val();
        var num = $('#num2').val();
        $.ajax({
            url:"${pageContext.request.contextPath }/movieinsert.do",
            method:"get",
            contentType: 'text/json,charset=utf-8',
            datatype:"json",
            data:{"mName":mName,
                "description":description,
                "actor":actor,
                "price":price,
                "num":num
            },
            success:function(result){
                if(result>0){
                    alert("添加成功");
                    location.reload(true);
                }else{
                    alert("添加失败");
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
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#movieinsert">添加电影</button>
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>图片</th>
                                <th>电影名</th>
                                <th>电影介绍</th>
                                <th>主演</th>
                                <th>目前票数</th>
                                <th>票价</th>
                                <th>修改</th>
                                <th>删除</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${movies}" var="movie" varStatus="status">
                                <c:if test="${status.index % 2 == 0 }">
                                    <tr>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7">
                                            <c:if test="${movie.image !=null }">
                                                <img id="image" style="width: 80%"  src="/image/${movie.image }">
                                            </c:if>
                                        </td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.mName}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.description}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.actor}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.num}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.price}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default" onclick="update('${movie.movieId}','${movie.mName}','${movie.description }','${movie.actor}','${movie.num}','${movie.price}')">修改</button></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><button type="button" class="btn btn-danger" onclick="moviedelete('${movie.movieId}')" >删除</button></td>
                                    </tr>
                                </c:if>
                                <c:if test="${status.index % 2 != 0 }">
                                    <tr>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7">
                                            <c:if test="${movie.image !=null }">
                                                <img id="image" style="width: 80%"  src="/image/${movie.image }">
                                            </c:if>
                                        </td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.mName}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.description}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.actor}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.num}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><span class="txt">${movie.price}</span></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default" onclick="update('${movie.movieId}','${movie.mName}','${movie.description }','${movie.actor}','${movie.num}','${movie.price}')">修改</button></td>
                                        <td width="10%" height="30" align="center" bgcolor="#FFF5D7"><button type="button" class="btn btn-danger" onclick="moviedelete('${movie.movieId}')" >删除</button></td>
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
<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
    <ul class="pagination">
            <li class="paginate_button page-item active  <c:if test="${pageInfo.pageNum==1}">disabled</c:if> ">
                <a aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link" href="${pageContext.request.contextPath}/movielist.do?page=1" >&laquo;</a>
            </li>
            <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="pageNo">
                <li class="paginate_button page-item <c:if test="${pageInfo.pageNum==pageNo}">active</c:if>">
                    <a aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link" href="${pageContext.request.contextPath}/movielist.do?page=${pageNo}">${pageNo}</a></li>
            </c:forEach>
            <li class="paginate_button page-item  <c:if test="${pageInfo.pageNum==pageInfo.pages}">disabled</c:if> ">
                <a aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link" href="${pageContext.request.contextPath}/movielist.do?page=${pageInfo.pages}">&raquo;</a>
            </li>
    </ul></div>

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
<div class="modal fade show" id="movieinsert" style="display: none; padding-right: 17px;" aria-modal="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">添加电影信息</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>

            <div class="modal-body">
                <form>
                    <div class="input-group mb-3">
                        电影名：
                        <input type="text" class="form-control" id="mName2" name="mName">
                    </div>
                    <div class="input-group mb-3">
                        电影介绍：
                        <input type="text" class="form-control" id="description2" name="description">
                    </div>
                    <div class="input-group mb-3">
                        主演：
                        <input type="text" class="form-control" id="actor2" name="actor">
                    </div>
                    <div class="input-group mb-3">
                        票数：
                        <input type="text" class="form-control" id="num2" name="num">
                    </div>
                    <div class="input-group mb-3">
                        票价：
                        <input type="text" class="form-control" id="price2" name="price">
                    </div>
                        <button type="button"  onclick="openindex()" class="btn btn-block btn-default">上传图片</button>
                </form>
            </div>

            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="movieinsert()">确认添加</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</body>
</html>