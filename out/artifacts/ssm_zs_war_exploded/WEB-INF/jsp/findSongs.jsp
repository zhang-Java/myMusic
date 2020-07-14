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
    <title>搜索</title>
    <link rel="stylesheet" type="text/css" href="/resource/css/title_and_foot.css"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/findSongs.css"/>
</head>
<body>
<script src="/resource/js/jquery.js"></script>
<script src="/resource/js/findSongs.js" type="text/javascript" charset="utf-8"></script>

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
        <c:if test="${user!=null}">
            <div id="mymusic" class="title-text hand green" onclick="window.location.href='/myMusic/myMusic?p1=0&p2=0&uId=${user.uId}';">我的音乐</div>
        </c:if>
        <c:if test="${user==null}">
            <div id="mymusic" class="title-text hand green needLogin" >我的音乐</div>
        </c:if>
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

    <div id="mm-title">

        <div id="mm-btns">

            <div id="btn-like" class="mm-btn hand green togreen" style="margin-left: 170px;" value='0'>歌曲</div>
            <div id="btn-list" class="mm-btn hand green" value='1'>专辑</div>
            <div id="btn-attention" class="mm-btn hand green" value='2'>歌单</div>
            <div id="btn-fans" class="mm-btn hand green" value='3'>用户</div>

        </div>

    </div>


    <div id="select-1" style="float:left; margin-bottom: 50px;" class="selects" >

        <div id="r-songs1" style="margin-left: 170px;">
            <div id="r-s-title">
                <div class="r-t" style="margin-left: 50px;">
                    歌曲
                </div>
                <div class="r-t" style="margin-left: 500px;">
                    歌手
                </div>
                <div class="r-t" style="margin-left: 215px;">
                    专辑
                </div>
                <div class="r-t" style="margin-left: 230px;">
                    时长
                </div>
            </div>


            <c:forEach items="${songs}" var="song" varStatus="status">

                <c:if test="${status.count%2==0}">
                    <div class="r-s-line2">
                </c:if>
                <c:if test="${status.count%2==1}">
                    <div class="r-s-line1">
                </c:if>
                <c:if test="${user!=null}" >
                    <div class="s-name green hand" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}&n=0','_blank');">
                            ${song.songName}
                    </div>
                </c:if>
                <c:if test="${user==null}" >
                    <div class="s-name green hand needLogin">
                            ${song.songName}
                    </div>
                </c:if>
                <div class="song-btns">
                    <c:if test="${user!=null}" >
                        <div class="s-play s-btn hand" onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}&n=0','_blank');"></div>
                    </c:if>
                    <c:if test="${user==null}" >
                        <div class="s-play s-btn hand needLogin"></div>
                    </c:if>
                    <div class="s-add s-btn hand tj" style="background-position: 0 -83px;" value="${song.songId}"></div>
                    <a href="/resource/mp3/${song.songId}.mp3" download="${song.songId}.mp3">
                        <div class="s-save s-btn hand" style="background-position: 0 -125px;"></div>
                    </a>
                </div>

                <div class="singer-name green hand" onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">
                        ${song.singer1.sName}
                </div>
                <div class="album-name green hand" onclick="window.location.href='/yyg/AlbumDetails?aId=${song.album.aId}';">
                        ${song.album.aName}
                </div>
                <div class="long">
                    <div class="long-t">${song.sLong}</div>
                </div>

                <c:if test="${status.count%2==0}">
                    </div>
                </c:if>
                <c:if test="${status.count%2==1}">
                    </div>
                </c:if>
            </c:forEach>

        </div>


    </div>


    <div id="select-2" style="float:left; margin-bottom: 50px;display: none;" class="selects">

        <div id="r-songs2" style="margin-left: 170px;">
            <div id="r-s-title">
                <div class="r-t" style="margin-left: 50px;">
                    专辑
                </div>
                <div class="r-t" style="margin-left: 500px;">
                    歌手
                </div>
                <div class="r-t" style="margin-left: 390px;">
                    发行
                </div>
            </div>


            <c:forEach items="${albums}" var="album" varStatus="status">

                <c:if test="${status.count%2==0}">
                    <div class="r-s-line2">
                </c:if>
                <c:if test="${status.count%2==1}">
                    <div class="r-s-line1">
                </c:if>
                <div class="s-name green hand" onclick="window.location.href='/yyg/AlbumDetails?aId=${album.aId}';">
                        ${album.aName}
                </div>

                <div class="singer-name green hand" onclick="window.location.href='/yyg/singerDetails?sId=${album.singer.sId}';">
                        ${album.singer.sName}
                </div>

                <div class="long" style="margin-left: 155px">
                    <div class="long-t">${album.aTime}</div>
                </div>

                <c:if test="${status.count%2==0}">
                    </div>
                </c:if>
                <c:if test="${status.count%2==1}">
                    </div>
                </c:if>
            </c:forEach>

        </div>


    </div>


    <div id="select-3" style="float:left; margin-bottom: 50px;width: 100%;display: none;" class="selects">

        <div id="r-songs3" style="margin-left: 170px;">
            <div id="r-s-title">
                <div class="r-t" style="margin-left: 50px;">
                    歌单
                </div>
                <div class="r-t" style="margin-left: 500px;">
                    创建人
                </div>
                <div class="r-t" style="margin-left: 357px;">
                    收听
                </div>
            </div>


            <c:forEach items="${songLists}" var="list" varStatus="status">

                <c:if test="${status.count%2==0}">
                    <div class="r-s-line2">
                </c:if>
                <c:if test="${status.count%2==1}">
                    <div class="r-s-line1">
                </c:if>
                <div class="s-name green hand" onclick="window.location.href='/yyg/SongListDetails?lId=${list.lId}';">
                        ${list.listName}
                </div>

                <div class="singer-name green hand">
                        ${list.user.uName}
                </div>

                <div class="long" style="margin-left: 155px">
                    <div class="long-t">${list.lListenNum}</div>
                </div>

                <c:if test="${status.count%2==0}">
                    </div>
                </c:if>
                <c:if test="${status.count%2==1}">
                    </div>
                </c:if>
            </c:forEach>

        </div>


    </div>


    <div id="select-4" style="float:left; margin-bottom: 50px;width: 100%;display: none;" class="selects">


        <div id="r-songs4" style="margin-left: 170px;">
            <div id="r-s-title">
                <div class="r-t" style="margin-left: 50px;">
                    用户
                </div>
                <div class="r-t" style="margin-left: 500px;">
                    关注
                </div>
                <div class="r-t" style="margin-left: 390px;">
                    粉丝数
                </div>
            </div>


            <c:forEach items="${users}" var="usern" varStatus="status">

                <c:if test="${status.count%2==0}">
                    <div class="r-s-line2">
                </c:if>
                <c:if test="${status.count%2==1}">
                    <div class="r-s-line1">
                </c:if>
                <div class="s-name green hand"
                     onclick="window.location.href='/myMusic/myMusic?p1=0&p2=0&uId=${usern.uId}';">
                        ${usern.uName}
                </div>

                <div class="singer-name green hand" style="margin-left: 12px">
                        ${usern.uAttentionNum}
                </div>

                <div class="long" style="margin-left: 180px">
                    <div class="long-t">${usern.uFansNum}</div>
                </div>

                <c:if test="${status.count%2==0}">
                    </div>
                </c:if>
                <c:if test="${status.count%2==1}">
                    </div>
                </c:if>
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

