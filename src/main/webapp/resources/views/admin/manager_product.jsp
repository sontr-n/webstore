<%@ page import="com.webstore.app.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sản phẩm</title>

        <link href="/resources/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>

        <%
            User users = (User) session.getAttribute("useradmin");
            if (users == null) {
                response.sendRedirect("/admin/login");
            }
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Quản lý sản phẩm</h3>
                    <a href="/admin/product/add">Thêm Sản Phẩm</a>                                
                <table class="data">
                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data">Tên sản phẩm</th>
                        <th class="data">Hình ảnh</th>
                        <th class="data">Giá bán</th>
                        <th class="data">Giá nhập</th>
                        <th class="data">Số lượng</th>
                        <th class="data" width="80px">NCC</th>    
                        <th class="data">Mô tả </th>
                        <th class="data" width="75px">Tùy Chọn</th>

                    </tr>
                    <c:forEach items="${prods}" var="p" varStatus="loop">
                    	<tr class="data">
	                        <td class="data" width="30px" style="text-align: center">${loop.index + 1}</td>
	                        <td class="data"> ${p.productName}</td>
	                        <td class="data"><img style="text-align: center" witdh="50px" height="50px" src="${p.productImage}" /></td>
	                        <td class="data"> <fmt:formatNumber value="${p.productPrice}" type="currency" currencySymbol=""/> VNĐ</td>
	                        <td class="data"> <fmt:formatNumber value="${p.productBuy}" type="currency" currencySymbol=""/> VNĐ</td>
	                        <td class="data"> ${p.productQuantity}</td>
	                        <td class="data"> ${p.productProvider}</td>
	                        <td class="data"> ${p.productDescription}</td>   
	                        <td class="data" width="90px">
			                    <center>
			                        <a href="/admin/product/update_product/${p.productID}">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
			                        <a href="/admin/product/delete/${p.productID}">Xóa</a>
			                    </center>
		                    </td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="clear"></div> 

            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
