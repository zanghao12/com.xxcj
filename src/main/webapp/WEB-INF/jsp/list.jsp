<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Insert title here</title>
    <style type="text/css">
        #images{
            width: 100px;
            height: 100px;
        }
    </style>
</head>
<body>
<table class="table table-bordered table-hover">
    <tr>
        <th>序号:</th>
        <th>图片:</th>
    </tr>
    <c:forEach items="${list}" var="product">
        <tr>
            <th>${product.pid }</th>
            <th><c:if test="${product.pimage !=null }">
                <img id="images"  src="/image/${product.pimage }">
            </c:if>
            </th>
        </tr>
    </c:forEach>
</table>
</body>
</html>