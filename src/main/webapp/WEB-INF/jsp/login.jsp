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
    <title>登录|注册</title>
</head>
<body>
<header>
    <a class="login" href="#">
        <i class="fa fa-user-circle"></i>
    </a>
</header>
<main>
    <p>防雷工程管理系统</p>
    <div class="flip-modal login">
        <div class="modal modal-login">
            <a class="close fa fa-close" href="#"></a>
            <div class="tabs">
                <a class="login active" href="#">登录</a>
                <a class="register" href="#">注册</a>
            </div>
            <div class="content">
                <div class="errormsg"></div>
                <form  method="post" action="userLogin">
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
        <div class="modal modal-register">
            <a class="close fa fa-close" href="#"></a>
            <div class="tabs">
                <a class="login" href="#">登录</a>
                <a class="register active" href="#">注册</a>
            </div>
            <div class="content">
                <div class="errormsg"></div>
                <form class="" method="get" action="userRegister">
                    <div class="input-field">
                        <i class="fa fa-user-o"></i>
                        <input name="username" type="text" placeholder="输入用户名">
                    </div>
                    <div class="input-field">
                        <i class="fa fa-user-o"></i>
                        <input name="realname" type="text" placeholder="真实姓名">
                    </div>
                    <div class="input-field">
                        <i class="fa fa-lock"></i>
                        <input name="password" type="password" placeholder="输入密码">
                    </div>
                    <div class="input-field">
                        <i class="fa fa-lock"></i>
                        <input name="password2" type="password" placeholder="请再次输入密码">
                    </div>
                    <div class="input-field">
                        <i class="fa fa-phone"></i>
                        <input name="mobile" type="text" placeholder="电话号码">
                    </div>
                    <div class="input-field">
                        <i class="fa fa-address-book"></i>
                        <input name="email" type="text" placeholder="电子邮箱">
                    </div>
                    <p style="font-size:17px">您的注册申请将被发送给管理员进行审核，请稍后再尝试登录</p>
                    <div class="input-field">
                        <input type="submit" value="注册">
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<script type="text/javascript" src="../js/login.js"></script>
</body>
</html>
