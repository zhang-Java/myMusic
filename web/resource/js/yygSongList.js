window.onload=function(){
	
	
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