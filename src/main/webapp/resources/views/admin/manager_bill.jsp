<%@page import="com.webstore.app.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Hóa Đơn</title>
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
                    <h3>Quản lý hóa đơn</h3>
                    <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">Mã hóa đơn</th>
                            <th class="data">Khách hàng</th>
                            <th class="data">SDT khách hàng</th>
                            <th class="data">Tổng hóa đơn</th>
                            <th class="data">Thanh toán</th>
                            <th class="data">Địa chỉ giao hàng</th>
                            <th class="data">Ngày mua</th>
                            <th class="data">Trạng thái đơn</th>
                            <th class="data" width="150px">Tùy chọn</th>
                        </tr>
                    <c:forEach items="${bills}" var="b">
	                    <tr class="data">
	                        <td class="data" width="30px">${b.id}</td>
	                        <td class="data"> ${b.userEmail}</td>
	                        <td class="data"> ${b.phone}</td>
	                        <td class="data">${b.total.longValue()}</td>
	                        <td class="data">${b.payment}</td>
	                        <td class="data">${b.address}</td>
	                        <td class="data">${b.date}</td>
	                        <c:choose>
	                        	<c:when test="${b.status == 1}">
									<td class="data"> <span style="font-size: 24px"> &#x2015;</span></td>	                        		
	                        	</c:when>
	                        	<c:when test="${b.status == 3}">
									<td class="data"><span style="color:green;font-size: 24px"> &#10004;</span></td>	                        		
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td class="data"><span style="font-size:24px;color:red">&#x3A7;</span></td>
	                        	</c:otherwise>
	                        </c:choose>
	                        <td class="data" width="75px">
			                    <center>
								<a title="hoàn tất" onclick="update(${b.id}, 3)"><span  style="color:green;font-size: 24px"> &#10004;</span></a> </a>&nbsp;&nbsp;
								<a title="hủy dơn" onclick="update(${b.id}, 2)"><span  style="font-size:24px;color:red">&#x3A7;</span></a> </a>&nbsp;&nbsp;
								<a title="xóa đơn" href="/admin/bill/delete/${b.id}"><span  style="font-size:24px">&#x26D4;</span></a> </a>&nbsp;&nbsp;
			                    </center>
		                    </td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="clear"></div> 
			
			<script type="text/javascript">
			function update(id, stt){
				$.ajax({
					url : "/admin/bill/update/" +id +'/' + stt,
					type : "GET",
					async : false,
					success : function(data) {
						if (data.mess === 'ok'){
							window.location.href = "/admin/manager_bill"
						}
						if (data.mess === 'eq'){
							alert('Số lương sản phẩm không đủ.');
						}
					},
					error : function(jqXHR, status, errorThrown) {
						console.log(errorThrown)
					}
					});
			}
			</script>
            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
