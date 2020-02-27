<%@page import="java.util.ArrayList"%>
<%@ page import="com.webstore.app.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loại sản phẩm</title>
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
                    <h3> Loại sản phẩm</h3>
                    <a href="/admin/category/add">Thêm loại sản phẩm</a>                                   
                <table class="data">
                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data">Mã Loại</th>
                        <th class="data">Tên Loại</th>             
                        <th class="data" width="75px">Tùy Chọn</th>

                    </tr>
                    <c:forEach items="${cates}" var="c" varStatus="loop">
                    	<tr class="data">
	                        <td class="data" width="30px">${loop.index + 1}</td>
	                        <td class="data">${c.categoryID}</td>
	                        <td class="data">${c.categoryName}</td>
	                        <td class="data" width="90px">
	                    <center>
	                        <a href="/admin/update_category/${c.categoryID}/${c.categoryName}">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
	                        <a href="/admin/manager_category/delete/${c.categoryID}">Xóa</a>
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
