<%--
  Created by IntelliJ IDEA.
  User: yangy
  Date: 2018/2/4
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
    </div>
    <div class="head-l">
        <c:choose>
            <c:when test="${empty user }">
                <a href="login.html" class="button button-little bg-green" ><span class="icon-home"></span> 用户登录</a> &nbsp;&nbsp;
            </c:when>
            <c:otherwise>
                <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 您好 ${user.userName}</a> &nbsp;&nbsp; &nbsp;&nbsp;<a class="button button-little bg-red" href="logout.php"><span class="icon-power-off"></span> 退出登录</a> </div>
            </c:otherwise>
        </c:choose>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <ul style="display:block">
        <li><a href="trainInfoQuery.php" target="right"><span class="icon-caret-right"></span>列车管理</a></li>
        <li><a href="questionQuery.php" target="right"><span class="icon-caret-right"></span>问题管理</a></li>
    </ul>
</div>
<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="trainInfoQuery.php" name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>