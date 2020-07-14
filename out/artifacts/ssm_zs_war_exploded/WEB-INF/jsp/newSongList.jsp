<%--
  Created by IntelliJ IDEA.
  User: sure
  Date: 2020/4/16
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/resource/favicon.ico">
    <title>创建歌单</title>
    <link rel="stylesheet" type="text/css" href="/resource/css/title_and_foot.css"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/newSongList.css"/>
</head>
<body>
<script src="/resource/js/jquery.js"></script>
<script src="/resource/js/newSongList.js" type="text/javascript" charset="utf-8"></script>

<div class="suspended" id="yyg_login">
    <div id="login-title">
        QQ登录
        <img src="/resource/img/yyg/close1.png" style="width: 15px;height: 15px;float: right;margin: 10px;" id="close" class="hand">
    </div>
    <div style="width: 500px;height: 50px;text-align: center;line-height: 70px;font-size: 20px;">账号密码登录</div>
    <form action="#" method="post">
        <input type="text" name="uNumber" id="uNumber" placeholder="请输入账号"/>
        <input type="password" name="uPassword" id="uPassword" placeholder="请输入密码"/>
        <input type="submit" value="授权并登录" id="s_and_l" class="hand"/>
    </form>
    <div id="register" class="hand">注册新账号</div>
</div>

<div id="music-title">
    <div class="content" id="title-content">
        <div id="m-logo"><img src="/resource/img/yyg/logo.png"></div>
        <div class="title-text hand green" onclick="window.location.href='/yyg/yyg';">音乐馆</div>
        <div id="yyg" class="hand">我的音乐</div>
        <div id="client" class="title-text hand green">客户端</div>
        <div id="kfpt" class="title-text hand green">开放平台</div>
        <div id="vip" class="title-text hand green">VIP</div>
        <div id="find-music">
            <form action="/yyg/findSongs" method="post">
                <input type="text" name="findName" id="find" placeholder="搜索音乐、MV、歌单、用户">
                <input type="submit" id="f-sub" style="display:none;"></input>
                <img src="/resource/img/yyg/find.png" id="find-btn"
                     onclick="$('#f-sub').click();">
                </input>
            </form>
        </div>
        <div id="login">
            <c:if test="${user==null}">
                <div id="login1" class="hand green">
                    登录
                </div>
            </c:if>
            <c:if test="${user!=null}">
                <img src=${user.uPhotoUrl} class="hand" style="width: 38px;height: 38px;border-radius: 50%;margin-top: 25px;">
            </c:if>
        </div>
        <div id="kl" class="hand">
            <div id="kl-btn" >
                开通绿钻豪华版
            </div>
        </div>
        <div id="kf" class="hand">
            <div id="kf-btn">
                开通付费包
            </div>
        </div>
    </div>
</div>


<div id="show">

    <div style="font-size: 25px;margin-left: 170px;margin-top: 60px">新建歌单</div>

    <form method="post" action="/myMusic/doNewSongList">

        <div id="get-l-name">
            <div class="left-text">歌单名称</div>
            <div><input type="text" name="listName" id="list-name" class="gray-border" placeholder="&nbsp;&nbsp;请输入歌单名"></div>
        </div>

        <div id="get-l-cover">
            <div class="left-text">歌单封面</div>
            <div id="l-cover">
                <img src="/resource/img/yyg/gd1.jpg" width="180px" height="180px" id="MYimg" name="lPhotoUrl" value="/resource/img/yyg/gd1.jpg">
            </div>
            <div style="float: left;height: 180px">
                <div style="float: left;margin-left: 30px;width: 500px">
                    最佳尺寸：800*800 px
                    <br>
                    支持JPG、JPEG、GIF、PNG，大小不超过5MB
                </div>
            </div>
            <a href="javascript:void(0)" class="file">
                <div id="file1" class="hand" onclick="$('#file').click()">插入图片</div>
                <input type="file" name="" id="file" style="display: none"/>
            </a>

        </div>

        <div id="select-tag">
            <div class="left-text">歌单标签</div>
            <div id="sl-tag" class="gray-border"></div>
        </div>

        <div id="show-tag" class="gray-border">
            <c:forEach items="${tagList}" var="tag">
                <c:if test="${tag.tId==0}">
                    <div class="t-title">${tag.tName}</div>
                </c:if>
                <c:if test="${tag.tId!=0}">
                    <div class="tag hand green" value="${tag.tId}">${tag.tName}</div>
                </c:if>
            </c:forEach>
        </div>

        <input type="submit" class="hand" value="完成" id="sub">

        <div id="go-back" class="gray-border hand"
             onclick="window.location.href='/myMusic/myMusic?p1=1&p2=0&uId=${user.uId}';">取消</div>

        <input type="text" name="tId11" id="tId11" style="display: none">
        <input type="text" name="tId22" id="tId22" style="display: none">
        <input type="text" name="tId33" id="tId33" style="display: none">

    </form>



