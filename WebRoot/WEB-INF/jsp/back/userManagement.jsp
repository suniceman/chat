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
<base href="<%=basePath%>">

<title>用户管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style>
* {
    margin: 0px;
    padding: 0px;
}

tr td{
    height: 30px;
    border-bottom: 1px solid;
}

table{
    border-spacing: 0px;
    text-align: center;
}

.search-button,.go_page {
    color: white;
    font-size: 14px;
    font-family: 微软雅黑;
    background-color: #cccc99;
    border: none;
    cursor: pointer;
}

.search-input {
    border: 1px solid;
    border-radius: 3px;
    outline: none;
    width: 150px;
    height: 20px;
}

.every_line:HOVER {
    background-color: #a3a375;
}
</style>
</head>
<body style="position: relative; background-color: #ccccb3">
    <div class="content" style="position: absolute; width: 100%; height: 550px;">
        <center>
            <div class="content-title">
                <br />
                <h1>用户管理</h1>
                <br />
            </div>
            <div class="content-search">
                用户名:&nbsp;<input id="username" class="search-input" type="text" value="${username }" placeholder="请输入用户名" name="username" maxlength="20">
                <input class="search-button" type="button" onclick="search()" value="搜索">
            </div>
            <br />
            <div class="content-list">
                <c:choose>
                    <c:when test="${not empty userList }">
                        <table class="papaer" style="text-align:center;width: 900px;">
                            <thead style=" background-color: #cccc99;font-family: 微软雅黑;font-size: 20px">
                                <tr>
                                    <th>编号</th>
                                    <th>用户名</th>
                                    <th>邮箱</th>
                                    <th>角色</th>
                                    <th>操作</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <c:forEach varStatus="i" var="user" items="${userList }">
                                <tr class="every_line" border-bottom:1px solid; ">
                                    <td style="text-align: center;">${i.index + 1}</td>
                                    <td>${user.username}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <c:if test="${user.roleId == 1}">超级管理员 </c:if>
                                        <c:if test="${user.roleId == 2}">普通用户 </c:if>
                                    </td>
                                    <td>
                                    <c:if test="${user.roleId == 2}">
                                    <a
                                        href="${pageContext.request.contextPath}/back/editUser.action?&id=${user.id }"><img
                                            title="编辑"
                                            src="${pageContext.request.contextPath}/images/edit.png"
                                            width="20px" height="20px"></a>
                                            </c:if>
                                            </td>
                                 <td style="text-align: center;">
                                    <c:if test="${user.roleId == 1}"></c:if>
                                    <c:if test="${user.roleId == 2}">
                                    <a title="删除" href="javascript:deleteUser('${user.id }');"><img alt="" src="${pageContext.request.contextPath}/images/delete.png"
                                     width="20px" height="20px">
                                    </a>
                                    </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <br />
                        <div class="page">
                            <a href="${pageContext.request.contextPath}/back/showUser.action?username=${username }&currentPage=1"><img alt=""
                                src="${pageContext.request.contextPath}/images/firstPage.png" width="20px" height="20px"></a> <a
                                href="${pageContext.request.contextPath}/back/showUser.action?username=${username }&currentPage=${currentPage - 1}"><img alt=""
                                src="${pageContext.request.contextPath}/images/pPage.png" width="20px" height="20px"></a> <span style="color: #000000;font-size: 16px"><b>&nbsp;${currentPage }&nbsp;</b>
                            </span><a href="${pageContext.request.contextPath}/back/showUser.action?username=${username }&currentPage=${currentPage + 1}"><img alt=""
                                src="${pageContext.request.contextPath}/images/nPage.png" width="20px" height="20px"></a> <a
                                href="${pageContext.request.contextPath}/back/showUser.action?username=${username }&currentPage=${maxPageNum}"><img alt=""
                                src="${pageContext.request.contextPath}/images/lastPage.png" width="20px" height="20px"> </a> <b style="color: #000000;font-size: 16px">共
                                ${maxPageNum } 页 </b><input id="goPage" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
                                maxlength="5" value="${currentPage }" type="text" style="width: 40px;height: 20px;"> <input class="go_page" type="button" onclick="goToPage()"
                                value="跳转" style="width: 50px;">
                        </div>
                    </c:when>
                    <c:otherwise>
                        <center>
                            <h3>没有用户信息</h3>
                        </center>
                    </c:otherwise>
                </c:choose>
            </div>
        </center>
    </div>
    <script>
        function search() {
            var username = document.getElementById("username").value;
            location.href = "${pageContext.request.contextPath}/back/showUser.action?username=" + username;
        }

        function goToPage() {
            var goPage = document.getElementById("goPage").value;
            location.href = "${pageContext.request.contextPath}/back/showUser.action?&currentPage="
                    + goPage;
        }

        function deleteUser(id) {
            if (confirm("你确定删除吗？")) {
                location.href = "${pageContext.request.contextPath}/back/delUser.action?&id=" + id;
            }
        }
    </script>
</body>
</html>
