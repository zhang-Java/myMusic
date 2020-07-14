<%--
  Created by IntelliJ IDEA.
  User: sure
  Date: 2020/4/20
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/resource/favicon.ico">
    <link rel="bookmark" href="/resource/favicon.ico">
    <title>播放</title>

    <link rel="stylesheet" type="text/css" href="/resource/css/play.css"/>
</head>
<body>
<script src="/resource/js/jquery.js"></script>
<script src="/resource/js/play.js" type="text/javascript" charset="utf-8"></script>
<script src="/resource/lyrics/${song.songId}.js" type="text/javascript" charset="utf-8"></script>

<div class="bg bg-blur" style="background: url('/resource/img/music_cover/${song.songId}.jpg');"></div>

<div class="content">
    <div id="play-title">
        <img src="/resource/img/play/player_logo.png" class="white-hand" style="padding: 22px; float: left;">
        <div id="tiltle-text">QQ音乐，千万高品质曲库尽享</div>
        <img src="/resource/img/play/khdxz.png " id="khdxz" class="hand .img-responsive white-hand">


        <img src="${user.uPhotoUrl}" class="img-circle hand .img-responsive white-hand" id="tx"
             onclick="window.location.href='/myMusic/myMusic?p1=0&p2=0&uId=${user.uId}';">
        <c:if test="${user.uName.length()<=9}">
        <div id="name" class="white-hand"
             onclick="window.location.href='/myMusic/myMusic?p1=0&p2=0&uId=${user.uId}';">${user.uName}</div>
        </c:if>
        <c:if test="${user.uName.length()>9}">
        <div id="name" class="white-hand" style="width: 10%;"
             onclick="window.location.href='/myMusic/myMusic?p1=0&p2=0&uId=${user.uId}';">${user.uName}</div>
        </c:if>
        <div id="tc" class="white-hand">设置</div>
        <div id="sz" class="white-hand">退出</div>


    </div>

    <div id="play-list">

        <div id="p-list">

            <div id="btns-1" class="list-btn">
                <img class="list-img" src="/resource/img/play/player-like.png">
                <div class="list-text">收藏</div>
            </div>

            <div id="btns-2" class="list-btn">
                <img src="/resource/img/play/player-add.png" class="list-img"  >
                <div style="float: right; line-height: 38px; margin-right: 20px;">添加到</div>
            </div>

            <a href="/resource/mp3/${song.songId}.mp3" download="${song.songId}.mp3" style="color: #ced6e0;">
                <div id="btns-3" class="list-btn">
                <img src="/resource/img/play/player-save.png" class="list-img" >
                <div class="list-text">下载</div>
                </div>
            </a>

            <div id="btns-4" class="list-btn">
                <img src="/resource/img/play/player-del.png" class="list-img" >
                <div class="list-text">删除</div>
            </div>

            <div id="btns-5" class="list-btn">
                <img src="/resource/img/play/player-qc.png" class="list-img">
                <div class="list-text">清空</div>
            </div>

        </div>

        <div id="list" style="overflow:auto;">
            <div class="list-row">
                <div class="row-text r1">歌曲</div>
                <div class="row-text r2">歌手</div>
                <div class="row-text r3">时长</div>
            </div>

            <c:if test="${songs==null}">
                <div class="list-row1">
                    <div class="row-text r1 white-hand" style="text-indent:50px;" >
                        <input type="checkbox" name="checkbox1" value="1" style="float: left; margin-top: 17px;"/>
                            <div onclick="window.open('/yyg/play?songId=${song.songId}&uId=${user.uId}&n=0','_blank');">${song.songName}</div>
                    </div>
                    <div class="row-text r2 white-hand"
                         onclick="window.location.href='/yyg/singerDetails?sId=${song.singer1.sId}';">${song.singer1.sName}</div>
                    <div class="row-text r3">${song.sLong}</div>
                </div>
            </c:if>

            <c:if test="${songs!=null}">
                <c:forEach items="${songs}" var="s" varStatus="status">
                <div class="list-row1">
                    <div class="row-text r1 white-hand" style="text-indent:50px;">
                        <input type="checkbox" name="checkbox1" value="1" style="float: left; margin-top: 17px;"/>
                        <c:if test="${lId!=null}">
                            <div onclick="window.location.href='/yyg/play?songId=${s.songId}&uId=${user.uId}&lId=${lId}&n=${status.count-1}';">${s.songName}</div>
                        </c:if>
                        <c:if test="${rId!=null}">
                            <div onclick="window.location.href='/yyg/play?songId=${s.songId}&uId=${user.uId}&rId=${rId}&n=${status.count-1}';">${s.songName}</div>
                        </c:if>
                        <c:if test="${aId!=null}">
                            <div onclick="window.location.href='/yyg/play?songId=${s.songId}&uId=${user.uId}&aId=${aId}&n=${status.count-1}';">${s.songName}</div>
                        </c:if>
                    </div>
                    <div class="row-text r2 white-hand"
                         onclick="window.location.href='/yyg/singerDetails?sId=${s.singer1.sId}';">${s.singer1.sName}</div>
                    <div class="row-text r3">${s.sLong}</div>
                </div>
                </c:forEach>
            </c:if>

        </div>

    </div>

    <div id="play-show">

        <div id="music-cover">
            <img src="/resource/img/music_cover/${song.songId}.jpg" style="width: 200px; height: 200px; margin-left: 160px;">
            <img src="/resource/img/play/player-img-bg.png" style="width: 20px; height: 190px;">
        </div>
        <div class="cover-text">歌曲名:${song.songName}</div>
        <div class="cover-text">歌手名:${song.singer1.sName}</div>
        <div class="cover-text">专辑名:${song.album.aName}</div>

        <div id="show-lyric">
            <div id="lyric">
                <p id="l1" class="lyric">兄弟，咱能换一首吗</p>
                <p id="l2" class="lyric">这首歌我没下</p>
                <p id="l3" class="lyric">功能能用就行呗</p>
                <p id="l4" class="lyric">哪有那么多流量下歌</p>
                <p id="l5" class="lyric">冲绿钻多贵啊</p>
                <p id="l6" class="lyric">去听前几首去奥，听话</p>
            </div>
        </div>

    </div>

    <div id="play-btns">

        <c:if test="${songs==null}">
            <img id="last" src="/resource/img/play/player-last.png" class="white-hand"
                 onclick="window.location.href='/yyg/play?songId=${song.songId}&uId=2&n=0';">
        </c:if>

        <c:if test="${songs!=null&&n>0}">
            <c:if test="${lId!=null}">
                <img id="last" src="/resource/img/play/player-last.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(n-1).songId}&uId=${user.uId}&lId=${lId}&n=${n-1}';">
            </c:if>
            <c:if test="${rId!=null}">
                <img id="last" src="/resource/img/play/player-last.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(n-1).songId}&uId=${user.uId}&rId=${rId}&n=${n-1}';">
            </c:if>
            <c:if test="${aId!=null}">
                <img id="last" src="/resource/img/play/player-last.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(n-1).songId}&uId=${user.uId}&aId=${aId}&n=${n-1}';">
            </c:if>
        </c:if>
        <c:if test="${songs!=null&&n<=0}">
            <c:if test="${lId!=null}">
                <img id="last" src="/resource/img/play/player-last.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(songs.size()-1).songId}&uId=${user.uId}&lId=${lId}&n=${songs.size()-1}';">
            </c:if>
            <c:if test="${rId!=null}">
                <img id="last" src="/resource/img/play/player-last.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(songs.size()-1).songId}&uId=${user.uId}&rId=${rId}&n=${songs.size()-1}';">
            </c:if>
            <c:if test="${aId!=null}">
                <img id="last" src="/resource/img/play/player-last.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(songs.size()-1).songId}&uId=${user.uId}&aId=${aId}&n=${songs.size()-1}';">
            </c:if>
        </c:if>

        <img id="play" src="/resource/img/play/player.png" class="white-hand">

        <c:if test="${songs==null}">
            <img id="next" src="/resource/img/play/player-next.png" class="white-hand"
                 onclick="window.location.href='/yyg/play?songId=${song.songId}&uId=2&n=0';">
        </c:if>

        <c:if test="${songs!=null&&songs.size()-1>n}">
            <c:if test="${lId!=null}">
            <img id="next" src="/resource/img/play/player-next.png" class="white-hand"
                 onclick="window.location.href='/yyg/play?songId=${songs.get(n+1).songId}&uId=${user.uId}&lId=${lId}&n=${n+1}';">
            </c:if>
            <c:if test="${rId!=null}">
                <img id="next" src="/resource/img/play/player-next.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(n+1).songId}&uId=${user.uId}&rId=${rId}&n=${n+1}';">
            </c:if>
            <c:if test="${aId!=null}">

                <img id="next" src="/resource/img/play/player-next.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(n+1).songId}&uId=${user.uId}&aId=${aId}&n=${n+1}';">
            </c:if>
        </c:if>
        <c:if test="${songs!=null&&songs.size()-1<=n}">
            <c:if test="${lId!=null}">
            <img id="next" src="/resource/img/play/player-next.png" class="white-hand"
                 onclick="window.location.href='/yyg/play?songId=${songs.get(0).songId}&uId=${user.uId}&lId=${lId}&n=${0}';">
            </c:if>
            <c:if test="${rId!=null}">
                <img id="next" src="/resource/img/play/player-next.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(0).songId}&uId=${user.uId}&rId=${rId}&n=${0}';">
            </c:if>
            <c:if test="${aId!=null}">
                <img id="next" src="/resource/img/play/player-next.png" class="white-hand"
                     onclick="window.location.href='/yyg/play?songId=${songs.get(0).songId}&uId=${user.uId}&aId=${aId}&n=${0}';">
            </c:if>
        </c:if>
        <div id="progress">
            <p id="m-name">${song.songName}-${song.singer1.sName}</p>
            <p id="m-time">00:00 / ${song.sLong}</p>
            <div id="m-line"></div>
            <!-- <img id="icon" src="../img/icon.png" class="white-hand"> -->
            <div id="icon" class="white-hand" style="user-select: none;"></div>

            <div id="m-line1"></div>
        </div>

        <img src="/resource/img/play/xh.png" id="m-form" class="white-hand">

        <div id="jump" value="/yyg/play?songId=${song.songId}&uId=${user.uId}&lId=${lId}&n=${n}" style="display: none;"></div>

        <img src="/resource/img/play/player-like-btn.png" id="m-like" class="white-hand like"
             onclick="window.open('/yyg/doInsertSongToSongList?songId=${song.songId}','_blank');location.reload();">

        <c:forEach items="${likeSongs}" var="like" varStatus="status">