</div>


<div id="links" style="float: left;">
    <div class="content">
        <div class="link">
            <div>下载qq音乐客户端</div>
            <div class="link-icons">
                <div style="float: left;" class="hand green">
                    <div class="link-icon" style="background-position: -2px 0;"></div>
                    <div class="icon-name">PC版</div>
                </div>
                <div style="float: left;" class="hand green">
                    <div class="link-icon" style="background-position: -95px 0;"></div>
                    <div class="icon-name">Mac版</div>
                </div>
                <div style="float: left;" class="hand green">
                    <div class="link-icon" style="background-position: -193px 0;"></div>
                    <div class="icon-name">Android版</div>
                </div>
                <div style="float: left;" class="hand green">
                    <div class="link-icon" style="background-position: -285px 0;"></div>
                    <div class="icon-name">iphone版</div>
                </div>

                <div style="position:relative;top: 80px;">开放平台</div>
                <div style="position:relative;top: 120px;" class="hand green">QQ音乐开放平台</div>
                <div style="position:relative;top: 100px;left: 150px;" class="hand green">通讯音乐人</div>
            </div>
        </div>
        <div class="link">
            <div>特色产品</div>
            <div class="link-icons">
                <div style="float: left;" class="hand green">
                    <div class="link-icon" style="background-position: -380px 0;"></div>
                    <div class="icon-name">全民K歌</div>
                </div>
                <div style="float: left;" class="hand green">
                    <div class="link-icon" style="background-position: -475px 0;"></div>
                    <div class="icon-name" style="width: 100px; position:relative;right: 19px;">Supper Sound</div>
                </div>
                <div style="float: left;" class="hand green">
                    <div class="link-icon" style="background-position: -580px 0;"></div>
                    <div class="icon-name">QPlay</div>
                </div>
                <div style="width: 200px;height: 200px;"></div>
                <div class="hand green" style="float:left;position:relative;top: -55px;left: 10px;">车载互联</div>
                <div class="hand green" style="float:left;position:relative;top: -55px;left: 25px;">QQ演出</div>
                <div class="hand green" style="float:left;position:relative;top: -5px;left: -110px;">TME集团官网</div>
                <div class="hand green" style="float:left;position:relative;top: 52px;left: -205px;">腾讯音乐</div>
            </div>
        </div>
        <div class="link" id="link3">
            <div>合作链接</div>
            <div style="width: 380px;float: left;margin-top: 40px;">
                <div class="hz" style="margin-right: 40px;">CG ENM</div>
                <div class="hz" style="margin-right: 40px;">腾讯视频</div>
                <div class="hz">手机QQ空间</div>
            </div>

            <div style="width: 380px;float: left;">
                <div class="hz" style="margin-right: 30px;">最新版QQ</div>
                <div class="hz" style="margin-right: 10px;">腾讯社交广告</div>
                <div class="hz">电脑管家</div>
            </div>

            <div style="width: 380px;float: left;">
                <div class="hz" style="margin-right: 30px;">QQ浏览器</div>
                <div class="hz" style="margin-right: 42px;">腾讯微云</div>
                <div class="hz">腾讯云</div>
            </div>

            <div style="width: 380px;float: left;">
                <div class="hz" style="margin-right: 47px;">企鹅FM</div>
                <div class="hz" style="margin-right: 25px;">智能电视网</div>
                <div class="hz">当贝市场</div>
            </div>

        </div>
        <div id="foot" style="float: left;margin-top: 40px;margin-left: 300px;">
            <img src="/resource/img/yyg/foot.png" style="width: 600px;height: 100px;">
        </div>
    </div>
</div>


</body>
</html>

