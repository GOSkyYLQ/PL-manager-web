<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/15/015
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://unpkg.com/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="icon" href="../img/login.ico" type="image/x-icon">
    <link rel="Shortcut Icon" href="../img/login.ico" type="image/x-icon">
    <title>登录</title>
</head>
<body>
<header>
    <a class="login" href="#">
        <i class="fa fa-user-circle"></i>
    </a>
</header>
<main>
    <p>防雷业务综合管理系统-防雷工程管理子系统</p>
    <div class="flip-modal login">
        <div class="modal modal-login">
            <a class="close fa fa-close" href="#"></a>
            <div class="tabs">
                <a class="login active" href="#">登录</a>
            </div>
            <div class="content">
                <div class="errormsg"></div>
                <form  method="post" action="/">
                    <div class="input-field">
                        <i class="fa fa-user-o"></i>
                        <input name="username" type="text" placeholder="用户名">
                    </div>
                    <div class="input-field">
                        <i class="fa fa-lock"></i>
                        <input name="password" type="password" placeholder="密码">
                    </div>
                    <div class="input-field">
                        <input type="submit" value="登录">
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<script type="text/javascript" src="../js/login.js"></script>
</body>
</html>
