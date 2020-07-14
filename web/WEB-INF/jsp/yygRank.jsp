<%--
  Created by IntelliJ IDEA.
  User: sure
  Date: 2020/4/14
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/resource/favicon.ico">
    <title>排行榜</title>
    <link rel="stylesheet" type="text/css" href="/resource/css/title_and_foot.css"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/yygRank.css"/>
</head>
<body>
<script src="/resource/js/jquery.js"></script>
<script src="/resource/js/yygRank.js" type="text/javascript" charset="utf-8"></script>

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

<div id="show">

    <div class="content">

        <div id="rank-name">

            <div id="rId" style="display: none" value="${rId}"></div>

            <div >
                <div class="rank-title" style="margin-top: 0px;">
                    巅峰榜
                </div>
                <c:forEach items="${rankList1}" var="rank" >
                    <div class="rankn" onclick="window.location.href='/yyg/yygRank?rId=${rank.rId-1}';">
                        ${rank.rName}
                    </div>
                </c:forEach>
            </div>

            <div >
                <div class="rank-title" >
                    地区榜
                </div>
                <c:forEach items="${rankList2}" var="rank" >
                    <div class="rankn" onclick="window.location.href='/yyg/yygRank?rId=${rank.rId-1}';">
                            ${rank.rName}
                    </div>
                </c:forEach>
            </div>

            <div >
                <div class="rank-title">
                    特色榜
                </div>
                <c:forEach items="${rankList3}" var="rank" >
                    <div class="rankn" onclick="window.location.href='/yyg/yygRank?rId=${rank.rId-1}';">
                            ${rank.rName}
                    </div>
                </c:forEach>
            </div>

            <div id="r-content">
                <div class="rank-title">
                    全球榜
                </div>

                <c:forEach items="${rankList4}" var="rank" >
                    <div class="rankn" onclick="window.location.href='/yyg/yygRank?rId=${rank.rId-1}';">
                            ${rank.rName}
                    </div>
                </c:forEach>
            </div>

        </div>

        <div id="rank-show">

            <div id="r-name">${rl.rName}</div>
            <div id="r-data">2020-04-14</div>
            <div id="rule" class="hand">榜单规则</div>

            <div style="width: 100%;height: 35px;float: left;margin-top: 30px;">

                <div class="r-btn1 hand">
                    <img src="/resource/img/singer/singer_play.png" width="25px" height="25px" style="margin-top: 4px;margin-left: 5px;">
                    <c:if test="${user!=null&&rankDates.size()>0}">
                        <div class="r-text1" onclick="window.open('/yyg/play?songId=${rankDates.get(0).song.songId}&uId=${user.uId}&rId=${rl.rId}&n=0','_blank');">
                            播放全部
                        </div>
                    </c:if>
                    <c:if test="${user==null&&rankDates.size()>0}">
                        <div class="r-text1 needLogin" >
                            播放全部
                        </div>
                    </c:if>
                    <c:if test="${user!=null&&rankDates.size()==0}">
                        <div class="r-text1">
                            播放全部
                        </div>
                    </c:if>
                </div>

                <div class="r-btn togray hand">
                    <img src="/resource/img/singer/singer_add.png" width="25px" height="25px" style="margin-top: 4px;margin-left: 10px;">
                    <div class="r-text" style="margin-right: 32px;">
                        收藏
                    </div>
                </div>

                <div class="r-btn togray hand">
                    <img src="/resource/img/play/player-save.png" width="25px" height="25px" style="margin-top: 4px;margin-left: 10px;">
                    <div class="r-text" style="margin-right: 32px;">
                        下载
                    </div>
                </div>

                <div class="r-btn togray hand">
                    <img src="/resource/img/yyg/message.png" width="25px" height="25px" style="margin-top: 4px;margin-left: 10px;">
                    <div class="r-text" style="margin-right: 32px;">
                        评论
                    </div>
                </div>

            </div>

            <div id="r-songs">
                <div id="r-s-title">
                    <div class="r-t" style="margin-left: 130px;">
                        歌曲
                    </div>
                    <div class="r-t" style="margin-left: 450px;">
                        歌手
                    </div>
                    <div class="r-t" style="margin-left: 230px;">
                        时长
                    </div>
                </div>

                <c:forEach items="${rankDates}" var="rank" varStatus="status" end="14">
                    <c:if test="${status.count%2==0}" >
                        <div class="r-s-line1">
                    </c:if>
                    <c:if test="${status.count%2==1}" >
                        <div class="r-s-line1">
                    </c:if>

                    <div class="ranknum">
                        ${status.count}
                    </div>
                    <div class="changn">
                        <c:if test="${rank.changeN>0}">
                        <div class="r-icon">
                            <img src="/resource/img/yyg/up.png" width="25px" height="25px" style="margin-left: 17px;margin-top: 15px;">
                        </div>
                        </c:if>
                        <c:if test="${rank.changeN<0}">
                            <div class="r-icon">
                                <img src="/resource/img/yyg/down.png" width="25px" height="25px" style="margin-left: 17px;margin-top: 15px;">
                            </div>
                        </c:if>
                        <c:if test="${rank.changeN==0}">
                            <div class="r-icon">
                                <img src="/resource/img/yyg/unChange.png" width="25px" height="25px" style="margin-left: 17px;margin-top: 15px;">
                            </div>
                        </c:if>

                        <div class="c-n">
                            <c:if test="${rank.changeN<0}">
                                ${-rank.changeN}
                            </c:if>
                            <c:if test="${rank.changeN>0}">
                                ${rank.changeN}
                            </c:if>
                        </div>

                    </div>
                    <c:if test="${user!=null}">

                        <div class="r-cover" onclick="window.open('/yyg/play?songId=${rank.song.songId}&uId=${user.uId}&n=0','_blank');">
                            <img src="/resource/img/music_cover/${rank.song.songId}.jpg" width="60px" height="60px" class="hand">
                        </div>

                    </c:if>
                    <c:if test="${user==null}">

                        <div class="r-cover needLogin">
                            <img src="/resource/img/music_cover/${rank.song.songId}.jpg" width="60px" height="60px" class="hand needLogin">
                        </div>

                    </c:if>

                    <c:if test="${user==null}">
                        <div class="s-name green hand">
                                ${rank.song.songName}
                        </div>
                    </c:if>
                    <c:if test="${user!=null}">
                        <div class="s-name green hand" onclick="window.open('/yyg/play?songId=${rank.song.songId}&uId=${user.uId}&n=0','_blank');">
                                ${rank.song.songName}
                        </div>
                    </c:if>

                    <div class="song-btns">
                        <c:if test="${user!=null}">
                            <div class="s-play s-btn hand" onclick="window.open('/yyg/play?songId=${rank.song.songId}&uId=${user.uId}&n=0','_blank');"></div>
                        </c:if>
                        <c:if test="${user==null}">
                            <div class="s-play s-btn hand needLogin"></div>
                        </c:if>
                        <div class="s-add s-btn hand tj" style="background-position: 0 -83px;" value="${rank.song.songId}"></div>
                        <a href="/resource/mp3/${rank.song.songId}.mp3" download="${rank.song.songId}.mp3">
                            <div class="s-save s-btn hand" style="background-position: 0 -125px;"></div>
                        </a>
                    </div>

                    <div class="singer-name green hand">
                        ${rank.song.singer1.sName}
                    </div>
                    <div class="long">
                        ${rank.song.sLong}
                    </div>

                    <c:if test="${status.count%2==0}" >
                        </div>
                    </c:if>
                    <c:if test="${status.count%2==1}" >
                        </div>
                    </c:if>
                </c:forEach>

            </div>



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