<%--            <div>${like.songName}</div>--%>
            <c:if test="${like.songId==song.songId}">

                <img src="/resource/img/play/player-like2.png" id="m-like" class="white-hand like"
                     onclick="window.open('/yyg/doDeleteSongToSongList?songId=${song.songId}','_blank');location.reload();">

            </c:if>
        </c:forEach>

        <a href="/resource/mp3/${song.songId}.mp3" download="${song.songId}.mp3">
            <img src="/resource/img/play/player-save-btn.png" id="m-save" class="white-hand">
        </a>

        <img src="/resource/img/play/player-message.png" id="m-message" class="white-hand">

        <div id="message-num">14</div>

        <img src="/resource/img/play/player-cj1.png" id="m-cj" class="white-hand">

        <img src="/resource/img/play/player-yl.png" id="m-yl" class="white-hand">

        <div id="yl-line"></div>

        <div id="yl-line1"></div>


        <div id="yl-icon" class="white-hand" style="user-select: none;"></div>

    </div>

    <div class="tjd" id="aaa">
        <div id="songId" value="${song.songId}"></div>
        <c:forEach items="${usongLists}" var="list">
            <div class="tjd-n" value="${list.lId}">
                ${list.listName}
            </div>
        </c:forEach>
    </div>

</div>

<audio src="/resource/mp3/${song.songId}.mp3" id="audio"></audio>

</body>
</html>

