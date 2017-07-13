<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript"
            src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/checkout.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Home</title>
    <script type="text/javascript">
        $(document).ready(

            function() {
                getTimedCars();
            });

        function getTimedCars(){
            // Do something here
            var id=$( ".message:last-child" ).attr('id');
            console.log('id='+id);
            if (id==null) id='';
            $.ajax({
                url : '/checkTimedCars?id='+id,
                type : "GET",
                async:false,
                dataType : "json",
                cache : false,

                success : function(data) {
                    $.each(data,function(index,carinfo) {
                        var $wrap=$('#wrap');

                        console.log(carinfo[0]);
                        console.log(carinfo[1]);
                        var $car=$('<div class="message row" id='+carinfo[0].id+'></div>');
                        $car.append($('<div class="col-sm-3 text-center">Car rider:'+carinfo[1].name+'</div>'));
                        $car.append($('<div class="col-sm-3 text-center">Car number:'+carinfo[0].car_number+'</div>'));
                        $car.append($('<div class="col-sm-3 text-center">Phone number:'+carinfo[1].phone_number+'</div>'));
                        var $button=$('<button class="btn btn-primary center-block" onclick="checkout('+carinfo[0].id+')">Checkout</button>');
                        $car.append($button);
                        $wrap.append($car);
                    });

                }

            });

            setTimeout(function(){
                getTimedCars()
            }, 1000);
        }






    </script>
    <style>
        .menu {
            background-color: #e1e1e3;
            text-align: center;
            padding-top: 30px;
            padding-bottom: 30px;
            color: #707c93;
            font-size:20px;
            border: 1px solid slategrey;

        }
        .menu:hover {
            background-color: #ececee;
            cursor: pointer;
        }
        hr.soften {
            height: 1px;
            background-image: -webkit-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.8), rgba(0,0,0,0));
            background-image:    -moz-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.8), rgba(0,0,0,0));
            background-image:     -ms-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.8), rgba(0,0,0,0));
            background-image:      -o-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.8), rgba(0,0,0,0));
            border: 0;
        }

        .message {
            background-color: #c3e3c8;
            padding-top: 17px;
            padding-bottom: 17px;
            margin-top: 10px;
            color: #185d44;
            font-size:17px;
            border: 1px solid darkslategrey;
        }
        .time-is-out {
            background-color: #d8e0e3;
            padding-top: 20px;
            padding-bottom: 20px;
            margin-top: 10px;
            color: #2c505d;
            font-size:20px;

        }
        body {
            background-color: #fff;
        }
    </style>
</head>
<body>
<jsp:include page="include/header.jsp" />

<div id="wrap">
    <hr class="soften" />
    <div class="row">
<div onclick="return location.href='/cars'" class="col-sm-10 col-sm-offset-1 menu">Current cars</div>
    </div>
    <div class="row">
    <div style="margin-top: 30px" onclick="return location.href='/addCar'" class="col-sm-10 col-sm-offset-1 menu">New car</div>
    </div>
    <hr class="soften" />
    <div class="row time-is-out text-center">
        Time is out for cars:
    </div>
</div>
<jsp:include page="include/footer.jsp" />


</body>
</html>