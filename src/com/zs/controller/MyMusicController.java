package com.zs.controller;


import com.zs.bean.*;
import com.zs.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/myMusic")
public class MyMusicController {
    @Autowired
    private UserService userService;
    @Autowired
    private SingerService singerService;
    @Autowired
    private SongService songService;
    @Autowired
    private AlbumService albumService;
    @Autowired
    private RankListService rankListService;
    @Autowired
    private RankDateService rankDateService;
    @Autowired
    private SongListService songListService;
    @Autowired
    private TagService tagService;
    @Autowired
    private AttentionService attentionService;

    @RequestMapping("/myMusic")
    public String myMusic(Integer p1, Integer p2,Integer uId, Model model,HttpSession httpSession) {

        //确定显示本网页的哪个选项卡
        if(p1==null){
            p1=0;
        }
        if(p2==null){
            p2=0;
        }
        if(uId==null){
            uId=1;
        }
        User user1 = userService.selectUserByUId(uId);
        User user=(User) httpSession.getAttribute("user");
        List<SongList> songLists=songListService.selectSongListByUId(uId);
        List<Song> songs =null;
        if(songLists.size()>0){
            Integer tempLId=songLists.get(0).getlId();
            songs = songListService.selectSongDateByLId(tempLId);
        }

        for (int i = 0; i < songLists.size(); i++) {
            Integer tempLId=songLists.get(i).getlId();
            Integer songNum = songListService.selectSongNum(tempLId);
            songListService.updateSongListSongNum(tempLId,songNum);
        }

        List<Singer> aSingers = singerService.selectASingerByUId(user1.getuId());
        List<User> aUsers = userService.selectAUserByUId(user1.getuId());
        List<User> fUsers = userService.selectFUserByUId(user1.getuId());

        model.addAttribute("p1", p1);
        model.addAttribute("p2", p2);
        model.addAttribute("user1", user1);
        model.addAttribute("songLists", songListService.selectSongListByUId(uId));
        model.addAttribute("songs", songs);
        model.addAttribute("aSingers", aSingers);
        model.addAttribute("aUsers", aUsers);
        model.addAttribute("fUsers", fUsers);

        return "myMusic";
    }

    @RequestMapping("/openPlatform")
    public String openPlatform() {

        return "openPlatform";
    }

    @RequestMapping("/newSongList")
    public String newSongList(Model model) {

        List<Tag> tags=tagService.selectAllTag();

        List<Tag> tagList=new ArrayList<>();
        tagList.add(new Tag(0,tags.get(0).gettType(),tags.get(0).gettType()));
        tagList.add(tags.get(0));
        for (int i = 1; i < tags.size(); i++) {
            if (!tags.get(i).gettType().equals(tags.get(i-1).gettType())){
                tagList.add(new Tag(0,tags.get(i).gettType(),tags.get(i).gettType()));
            }
            tagList.add(tags.get(i));
        }

        model.addAttribute("tagList", tagList);

        return "newSongList";
    }

    @RequestMapping("/doNewSongList")
    public String doNewSongList(String listName,String tId11,String tId22,String tId33, HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        SongList songList=new SongList(null,listName,user,tagService.selectTagByTId(Integer.parseInt(tId11)),tagService.selectTagByTId(Integer.parseInt(tId22)),tagService.selectTagByTId(Integer.parseInt(tId33)),0,0,"/resource/img/yyg/gd9.jpg",0,new ArrayList<>());
        System.out.println(songList);
        songListService.insertSongList(songList);

        return "forward:/myMusic/myMusic?p1=1&p2=0&uId="+user.getuId();
    }

    @RequestMapping("/doDeleteSongFromListBySongId")
    public String doDeleteSongFromListBySongId(Integer lId,Integer songId,HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        songListService.doDeleteSongToSongList(lId,songId);

        return "forward:/yyg/SongListDetails?lId="+lId;
    }

    @RequestMapping("/insertAttentionSinger")
    public String insertAttentionSinger(Integer sId,HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        attentionService.insertAttentionSinger(user.getuId(),sId);

        return "forward:/myMusic/myMusic?p1=2&p2=0&uId="+user.getuId();
    }

    @RequestMapping("/deleteAttentionSinger")
    public String deleteAttentionSinger(Integer sId,HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        attentionService.deleteAttentionSinger(user.getuId(),sId);

        return "forward:/myMusic/myMusic?p1=2&p2=0&uId="+user.getuId();
    }

    @RequestMapping("/insertAttentionUser")
    public String insertAttentionUser(Integer uId,HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        attentionService.insertAttentionUser(user.getuId(),uId);

        return "forward:/myMusic/myMusic?p1=2&p2=1&uId="+user.getuId();
    }

    @RequestMapping("/deleteAttentionUser")
    public String deleteAttentionUser(Integer uId,HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        attentionService.deleteAttentionUser(user.getuId(),uId);

        return "forward:/myMusic/myMusic?p1=2&p2=1&uId="+user.getuId();
    }

    @RequestMapping("/insertToMySongList")
    public String insertToMySongList(Integer lId,HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        SongList songList1 = songListService.selectSongListBylId(lId);
        SongList songList2=new SongList(null,songList1.getListName(),user,songList1.getTag1(),songList1.getTag2(),songList1.getTag3(),songList1.getSongNum(),songList1.getlListenNum(),songList1.getlPhotoUrl(),songList1.getlMessageNum(),songList1.getSongs());

        songListService.insertSongList(songList2);
        List<SongList> songLists = songListService.selectSongListByUId(user.getuId());

        if(songLists!=null){
            Integer lId2=null;
            for (int i = 0; i < songLists.size(); i++) {
                if(songLists.get(i).getListName().equals(songList1.getListName())){
                    lId2=songLists.get(i).getlId();
                    break;
                }
            }

            List<Song> songs = songListService.selectSongDateByLId(songList1.getlId());
            for (int i = 0; i < songs.size(); i++) {
                songListService.insertSongInList(songs.get(i).getSongId(),lId2);
            }
        }

        return "forward:/myMusic/myMusic?p1=1&p2=0&uId="+user.getuId();
    }

    @RequestMapping("/insertToMyAlbum")
    public String insertToMyAlbum(Integer aId,HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        Album album = albumService.selectAlbumByAId(aId);
        SongList songList2=new SongList(null,album.getaName(),user,tagService.selectTagByTId(1),tagService.selectTagByTId(10),tagService.selectTagByTId(42),0,0,"/resource/img/dish/dish%20("+album.getaId()+").jpg",album.getMessageNum(),null);

        songListService.insertSongList(songList2);
        List<SongList> songLists = songListService.selectSongListByUId(user.getuId());

        if(songLists!=null){
            Integer lId2=null;
            for (int i = 0; i < songLists.size(); i++) {
                if(songLists.get(i).getListName().equals(album.getaName())){
                    lId2=songLists.get(i).getlId();
                    break;
                }
            }

            List<Song> songs = songService.selectSongByAId(album.getaId());
            for (int i = 0; i < songs.size(); i++) {
                songListService.insertSongInList(songs.get(i).getSongId(),lId2);
            }
        }

        return "forward:/myMusic/myMusic?p1=1&p2=0&uId="+user.getuId();
    }

    @RequestMapping("/deleteSongList")
    public String deleteSongList(Integer lId,HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        songListService.deleteSongList(lId);

        return "forward:/myMusic/myMusic?p1=1&p2=1&uId="+user.getuId();
    }

}
