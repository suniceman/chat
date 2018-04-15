<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>在线聊天后台登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/login2.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
    <h1>在线聊天后台登录</h1>
    <div class="login" style="margin-top:50px;">
        <div class="web_qr_login" id="web_qr_login" style="display: block; height: 230px;">
            <!--登录-->
            <div class="web_login" id="web_login">
                <div class="login-box">
                    <div class="login_form">
                        <form action="${pageContext.request.contextPath}/back/dologin.action" accept-charset="utf-8" id="login_form" class="loginForm"
                            method="post">
                            <div class="uinArea" id="uinArea">
                                <b style="color: red; position: absolute;left: 100px;top: -20px;">${errorMessage }</b> 
                                <label class="input-tips" for="u">账号：</label>
                                <div class="inputOuter">
                                    <input type="text" id="u" name="username" placeholder="请输入用户名" value="${username }" class="inputstyle"/>
                                </div>
                            </div>
                            <div class="uinArea">
                                <label class="input-tips" for="u">密码：</label>
                                <div class="inputOuter">
                                    <input type="password" name="password" placeholder="请输入密码" value="${password }" class="inputstyle"/>
                                </div>
                            </div>
                            <div style="padding-left:50px;margin-top:20px;">
                                <input type="submit" value="登录" style="width:150px;" class="button_blue" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--登录end-->
        </div>
    </div>
                        <br>
     <div style="text-align: center;">
      <span>Copyright &copy; 2018.Company name, Inc. All Rights Reserved. </span>
      <br/><br/>
    </div>
</body>
</html>