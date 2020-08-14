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
import java.util.Random;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:08
 */
@Controller
@RequestMapping("/yyg")
public class YygController {
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


    @RequestMapping("/registerUser")
    public String insertUser(Model model) {
        int uNumber = userService.selectMaxNumber()+1;
        model.addAttribute("uNumber", uNumber);

        return "registerUser";
    }

    @RequestMapping("/doRegisterUser")
    public String doInsertUser(User user2,Model model) {
        userService.insertUser(user2);
        songListService.insertLike(userService.selectUserByUNumber(Integer.parseInt(user2.getuNumber())).getuId());
        model.addAttribute("user", null);
        return "forward:/yyg/yyg";
    }

    @RequestMapping("/yyg")
    public String yyg(Model model,HttpSession httpSession) {

        List<SongList> songLists=songListService.selectAllSongList();
        List<Song> songs=songService.selectAllSong();
        List<Song> songFromOutBack=songService.selectSongByRegion("中国",null);
        List<Song> songFromGT=songService.selectSongByRegion("香港","台湾");
        List<Song> songFromEuropeAmerica=songService.selectSongByRegion("欧洲","美国");
        List<Song> songFromKorea=songService.selectSongByRegion("韩国",null);
        List<Song> songFromJapan=songService.selectSongByRegion("日本",null);

        List<Album> dishsFromOutBack=albumService.selectAlbumByRegion("中国",null);
        List<Album> dishsFromGT=albumService.selectAlbumByRegion("香港","台湾");
        List<Album> dishsFromEuropeAmerica=albumService.selectAlbumByRegion("欧洲","美国");
        List<Album> dishsFromKorea=albumService.selectAlbumByRegion("韩国",null);
        List<Album> dishsFromJapan=albumService.selectAlbumByRegion("日本",null);
        List<Album> dishs=albumService.selectAllAlbum();

        List<RankList> ranks= rankListService.selectAllRank();

        List<RankDate> rankDates1 = rankDateService.selectByRId(1);
        List<RankDate> rankDates2 = rankDateService.selectByRId(2); //2
        List<RankDate> rankDates3 = rankDateService.selectByRId(3); //3
        List<RankDate> rankDates4 = rankDateService.selectByRId(10); //10
        List<RankDate> rankDates5 = rankDateService.selectByRId(11); //11

        model.addAttribute("songLists", songLists);
        model.addAttribute("songs", songs);
        model.addAttribute("songFromOutBack", songFromOutBack);
        model.addAttribute("songFromGT", songFromGT);
        model.addAttribute("songFromKorea", songFromKorea);
        model.addAttribute("songFromEuropeAmerica", songFromEuropeAmerica);
        model.addAttribute("songFromJapan", songFromJapan);
        model.addAttribute("dishsFromOutBack", dishsFromOutBack);
        model.addAttribute("dishsFromEuropeAmerica", dishsFromEuropeAmerica);
        model.addAttribute("dishsFromGT", dishsFromGT);
        model.addAttribute("dishsFromKorea", dishsFromKorea);
        model.addAttribute("dishsFromJapan", dishsFromJapan);
        model.addAttribute("dishs", dishs);
        model.addAttribute("rankDates1", rankDates1);
        model.addAttribute("rankDates2", rankDates2);
        model.addAttribute("rankDates3", rankDates3);
        model.addAttribute("rankDates4", rankDates4);
        model.addAttribute("rankDates5", rankDates5);



//        rankDateService.insertRankDate(new RankDate());



        return "yyg";

    }

    @RequestMapping("/doLogin")
    public String doLogin(Integer uNumber, String uPassword, Model model, HttpSession httpSession) {
        User user=userService.selectUserByIdAndPassword(uNumber,uPassword);

        if(user!=null){
            httpSession.setAttribute("user", user);
        }

        return "forward:/yyg/yyg";
    }

    @RequestMapping("/yygSinger")
    public String yygSinger(Integer page, Model model) {

        if(page==null){
            page=0;
        }

        model.addAttribute("singerList", singerService.selectAllSinger());
        model.addAttribute("page", page);
        return "yygSinger";
    }

    @RequestMapping("/singerDetails")
    public String yygDetails(Integer sId,Model model,HttpSession httpSession) {

        Singer singer=singerService.selectSingerById(sId);
        model.addAttribute("singer", singer);

        User user=(User) httpSession.getAttribute("user");
        List<SongList> usongLists = songListService.selectSongListByUId(user.getuId());
        model.addAttribute("usongLists", usongLists);

        model.addAttribute("songList", songService.selectSongBySId(sId));
        return "singerDetails";
    }

    @RequestMapping("/yygDisc")
    public String yygDisc(Integer page,Model model,HttpSession httpSession) {

        if (page==null){
            page=0;
        }

        List<Album> dishs=albumService.selectAllAlbum();
        User user=(User) httpSession.getAttribute("user");

        if(user!=null){
            List<SongList> usongLists = songListService.selectSongListByUId(user.getuId());
            model.addAttribute("usongLists", usongLists);
        }


        model.addAttribute("dishs", dishs);
        model.addAttribute("page", page);

        return "yygDiscPage";
    }

