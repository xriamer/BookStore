<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String loginUrl=basePath+"pages/MemberServletFront/login";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>网上书城</title>
    <link type="text/css" rel="stylesheet" href="css/base.css">
    <script type="text/javascript" src="js/base.js"></script>
    <script type="text/javascript" src="js/member.js"></script>
</head>
<body>
<jsp:include page="/pages/header.jsp"/>
<div id="mainDiv">
    编写登陆表单
    <form action="<%=loginUrl%>" method="post" onsubmit="return validateLogin()">
        <table border="1" cellpadding="5" cellspacing="0" bgcolor="F2F2F2" align="center" width="80%">
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'F2F2F2')">
                <td colspan="3">用户登录</td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'F2F2F2')">
                <td width="15%">用户ID:</td>
                <td width="40%"><input type="text" name="mid" id="mid" class="init" onblur="validateMid()"></td>
                <td width="45%"><span id="midMsg"></span></td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'F2F2F2')">
                <td>密&nbsp;&nbsp;码</td>
                <td><input type="password" name="password" id="password" class="init" onblur="validatePassword()"></td>
                <td><span id="passwordMsg"></span></td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'F2F2F2')">
                <td>验证码:</td>
                <td>
                    <input type="text" name="code" id="code" maxlength="4" size="4" class="init" onblur="validateCode()">
                    <img src="pages/image.jsp" style="width:80px;height:25px">
                </td>
                <td><span id="CodeMsg"></span></td>
            </tr>
            <tr onmouseover="changeColor(this,'white')" onmouseout="changeColor(this,'F2F2F2')">
                <td colspan="3">
                    <input type="submit" value="登录">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="/pages/footer.jsp"/>
</body>
</html>