window.onload=function(){
	
	// $('#recommend-list2').mouseover(function(){
	// 	// 	document.getElementById("r-last").style.display='block';
	// 	// 	document.getElementById("r-next").style.display='block';
	// 	// });
	// 	//
	// 	// $('#recommend-list2').mouseout(function(){
	// 	// 	document.getElementById("r-last").style.display='none';
	// 	// 	document.getElementById("r-next").style.display='none';
	// 	// });
	
	$('#login1').on('click',
		function(){
			document.getElementById("yyg_login").style.display='block';
		}
	)

	$('.needLogin').on('click',
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