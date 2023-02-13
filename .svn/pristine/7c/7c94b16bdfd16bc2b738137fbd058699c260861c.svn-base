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
</style>
<div class="content-page">
     <div class="content">
     	 <div class="container-fluid">
     	 	 <div class="row" id="toto" style="margin-top:20px;">
     	  		<div class="col-4">
     	 			<div class="row" id="toto">  	 
		     	 	
					  	<div class="col-xs-8" >
					  		<img src="/resources/profileImg/oneoone.jpg" id="systemImg">
					  		<div id="linkbox"> 								
					  			<span
									style="						
									font-weight: bold; 
									font-size: 1.5em;
									line-height: 1.0em; 
									color: black;
									font-family: arial;
								">
									더 많은 정보가 필요하거나 BoatIn 플랜 중 하나를 사용해보고 싶으신가요? 
									정보를 제공해 주시면 BoatIn 직원이 신속하게 답변을 드리겠습니다.
									간단한 질문이 있으신가요? <a href="/faq/faqMain">FAQ를 확인해 주세요.</a>
									</span>
					  		</div>
					  	</div>
					  	<div class="col-xs-4"></div>							
     	 			</div>
 			 </div>
    			<div class="col-8">
    				  <div class="card" id="oneooneouter">
                                    <div class="card-body" style="height:800px;">
                                        <h1>BoatIn에게 문의하기</h1>
                                        <form action="javascript:oneoonesubmit()" class="parsley-examples" id="oneooneform">
                                            <div class="mb-3">
                                                <label for="userName" class="form-label" style="font-size:13px;">제목<span class="text-danger">*</span></label>
                                                <input type="text" name="Title" parsley-trigger="change" required placeholder="제목" class="form-control" id="title" />
                                            </div>
                                            <div class="mb-3">
                                                <label for="questionType" class="form-label" style="font-size:13px;">문의 종류<span class="text-danger">*</span></label>                                                                                    
                                                    <select class="form-select" id="oneoone-select">
                                                       <option value="서비스이용">서비스이용</option>
                                                       <option value="계정 및 보안">계정 및 보안</option>
                                                       <option value ="일반적인 질문">일반적인 질문 </option>                                                  
                                                       <option value = "기타">기타</option>
                                                    </select>
                                            </div> 
                                            <div class="mb-3">
                                            	<label for="contentWrite" class="form-label" style="font-size:14px;">무엇을 논의하고 싶으십니까?<span class="text-danger">*</span></label> 
                                            	<textarea class="form-control" rows="20" cols="104" id="content" style="resize: none;"></textarea>
                                            	
                                            </div>                                       
                                            <div class="mb-5">
                                                <div class="form-check">
                                                    <input id="checkbox6a" type="checkbox" class="form-check-input" required="required"/>
                                                    <label for="checkbox6a">
                                                      확인란을 선택하고 "제출"을 클릭하면 BoatIn의 개인 정보 보호 정책에 동의하는 것입니다.
                                                       <span class="text-danger">*</span>
                                                    </label>
                                                </div>
                                                <br>
                                              <div class="mb-3 text-end">
                                                   <button class="btn btn-primary waves-effect waves-light" type="submit">제출</button>                                                 
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
