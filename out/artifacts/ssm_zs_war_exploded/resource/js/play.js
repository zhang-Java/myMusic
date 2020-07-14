window.onload=function(){

	// var jump = $('#jump').attr('value');	//跳转回来时的地址

	var p_index=0;		//播放
	var xh_index=0;		//循环

	var like_index;
	var like=document.getElementsByClassName('like');
	if(like.length==2){
		like[0].style.display='none';
		like_index=1;
	}else {
		like_index=0;
	}

	// var like_index=0;

	var cj_index=0;		//纯净
	var progress_index=0;	//进度条拖拽时不自动走
	var progress_index2=0;	//点击其他按钮时的鼠标松开事件不影响进度条
	var lyric_index=1;	//歌词
	var jy_index=0;		//静音

	var play=$('#play');
	var m_form=$('#m-form');
	var m_like=$('#m-like');
	var m_cj=$('#m-cj');
	var m_yl=$('#m-yl');
	var audio=document.getElementById("audio");
	var icon=document.getElementById("icon");
	var yl_icon=document.getElementById("yl-icon");

	
	var timer;
	var totalTime=audio.duration;		//歌曲总时间
	var lyric_list;
	if(lyric.length>1){
		lyric_list=lyric.split('[');

	var lyric_times=[];
	for(var i=1;i<lyric_list.length;i++){		//把歌词时间转化为s格式
		var fm=lyric_list[i].split(']')[0].split('.');
		var f=fm[0].split(':')[0];
		var m=fm[0].split(':')[1];
		
		var lyric_time=f*60+parseInt(m);
		lyric_times.push(lyric_time);
	}


	//初始化
	function init(){
	
		$("#l1").text(lyric_list[1].split(']')[1]);
		$("#l2").text(lyric_list[2].split(']')[1]);
		$("#l3").text(lyric_list[3].split(']')[1]);
		$("#l4").text(lyric_list[4].split(']')[1]);
		$("#l5").text(lyric_list[5].split(']')[1]);
		$("#l6").text(lyric_list[6].split(']')[1]);
	
	}
	
	init();

	//歌曲进度条
	function progressTime(){
		
		//获取当前时间 / 总时间
		var n=audio.currentTime/audio.duration;
		// console.log(n);
		var line=document.getElementById("m-line").offsetWidth;
		var line1=document.getElementById("m-line1");
		
		if(progress_index==0){		//当未拖拽时自动前进
			
			icon.style.marginLeft = ~~(n*line)+'px';	//位运算符取整  小点向右移动距离
			
			line1.style.width= ~~(n*line)+'px';		//进度条变白距离

			if(audio.currentTime==audio.duration&&xh_index==0){
				$('#next').click();
			}

			if(audio.currentTime==audio.duration&&xh_index==1){

				icon.style.marginLeft = 0+'px';	//位运算符取整  小点向右移动距离
				line1.style.width= 0+'px';		//进度条变白距离
				audio.currentTime=0;
				audio.play();

			}
			
		}
		
	}

	//拖拽进度条
	icon.onmousedown=function(e){
		
		var m_time;
		
		document.onmousemove=function(e){	//鼠标按下后 移动 时改变进度条
		
			progress_index=1;
			progress_index2=1;
		
			var x=e.clientX;
			var icon_left=document.getElementById("m-line").offsetParent.offsetLeft;	//小圆点(进度条左端)距边界距离
			var progressLong=x-icon_left-2;		//进度条长度  -2是为了让鼠标在中间
			
			if(progressLong<0){
				progressLong=0;
			}
			if(progressLong>document.getElementById("m-line").offsetWidth){
				progressLong=document.getElementById("m-line").offsetWidth;
			}
			
			var a=(progressLong+2)/document.getElementById("m-line").offsetWidth;
			var b=a.toFixed(2);		//保留两位小数 妈的这里不管精度的事就会报错
			m_time=audio.duration*(b);
			
			icon.style.marginLeft=progressLong+'px';
			document.getElementById("m-line1").style.width=progressLong+'px';
			
		}
		
		document.onmouseup=function(){
			
			if(progress_index2==1){
			
				audio.currentTime=m_time;
				progressTime();
							
				for(var i=1;i<lyric_list.length;i++){		//147
					
					var ti=lyric_times[i];
					
					if(parseInt(m_time)<ti){
						lyric_index=i;
						break;
					}
					
				}
				
				lyricChange();
				
			}
			
			this.onmousedown=null;
			this.onmousemove=null;
			
			progress_index=0;
			progress_index2=0;
		}
		
		
	}
	
	
	audio.volume = 0.1;		//待做，音量调整
	
	yl_icon.onmousedown=function(e){
		
		document.onmousemove=function(e){	//鼠标按下后 移动 时改变进度条
		
			var x=e.clientX;
			var icon_left=document.getElementById("yl-line").offsetLeft;	//小圆点(进度条左端)距边界距离
			var progressLong=x-icon_left-2;		//进度条长度  -2是为了让鼠标在中间
			
			if(progressLong<0){
				progressLong=0;
			}
			if(progressLong>document.getElementById("yl-line").offsetWidth){
				progressLong=document.getElementById("yl-line").offsetWidth;
			}
			
			var a=(progressLong+2)/document.getElementById("yl-line").offsetWidth;
			var b=a.toFixed(1);		
			
			yl_icon.style.marginLeft=progressLong+'px';
			document.getElementById("yl-line1").style.width=progressLong+'px';
			
			audio.volume = b;
		}
		
		document.onmouseup=function(){
			
			this.onmousedown=null;
			this.onmousemove=null;

		}
		
		
	}
	
	
	
	//歌词同步	timeupdate当音频播放位置改变时执行函数
	audio.addEventListener('timeupdate',function(){
		
		var cTime=parseInt(this.currentTime);
		var f=parseInt(cTime/60);
		var m=cTime%60;
		var zf=parseInt(audio.duration/60);
		var zm=parseInt(audio.duration%60);
		
		if(m<10){
			m='0'+m;
		}
		if(f<10){
			f='0'+f;
		}
		if(zm<10){
			zm='0'+zm;
		}
		if(zf<10){
			zf='0'+zf;
		}
		
		 var ct=f+':'+m+' / '+zf+':'+zm;
		$('#m-time').text(ct);
		
		if(cTime==lyric_times[lyric_index]){
			$("#l1").text(lyric_list[lyric_index-1].split(']')[1]);
			$("#l2").text(lyric_list[lyric_index].split(']')[1]);
			$("#l3").text(lyric_list[lyric_index+1].split(']')[1]);
			$("#l4").text(lyric_list[lyric_index+2].split(']')[1]);
			$("#l5").text(lyric_list[lyric_index+3].split(']')[1]);
			$("#l6").text(lyric_list[lyric_index+4].split(']')[1]);

			lyric_index++;
			$("#l3").css('color','#2ecc71');
		}
		if(cTime==parseInt(totalTime)){
			lyric_index=1;
		}
		
	});
	
	function lyricChange(){
		
		var cTime=parseInt(this.currentTime);
		
		if(cTime==lyric_times[lyric_index]){
			$("#l1").text(lyric_list[lyric_index-1].split(']')[1]);
			$("#l2").text(lyric_list[lyric_index].split(']')[1]);
			$("#l3").text(lyric_list[lyric_index+1].split(']')[1]);
			$("#l4").text(lyric_list[lyric_index+2].split(']')[1]);
			$("#l5").text(lyric_list[lyric_index+3].split(']')[1]);
			$("#l6").text(lyric_list[lyric_index+4].split(']')[1]);
			lyric_index++;
			$("#l3").css('color','#2ecc71');
		}
		if(cTime==parseInt(totalTime)){
			lyric_index=1;
		}
		
	}
	
	lyricChange();
	}
	//播放
	play.on('click',
		function(){
			
			if(p_index==0){
				play.attr("src",'/resource/img/play/stop.png');
				audio.play();
				timer=setInterval(progressTime,1000);
				p_index=1;
			}
			else{
				play.attr("src",'/resource/img/play/player.png');
				audio.pause();
				timer=null;
				p_index=0;
			}
			
		}
	)
	
	//循环模式
	m_form.on('click',function(){
		
			if(xh_index==0){
				m_form.attr("src",'/resource/img/play/xh1.png');
				xh_index=1;
			}
			else{
				m_form.attr("src",'/resource/img/play/xh.png');
				xh_index=0;
			}
		
		}
	)
	
	//设为喜欢
	m_like.on('click',function(){

			if($('#like_index').attr('value')==0){
				if(like_index==0){
					m_like.attr("src",'/resource/img/play/player-like2.png');
					like_index=1;
					location.reload();
				}
				else{
					m_like.attr("src",'/resource/img/play/player-like-btn.png');
					like_index=0;
					location.reload();
				}
			}
		if($('#like_index').attr('value')==1){
			if(like_index==1){
				m_like.attr("src",'/resource/img/play/player-like-btn.png');
				like_index=0;
				location.reload();
			}
			else{
				m_like.attr("src",'/resource/img/play/player-like2.png');
				like_index=1;
				location.reload();
			}
		}

		
		}
	)
	
	//纯净模式
	m_cj.on('click',function(){
		
			if(cj_index==0){
				m_cj.attr("src",'/resource/img/play/player-cj2.png');
				cj_index=1;
			}
			else{
				m_cj.attr("src",'/resource/img/play/player-cj1.png');
				cj_index=0;
			}
		
		}
	)
	
	//音量
	m_yl.on('click',function(){
		
			if(jy_index==0){
				m_yl.attr("src",'/resource/img/play/player-jy.png');
				jy_index=1;
				audio.volume = 0;
			}
			else{
				m_yl.attr("src",'/resource/img/play/player-yl.png');
				jy_index=0;
				audio.volume = 0.1;
			}
		
		}
	)

	$('#btns-2').on('click',function(e){

			var x=e.clientX;
			var y=e.clientY;

			var tjd=document.getElementsByClassName("tjd")[0];
			tjd.style.left=x+"px";
			tjd.style.top=y+"px";
			tjd.style.display='block';

		}
	)

	$("#btns-2").on("click", function(e){
		$("#aaa").show();
		$(document).one("click", function(){
			$("#aaa").hide();
		});
		e.stopPropagation();
	});

	$(".tjd-n").on("click", function(e){

		var lId=$(this).attr('value');
		var songId=$('#songId').attr('value');

		window.open('/yyg/doInsertToSongList?lId='+lId+"&songId="+songId,'_blank');

	});
	
	
}