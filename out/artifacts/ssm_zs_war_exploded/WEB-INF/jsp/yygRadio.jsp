<%--
  Created by IntelliJ IDEA.
  User: sure
  Date: 2020/4/15
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/resource/favicon.ico">
    <title>电台</title>
    <link rel="stylesheet" type="text/css" href="/resource/css/title_and_foot.css"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/yygRadio.css"/>
</head>
<body>
<script src="/resource/js/jquery.js"></script>
<script src="/resource/js/yygRadio.js" type="text/javascript" charset="utf-8"></script>

<div class="suspended" id="yyg_login">
    <div id="login-title">
        QQ登录
        <img src="/resource/img/yyg/close1.png" style="width: 15px;height: 15px;float: right;margin: 10px;" id="close" class="hand">
    </div>
    <div style="width: 500px;height: 50px;text-align: center;line-height: 70px;font-size: 20px;">账号密码登录</div>
    <form action="/yyg/doLogin" method="post">
        <input type="text" name="uNumber" id="uNumber" placeholder="请输入账号"/>
        <input type="password" name="uPassword" id="uPassword" placeholder="请输入密码"/>
        <input type="submit" value="授权并登录" id="s_and_l" class="hand"/>
    </form>
    <div onclick="window.location.href='/yyg/registerUser';" id="register" class="hand">注册新账号</div>
</div>

<div id="music-title">
    <div class="content" id="title-content">
        <div id="m-logo"><img src="/resource/img/yyg/logo.png"></div>
        <div id="yyg" class="hand" onclick="window.location.href='/yyg/yyg';">音乐馆</div>
        <c:if test="${user!=null}">
            <div id="mymusic" class="title-text hand green" onclick="window.location.href='/myMusic/myMusic?p1=0&p2=0&uId=${user.uId}';">我的音乐</div>
        </c:if>
        <c:if test="${user==null}">
            <div id="mymusic" class="title-text hand green needLogin" >我的音乐</div>
        </c:if>
        <div id="client" class="title-text hand green" onclick="window.open('/myMusic/openPlatform','_blank');">客户端</div>
        <div id="kfpt" class="title-text hand green" onclick="window.open('/myMusic/openPlatform','_blank');">开放平台</div>
        <div id="vip" class="title-text hand green" onclick="window.open('/myMusic/openPlatform','_blank');">VIP</div>
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
                <img src=${user.uPhotoUrl} class="hand" style="width: 38px;height: 38px;border-radius: 50%;margin-top: 25px;" onclick="window.location.href='/myMusic/myMusic?p1=0&p2=0&uId=${user.uId}';">
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

<div id="m-btns">
    <div class="content">
        <div onclick="window.location.href='/yyg/yyg';" class="m-btns hand green" id="m-b1">首页</div>
        <div onclick="window.location.href='/yyg/yygSinger';" class="m-btns hand green" id="m-b2">歌手</div>
        <div onclick="window.location.href='/yyg/yygDisc';" class="m-btns hand green" id="m-b3">新碟</div>
        <div onclick="window.location.href='/yyg/yygRank?rId=0';" class="m-btns hand green" id="m-b4">排行榜</div>
        <div onclick="window.location.href='/yyg/yygSongList';" class="m-btns hand green" id="m-b5">分类歌单</div>
        <div onclick="window.location.href='/yyg/yygRadio';" class="m-btns hand green" id="m-b6">电台</div>
        <div onclick="window.location.href='/yyg/yygMV';" class="m-btns hand green" id="m-b7">MV</div>
        <div onclick="window.location.href='/yyg/yygAlbum';" class="m-btns hand green" id="m-b8">数字专辑</div>
        <div onclick="window.location.href='/yyg/yyg';" class="m-btns hand green" id="m-b9">票务</div>
    </div>
</div>

