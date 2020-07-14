window.onload=function(){

	var selects=document.getElementsByClassName('selects');

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
		$(this).children(".s-name").css('width','100px');
		$(this).children(".del")[0].style.display = 'block';
		$(this).children(".long")[0].style.display = 'none';
	});
	
	$('.r-s-line1').mouseover(function(){

		$(this).children(".song-btns")[0].style.display = 'block';
		$(this).children(".s-name").css('width','100px');
		$(this).children(".del")[0].style.display = 'block';
		$(this).children(".long")[0].style.display = 'none';

	});
	
	$('.r-s-line2').mouseout(function(){
		$(this).children(".song-btns")[0].style.display = 'none';
		$(this).children(".s-name").css('width','528px');
		$(this).children(".del")[0].style.display = 'none';
		$(this).children(".long")[0].style.display = 'block';
	});
	
	$('.r-s-line1').mouseout(function(){
		$(this).children(".song-btns")[0].style.display = 'none';
		$(this).children(".s-name").css('width','528px');
		$(this).children(".del")[0].style.display = 'none';
		$(this).children(".long")[0].style.display = 'block';
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
	
	$('.s-del').mouseover(function(){
	
		$('.s-del').css('background-position',"-42px -166px");
		
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
	
	$('.s-del').mouseout(function(){
	
		$('.s-del').css('background-position',"0px -166px");
		
	});
	
	
	$('.mm-btn').on('click',
		function(){
			$('.mm-btn').attr('class',"mm-btn hand green");
			$(this).attr('class',"mm-btn hand green togreen");
			var selects=document.getElementsByClassName('selects');
			for (var i = 0; i < selects.length; i++) {
				selects[i].style.display = 'none';
			}
			selects[$(this).attr('value')].style.display = 'block';
		}
	)
	
	$('.a-t').on('click',
		function(){
			$('.a-t').attr('class',"a-t green hand");
			$(this).attr('class',"a-t hand green togreen");
			var selects=document.getElementsByClassName('a-selects');
			for (var i = 0; i < selects.length; i++) {
				selects[i].style.display = 'none';
			}
			selects[$(this).attr('value')].style.display = 'block';
		}
	)

	$('.needLogin').on('click',
		function(){
			document.getElementById("yyg_login").style.display='block';
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
	
}