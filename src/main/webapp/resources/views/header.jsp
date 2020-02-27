<%@ page import="com.webstore.app.entity.User"%>
<%@ page import="com.webstore.app.model.Cart"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
        
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=352114845163521";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    
    	function addItem(id){
    		$.ajax({
				url : "/cart/plus/"+id,
				type : "GET",
				async : false,
				success : function(result) {
					generateNotify(result.message);
					updateCart(result);
				},
				error : function(jqXHR, status, errorThrown) {
					generateNotify(errorThrown);
				}
				});
    	}
    	function subItem(id){
    		$.ajax({
				url : "/cart/sub/"+id,
				type : "GET",
				async : false,
				success : function(result) {
					generateNotify(result.message);
					updateCart(result);
				},
				error : function(jqXHR, status, errorThrown) {
					generateNotify(errorThrown);
				}
				});
    	}
    	function removeItem(id){
    		$.ajax({
				url : "/cart/plus/"+id,
				type : "GET",
				async : false,
				success : function(result) {
					generateNotify(result.message);
					updateCart(result);
				},
				error : function(jqXHR, status, errorThrown) {
					generateNotify(errorThrown);
				}
				});
    	}
    	
    	function updateCart(data) {
    		$(".simpleCart_total").text(data.price);
    		$(".simpleCart_quantity").text(data.quantity);
    	}
    	
    	function generateNotify(mess) {
    			$.notify({
  			      title: '<strong>Thông báo: </strong>',
  			      icon: 'glyphicon glyphicon-star',
  			      message: mess
  			    },{
  			      type: 'info',
  			      animate: {
  					    enter: 'animated fadeInDown',
  			        	exit: 'animated fadeOutUp'
  			      },
  			      placement: {
  			        from: "top",
  			        align: "right"
  			      },
  			      newest_on_top: true,
  			      offset: 40,
  			      spacing: 10,
  			      z_index: 1031,
  			    template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
  				'<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
  				'<span data-notify="icon"></span> ' +
  				'<span data-notify="title">{1}</span> ' +
  				'<span data-notify="message">{2}</span>' +
  				'<div class="progress" data-notify="progressbar">' +
  					'<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
  				'</div>' +
  				'<a href="{3}" target="{4}" data-notify="url"></a>' +
  			'</div>'
  			    });
    	}
    </script>
</head>
<body>

    <%
        User user = (User) session.getAttribute("user");

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

    %>

    <div class="header">
        <div class="container">
            <div class="header-grid">
                <div class="header-grid-left animated wow slideInLeft" data-wow-delay=".5s">
                    <ul>
                        <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
                        	<%-- <% if (user != null){ %>
                        		<a href="mailto:<% user.getUserEmail(); %>"><% user.getUserEmail(); %></a>
                        	<% } else {%>
                        		<a href="mailto:info@example.com">info@examle.com</a>
                        	<% }%> --%>
                        	<c:choose>
                        		<c:when test="${not empty user}">
                        			<a href="mailto:${user.userEmail}">${user.userEmail}</a>
                        		</c:when>
                        		<c:otherwise>
                        			<a href="mailto:info@example.com">info@examle.com</a>
                        		</c:otherwise>
                        	</c:choose>
                        </li>
                            <%                                if (session.getAttribute("user") != null) {
                            %>
                        <li><i class="glyphicon glyphicon-book" aria-hidden="true"></i><a href='/shop/logout'>Thoát</a></li>

                        <%} else {%>
	                        <li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="/shop/login">Đăng Nhập</a></li>
	                        <li><i class="glyphicon glyphicon-book" aria-hidden="true"></i><a href="/shop/register">Đăng Ký</a></li>
                        <%}%>

                    </ul>
                </div>
                <div class="header-grid-right animated wow slideInRight" data-wow-delay=".5s">
                    <ul class="social-icons">
                        <li><a href="https://www.facebook.com" class="facebook"></a></li>
                        <li><a href="#" class="twitter"></a></li>
                        <li><a href="https://www.gmail.com" class="g"></a></li>
                        <li><a href="#" class="instagram"></a></li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="logo-nav">
                <div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
                    <h1><a href="/shop/homepage">Nội thất<span>Shop anywhere</span></a></h1>
                </div>
                <div class="logo-nav-left1">
                    <nav class="navbar navbar-default">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header nav_2">
                            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div> 
                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav">
                                <li class="active homepage"><a href="/shop/homepage" class="act">Trang chủ</a></li>	
                                <!-- Mega Menu -->
                                <li class="dropdown product">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sản phẩm<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-3">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <c:forEach items="${categories}" var="c">
                                                    	<li>
                                                        	<a href="/shop/single/product/${c.categoryID}">${c.categoryName}
                                                        	</a>
                                                   	 	</li>
                                                    </c:forEach>
                                                </ul>

                                            </div>


                                            <div class="clearfix"></div>
                                        </div>
                                    </ul>
                                </li>                                
                                <li class="dropdown policy">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Chính Sách <b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-3">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">                                                  
                                                    <li><a href="/shop/delivery">Chính Sách Giao Hàng</a></li>
                                                    <li><a href="/shop/delivery">Chính Sách Bảo Hành</a></li>
                                                </ul>
                                            </div>                                                                                       
                                            <div class="clearfix"></div>
                                        </div>
                                    </ul>
                                </li>
                                <li class="contact" ><a href="/shop/contact">Liên hệ</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="logo-nav-right">
                    <div class="search-box">
                        <div id="sb-search" class="sb-search sb-search-open">
                            <form action="/shop/product/search">
                                <input class="sb-search-input" name="keyword" placeholder="Mời bạn nhập sản phẩm cần tìm..." type="search" id="search">
                                <input class="sb-search-submit" type="submit" value="">
                                <span class="sb-icon-search"> </span>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="header-right">
                    <div class="cart box_1">
                        <a href="/shop/checkout">
                            <h3> 
                                <div class="total">
                                    <span class="simpleCart_total">${totalPrices.longValue()}</span> VNĐ
                                    (<span id="simpleCart_quantity" class="simpleCart_quantity">${quantity}</span> Sản Phẩm)
                                </div>
                                <img src="/resources/images/bag.png" alt="" />
                            </h3>
                        </a>
                        <p><a href="javascript:;" class="simpleCart_empty">Giỏ Hàng</a></p>
                        <div class="clearfix"> </div>
                    </div>	
                </div>
                <div class="clearfix"> </div>
                <input  type="hidden" class="active-holder" val=${menu}/>
            </div>
        </div>
        <script>
        </script>
    </div>
    <!-- //header -->
</body>
</html>
