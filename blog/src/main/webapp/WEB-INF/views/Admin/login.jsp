<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/4
  Time: 20:08
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Yuu Blog-后台管理</title>
    <link rel="icon" href="/static/assets/img/logo.png" />
    <link href="/static/assets/css/login.css" rel="stylesheet" type="text/css"/>
    <!-- Jquery -->
    <script src="/static/assets/js/jquery.min.js"></script>
    <!-- Layui -->
    <script src="/static/assets/plugin/layui/layui.all.js"></script>
</head>

<body>
<div class="login_box">
    <div class="login_l_img"><img src="/static/assets/img/login-img.png"/></div>
    <div class="login">
        <div class="login_logo"><a href="#"><img src="/static/assets/img/login_logo.png"/></a></div>
        <div class="login_name">
            <p>Yuu Blog-后台管理系统</p>
        </div>
        <form method="post" id="loginForm">
            <input id="username" name="userName" type="text"  placeholder="用户名" autocomplete="off">
            <input id="password" name="userPass" type="password"  placeholder="密码" autocomplete="off"/>
            <input id="submit" value="登录" type="button"/>
        </form>
    </div>
    <div class="copyright"> by:&nbsp;Yuu Blog--版权所有©2019</div>
</div>



<script type="text/javascript">
    // 登录验证
    $("#submit").click(function () {
        var username = $("#username").val().replace(/(^\s*)|(\s*$)/g, "");
        var password = $("#password").val().replace(/(^s*)|(s*$)/g, "");
        if (username == "") {
            layer.msg('用户名不能为空!',function () {
                $("#username").val("");
            });
        } else if (password == "") {
            layer.msg('密码不能为空!',function () {
                $("#password").val("");
            })
        } else {
            $.ajax({
                async:false,
                type:"POST",
                url:"/loginVerify",
                contentType:"application/x-www-form-urlencoded; charset=utf-8",
                data:$("#loginForm").serialize(),
                dataType:"json",
                success:function (data) {
                    if(data.code == 0) {
                        layer.msg('用户名或密码错误！',function () {
                        })
                    } else {
                        window.location.href = "/admin"
                    }
                }
            })
        }
    });
</script>
</body>
</html>
