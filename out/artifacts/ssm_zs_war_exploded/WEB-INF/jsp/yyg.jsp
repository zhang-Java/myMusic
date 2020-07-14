<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sure
  Date: 2020/4/8
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/resource/favicon.ico" type="image/x-icon"/>
    <title>音乐馆</title>
</head>
<link rel="stylesheet" type="text/css" href="/resource/css/yyg.css"/>
<body>
<script src="/resource/js/jquery.js"></script>
<script src="/resource/js/yyg.js" type="text/javascript" charset="utf-8"></script>

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
    <div onclick="window.open('/yyg/registerUser','_blank');window.close();" id="register" class="hand">注册新账号</div>
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

<div id="recommend-list">
    <div class="content">
        <div class="list-title">
            歌 单 推 荐
        </div>
        <div class="list-btns" style="margin-left: 320px; margin-top: 10px;">
            <div id="l-btn1" class="m-btns2 hand green m-b" value="0">为你推荐</div>
            <div id="l-btn2" class="m-btns hand green m-b" value="1">官方歌单</div>
            <div id="l-btn3" class="m-btns hand green m-b" value="2">情歌</div>
            <div id="l-btn4" class="m-btns hand green m-b" value="3">网络歌曲</div>
            <div id="l-btn5" class="m-btns hand green m-b" value="4">经典</div>
            <div id="l-btn6" class="m-btns hand green m-b" style="margin-right: 200px;" value="5">KTV热歌</div>
        </div>
        <div class="l-select">
            <c:forEach items="${songLists}" var="song" end="4">
                <div class="list-content" style="margin-left: 10px;">
                    <div class="list-cover hand" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                        <img src="${song.lPhotoUrl}" >
                    </div>
                    <div class="list-text hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                        ${song.listName}
                        <br>
                        播放量: ${song.lListenNum}万
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="l-select" style="display: none">
            <c:forEach items="${songLists}" var="song" begin="5" end="9">
                <div class="list-content" style="margin-left: 10px;">
                    <div class="list-cover hand" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                        <img src="${song.lPhotoUrl}">
                    </div>
                    <div class="list-text hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                            ${song.listName}
                        <br>
                        播放量: ${song.lListenNum}万
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="l-select" style="display: none">
            <c:forEach items="${songLists}" var="song" begin="10" end="14">
                <div class="list-content" style="margin-left: 10px;">
                    <div class="list-cover hand" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                        <img src="${song.lPhotoUrl}" >
                    </div>
                    <div class="list-text hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                            ${song.listName}
                        <br>
                        播放量: ${song.lListenNum}万
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="l-select" style="display: none">
            <c:forEach items="${songLists}" var="song" begin="15" end="19">
                <div class="list-content" style="margin-left: 10px;">
                    <div class="list-cover hand" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                        <img src="${song.lPhotoUrl}" >
                    </div>
                    <div class="list-text hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                            ${song.listName}
                        <br>
                        播放量: ${song.lListenNum}万
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="l-select" style="display: none">
            <c:forEach items="${songLists}" var="song" begin="20" end="24">
                <div class="list-content" style="margin-left: 10px;">
                    <div class="list-cover hand" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                        <img src="${song.lPhotoUrl}" >
                    </div>
                    <div class="list-text hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                            ${song.listName}
                        <br>
                        播放量: ${song.lListenNum}万
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="l-select" style="display: none">
            <c:forEach items="${songLists}" var="song" begin="25" end="29">
                <div class="list-content" style="margin-left: 10px;">
                    <div class="list-cover hand" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                        <img src="${song.lPhotoUrl}" >
                    </div>
                    <div class="list-text hand green" onclick="window.location.href='/yyg/SongListDetails?lId=${song.lId}';">
                            ${song.listName}
                        <br>
                        播放量: ${song.lListenNum}万
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>

