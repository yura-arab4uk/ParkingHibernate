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

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add car</title>
    <style>
        body {
            background-color: #e1e1e3;
        }

    </style>
</head>
<body>
<jsp:include page="include/header.jsp" />

<div id="wrap">
    <hr style="margin-top: 100px" />
    <div class="row">
    <div class="col-sm-4 col-sm-offset-4">
    <form id="formProd" method="post" action="/addCar">
        <div class="form-group text-center">
            <label class="control-label" for="nam">Car number:</label>
            <input autocomplete="false" class="form-control" id="nam" name="car_number"/>
        </div>

        <div class="form-group text-center">
            <label class="control-label" for="des">Parking time in minutes:</label>
            <input autocomplete="off" class="form-control" id="des" name="parking_time"/>
        </div>
        <div class="form-group text-center">
            <label class="control-label" for="brand">Brand id:</label>
            <select id="brand" name="brand_id" class="form-control">
                <c:forEach items="${brands}" var="b">
                    <option value="${b.id}">${b.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group text-center">
            <label class="control-label" for="colo">Color id:</label>
            <select id="colo" name="color_id" class="form-control">
                <c:forEach items="${colors}" var="c">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group text-center">
            <label class="control-label" for="pri2">Car rider's name:</label>
            <input autocomplete="off" class="form-control" id="pri2" name="name"/>
        </div>
        <div class="form-group text-center">
            <label class="control-label" for="pri3">Phone number:</label>
            <input autocomplete="off" class="form-control" id="pri3" name="phone_number"/>
        </div>
        <div class="form-group text-center">
            <input autocomplete="off" type="submit" class="btn btn-default" value="Add car"/>
        </div>
    </form>
    </div>
    </div>

    <hr />
</div>
<jsp:include page="include/footer.jsp" />

</body>
</html>