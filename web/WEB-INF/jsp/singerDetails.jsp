<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sure
  Date: 2020/4/12
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/resource/favicon.ico">
    <title>歌手详情</title>
    <link rel="stylesheet" type="text/css" href="/resource/css/title_and_foot.css"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/singerDetails.css"/>
</head>
<body>
<script src="/resource/js/jquery.js"></script>
<%--<script src="/resource/js/title_and_foot.js" type="text/javascript" charset="utf-8"></script>--%>
<script src="/resource/js/singerDetails.js" type="text/javascript" charset="utf-8"></script>

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
    <div id="register" class="hand">注册新账号</div>
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


<div id="details">
    <div class="content">


        <img src="${singer.sPhotoUrl}" width="250px" height="250px" style="border-radius: 50%;margin-top: 35px;float: left;">

        <div id="big_sName">${singer.sName}</div>
        <div id="enter">已入驻</div>
        <div style="height: 44px;width: 530px;float: left;margin-top: 79px;"></div>
        <div id="introduction">${singer.sIntroduction}</div>
        <div id="more" class="hand">[ 更多 ]</div>
        <div style="float: left;width: 900px;height: 30px;">
            <div class="t-text">
                单曲 ${singer.singleNum} | 专辑 ${singer.albumNum} | MV ${singer.mvNum}
            </div>
        </div>
        <div id="play-hot-song" class="hand">
            <div style="float: left;margin: 6px;"><img src="/resource/img/singer/singer_play.png" width="25px" height="25px"></div>
            <div style="float: left;">播放歌手热门歌曲</div>
        </div>
        <div id="attention" class="hand">
            <div style="float: left;margin: 6px;"><img src="/resource/img/singer/singer_add.png" id="attent" width="25px" height="25px"></div>
            <!-- <div><img src="../img/singer/singer_add2.png" id="attent" width="25px" height="25px"></div> -->
            <c:if test="${user!=null}">
                <div style="float: left;"
                     onclick="window.location.href='/myMusic/insertAttentionSinger?uId=${user.uId}&sId=${singer.sId}';">关注 ${singer.sAttentionNum}万</div>
            </c:if>
            <c:if test="${user==null}">
                <div class="needLogin" style="float: left;">关注 ${singer.sAttentionNum}万</div>
            </c:if>
        </div>

    </div>
</div>


<div id="hot_songs">
    <div class="content">

        <div class="big-title">热门歌曲</div>

        <div class="song-tr1" style="color: gray;">
            <div class="th1">歌曲</div>
            <div class="td2">专辑</div>
            <div class="td3">时长</div>
        </div>
        <div id="songs">

            <c:if test="${songList!=null}">
            <c:forEach items="${songList}" var="song" varStatus="status">
                <c:if test="${status.count%2==1}">
                    <div class="song-tr2 sdtr">
                        <div class="td0">${status.count}</div>
                        <c:if test="${user!=null}">
                            <div class="td1 hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}&n=0','_blank');">${song.songName}</div>
                        </c:if>
                        <c:if test="${user==null}">
                            <div class="td1 hand green needLogin">${song.songName}</div>
                        </c:if>
                        <div class="td2 hand green" onclick="window.location.href='/yyg/AlbumDetails?aId=${song.album.aId}';">${song.album.aName}</div>
                        <div class="td3">${song.sLong}</div>
                    </div>
                </c:if>
                <c:if test="${status.count%2==0}">
                    <div class="song-tr1 sdtr">
                        <div class="td0">${status.count}</div>
                        <c:if test="${user!=null}">
                            <div class="td1 hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}&n=0','_blank');">${song.songName}</div>
                        </c:if>
                        <c:if test="${user==null}">
                            <div class="td1 hand green needLogin">${song.songName}</div>
                        </c:if>
                        <div class="td2 hand green" onclick="window.location.href='/yyg/AlbumDetails?aId=${song.album.aId}';">${song.album.aName}</div>
                        <div class="td3">${song.sLong}</div>
                    </div>
                </c:if>

            </c:forEach>
            </c:if>

        </div>


    </div>
</div>


<div id="sing-page">
    <div id="content">
        <div style="margin: 0 auto; width: 170px; margin-top: 50px;">
            <div id="pages">

                <div id="last-page" class="page">
                    <img src="/resource/img/singer/last_page.png" style="margin: 10px 15px;">
                </div>

                <div id="parent">
                    <div id="pagen">
                        <div class="page2">1</div>
                    </div>
                </div>

                <div id="next-page" class="page">
                    <img src="/resource/img/singer/next_page.png" style="margin: 10px 15px;">
                </div>

            </div>
        </div>
    </div>
</div>






<div id="links">
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

<div class="tjd">
    <div id="songId"></div>
    <c:forEach items="${usongLists}" var="list">
        <div class="tjd-n" value="${list.lId}">
                ${list.listName}
        </div>
    </c:forEach>
</div>

</body>
</html>

