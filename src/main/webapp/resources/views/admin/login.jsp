<%@page import="com.webstore.app.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="/resources/css/mos-style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            User user = new User();
            if (session.getAttribute("useradmin") != null) {
                user = (User) session.getAttribute("useradmin");

            } else {
                user.setUserEmail("");
            }
        %>

        <div id="header">
            <div class="inHeaderLogin"></div>
        </div>

        <div id="loginForm">
            <div class="headLoginForm">
                Login Administrator
            </div>
            <div class="fieldLogin">
                <form method="POST" action="/admin/login">
                    <%if (session.getAttribute("error") != null) {%>         
                    <div>                            
                        <p style="color:red"><%=session.getAttribute("error")%></p>         
                    </div>                               
                    <%}%>
                    <div>
                        <input type="email" placeholder="Email " name="email" required >
                        <input type="password" placeholder="Mật Khẩu" name="password" required >                            
                    </div>
                    <input type="hidden" value="login" name="command"> 
                    <input type="submit" value="Đăng Nhập">
                </form>
            </div>
        </div>

    </body>
</html>