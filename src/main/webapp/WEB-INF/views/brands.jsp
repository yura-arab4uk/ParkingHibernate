<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script
            src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    <title>Brands</title>
    <style>
        body {
            background-color: #e1e1e3;
        }

    </style>
    <script>
        $(document).ready(function(){

        });
        function removeBrand(id){
            $.ajax({
                url : '/removeBrand?id='+id,
                type : "POST",

                dataType : "json",
                cache : false,

                success : function(data) {
                    console.log(data.status);
                    var $brand=$('#'+id);
                    $brand.remove();

                }

            });
        }
    </script>
</head>
<body>
<jsp:include page="include/header.jsp" />

<div id="wrap">
    <div class="container">
        <div class="row">
            <div style="font-size:20px" class="col-sm-10 col-sm-offset-1 text-center">
                <b>Brands</b>
            </div>
            <div class="col-sm-10 col-sm-offset-1 text-center">
                <form id="formAddBrand" class="form-inline" method="POST" action="/addBrand">
                    <div class="form-group">
                        <label class="control-label" for="nam">Brand name:</label>
                        <input id="nam" name="name" type="text" class="form-control" placeholder="Brand name">
                    </div>
                    <button type="submit" class="btn btn-default">Add</button>
                </form>
            </div>
        </div>
        <c:forEach items="${brands}" var="b">

            <div id="${b.id}" class="row">
                <hr/>
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="col-sm-10 col-sm-offset-1 text-center">
                        <span>${b.name}</span>
                    </div>
                    <div class="col-sm-1">
                        <button onclick="removeBrand(${b.id})" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-remove"></span></button>
                    </div>
                </div>

            </div>

        </c:forEach>
    </div>
</div>
<jsp:include page="include/footer.jsp" />

</body>
</html>
