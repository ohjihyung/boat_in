<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div style="margin-top: 30px;">
	<input id="proName_H" type="hidden" value="" readonly="readonly"> <input id="sheetId" type="hidden" value="" readonly="readonly"> <input id="docuId" type="hidden" value="" readonly="readonly">
	<!-- 	<button id="checkBtn" type="button" class="btn btn-danger " onclick="checkValue_H()">값확인용 버튼</button><br> -->
	<div id="ifdiv" class="row d-none">
		<div class="card d-flex flex-row">
			<div class="d-flex flex-column m-4">
				<h1>공유문서를 사용할 수 있습니다.</h1>
				<br>
				<input id="docsBtn" type="button" class="btn btn-outline-primary waves-effect waves-light " style="font-size:1.5em;" value="Google Docs" />
				<br> 
				<input id="sheetBtn" type="button" class="btn btn-outline-success waves-effect waves-light" style="font-size:1.5em;" value="Google Sheet"/>
			</div>
			<iframe class="mt-3" style="width: 100%; height: 800px;" id="contentSheet"></iframe>
		</div>
	</div>
	<div class="row mt-5 d-flex justify-content-center d-none" id="initGdocs">
		<div class="card col-4 p-5 w-50">
			<div>
				<h1 class="w-100">최초사용시 구글인증 1회가 필요합니다.</h1>
				<div class="mt-3 d-flex justify-content-center">
					<input id="authBtn" type="button" class="btn btn-dark rounded-pill waves-effect waves-light" onclick="googleAuthLogin_H()" value="Google인증">
				</div>
			</div>
		</div>
	</div>
	<div></div>

</div>

<script>
//앞으로 할일 - sheetid 저장해서 꺼내쓰도록 ,  상태코드 추가해서  구글 인증인지 아닌지, 
//프로젝트 리더가 한번만 생성하도록 
// 구글 인증을 해야 사용할수있습니다 문구 사용후 
// 구글인증 버튼하나만 뿌려놓고, 인증하면 구글시트,docs 활성화 시키기 
$(function(){
	var proNo_H =URLSearch.get("proNo")
	var proNo={
		proNo :proNo_H
	}
	console.log(proNo)
	//gdocs 인증정보 불러오기 
	
	gdocsCheck()
	
	//프로젝트이름불러오기
	 $.ajax({
	  		type: "get",
	  		url: "${webPath}/gdocs/getproname",
	  		data: proNo,
	  		async:false,
	  		contentType : "application/json;charset=utf-8",
	  		dataType: "text",
	  		success:function(res){
	  			$('#proName_H').val(res)
	  		}
	  	})//getproname
	

	  	
	
})//$(function(){}

 function gdocsCheck(){
	var proNo_H =URLSearch.get("proNo")
	var proNo={
		proNo :proNo_H
	}
	$.ajax({
		type: "get",
		url: "${webPath}/gdocs/getGdocsOne",
		data: proNo,
		contentType : "application/json;charset=utf-8",
		dataType: "json",
		success:function(res){
			console.log(res)
			var sheetId = res.sheetId; 
			var wordId = res.wordId;
			var gdocAuth = res.gdocAuth
			$('#sheetId').val(sheetId);
			$('#docuId').val(wordId);
			$('#certifyGdocs').val(gdocAuth);
			console.log( "godocAuth : "+gdocAuth)
			if (gdocAuth == '0') {
				$('#initGdocs').attr("class",'row mt-5 d-flex justify-content-center d-block')
				$('#ifdiv').attr('class','mt-3 d-none')
			}else if (gdocAuth == '1') {
				$('#initGdocs').attr("class",'row mt-5 d-flex justify-content-center d-none')
				$('#docsBtn').click()
				$('#sheetBtn').attr('type','button');
				$('#ifdiv').attr('class','mt-3 d-block')
			}	  	
			
		}
	})//getGdocsOne
}



$('#sheetBtn').on('click',function(){
	$("#contentSheet").attr("src","")
	var sheetId = $('#sheetId').val();
	var sheetUrl = "https://docs.google.com/spreadsheets/d/"+sheetId+"/edit#gid=0";
	console.log(sheetUrl);
	$("#contentSheet").attr("src",sheetUrl)
})
$('#docsBtn').on('click',function(){
	$("#contentSheet").attr("src","")
	var docuId = $('#docuId').val();
	var docuUrl = "https://docs.google.com/document/d/"+docuId+"/edit";
	$("#contentSheet").attr("src",docuUrl)
})




//docs db 정보 업데이트 
 function updateDocs(){
	var proNo = URLSearch.get("proNo");
	var sheetId = $('#sheetId').val()
	var docuId = $('#docuId').val()
	
	var gdocsVO = {
		proNo : proNo,
		sheetId : sheetId,
		wordId : docuId, 
		gdocAuth : '1'
	}
	console.log(gdocsVO)
	
	$.ajax({
		type: "put",
  		url: "${webPath}/gdocs/createDocs",
  		data: JSON.stringify(gdocsVO),
  		async:false,
  		contentType : "application/json;charset=utf-8",
  		dataType: "text",
  		success:function(res){
  			console.log(res)
  		}
	})
}

function alertTimer(){
	var timerInterval
	Swal.fire({
	  title: 'Google 문서를 생성중입니다.',
	  timer: 3000,
	  timerProgressBar: false,
	  didOpen: () => {
	    Swal.showLoading()
	    const b = Swal.getHtmlContainer().querySelector('b')
	    timerInterval = setInterval(() => {
	      b.textContent = Swal.getTimerLeft()
	    }, 100)
	  },
	  willClose: () => {
	    clearInterval(timerInterval)
	    successAlert()
	  }
	}).then((result) => {
	  /* Read more about handling dismissals below */
	  if (result.dismiss === Swal.DismissReason.timer) {
	    console.log('I was closed by the timer')
	  }
	})	

}

function successAlert(){
	Swal.fire({
		  position: 'top-end',
		  icon: 'success',
		  title: '문서생성이 완료되었습니다.',
		  showConfirmButton: false,
		  timer: 1500
		})
}


</script>

