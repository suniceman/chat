<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>在线聊天</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<body>
<div class="cotn_principal">
  <div class="cont_centrar">
    <div style="width: 200px; color: red; margin: 0 auto; padding-top: 30px;">${errorMessage }</div>
    <div class="cont_login">
      <div class="cont_info_log_sign_up">
        <div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h2>登录</h2>
            <p>登陆在线聊天.</p>
            <button class="btn_login" onclick="cambiar_login()">登录</button>
          </div>
        </div>
        <div class="col_md_sign_up">
          <div class="cont_ba_opcitiy">
            <h2>注册</h2>
            <p>注册在线聊天系统账号</p>
            <button class="btn_sign_up" onclick="cambiar_sign_up()">注册</button>
          </div>
        </div>
      </div>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="${pageContext.request.contextPath}/images/po.jpg" alt="" /> </div>
      </div>
      <div class="cont_forms" >
        <div class="cont_img_back_"> <img src="${pageContext.request.contextPath}/images/po.jpg" alt="" /> </div>
        <form action="${pageContext.request.contextPath}/user/dologin.action" method="post">
	        <div class="cont_form_login"> <a href="#" onclick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
	          <h2>登陆</h2>
	          <input type="text" name="email" placeholder="邮箱" required="required" />
	          <input type="password" name="password" placeholder="密码" required="required" />
	          <button class="btn_login" onclick="cambiar_login()">登陆</button>
	          <button class="btn_login">
	           <a style="display: inline-block;" href="${pageContext.request.contextPath}/user/forgot.action">忘记密码?</a>
              </button>
	        </div>
        </form>
        <form action="${pageContext.request.contextPath}/user/regist.action" enctype="multipart/form-data" method="post">
        <div class="cont_form_sign_up"> <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
          <h2>注册</h2>
          <input type="email" name="email" placeholder="邮箱" required="" />
          <input type="text" name="username" placeholder="用户名" required=""/>
          <input type="password" name="password" placeholder="密码"  required=""/>
          <div style="text-align: left; padding: 10px 30px;">
          <lable>上传头像：</lable>
          <input name="pictureFile" type="file"  required=""/>
          </div>
          <input type="text" name="questionOne" placeholder="密保：您的姓名是？" required="" />
          <input type="text" name="questionTwo" placeholder="密保：您好朋友名字是？" required=""/>
          <input type="text" name="questionThree" placeholder="密保：您的学号（或工号）是？" required="" />
          <button class="btn_sign_up" onclick="cambiar_sign_up()">注册</button>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>

</body>
</html>
