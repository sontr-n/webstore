<%@page import="com.webstore.app.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
        <link href="/resources/css/mos-style.css" rel='stylesheet' type='text/css' />
		<script src="/resources/js/jquery.min.js"></script>
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
                    <h3>Thông tin sản phẩm</h3>
                    <form action="/shop/ManagerProductServlet" method="post" >
                        <table width="95%">
                            <tr>
                                <td>
                                    <b>Tên sản phẩm</b>
                                </td>
                                <td>
                                    <input type="text" class="sedang prodName" name="tensanpham">
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <b>Giá bán</b>
                                </td>
                                <td>
                                    <!-- <input type="text" class="sedang price" name="gia"> -->
                                    <input type="text" class="textfield sedang price" name="gia" value="" id="extra7" name="extra7" onkeypress="return isNumber(event)" />
                                </td>
                            </tr>
							<tr>
                            <td>
                                <b>Giá nhập</b>
                            </td>
                            <td>
                            <input type="text" class="textfield sedang buy" name="buy" value="${product.productBuy.longValue()}" id="extra7" name="extra7" onkeypress="return isNumber(event)" />
                                <%=error%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Số lượng</b>
                            </td>
                            <td>
                            <input type="text" class="textfield sedang quantity" name="quantity" value="${product.productQuantity}" id="extra7" name="extra7" onkeypress="return isNumber(event)" />
                                <%=error%>
                            </td>
                        </tr>
                        <tr>
                                <td>
                                    <b>Nhà cung cấp</b>
                                </td>
                                <td>
                                    <input type="text" class="sedang provider" name="provider" value="${product.productProvider}" />
                                <%=error%>
                            </td> 
                        </tr>
                            <tr>
                                <td>
                                    <b>Loại sản phẩm</b>
                                </td>
                                <td>
                                    <select name="category_id" class="cateId">
                                    <c:forEach items="${cates}" var="c">
                                    	<option value="${c.categoryID}">${c.categoryName} </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <b>Mô tả sản phẩm</b>
                            </td>
                            <td>
                                <textarea class="form-textarea" id="noiDung" name="mota"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Hình ảnh</b>
                            </td>
                            <td>
                                <input type="file" id="productImg" name="hinhanh">
                            </td>
                        </tr>

                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="hidden" class="command" name="command" value="insert">
                                <input class="button" value="Lưu dữ liệu" onclick="postFormData()">
                            </td></tr>
                    </table>
                </form>
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
			<script>
			
			function isNumber(evt) {
			    evt = (evt) ? evt : window.event;
			    var charCode = (evt.which) ? evt.which : evt.keyCode;
			    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
			        return false;
			    }
			    return true;
			}
			
		function postData(img) {
			var body = {
					command: $('.command').val(),
					image: img,
					descrip: $('#noiDung').val(),
					cateId: $('.cateId').val(),
					price: $('.price').val(),
					prodName: $('.prodName').val(),
					prodId: $('.prodId').val(),
					buy: $('.buy').val(),
					quantity: $('.quantity').val(),
					provider: $('.provider').val()
			};
			
			$.ajax({
					url : "/admin/product/manager_product",
					type : "POST",
					contentType : "application/json",
					dataType:"json",
					data : JSON.stringify(body),
					async : false,
					success : function(result) {
						window.location.href = result.url;
					},
					error : function(jqXHR, status, errorThrown) {
					}
			});
		}
		
		function postFormData() {
			var form = new FormData();
			var file = $('#productImg')[0].files[0];
			
			if (file.name){
				form.append('hinhanh',file, file.name);
			}
				$.ajax({
					url : "/admin/product/file",
					type : "POST",
					data : form,
					processData : false,
					contentType : false,
					async : false,
					success : function(result) {
						postData(result);
					},
					error : function(jqXHR, status, errorThrown) {
					}
				});
		}
	</script>
        </div>


    </body>
</html>
