window.onload=function(){

	$('.rankn')[$('#rId').attr('value')].className="rankn1";

	$('#login1').on('click',
		function(){
			document.getElementById("yyg_login").style.display='block';
		}
	)
	
	
    $('#close').mouseover(function(){
		$('#close').attr('src',"/resource/img/yyg/close2.png");
	});
	
	$('#close').mouseout(function(){
		$('#close').attr('src',"/resource/img/yyg/close1.png");
	});
	
	$('#close').on('click',
		function(){
			document.getElementById("yyg_login").style.display='none';
		}
	)
	
	
	$('.r-s-line2').mouseover(function(){

		$(this).children(".song-btns")[0].style.display = 'block';
		$(this).children(".s-name").css('width','200px');
	});
	
	$('.r-s-line1').mouseover(function(){

		$(this).children(".song-btns")[0].style.display = 'block';
		$(this).children(".s-name").css('width','200px');

	});
	
	$('.r-s-line2').mouseout(function(){
		$(this).children(".song-btns")[0].style.display = 'none';
		$(this).children(".s-name").css('width','405px');
	});
	
	$('.r-s-line1').mouseout(function(){
		$(this).children(".song-btns")[0].style.display = 'none';
		$(this).children(".s-name").css('width','405px');
	});
	
	
	
	$('.s-play').mouseover(function(){
	
		$('.s-play').css('background-position',"-42px 0px");
	
	});
	
	$('.s-add').mouseover(function(){
	
		$('.s-add').css('background-position',"-42px -83px");
	
	});
	
	$('.s-save').mouseover(function(){
	
		$('.s-save').css('background-position',"-42px -125px");
		
	
	});
	
	$('.s-play').mouseout(function(){
	
		$('.s-play').css('background-position',"0px 0px");
	
	});
	
	$('.s-add').mouseout(function(){
	
		$('.s-add').css('background-position',"0px -83px");
	
	});
	
	$('.s-save').mouseout(function(){
	
		$('.s-save').css('background-position',"0px -125px");
	
	});

	$('.needLogin').on('click',
		function(){
			document.getElementById("yyg_login").style.display='block';
		}
	)

	$('.tj').on('click',function(event,e){

			var x = y = 0,
				doc = document.documentElement,
				body = document.body;
			if(!event) event=window.event;
			if (window.pageYoffset) {//pageYoffset是Netscape特有
				x = window.pageXOffset;
				y = window.pageYOffset;
			}else{
				x = (doc && doc.scrollLeft || body && body.scrollLeft || 0)
					- (doc && doc.clientLeft || body && body.clientLeft || 0);
				y = (doc && doc.scrollTop  || body && body.scrollTop  || 0)
					- (doc && doc.clientTop  || body && body.clientTop  || 0);
			}
			x += event.clientX;
			y += event.clientY;

			$('#songId').attr('value',$(this).attr('value'));

			var tjd=document.getElementsByClassName("tjd")[0];
			tjd.style.left=x+"px";
			tjd.style.top=y+"px";
			tjd.style.display='block';

		}
	)

	$(".tj").on("click", function(e){
		$(".tjd").show();
		$(document).one("click", function(){
			$(".tjd").hide();
		});
		e.stopPropagation();
	});

	$(".tjd-n").on("click", function(e){

		var lId=$(this).attr('value');
		var songId=$('#songId').attr('value');

		window.open('/yyg/doInsertToSongList?lId='+lId+"&songId="+songId,'_blank');

	});
	
	
}