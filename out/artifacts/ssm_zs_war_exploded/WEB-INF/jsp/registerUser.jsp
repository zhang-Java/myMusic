<%--
  Created by IntelliJ IDEA.
  User: sure
  Date: 2020/4/6
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="/resource/favicon.ico" type="image/x-icon"/>
        <title>注册</title>
        <link rel="stylesheet" type="text/css" href="/resource/css/register.css"/>
    </head>
    <body>

        <div id="left" >
            <img src="/resource/img/register/logo1.png" id="logo1" class="hand"><div id="logo1-text" class="hand">QQ</div>
        </div>

        <div id="b1" class="hand">
            <img src="/resource/img/register/logo2.png" style="width: 100px; height: 40px;">
        </div>

        <div id="b2" class="hand">
            简体中文
        </div>

        <div id="b3" class="hand">
            意见反馈
        </div>

        <div id="t1">
            欢迎注册QQ
        </div>

        <div id="t2">
            每一天，乐在沟通。
        </div>

        <div id="t3" class="hand">
            免费靓号
        </div>

        <form action="/yyg/doRegisterUser" method="post" id="form1">
            <input type="text" name="uNumber" value="${uNumber}" style="display: none;">
            <input type="text" name="uName" id="uName" class="kuang" placeholder="昵称"/>
            <input type="password" name="uPassword" id="uPassword" class="kuang" placeholder="密码"/>
            <input type="button" value="立即注册" class="btn-z hand"
                   onclick="alert('帐号为：'+${uNumber});document.getElementById('form1').action='/yyg/doRegisterUser';document.getElementById('form1').submit();"
            />
        </form>

    </body>
</html>

