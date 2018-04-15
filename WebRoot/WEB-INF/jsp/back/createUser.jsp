<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>

<title>添加用户</title>

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
                <h1>添加用户</h1>
            </div>
        </center>
        <br />
        <div class="content-list">
            <form id="addFormObj" action="${pageContext.request.contextPath}/back/createUser.action" enctype="multipart/form-data" method="post">
                <label class="title_font">用户名:</label>
                <input id="username" name="username" class="style_input" style="left: 20px;" type="text" placeholder="请输入用户名"
                 data-easyform="length:4 20;char-normal;real-time;ajax:checkName();" data-message="用户名必须为4—20位的英文字母或数字"
                 data-easytip="position:right;class:easy-black;" data-message-ajax="用户名已存在!" /><br />
                <label class="title_font">密码:</label>
                <input id="password" name="password" class="style_input" type="password" placeholder="请输入密码" 
                 data-easyform="length:4 20;real-time;" data-message="密码必须为4—20位"
                 data-easytip="class:easy-black;" /><br />
                 <label class="title_font" style="left: 20px;">确认:</label>
                <input id="rePassword" name="rePassword" class="style_input" type="password" placeholder="请输入确认密码" 
                 data-easyform="length:4 20;equal:#password;real-time;"
                 data-message="两次密码输入要一致" data-easytip="class:easy-black;"/><br />
                <label class="title_font">邮箱:</label>
                <input id="email" name="email" class="style_input" type="text" placeholder="请输入邮箱"
                 data-easyform="email;real-time;" data-message="Email格式要正确"
                 data-easytip="class:easy-black;" /><br />
                 <label class="title_font">头像:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="pictureFile" name="pictureFile" class="style_input" style="left: 20px;" type="file"/><br />
                 <label class="title_font">密保1:</label>
                <input id="questionOne" name="questionOne" class="style_input" style="left: 20px;" type="text" placeholder="请输入您的姓名"
                 data-easyform="length:1 200;real-time;" data-message="请输入您的姓名"
                 data-easytip="position:right;class:easy-black;"/><br />
                 <label class="title_font">密保2:</label>
                <input id="questionTwo" name="questionTwo" class="style_input" style="left: 20px;" type="text" placeholder="请输入您好朋友名字"
                 data-easyform="length:1 200;real-time;" data-message="请输入您好朋友名字"
                 data-easytip="position:right;class:easy-black;"/><br />
                 <label class="title_font">密保3:</label>
                <input id="questionThree" name="questionThree" class="style_input" style="left: 20px;" type="text" placeholder="请输入您的学号（或工号）"
                 data-easyform="length:1 200;real-time;" data-message="请输入您的学号（或工号）"
                 data-easytip="position:right;class:easy-black;"/><br />
                <label class="title_font">角色:</label>
                <select id="roleId" name="roleId" class="style_input">
                    <option value="2">普通用户</option>
                </select><br />
                <center>
                    <input id="publishButton" class="publish_button" type="submit" value="添加">&nbsp; <input class="publish_button" type="reset" value="重置">
                </center>
            </form>
        </div>
    </div>
    <script>
        function checkName() {
           var name = $("#username").val();
            $.ajax({
                        type : "post",
                        url : "${pageContext.request.contextPath}/back/checkName.action",
                        data : "name=" + name,
                        dataType : "text",
                        success : function(resData) {
                            if (resData == 'right') {
                            	$("#username").trigger("easyform-ajax", false);
                            } else {
                            	$("#username").trigger("easyform-ajax", true);
                            }
                        }
                    });
         }
    </script>
    <script>
    $(function() {
        $('#addFormObj').easyform();
    });
</script>
</body>
</html>
