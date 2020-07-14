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

	var regexImageFiler;
	var imgReaderl = new FileReader();

	regexImageFiler = /^(?:image\/bmp|image\/png|image\/jpeg|image\/jpg|\/gif)$/i;

	imgReaderl.onload = function(evt) {
		$("#MYimg").attr("src", evt.target.result);

	}

	$("#file").change(function() {
		var imgfFile = $("#file").prop("files")[0];
		if(!regexImageFiler.test(imgfFile.type)) {
			alert("选择有效图片");
		}
		imgReaderl.readAsDataURL(imgfFile);
		var fileName = $("#file").val();
		$('#MYimg').attr("name",fileName);
	})

	var sl_tag=document.getElementById('sl-tag');
	var content="";
	var index=0;
	var tempHTML="";

	$('.tag').on('click',
		function(){

			if(index<3&&tempHTML!=this.innerHTML){
				index++;
				content+="<div class='sel-tag hand' id='tId"+index+"' value='"+$(this).attr('value')+"'>"+this.innerHTML+"</div>";
				sl_tag.innerHTML=content;
				tempHTML=this.innerHTML;
			}

		}
	)

	$('#sub').on('click',
		function(){
			$('#tId11').attr('value',$('#tId1').attr('value'));
			$('#tId22').attr('value',$('#tId2').attr('value'));
			$('#tId33').attr('value',$('#tId3').attr('value'));
			$('#lPhotoUrl1').attr('value',$('#MYimg').attr('value'));

		}
	)
	
	
}