<div id="recommend-song">
    <div class="content">
        <div class="list-title">
            新 歌 首 发
        </div>
        <div class="list-btns" style="margin-left: 365px; margin-top: 10px;">
            <div id="s-btn1" class="m-btns2 hand green re-b" value="0">最新</div>
            <div id="s-btn2" class="m-btns hand green re-b" value="1">内地</div>
            <div id="s-btn3" class="m-btns hand green re-b" value="2">港台</div>
            <div id="s-btn4" class="m-btns hand green re-b" value="3">欧美</div>
            <div id="s-btn5" class="m-btns hand green re-b" value="4">韩国</div>
            <div id="s-btn6" class="m-btns hand green re-b" style="margin-right: 200px;" value="5">日本</div>
        </div>

        <div id="songs">
            <div class="s-select">
                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songs}" var="song" end="2">

                        <div class="song-content">
                            <c:if test="${user!=null}" >
                            <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                 onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>

                    </c:forEach>
                </div>

                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songs}" var="song" begin="3" end="5">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div>
                    <c:forEach items="${songs}" var="song" begin="6" end="8">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="s-select" style="display: none">
                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromOutBack}" var="song" end="2">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromOutBack}" var="song" begin="3" end="5">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div>
                    <c:forEach items="${songFromOutBack}" var="song" begin="6" end="8">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="s-select" style="display: none">
                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromGT}" var="song" end="2">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromGT}" var="song" begin="3" end="5">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div>
                    <c:forEach items="${songFromGT}" var="song" begin="6" end="8">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="s-select" style="display: none">
                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromEuropeAmerica}" var="song" end="2">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromEuropeAmerica}" var="song" begin="3" end="5">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div>
                    <c:forEach items="${songFromEuropeAmerica}" var="song" begin="6" end="8">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="s-select" style="display: none">
                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromKorea}" var="song" end="2">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromKorea}" var="song" begin="3" end="5">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div>
                    <c:forEach items="${songFromKorea}" var="song" begin="6" end="8">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="s-select" style="display: none">
                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromJapan}" var="song" end="2">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div style="float: left; border-bottom: 1px solid #ecf0f1;">
                    <c:forEach items="${songFromJapan}" var="song" begin="3" end="5">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>

                <div>
                    <c:forEach items="${songFromJapan}" var="song" begin="6" end="8">
                        <div class="song-content">
                            <c:if test="${user!=null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand" width="90px" height="90px" style="float: left;"
                                     onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">
                            </c:if>
                            <c:if test="${user==null}" >
                                <img src="/resource/img/music_cover/${song.songId}.jpg" class="s-cover hand needLogin" width="90px" height="90px" style="float: left;">
                            </c:if>
                            <div style="width: 150px; float: left;margin-left: 20px;">
                                <c:if test="${user!=null}" >
                                    <div class="songName hand green" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}','_blank');">${song.songName}</div>
                                </c:if>
                                <c:if test="${user==null}" >
                                    <div class="songName hand green needLogin">${song.songName}</div>
                                </c:if>
                                <div class="singName hand green" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                            </div>
                            <div class="long">${song.sLong}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>


        </div>


    </div>
</div>

<div id="recommend-list2">
    <div id="r-last"><img src="/resource/img/yyg/last.png" class="hand" style="width: 40px;height: 55px;margin-top: 24px;margin-left: 20px;"></div>
    <div class="content">
        <div class="list-title">
            精 彩 推 荐
        </div>
        <div id="jc-content" style="margin-top: 25px;">
            <img src="/resource/img/yyg/jc%20(1).jpg" id="jc1" class="jc hand" style="margin-right: 20px;">
            <img src="/resource/img/yyg/jc%20(2).jpg" id="jc2" class="jc hand">
        </div>
        <div id="r-p1" class="r-p" style="margin-left: 553px; background: #b2bec3;"></div>
        <div id="r-p3" class="r-p"></div>
        <div id="r-p5" class="r-p"></div>
    </div>
    <div id="r-next"><img src="/resource/img/yyg/next.png" class="hand" style="width: 40px;height: 55px;margin-top: 25px;margin-left: 25px;"></div>
</div>