    @RequestMapping("/yygDiscPage")
    public String yygDiscPage(Integer page, Model model,HttpSession httpSession) {

        if (page==null){
            page=0;
        }

        List<Album> dishs=albumService.selectAllAlbum();
        User user=(User) httpSession.getAttribute("user");

        if(user!=null){
            List<SongList> usongLists = songListService.selectSongListByUId(user.getuId());
            model.addAttribute("usongLists", usongLists);
        }


        model.addAttribute("dishs", dishs);
        model.addAttribute("page", page);

        return "yygDiscPage";
    }

    @RequestMapping("/yygRank")
    public String yygRank(Integer rId,Model model,HttpSession httpSession) {

        List<RankDate> rankDates = rankDateService.selectByRId(rId+1);
        List<RankList> rankList1 = rankListService.selectRankByRType("巅峰榜");
        List<RankList> rankList2 = rankListService.selectRankByRType("地区榜");
        List<RankList> rankList3 = rankListService.selectRankByRType("特色榜");
        List<RankList> rankList4 = rankListService.selectRankByRType("全球榜");
        RankList rl=rankListService.selectRankByRId(rId+1);

        User user=(User) httpSession.getAttribute("user");
        if(user!=null){
            List<SongList> usongLists = songListService.selectSongListByUId(user.getuId());
            model.addAttribute("usongLists", usongLists);
        }

        model.addAttribute("rId", rId);
        model.addAttribute("rl", rl);
        model.addAttribute("rankDates", rankDates);
        model.addAttribute("rankList1", rankList1);
        model.addAttribute("rankList2", rankList2);
        model.addAttribute("rankList3", rankList3);
        model.addAttribute("rankList4", rankList4);

        return "yygRank";
    }

    @RequestMapping("/yygSongList")
    public String yygSongList(Model model) {

        List<SongList> songLists=songListService.selectAllSongList();

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

        model.addAttribute("songLists", songLists);

        return "yygSongList";
    }

    @RequestMapping("/yygRadio")
    public String yygRadio(Model model) {

        List<SongList> songLists=songListService.selectAllSongList();

        model.addAttribute("songLists", songLists);

        return "yygRadio";
    }

    @RequestMapping("/yygMV")
    public String yygMV(Integer sId,Model model) {

        List<Song> songs=songService.selectAllSong();

        model.addAttribute("songs", songs);

        return "yygMV";
    }

    @RequestMapping("/yygAlbum")
    public String yygAlbum(Integer page,Model model) {

        if(page==null){
            page=0;
        }

        List<Album> dishs=albumService.selectAllAlbum();

        model.addAttribute("dishs", dishs);
        model.addAttribute("page", page);

        return "yygAlbum";
    }

    @RequestMapping("/SongListDetails")
    public String SongListDetails(Integer lId,Model model,HttpSession httpSession) {

        SongList songList = songListService.selectSongListBylId(lId);
        List<Song> songs= songListService.selectSongDateByLId(lId);
        List<Tag> tags=tagService.selectTagsByLId(lId);
        Integer collectNum = songListService.selectCollectNum(songList.getListName());
        songListService.updateListenNum(lId,songList.getlListenNum());

        User user=(User) httpSession.getAttribute("user");
        if(user!=null){
            List<SongList> usongLists = songListService.selectSongListByUId(user.getuId());
            model.addAttribute("usongLists", usongLists);
        }


        model.addAttribute("songList", songList);
        model.addAttribute("songs", songs);
        model.addAttribute("tags", tags);
        model.addAttribute("collectNum", collectNum);

        return "SongListDetails";
    }

    @RequestMapping("/AlbumDetails")
    public String AlbumDetails(Integer aId,Model model,HttpSession httpSession) {

        Album album=albumService.selectAlbumByAId(aId);
        List<Song> songs=songService.selectSongByAId(aId);

        User user=(User) httpSession.getAttribute("user");
        if(user!=null){
            List<SongList> usongLists = songListService.selectSongListByUId(user.getuId());
            model.addAttribute("usongLists", usongLists);
        }

        model.addAttribute("album", album);
        model.addAttribute("songs", songs);


        return "AlbumDetails";
    }

