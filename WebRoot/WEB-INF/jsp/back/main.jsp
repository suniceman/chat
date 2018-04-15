<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线聊天后台管理首页</title>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    list-style: none;
}

img {
    border: 0;
}

body {
    font-size: 12px;
    color: #555555;
    background: url(${pageContext.request.contextPath}/images/back_main.jpg)
        no-repeat;
    background-size: 100% 100%;
}

.navbox {
    height: 40px;
    position: relative;
    z-index: 9;
    margin: auto;
    background: #554b4a;
    filter: alpha(opacity = 90);
    -moz-opacity: 0.90;
    opacity: 0.90;
    font-family: '微软雅黑';
}

.nav {
    width: 1002px;
    margin: 0 auto;
    height: 40px;
    list-style: none;
}

.nav li {
    float: left;
    height: 40px;
    position: relative;
    list-style: none;
}

.nav li.last {
    background: none;
}

.nav li a {
    text-decoration: none;
}

.nav li a span {
    float: left;
    display: block;
    line-height: 40px;
    font-size: 14px;
    color: #ffffff;
    cursor: pointer;
    width: 143px;
    text-align: center;
}

.mj_hover_menu {
    text-decoration: none;
    width: 143px;
    background:
        url(${pageContext.request.contextPath}/images/menu_hover.jpg);
    height: 40px;
}

.nav li.selected .submenu {
    display: block;
}

.nav li .submenu {
    display: none;
    position: absolute;
    top: 40px;
    left: -9px;
}

.nav li .submenu li {
    float: none;
    padding: 0;
    background: none;
    height: auto;
    border-bottom: dotted 0px #BEBEBE;
}

.mj_menu_pro_bg {
    width: 825px;
    height: 235px;
    background:
        url(${pageContext.request.contextPath}/images/menu_pro_bg.png)
        no-repeat;
}

.mj_menu_pro_main {
    width: 765px;
    margin: auto;
    padding-top: 12px;
}

.mj_menu_pro_li {
    float: left;
}

.mj_menu_li_txt {
    line-height: 22px;
    font-size: 12px;
    color: #696969;
}

.mj_menu_li_txt font {
    font-size: 14px;
    color: #bb1721;
}

.mj_menu_li_txt a {
    color: #696969;
    text-decoration: none;
}

.mj_menu_li_txt a:hover {
    color: #696969;
    text-decoration: underline;
}

.mj_menu_news_bg {
    width: 480px;
    height: 185px;
    background:
        url(${pageContext.request.contextPath}/images/menu_news_bg.png)
        no-repeat;
}

.mj_menu_news_main {
    width: 440px;
    margin: auto;
    padding-top: 12px;
}

.mj_menu_news_li {
    padding: 0px 30px;
    margin-right: 30px;
    height: 150px;
    float: left;
    border-right: solid 1px #cccccc;
}

.mj_menu_news_img {
    float: left;
    text-align: left;
    color: #bb1721;
    line-height: 30px;
    font-size: 14px;
}

.mj_menu_news_li2 {
    padding: 0px 30px;
    height: 150px;
    float: right;
    border-left: solid 1px #cccccc;
}

.mj_menu_news_img2 {
    float: left;
    margin-left: 30px;
    text-align: left;
    color: #bb1721;
    line-height: 30px;
    font-size: 14px;
}

.mj_menu_news_li3 {
    padding: 0px 25px;
    height: 150px;
    float: right;
    border-left: solid 1px #cccccc;
}

.mj_menu_news_img3 {
    float: left;
    margin-left: 10px;
    text-align: left;
    color: #bb1721;
    line-height: 30px;
    font-size: 14px;
}
</style>
</head>
<body>
    <div class="navbox">
        <div class="nav">
            <li class="drop-menu-effect"><a
                href="${pageContext.request.contextPath}/back/main.action"><span>后台首页</span></a>
            </li>
            <li class="drop-menu-effect"><a
                href="${pageContext.request.contextPath}/back/showMessage.action"
                target="backContent"><span>聊天记录查看</span></a></li>
            <li class="drop-menu-effect"><a
                href="${pageContext.request.contextPath}/back/showUser.action"
                target="backContent"><span>用户查看</span></a></li>
            <li class="drop-menu-effect"><a
                href="${pageContext.request.contextPath}/back/addUser.action"
                target="backContent"><span>新增用户</span></a></li>
            <li class="drop-menu-effect"><a
                href="${pageContext.request.contextPath}/back/updatePassword.action"
                target="backContent"><span>修改密码</span></a></li>
            <li class="drop-menu-effect"><a href="#"><span>退出系统</span></a>
                <div class="submenu" style="left:-347px;">
                    <div class="mj_menu_news_bg">
                        <div class="mj_menu_news_main">
                            <div class="mj_menu_news_li3">
                                <div class="mj_menu_li_txt">
                                    <a href="javaScript:logout()">退出系统</a><br />
                                </div>
                            </div>
                            <div class="mj_menu_news_img3">
                                <img src="${pageContext.request.contextPath}/images/p.png" /><br />
                                <font>退出系统</font>
                            </div>
                            <div style="clear:both; height:0px; overflow:hidden;"></div>
                        </div>
                    </div>
                </div></li>
        </div>
    </div>
    <div style="height: 100%;">
        <iframe name="backContent"
            style="width:100%; height: 99.6%;frameborder=" no" ;border="none">
        </iframe>
    </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <script>
        function logout() {
            if (confirm("您确定退出后台管理系统吗？")) {
                location.href = "${pageContext.request.contextPath}/back/backLogout.action";
            }
        }
        $(function() {
            lanrenzhijia(".drop-menu-effect");
        });
        function lanrenzhijia(_this) {
            $(_this).each(function() {
                var $this = $(this);
                var theMenu = $this.find(".submenu");
                var tarHeight = theMenu.height();
                theMenu.css({
                    height : 0
                });
                $this.hover(function() {
                    $(this).addClass("mj_hover_menu");
                    theMenu.stop().show().animate({
                        height : tarHeight
                    }, 400);
                }, function() {
                    $(this).removeClass("mj_hover_menu");
                    theMenu.stop().animate({
                        height : 0
                    }, 400, function() {
                        $(this).css({
                            display : "none"
                        });
                    });
                });
            });
        }
    </script>

</body>
</html>