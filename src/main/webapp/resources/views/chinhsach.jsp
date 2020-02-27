
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Chính sách</title>

        <link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script src="/resources/js/jquery.min.js"></script>
        <!-- //js -->
        <!-- for bootstrap working -->
        <script type="text/javascript" src="/resources/js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <!-- timer -->
        <link rel="stylesheet" href="/resources/css/jquery.countdown.css" />
        <!-- //timer -->
        <!-- animation-effect -->
        <link href="/resources/css/animate.min.css" rel="stylesheet"> 
        <script src="/resources/js/wow.min.js"></script>
        <script>
            new WOW().init();
            $(document).ready(function() {
            	$('.active').removeClass('active');
            	$('.policy').addClass('active');
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div style="padding: 30px; text-align: center;">
        	<h3>Trang đang hoàn thiện tính năng giao hàng qua dịch vụ thứ 3 và các chính sách.</h3>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
