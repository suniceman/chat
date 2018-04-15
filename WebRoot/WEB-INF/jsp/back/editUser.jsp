<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>

<title>编辑用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/easyform.css">
<script src="${pageContext.request.contextPath}/js/easyform.js"></script>
<style>
* {
    margin: 0px;
    padding: 0px;
}

.content-list {
    width: 380px;
    margin: 0 auto;
}

.publish_button {
    width: 150px;
    height: 30px;
    color: white;
    background-color: #cccc99;
    font-size: 20px;
    font-family: 微软雅黑;
    outline: none;
    border: none;
    border-radius: 3px;
    font-size: 20px;
    cursor: pointer;
    margin-top: 20px;
}

.publish_button:HOVER {
    background-color: #ccccDD;
}

.text_area {
    border: 1px solid;
    border-radius: 3px;
    outline: none;
    padding: 2px;
    resize: none;
    font-size: 14px;
    font-family: 微软雅黑;
}

.style_input {
    position: relative;
    height: 30px;
    width: 200px;
    left: 40px;
    margin-top:30px;
    border: 1px solid;
    border-radius: 3px;
    outline: none;
    padding: 2px;
    font-size: 14px;
    font-family: 微软雅黑;
}
.title_font {
    font-size: 20px;
    font-family: 微软雅黑;
}
</style>
</head>

<body style="position: relative; background-color: #ccccb3">
    <div class="content" style="position: absolute; width: 100%; height: 550px;">
        <center>
            <div class="content-title">
                <br />
                <h1>编辑用户</h1>
            </div>
        </center>
        <br />
        <div class="content-list">
            <form id="addFormObj" action="${pageContext.request.contextPath}/back/updateUser.action" method="post">
            <input type="hidden" name="id" value="${editUser.id} ">
                <label class="title_font">用户名:</label>
                <input id="username" name="username" class="style_input" style="left: 20px;" value="${editUser.username}" type="text" placeholder="请输入用户名"
                 data-easyform="length:4 20;char-normal;real-time;" data-message="用户名必须为4—20位的英文字母或数字"
                 data-easytip="position:right;class:easy-black;"/><br />
                <label class="title_font">密码:</label>
                <input id="password" name="password" class="style_input" type="password" placeholder="请输入新密码" 
                 data-easyform="length:4 20;real-time;" data-message="密码必须为4—20位"
                 data-easytip="class:easy-black;" /><br />
                 <label class="title_font" style="left: 20px;">确认:</label>
                <input id="rePassword" name="rePassword" class="style_input" type="password" placeholder="请输入确认密码" 
                 data-easyform="length:4 20;equal:#password;real-time;"
                 data-message="两次密码输入要一致" data-easytip="class:easy-black;"/><br />
                <center>
                    <input id="publishButton" class="publish_button" type="submit" value="添加">&nbsp; <input class="publish_button" type="reset" value="重置">
                </center>
            </form>
        </div>
    </div>
    <script>
    $(function() {
        $('#addFormObj').easyform();
    });
</script>
</body>
</html>