    @RequestMapping("/play")
    public String play(Integer songId,Integer uId,Integer lId,Integer rId,Integer aId,Integer n,Model model) {

        Song song=songService.selectSongBySongId(songId);
        User user=userService.selectUserByUId(uId);

        model.addAttribute("song", song);
        model.addAttribute("user", user);

        List<SongList> usongLists = songListService.selectSongListByUId(user.getuId());
        Integer likelId=null;
        for (int i = 0; i < usongLists.size(); i++) {
            if(usongLists.get(i).getListName().equals("我喜欢")){
                likelId=usongLists.get(i).getlId();
                break;
            }
        }
        List<Song> likeSongs = songListService.selectSongDateByLId(likelId);

        if(lId!=null){
            model.addAttribute("songs", songListService.selectSongDateByLId(lId));
            model.addAttribute("lId", lId);
        }
        if (rId!=null){
            List<Song> rs=new ArrayList<>();
            List<RankDate> rd = rankDateService.selectByRId(rId);
            for (int i = 0; i < rd.size(); i++) {
                rs.add(rd.get(i).getSong());
            }
            model.addAttribute("songs", rs);
            model.addAttribute("rId", rId);
        }
        if (aId!=null){
            model.addAttribute("songs", songService.selectSongByAId(aId));
            model.addAttribute("aId", aId);
        }
        if(lId!=null||rId!=null||aId!=null){
            model.addAttribute("n", n);
        }
        model.addAttribute("likeSongs", likeSongs);
        model.addAttribute("usongLists", usongLists);

        return "play";
    }

    @RequestMapping("/doInsertSongToSongList")
    public String doInsertSongToSongList(Integer songId,Model model, HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        List<SongList> songLists = songListService.selectSongListByUId(user.getuId());
        Integer lId=null;
        for (int i = 0; i < songLists.size(); i++) {
            if(songLists.get(i).getListName().equals("我喜欢")){
                lId=songLists.get(i).getlId();
                break;
            }
        }

        songListService.doInsertSongToSongList(lId,songId);

        return "forward:/myMusic/myMusic?p1=0&p2=0&uId="+user.getuId();
    }

    @RequestMapping("/doDeleteSongToSongList")
    public String doDeleteSongToSongList(Integer songId,Model model, HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        List<SongList> songLists = songListService.selectSongListByUId(user.getuId());
        Integer lId=null;

        for (int i = 0; i < songLists.size(); i++) {
            if(songLists.get(i).getListName().equals("我喜欢")){
                lId=songLists.get(i).getlId();
                break;
            }
        }

        songListService.doDeleteSongToSongList(lId,songId);

        return "forward:/myMusic/myMusic?p1=0&p2=0&uId="+user.getuId();
    }

    @RequestMapping("/doInsertToSongList")
    public String doInsertToSongList(Integer songId,Integer lId,HttpSession httpSession) {

        User user=(User) httpSession.getAttribute("user");

        List<SongList> songLists = songListService.selectSongListByUId(user.getuId());

        songListService.doInsertSongToSongList(lId,songId);

        return "forward:/myMusic/myMusic?p1=1&p2=0&uId="+user.getuId();
    }

    @RequestMapping("/findSongs")
    public String findSongs(String findName,Model model) {

        List<Song> songs = songService.selectSongByFindName(findName);
        List<Album> albums = albumService.selectAlbumByFindName(findName);
        List<SongList> songLists = songListService.selectSongListByFindName(findName);
        List<User> users = userService.selectUserByFindName(findName);

        model.addAttribute("songs", songs);
        model.addAttribute("albums", albums);
        model.addAttribute("songLists", songLists);
        model.addAttribute("users", users);

        return "findSongs";
    }

    @RequestMapping("/yygSingerByletter")
    public String yygSingerByletter(String tagName, Model model) {
        List<Singer> singerList=singerService.selectSingerByLetter(tagName);
        model.addAttribute("singerList", singerList);
        return "yygSinger";
    }

    @RequestMapping("/yygSingerByRegion")
    public String yygSingerByRegion(String tagName, Model model) {
        List<Singer> singerList=singerService.selectSingerByRegion(tagName);
        model.addAttribute("singerList", singerList);
        return "yygSinger";
    }

    @RequestMapping("/yygSingerBySex")
    public String yygSingerBySex(String tagName, Model model) {
        List<Singer> singerList=singerService.selectSingerBySex(tagName);
        model.addAttribute("singerList", singerList);
        return "yygSinger";
    }

    @RequestMapping("/yygSingerByStyle")
    public String yygSingerByStyle(String tagName, Model model) {
        List<Singer> singerList=singerService.selectSingerByStyle(tagName);
        model.addAttribute("singerList", singerList);
        return "yygSinger";
    }

    @RequestMapping("/yygAlbumByRegion")
    public String yygAlbumByRegion(String r1,String r2, Model model) {

        List<Album> dishs=albumService.selectAlbumByRegion(r1,r2);

        model.addAttribute("dishs", dishs);

        return "yygAlbum";
    }

    @RequestMapping("/yygDiscByRegion")
    public String yygDiscByRegion(String r1,String r2, Model model) {

        List<Album> dishs=albumService.selectAlbumByRegion(r1,r2);

        model.addAttribute("dishs", dishs);

        return "yygDisc";
    }

    @RequestMapping("/yygSongListByTag")
    public String yygSongListByTag(Integer tId, Model model) {

        List<SongList> songLists=songListService.selectSongListByTId(tId);

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

        model.addAttribute("songLists", songLists);

        return "yygSongList";
    }

}
