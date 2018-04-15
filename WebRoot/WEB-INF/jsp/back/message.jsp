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

<title>聊天记录查看</title>

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
    padding: 2px 16px;
    font-size: 16px;
    font-family: 微软雅黑;
    border-radius: 2px;
    font-weight:bold;
    background-color: lightskyblue;
    border: 1px solid #000;
    cursor: pointer;
}

.search-input {
    border: 1px solid;
    border-radius: 3px;
    outline: none;
    width: 150px;
    height: 30px;
}

.every_line:HOVER {
    background-color: #a3a375;
}

.page {
    margin-top: 20px;
}
</style>
</head>
<body style="position: relative; background-color: #ccccb3">
    <div class="content" style="position: absolute; width: 100%; height: 550px;">
        <center>
            <div class="content-title">
                <br />
                <h1>聊天记录查看</h1>
                <br />
            </div>
            <div class="content-search">
               关键字查询:&nbsp;&nbsp;&nbsp;<input id="content" class="search-input" type="text" value="${content }" placeholder="请输入关键字" name="content" maxlength="15">&nbsp;&nbsp;&nbsp;&nbsp; <input
                    class="search-button" type="button" onclick="search()" value="搜索">
            </div>
            <br />
            <div class="content-list">
                <c:choose>
                    <c:when test="${not empty messageVoList }">
						<table style="text-align:center;width: 900px;">
							<thead
								style=" background-color: #cccc99;font-family: 微软雅黑;font-size: 20px">
								<tr>
									<th>编号</th>
									<th>发送人</th>
									<th>发送内容</th>
									<th>收信人</th>
									<th>发送时间</th>
									<th>聊天类型</th>
									<th>操作</th>
								</tr>
							</thead>
							<c:forEach varStatus="i" var="m" items="${messageVoList }">
								<tr class="every_line">
									<td style="text-align: center;">${i.index + 1}</td>
									<td style="text-align: center;"><span title="${m.fromUserName}"
										style="white-space:nowrap; width: 160px;display: inline-block;overflow:hidden;text-overflow: ellipsis;">${m.fromUserName}</span></td>
									<td style="text-align: left;"><span
										title="${m.content}"
										style="white-space:nowrap; width: 210px;display: inline-block;overflow:hidden;text-overflow: ellipsis;">${m.content}</span></td>
                                    <td style="text-align: center;"><span title="${m.toUserName}"
                                        style="white-space:nowrap; width: 160px;display: inline-block;overflow:hidden;text-overflow: ellipsis;">${m.toUserName}</span></td>
									<td title="${m.sendTime}">${m.sendTime}</td>
									<td title="${m.type}">${m.type}</td>
									<td><a href="javascript:deleteBrand('${m.id }');"><img
											alt=""
											src="${pageContext.request.contextPath}/images/delete.png"
											width="20px" height="20px"></a></td>
								</tr>
							</c:forEach>
						</table>
						<br />
                        <div class="page">
                            <a href="${pageContext.request.contextPath}/back/showMessage.action?content=${content }&currentPage=1"><img alt=""
                                src="${pageContext.request.contextPath}/images/firstPage.png" width="20px" height="20px"></a> <a
                                href="${pageContext.request.contextPath}/back/showMessage.action?content=${content }&currentPage=${currentPage - 1}"><img alt=""
                                src="${pageContext.request.contextPath}/images/pPage.png" width="20px" height="20px"></a> <span style="color: #000000;font-size: 20px"><b>&nbsp;${currentPage }&nbsp;</b>
                            </span><a href="${pageContext.request.contextPath}/back/showMessage.action?content=${content }&currentPage=${currentPage + 1}"><img alt=""
                                src="${pageContext.request.contextPath}/images/nPage.png" width="20px" height="20px"></a>
							<a
								href="${pageContext.request.contextPath}/back/showMessage.action?content=${content }&currentPage=${maxPageNum}"><img
								alt=""
								src="${pageContext.request.contextPath}/images/lastPage.png"
								width="20px"> </a> <b style="color: #000000;font-size: 16px">共
                                ${maxPageNum } 页 </b><input id="goPage" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
                                maxlength="5" value="${currentPage }" type="text" style="width: 40px;height: 20px;"> <input class="go_page" type="button" onclick="goToPage()"
                                value="跳转"">
                        </div>
                    </c:when>
                    <c:otherwise>
                        <center>
                            <h3>没有聊天记录信息</h3>
                        </center>
                    </c:otherwise>
                </c:choose>
            </div>
        </center>
    </div>
    <script>
        function search() {
            var content = document.getElementById("content").value;
            location.href = "${pageContext.request.contextPath}/back/showMessage.action?content="
                    + content;
        }

        function goToPage() {
            var goPage = document.getElementById("goPage").value;
            location.href = "${pageContext.request.contextPath}/back/showMessage.action?&currentPage="
                    + goPage;
        }

        function deleteBrand(id) {
            if (confirm("你确定删除吗？")) {
                location.href = "${pageContext.request.contextPath}/back/delMessage.action?&id="
                        + id;
            }
        }
    </script>
</body>
</html>