<div id="new-dish">
    <div class="content">
        <div class="list-title">
            新 碟 首 发
        </div>

        <div class="list-btns" style="margin-left: 365px; margin-top: 10px;">
            <div id="d-btn1" class="m-btns2 hand green d-b" value="0">内地</div>
            <div id="d-btn2" class="m-btns hand green d-b" value="1">港台</div>
            <div id="d-btn3" class="m-btns hand green d-b" value="2">日本</div>
            <div id="d-btn4" class="m-btns hand green d-b" value="3">欧美</div>
            <div id="d-btn5" class="m-btns hand green d-b" value="4">韩国</div>
            <div id="d-btn6" class="m-btns hand green d-b" style="margin-right: 200px;" value="5">其他</div>
        </div>

        <div style="margin-top: 60px;">

            <div class="d-select">
                <c:forEach items="${dishsFromOutBack}" var="dish" end="9">
                <div class="dish-content">
                    <c:if test="${dish.aId>31}">
                    <img src="/resource/img/dish/dish%20(0).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                    </c:if>
                    <c:if test="${dish.aId<=31}">
                        <img src="/resource/img/dish/dish%20(${dish.aId}).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                    </c:if>
                    <div class="d-name hand green" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">${dish.aName}</div>
                    <div class="d-singer hand green" onclick="window.location.href='/yyg/singerDetails?sId=${dish.singer.sId}';">${dish.singer.sName}</div>
                </div>
                </c:forEach>
            </div>

            <div class="d-select" style="display: none">
                <c:forEach items="${dishsFromGT}" var="dish" end="9">
                    <div class="dish-content">
                        <c:if test="${dish.aId>31}">
                            <img src="/resource/img/dish/dish%20(0).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <c:if test="${dish.aId<=31}">
                            <img src="/resource/img/dish/dish%20(${dish.aId}).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <div class="d-name hand green" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">${dish.aName}</div>
                        <div class="d-singer hand green" onclick="window.location.href='/yyg/singerDetails?sId=${dish.singer.sId}';">${dish.singer.sName}</div>
                    </div>
                </c:forEach>
            </div>

            <div class="d-select" style="display: none">
                <c:forEach items="${dishsFromJapan}" var="dish" end="9">
                    <div class="dish-content">
                        <c:if test="${dish.aId>31}">
                            <img src="/resource/img/dish/dish%20(0).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <c:if test="${dish.aId<=31}">
                            <img src="/resource/img/dish/dish%20(${dish.aId}).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <div class="d-name hand green" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">${dish.aName}</div>
                        <div class="d-singer hand green" onclick="window.location.href='/yyg/singerDetails?sId=${dish.singer.sId}';">${dish.singer.sName}</div>
                    </div>
                </c:forEach>
            </div>

            <div class="d-select" style="display: none">
                <c:forEach items="${dishsFromEuropeAmerica}" var="dish" end="9">
                    <div class="dish-content">
                        <c:if test="${dish.aId>31}">
                            <img src="/resource/img/dish/dish%20(0).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <c:if test="${dish.aId<=31}">
                            <img src="/resource/img/dish/dish%20(${dish.aId}).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <div class="d-name hand green" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">${dish.aName}</div>
                        <div class="d-singer hand green" onclick="window.location.href='/yyg/singerDetails?sId=${dish.singer.sId}';">${dish.singer.sName}</div>
                    </div>
                </c:forEach>
            </div>

            <div class="d-select" style="display: none">
                <c:forEach items="${dishsFromKorea}" var="dish" end="9">
                    <div class="dish-content">
                        <c:if test="${dish.aId>31}">
                            <img src="/resource/img/dish/dish%20(0).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <c:if test="${dish.aId<=31}">
                            <img src="/resource/img/dish/dish%20(${dish.aId}).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <div class="d-name hand green" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">${dish.aName}</div>
                        <div class="d-singer hand green" onclick="window.location.href='/yyg/singerDetails?sId=${dish.singer.sId}';">${dish.singer.sName}</div>
                    </div>
                </c:forEach>
            </div>

            <div class="d-select" style="display: none">
                <c:forEach items="${dishs}" var="dish" end="9">
                    <div class="dish-content">
                        <c:if test="${dish.aId>31}">
                            <img src="/resource/img/dish/dish%20(0).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <c:if test="${dish.aId<=31}">
                            <img src="/resource/img/dish/dish%20(${dish.aId}).jpg" class="d-cove" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">
                        </c:if>
                        <div class="d-name hand green" onclick="window.location.href='/yyg/AlbumDetails?aId=${dish.aId}';">${dish.aName}</div>
                        <div class="d-singer hand green" onclick="window.location.href='/yyg/singerDetails?sId=${dish.singer.sId}';">${dish.singer.sName}</div>
                    </div>
                </c:forEach>
            </div>


        </div>



    </div>
</div>

<div id="rank">
    <div class="content">
        <div class="list-title" style="margin-left: 550px;">
            排 行 榜
        </div>

        <div class="rank-content">
            <div class="r-title1">
                巅 峰 榜
            </div>
            <div class="r-title2 hand">
                热歌
            </div>
            <c:forEach items="${rankDates1}" var="rankDate" varStatus="status" end="2">
            <div class="rank-n">
                <div style="margin-top: 30px;" class="rangk-name hand">${status.count} ${rankDate.song.songName}</div>
                <div style="margin-left: 15px;margin-top: 5px;" class="rangk-name hand">${rankDate.song.singer1.sName}</div>
            </div>
            </c:forEach>
        </div>

        <div class="rank-content" style="background-position: -224px 0px;">
            <div class="r-title1">
                巅 峰 榜
            </div>
            <div class="r-title2 hand">
                新歌
            </div>
            <c:forEach items="${rankDates2}" var="rankDate" varStatus="status" end="2">
                <div class="rank-n">
                    <div style="margin-top: 30px;" class="rangk-name hand">${status.count} ${rankDate.song.songName}</div>
                    <div style="margin-left: 15px;margin-top: 5px;" class="rangk-name hand">${rankDate.song.singer1.sName}</div>
                </div>
            </c:forEach>
        </div>

        <div class="rank-content" style="background-position: -448px 0px;">
            <div class="r-title1">
                巅 峰 榜
            </div>
            <div class="r-title2 hand">
                流行指数
            </div>
            <c:forEach items="${rankDates3}" var="rankDate" varStatus="status" end="2">
                <div class="rank-n">
                    <div style="margin-top: 30px;" class="rangk-name hand">${status.count} ${rankDate.song.songName}</div>
                    <div style="margin-left: 15px;margin-top: 5px;" class="rangk-name hand">${rankDate.song.singer1.sName}</div>
                </div>
            </c:forEach>
        </div>

        <div class="rank-content" style="background-position: -672px 0px;">
            <div class="r-title1">
                巅 峰 榜
            </div>
            <div class="r-title2 hand">
                欧美
            </div>
            <c:forEach items="${rankDates4}" var="rankDate" varStatus="status" end="2">
                <div class="rank-n">
                    <div style="margin-top: 30px;" class="rangk-name hand">${status.count} ${rankDate.song.songName}</div>
                    <div style="margin-left: 15px;margin-top: 5px;" class="rangk-name hand">${rankDate.song.singer1.sName}</div>
                </div>
            </c:forEach>
        </div>

        <div class="rank-content" style="background-position: -896px 0px;">
            <div class="r-title1">
                巅 峰 榜
            </div>
            <div class="r-title2 hand">
                韩国
            </div>
            <c:forEach items="${rankDates5}" var="rankDate" varStatus="status" end="2">
                <div class="rank-n">
                    <div style="margin-top: 30px;" class="rangk-name hand">${status.count} ${rankDate.song.songName}</div>
                    <div style="margin-left: 15px;margin-top: 5px;" class="rangk-name hand">${rankDate.song.singer1.sName}</div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>

