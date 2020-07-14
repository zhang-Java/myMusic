window.onload=function(){
	
	var r_page_index=1;

	$('#recommend-list2').mouseover(function(){
		document.getElementById("r-last").style.display='block';
		document.getElementById("r-next").style.display='block';
	});

	$('#recommend-list2').mouseout(function(){
		document.getElementById("r-last").style.display='none';
		document.getElementById("r-next").style.display='none';
	});


	$('#r-last').on('click',
		function(){
			if(r_page_index>=1){
				r_page_index-=2;
				if(r_page_index<1){
					r_page_index=5;
				}
				var index=r_page_index+1;
				$('#jc1').attr('src',"/resource/img/yyg/jc%20("+r_page_index+").jpg");
				$('#jc2').attr('src',"/resource/img/yyg/jc%20("+index+").jpg");
				$('.r-p').css('background','#dfe6e9');
				$('#r-p'+r_page_index).css('background','#b2bec3');
			}
		}
	)

	$('#r-next').on('click',
		function(){
			if(r_page_index<=5){
				r_page_index+=2;
				if(r_page_index>5){
					r_page_index=1;
				}
				var index=r_page_index+1;
				$('#jc1').attr('src',"/resource/img/yyg/jc%20("+r_page_index+").jpg");
				$('#jc2').attr('src',"/resource/img/yyg/jc%20("+index+").jpg");
				$('.r-p').css('background','#dfe6e9');
				$('#r-p'+r_page_index).css('background','#b2bec3');

			}
		}
	)

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

	$('#register'),$('#close').on('click',
		function(){
			document.getElementById("yyg_login").style.display='none';
		}
	)

	$('#recommend-list .m-b').on('click',
		function(e){
			$('#recommend-list .m-btns2').attr('class',"m-btns hand green m-b");
			$(this).attr('class',"m-btns2 hand green m-b");

			var selects=document.getElementsByClassName('l-select');
			for (var i = 0; i < selects.length; i++) {
				selects[i].style.display = 'none';
			}
			selects[$(this).attr('value')].style.display = 'block';

		}
	)


	$('#recommend-song .re-b').on('click',
		function(e){
			$('#recommend-song .m-btns2').attr('class',"m-btns hand green re-b");
			$(this).attr('class',"m-btns2 hand green re-b");

			var selects=document.getElementsByClassName('s-select');
			for (var i = 0; i < selects.length; i++) {
				selects[i].style.display = 'none';
			}
			selects[$(this).attr('value')].style.display = 'block';
		}
	)



	$('#new-dish .d-b').on('click',
		function(e){
			$('#new-dish .m-btns2').attr('class',"m-btns hand green d-b");
			$(this).attr('class',"m-btns2 hand green d-b");

            var selects=document.getElementsByClassName('d-select');
            for (var i = 0; i < selects.length; i++) {
                selects[i].style.display = 'none';
            }
            selects[$(this).attr('value')].style.display = 'block';

		}
	)



	$('#mv .mv-b').on('click',
		function(e){
			$('#mv .m-btns2').attr('class',"m-btns hand green mv-b");
			$(this).attr('class',"m-btns2 hand green mv-b");

			var selects=document.getElementsByClassName('mv-select');
			for (var i = 0; i < selects.length; i++) {
				selects[i].style.display = 'none';
			}
			selects[$(this).attr('value')].style.display = 'block';
		}
	)


	
}