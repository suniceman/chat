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

<title>Forge后台登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/login2.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
    <h1>找回密码</h1>
    <div class="login" style="margin-top:50px;">
        <div class="web_qr_login" id="web_qr_login" style="display: block; height: 430px;">
            <!--登录-->
            <div class="web_login" id="web_login">
                <div class="login-box">
                    <div class="login_form">
                        <form action="${pageContext.request.contextPath}/user/check.action" accept-charset="utf-8" id="login_form" class="loginForm"
                            method="post">
                            <input type="hidden" name="did" value="0" /> <input type="hidden" name="to" value="log" />
                            <div class="uinArea" id="uinArea">
                                <b style="color: red; position: absolute;left: 100px;top: -20px;">${errorMessage }</b> 
                                <label class="input-tips" for="u">账号：</label>
                                <div class="inputOuter">
                                    <input type="text" id="u" name="email" placeholder="请输入邮箱" value="${email }" class="inputstyle"/>
                                </div>
                            </div>
                            <div class="uinArea">
                                <label class="input-tips" for="u">密保：</label>
                                <div class="inputOuter">
                                    <input type="text" name="questionOne" placeholder="您的姓名是？" value="${questionOne }" class="inputstyle"/>
                                </div>
                            </div>
                            <div class="uinArea">
                                <label class="input-tips" for="u">密保：</label>
                                <div class="inputOuter" id="uArea">
                                    <input type="text" name="questionTwo" placeholder="您好朋友名字是？" value="${questionTwo }" class="inputstyle"/>
                                </div>
                            </div>
                            <div class="uinArea">
                                <label class="input-tips" for="u">密保：</label>
                                <div class="inputOuter">
                                    <input type="text" name="questionThree" placeholder="您的学号（或工号）是？" value="${questionThree }" class="inputstyle"/>
                                </div>
                            </div>
                            <div class="pwdArea">
                                <label class="input-tips" for="p">密码：</label>
                                <div class="inputOuter">
                                    <input type="password" name="password" placeholder="请输入新密码" class="inputstyle"/>
                                </div>
                            </div>
                            <div style="padding-left:50px;margin-top:20px;">
                                <input type="submit" value="找回密码" style="width:150px;" class="button_blue" />
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