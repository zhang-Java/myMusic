window.onload=function(){

	$('#login1').on('click',
		function(){
			document.getElementById("yyg_login").style.display='block';
		}
	)

	// var str2 = "";
	// var page_index=1;
	//
	// $('#last-page').on('click',function(){
	// 	if(page_index>1){
	// 		page_index--;
	// 		changePage();
	// 	}
	// })
	//
	// $('#next-page').on('click',function(){
	// 	if(page_index<299){
	// 		page_index++;
	// 		changePage();
	// 	}
	// })
	//
	// function changePage(){
	// 	str2='';
	//
	// 	if(page_index<=3){
	// 		for (var i = 1; i < 6; i++) {
	// 				if(i==page_index){
	// 					str2 += '<div class="page2" onclick="window.location.href=\'/yyg/singer?page=\'+(1);">'+i+'</div>';
	// 				}else{
	// 					str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(i-1);">'+i+'</div>';
	// 				}
	// 		}
	// 		str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(i-1);">'+'...'+'</div>';
	// 		str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(i-1);">'+299+'</div>';
	// 	}
	// 	if(page_index>3&&page_index<296){
	// 		str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(page_index-4);">'+(page_index-3)+'</div>';
	// 		str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(page_index-3);">'+(page_index-2)+'</div>';
	// 		str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(page_index-2);">'+(page_index-1)+'</div>';
	// 		str2 += '<div class="page2" onclick="window.location.href=\'/yyg/singer?page=\'+(page_index-1);">'+(page_index)+'</div>';
	// 		str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(page_index);">'+(parseInt(page_index)+1)+'</div>';
	// 		str2 += '<div class="page">'+'...'+'</div>';
	// 		str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(298);">'+299+'</div>';
	// 	}
	// 	if(page_index>=296&&page_index<299){
	// 		str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(0);">'+1+'</div>';
	// 		str2 += '<div class="page">'+'...'+'</div>';
	// 		for (var i = 295; i <= 299; i++) {
	// 				if(i==page_index){
	// 					str2 += '<div class="page2" onclick="window.location.href=\'/yyg/singer?page=\'+(i-1);">'+i+'</div>';
	// 				}else{
	// 					str2 += '<div class="page" onclick="window.location.href=\'/yyg/singer?page=\'+(i-1);">'+i+'</div>';
	// 				}
	// 		}
	// 	}
	// 	if(page_index==299){
	// 		str2 += '<div class="page">'+1+'</div>';
	// 		str2 += '<div class="page">'+'...'+'</div>';
	// 		str2 += '<div class="page">'+(page_index-4)+'</div>';
	// 		str2 += '<div class="page">'+(page_index-3)+'</div>';
	// 		str2 += '<div class="page">'+(page_index-2)+'</div>';
	// 		str2 += '<div class="page">'+(page_index-1)+'</div>';
	// 		str2 += '<div class="page2">'+page_index+'</div>';
	// 	}
	//
	//
	// 	document.getElementById("pagen").innerHTML = str2;
	// }
	//
	// changePage();
	//
	// $('#pagen').on('click','.page',function(){
	//
	// 	page_index=$(this).text();
	// 	changePage();
	//
	// })


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

	// $('#close').on('click',
	// 	function(){
	// 		document.getElementById("yyg_login").style.display='none';
	// 	}
	// )

	$('.needLogin').on('click',
		function(){
			document.getElementById("yyg_login").style.display='block';
		}
	)

	var dateNum = $('#dateNum').attr('value');

	var page_w=100+60*(parseInt(parseInt(dateNum)/80)+1)+20;

	var m_left=580-50*(parseInt(parseInt(dateNum)/80)+1);

	$('#pages').css('width',page_w+'px');
	$('#pages').css('margin-left',m_left+'px');

}