<div id="show">


    <div id="r-tags">
        <div style="float: left;width: 1px;height: 490px;margin-top: 22px;background: #dcdde1;"></div>
        <div id="r-img">
            <img src="/resource/img/radio/sidebar.png" style="margin-top: 10px;">
        </div>
        <div id="tags">
            <div class="r-tag" style="margin-top: 0px;"><a href="#rm" class="hand green">热门</a></div>
            <div class="r-tag"><a href="#xq" class="hand green">心情</a></div>
            <div class="r-tag"><a href="#zt" class="hand green">主题</a></div>
            <div class="r-tag"><a href="#cj" class="hand green">场景</a></div>
            <div class="r-tag"><a href="#qf" class="hand green">曲风</a></div>
            <div class="r-tag"><a href="#yy" class="hand green">语言</a></div>
            <div class="r-tag"><a href="#rq" class="hand green">人群</a></div>
            <div class="r-tag"><a href="#yq" class="hand green">乐器</a></div>
        </div>
    </div>

    <div id="discs">

        <div style="margin-left: 220px;margin-top: 50px; float: left;">
            <div class="r-title"><a id="rm"></a>热门</div>
            <c:forEach items="${songLists}" var="song" end="4">
                <div class="dish-content">
                    <img src="${song.lPhotoUrl}" class="d-cove" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                    <div class="d-name hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">${song.listName}</div>
                    <div class="d-singer">播放量: ${song.lListenNum}万</div>
                </div>
            </c:forEach>
        </div>


        <div style="margin-left: 220px;margin-top: 50px; float: left;">
            <div class="r-title"><a id="xq"></a>心情</div>

            <c:forEach items="${songLists}" var="song" begin="5" end="9">
                <div class="dish-content">
                    <img src="${song.lPhotoUrl}" class="d-cove" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                    <div class="d-name hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">${song.listName}</div>
                    <div class="d-singer">播放量: ${song.lListenNum}万</div>
                </div>
            </c:forEach>
        </div>

        <div style="margin-left: 220px;margin-top: 50px; float: left;">
            <div class="r-title"><a id="zt"></a>主题</div>

            <c:forEach items="${songLists}" var="song" begin="10" end="14">
                <div class="dish-content">
                    <img src="${song.lPhotoUrl}" class="d-cove" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                    <div class="d-name hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">${song.listName}</div>
                    <div class="d-singer">播放量: ${song.lListenNum}万</div>
                </div>
            </c:forEach>
        </div>

        <div style="margin-left: 220px;margin-top: 50px; float: left;">
            <div class="r-title"><a id="cj"></a>场景</div>

            <c:forEach items="${songLists}" var="song" begin="2" end="5">
                <div class="dish-content">
                    <img src="${song.lPhotoUrl}" class="d-cove" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                    <div class="d-name hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">${song.listName}</div>
                    <div class="d-singer">播放量: ${song.lListenNum}万</div>
                </div>
            </c:forEach>
        </div>

        <div style="margin-left: 220px;margin-top: 50px; float: left;">
            <div class="r-title"><a id="qf"></a>曲风</div>

            <c:forEach items="${songLists}" var="song" begin="20" end="24">
                <div class="dish-content">
                    <img src="${song.lPhotoUrl}" class="d-cove" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                    <div class="d-name hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">${song.listName}</div>
                    <div class="d-singer">播放量: ${song.lListenNum}万</div>
                </div>
            </c:forEach>
        </div>

        <div style="margin-left: 220px;margin-top: 50px; float: left;">
            <div class="r-title"><a id="yl"></a>语言</div>

            <c:forEach items="${songLists}" var="song" begin="15" end="19">
                <div class="dish-content">
                    <img src="${song.lPhotoUrl}" class="d-cove" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                    <div class="d-name hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">${song.listName}</div>
                    <div class="d-singer">播放量: ${song.lListenNum}万</div>
                </div>
            </c:forEach>
        </div>

        <div style="margin-left: 220px;margin-top: 50px; float: left;">
            <div class="r-title"><a id="rq"></a>人群</div>

            <c:forEach items="${songLists}" var="song" begin="12" end="16">
                <div class="dish-content">
                    <img src="${song.lPhotoUrl}" class="d-cove" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                    <div class="d-name hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">${song.listName}</div>
                    <div class="d-singer">播放量: ${song.lListenNum}万</div>
                </div>
            </c:forEach>
        </div>

        <div style="margin-left: 220px;margin-top: 50px; float: left;">
            <div class="r-title"><a id="yq"></a>乐器</div>

            <c:forEach items="${songLists}" var="song" begin="25" end="29">
                <div class="dish-content">
                    <img src="${song.lPhotoUrl}" class="d-cove" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                    <div class="d-name hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">${song.listName}</div>
                    <div class="d-singer">播放量: ${song.lListenNum}万</div>
                </div>
            </c:forEach>
        </div>



    </div>




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

