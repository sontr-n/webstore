<%@page import="com.webstore.app.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật Loại</title>

        <link href="/resources//css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>

        <%
            User users = (User) session.getAttribute("useradmin");
            if (users == null) {
                response.sendRedirect("/admin/login");
            }

            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Cập nhật Loại</h3>
                    <form action="/admin/manager_category" method="post">
                        <table width="95%">
                            <tr>
                                <td style="float: right"><b>Tên Loại:</b></td>
                                <td>
                                    <input type="text" class="sedang" value="${cate.categoryName}" name="cateName" />
                                <%=error%>
                            </td>
                        </tr>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="id" value="${cate.categoryID}">
                                <input type="submit" class="button" value="Lưu dữ liệu">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>


    </body>
</html>

