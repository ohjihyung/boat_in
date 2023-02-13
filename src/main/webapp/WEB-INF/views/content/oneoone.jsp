<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<style>
	#toto{
		height: 800px;		
	}
	#systemImg {
		height:350px;
		margin-left :70px;
		z-index: 1;
		border-radius: 5px;
		margin-top: 100px;
	}
	#oneooneouter{	
		width :800px;
	
	}
	#linkbox{
		margin-left: 70px;
		margin-top : 30px;
	}
	.oneooneFont{
		font-size: 1.3em !important;
	}
</style>
<div class="content-page">
     <div class="content">
     	 <div class="container-fluid">
     	 	 <div class="row" id="toto" style="margin-top:50px;">
     	  		<div class="col-4">
     	 			<div class="row" id="toto">  	 
		     	 	
					  	<div class="col-xs-8" >
					  		<img src="/resources/profileImg/oneoone.jpg" id="systemImg">
					  		<div id="linkbox">
					  			<h1 class="mt-2 fw-bold"> 1:1 문의 </h1>
					  			<hr>
								<h2 class="mt-2 mb-4">
									BOAT-IN에 대해 더 많은 정보가 필요하신가요?<br>
									질문을 남겨주시면 신속하게 답변을 드리겠습니다.<br>
								</h2>
								<h3>
									간단한 질문은 <a href="/faq/faqMain">자주 묻는 질문</a>을 확인해 주세요!
					  			</h3>
					  		</div>
					  	</div>
					  	<div class="col-xs-4"></div>							
     	 			</div>
 			 </div>
    			<div class="col-8">
    				  <div class="card" id="oneooneouter" style="">
                          <div class="card-body" style="height:800px;">
                              <input type="button" class="btn btn-warning mb-3" value="데이터" onclick="inputoneooneData();">
                              <form action="javascript:oneoonesubmit()" class="parsley-examples" id="oneooneform">
                                  <div class="mb-3">
                                      <label for="userName" class="form-label oneooneFont" >제목<span class="text-danger">*</span></label>
                                      <input type="text" name="Title" parsley-trigger="change" required placeholder="제목" class="form-control oneooneFont" id="title" />
                                  </div>
                                  <div class="mb-3">
                                      <label for="questionType" class="form-label oneooneFont">문의 종류<span class="text-danger">*</span></label>                                                                                    
                                          <select class="form-select oneooneFont" id="oneoone-select">
                                             <option value="서비스 이용">서비스 이용</option>
                                             <option value="계정 및 보안">계정 및 보안</option>
                                             <option value ="일반적인 질문">일반적인 질문 </option>                                                  
                                             <option value = "기타">기타</option>
                                          </select>
                                  </div> 
                                  <div class="mb-3">
                                  	<label for="contentWrite" class="form-label oneooneFont" style="font-size:14px;">무엇을 논의하고 싶으십니까?<span class="text-danger">*</span></label> 
                                  	<textarea class="form-control oneooneFont" rows="10" cols="10" id="content" style="resize: none;" placeholder="질문을 남겨주세요."></textarea>
                                  </div>                                       
                                  <div class="mb-5">
                                      <div class="form-check">
                                          <input id="checkbox6a" type="checkbox" class="form-check-input oneooneFont" required="required"/>
                                          <label for="checkbox6a" class="oneooneFont">
                                       			BOAT-IN의 개인 정보 보호 정책에 동의합니다.
                                             <span class="text-danger">*</span>
                                          </label>
                                      </div>
                                      <br>
                                    <div class="mb-3 text-end">
                                         <button class="btn btn-primary waves-effect waves-light oneooneFont" style="font-size: 15px" type="submit">제출</button>                                                 
                                    </div>
                                  </div>                                        
                              </form>
                          </div>
                      </div> <!-- end card -->   			
    			</div>
     	  </div> <!--end of row -->
     	 </div> <!-- end of container-fluid -->
     </div> <!-- end of content -->
</div> <!-- end of content-page -->

<script>
function inputoneooneData(){
	document.querySelector("#title").value = "프로젝트 명좀 바꿔주세요!";
	document.querySelector("#content").value = "보트인 프로젝트 이름을 boatin 프로젝트로 변경해 주세요";
	document.querySelector("#oneoone-select").value = "서비스이용";
	var cbox = document.querySelector("#checkbox6a")
	cbox.setAttribute("checked","true");
}

function oneoonesubmit(){
	var oneooneform =document.querySelector("#oneooneform");
	var myId = localStorage.getItem("id");
	var title = document.querySelector("#title").value;
	var content = document.querySelector("#content").value;
	var contentType = document.querySelector("#oneoone-select").value;
	var xhr = new XMLHttpRequest();
	var oneooneData = {
						"Id" : myId,
						"title" : title,
						"content" : content,
						"contentType" :contentType
					
						}
	xhr.open("post", '/oneoone/questionInsert', true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText);
			if(xhr.responseText== '1'){
				oneooneform.reset();
				Swal.fire({
					  position: 'center',
					  icon: 'success',
					  title: '문의하신 내용이 접수되었습니다.',
					  showConfirmButton: false,
					  timer: 2500
					})
			}
		}
	}
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(oneooneData));
		
}

</script>
