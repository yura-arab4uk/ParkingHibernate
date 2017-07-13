<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript"
            src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/checkout.js"></script>

    <title>Current cars</title>
    <script>
        $(document).ready(

            function() {

            });

        function fillEditForm(id) {
            var $col9s=$('#'+id).children('.col-sm-9').children();
            var $col3s=$('#'+id).children('.col-sm-3').children();
            $('#id').attr("value",id);
            $('#car_').attr("value",$col9s.eq(0).children('span').text());
            $('#park').attr("value",$col9s.eq(2).children('span').text());
            $('#brand').val($col9s.eq(3).children('span').attr('class'));
            $('#colo').val($col9s.eq(4).children('span').attr('class'));
            $('#phon').attr("value",$col9s.eq(5).children('span').text());
            $('#name').attr("value",$col3s.eq(0).children('span').text());
        }
        function editSubmit() {
            $('#formUser').submit();
        }
    </script>
    <style>
        body {
            background-color: #fff;
        }

    </style>
</head>
<body>
<jsp:include page="include/header.jsp" />

<div id="wrap">
    <hr/>
    <div class="row" id="cars">
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="col-sm-2">
                        <b>Car number</b>
                    </div>
                    <div class="col-sm-2">
                        <b>Checkin datetime</b>
                    </div>
                    <div class="col-sm-2">
                        <b>Parking time (minutes)</b>
                    </div>
                    <div class="col-sm-2">
                        <b>Brand</b>
                    </div>
                    <div class="col-sm-2">
                        <b>Color</b>
                    </div>
                    <div class="col-sm-2">
                        <b>Phone number</b>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="col-sm-6">
                        <b>CarRider</b>
                    </div>
                    <div class="col-sm-6">
                        <b>Buttons</b>
                    </div>
                </div>
            </div>
            <c:forEach items="${carsMap}" var="entry">

                <div id="${entry.key.id}" class="row">
                    <hr/>
                    <div class="col-sm-9">
                        <div class="col-sm-2">
                            <span>${entry.key.car_number}</span>
                        </div>
                        <div class="col-sm-2">
                            <span>${entry.key.checkin_datetime}</span>
                        </div>
                        <div class="col-sm-2">
                            <span>${entry.key.parking_time}</span>
                        </div>
                        <div class="col-sm-2">
                            <span class="${entry.key.brand.id}">${brandsMap[entry.key.brand.id].name}</span>
                        </div>
                        <div class="col-sm-2">
                           <span class="${entry.key.color.id}">${colorsMap[entry.key.color.id].name}</span>
                        </div>
                        <div class="col-sm-2">
                           <span>${entry.value.phone_number}</span>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="col-sm-6">
                            <span>${entry.value.name}</span>
                        </div>
                        <div class="col-sm-6">
                            <button onclick="fillEditForm(${entry.key.id})" type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-edit"></span></button>
                            <button onclick="checkout(${entry.key.id})" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-remove"></span></button>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit car</h4>
            </div>
            <div class="modal-body">

                <form id="formUser" action="/changeCar" method="post">
                    <input id="id" type="hidden" class="form-control" name="id"/>
                    <label class="control-label" for="car_">Car number:</label>
                    <input class="form-control" id="car_" name="car_number"/>
                    <label class="control-label" for="park">Parking time (minutes):</label>
                    <input class="form-control" id="park" name="parking_time"/>
                    <label class="control-label" for="brand">Brand:</label>
                    <select id="brand" name="brand_id" class="form-control">
                        <c:forEach items="${brandsMap}" var="b">
                            <option value="${b.value.id}">${b.value.name}</option>
                        </c:forEach>
                    </select>
                    <label class="control-label" for="colo">Color:</label>
                    <select id="colo" name="color_id" class="form-control">
                        <c:forEach items="${colorsMap}" var="c">
                            <option value="${c.value.id}">${c.value.name}</option>
                        </c:forEach>
                    </select>
                    <label class="control-label" for="phon">Phone number:</label>
                    <input class="form-control" id="phon" name="phone_number"/>
                    <label class="control-label" for="name">CarRider:</label>
                    <input class="form-control" id="name" name="name"/>

                </form>
            </div>
            <div class="modal-footer">
                <button onclick="editSubmit()" type="button" class="btn btn-default" data-dismiss="modal">Save</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="include/footer.jsp" />



</body>
</html>