<div id="mv">
    <div class="content">
        <div class="list-title" style="margin-left: 565px;">
            M V
        </div>
        <div class="list-btns" style="margin-left: 365px; margin-top: 10px;">
            <div id="mv-btn1" class="m-btns2 hand green mv-b" value="0">精选</div>
            <div id="mv-btn2" class="m-btns hand green mv-b" value="1">内地</div>
            <div id="mv-btn3" class="m-btns hand green mv-b" value="2">港台</div>
            <div id="mv-btn4" class="m-btns hand green mv-b" value="3">欧美</div>
            <div id="mv-btn5" class="m-btns hand green mv-b" value="4">韩国</div>
            <div id="mv-btn6" class="m-btns hand green mv-b" style="margin-right: 200px;" value="5">日本</div>
        </div>

        <div style="margin-top: 80px;">

            <div class="mv-select">
                <c:forEach items="${songs}" var="song" end="9" >
                <div class="mv-content">
                    <img src="/resource/img/mv/mv%20(${song.mv}).jpg" class="mv-cover hand">
                    <div class="mv-name hand green">${song.songName}</div>
                    <div class="mv-singer hand green">${song.singer1.sName}</div>
                </div>
                </c:forEach>
            </div>

            <div class="mv-select" style="display: none">
                <c:forEach items="${songFromOutBack}" var="song" end="9" >
                    <div class="mv-content">
                        <img src="/resource/img/mv/mv%20(${song.mv}).jpg" class="mv-cover hand">
                        <div class="mv-name hand green">${song.songName}</div>
                        <div class="mv-singer hand green">${song.singer1.sName}</div>
                    </div>
                </c:forEach>
            </div>

            <div class="mv-select" style="display: none">
                <c:forEach items="${songFromGT}" var="song" end="9" >
                    <div class="mv-content">
                        <img src="/resource/img/mv/mv%20(${song.mv}).jpg" class="mv-cover hand">
                        <div class="mv-name hand green">${song.songName}</div>
                        <div class="mv-singer hand green">${song.singer1.sName}</div>
                    </div>
                </c:forEach>
            </div>

            <div class="mv-select" style="display: none">
                <c:forEach items="${songFromEuropeAmerica}" var="song" end="9" >
                    <div class="mv-content">
                        <img src="/resource/img/mv/mv%20(${song.mv}).jpg" class="mv-cover hand">
                        <div class="mv-name hand green">${song.songName}</div>
                        <div class="mv-singer hand green">${song.singer1.sName}</div>
                    </div>
                </c:forEach>
            </div>

            <div class="mv-select" style="display: none">
                <c:forEach items="${songFromKorea}" var="song" end="9" >
                    <div class="mv-content">
                        <img src="/resource/img/mv/mv%20(${song.mv}).jpg" class="mv-cover hand">
                        <div class="mv-name hand green">${song.songName}</div>
                        <div class="mv-singer hand green">${song.singer1.sName}</div>
                    </div>
                </c:forEach>
            </div>

            <div class="mv-select" style="display: none">
                <c:forEach items="${songFromJapan}" var="song" end="9" >
                    <div class="mv-content">
                        <img src="/resource/img/mv/mv%20(${song.mv}).jpg" class="mv-cover hand">
                        <div class="mv-name hand green">${song.songName}</div>
                        <div class="mv-singer hand green">${song.singer1.sName}</div>
                    </div>
                </c:forEach>
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


</body>
</html>

