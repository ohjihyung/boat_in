<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<style>
    #word {
        margin: 10px;
        outline: none;
        display: block;
/*         color: black; */
        width: 200px;
/*         font-size: 20px; */
/*         font-weight: bolder !important; */
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
</style>

<div class="content">
                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- Right Sidebar -->
                        <div class="row">
                            <div class="col-lg-12" style="padding-top: 30px">
                                <div class="card">
                                    <div class="card-body">
                                        <!-- Left sidebar -->
                                        <div class="inbox-leftbar">
                                            <!-- 트리 출력 -->
                                 			<div class="text font-13 fw-bold" id="tree"></div>
                                        </div>
                                        <!-- End Left sidebar -->
                              
                             			<!-- start inbox-rightbar-->
                                        <div class="inbox-rightbar" style="min-height: 670px">
                                            
			                               <!-- 파일 출력 -->
			                               <div class="listArea">
			                                  <div class="row">
		                                     	<div class='text-center'>
		                                     		<span id="FileMsg" style='margin-top: 20%; font-size: 1.5em; font-weight: bold; display: block;'>조회할 폴더를 선택하세요.</span>
		                                     	</div>
			                                     <div class="m-2"></div>
			                                     <div id="gallary" class="flex-container" style="display: flex; flex-wrap: wrap;">
			                                     </div>
			                                  </div>
                                           </div> 
                                        <div class="clearfix"></div>
                                    </div>    <!-- end inbox-rightbar-->
                                </div>
                            </div> <!-- end Col -->
                        </div><!-- End row -->
                    </div> <!-- container -->
                </div>

	<script>

$(document).ready(function() {
   getJson();
});

function getJson() {
   
	// 랜더링
	document.querySelector("#tree").innerHTML = "<div class='text-center'><div class='spinner-border spinner-border-sm m-2' role='status'></div></div>";
	
   // proNo 불러오기
   let jsonData_O = URLSearch.get("proNo");
   console.log("dataRoom.jsp - proNo : ", jsonData_O);
   
   $.ajax({   
        type : 'POST',
        url : '/filetree',
        data : { projectNo : jsonData_O },
        dataType : 'json',
        success : function(data) {
           
           console.log("dataRoom.jsp - success-data : ", data);
           let fileArr = new Array();
             
           $.each(data, function(i, item){
              
              fileArr[i] = {
                          id : item.FILE_ID,
                          parent : item.PARENT_ID,
                          text : item.FILE_NAME,
                          depth : item.DEPTH
                        }
           });
           console.log("fileArr : ", fileArr);
            
           // 트리 생성 
           $('#tree').jstree({
              "plugins" : ['wholerow', 'types', 'json_data'],
              "core" : {
                  "data" : fileArr    // 데이터 연결 
              },
           
           })
           .bind('loaded.jstree', function(e,data){   // 트리 로딩 완료 이벤트 
//               alert("로딩완료!");
              $("#tree").jstree("open_all");   // 전체 오픈... 오우 되네...?
           })
           .bind('select_node.jstree',function(e,data){   // 노드 선택 이벤트
              console.log("노드선택이벤트-data : ", data);
              
              let FileMsg = document.querySelector("#FileMsg");
              FileMsg.style.cssText = "margin-top: 20%; font-size: 1.5em; font-weight: bold; display: block;";
            
             // 노드 초기화
			 $("#gallary").empty();
             
           
             // 노드 클릭 시 프로젝트-카테고리-상위작업 모두가 일치하는 파일들 가져오기
             // FILE_PATH, FILE_REAL_NAME
             let name = data.instance.get_node(data.selected).text;            // name 가져오기
             let depth = data.instance.get_node(data.selected).original.depth;   // depth 가져오기
             let parentId = data.instance.get_node(data.selected).parents[0];    // parentId 가져오기
             let proNo = "";                                        // proNo 가져오기
             if(depth == 1) {
                proNo = data.instance.get_node(data.selected).parents[0];
             } else if(depth == 2) {
                proNo = data.instance.get_node(data.selected).parents[1];
             }          
//               console.log("name : ", name);
//               console.log("depth : ", depth);
//               console.log("parentId : ", parentId);
//               console.log("proNo : ", proNo);
            
              $.ajax({
                 type : 'POST',
               url : '/gallary',
               data : {
                     name : name,
                     depth : depth,
                     parentId : parentId,
                     proNo : proNo
               },
               dataType : 'json',
               success : function(data) {
                  console.log("data : ", data);
	              console.log("depth : ", depth);
                  
				 
                  if(depth > 1) {	// 상위작업명일 때
                  
					  if(data.length == 0) {
						  document.querySelector("#FileMsg").innerText = "파일이 없습니다.";
						  document.querySelector("#FileMsg").style.cssText = "margin-top: 20%; font-size: 1.5em; font-weight: bold; display: block;";
					  }else{
						  document.querySelector("#FileMsg").style.cssText = "margin-top: 20%; font-size: 1.5em; font-weight: bold; display: none;";
	
						  $.each(data, function(i, item) {
		                     
		                     console.log("i : ", i);
	
		                     let container = null;
		                     let childElement = null;
		                     let txt = ``;
		                     
		                     txt += `<div class="card m-2" style="flex: 1 1 20%">`;
		                     txt += `<a id="word" style="text-align: center; font-size: 13px; padding: 0px;" href="` + item.filePath + `" download = "` + item.fileRealName + `">`;
		                     txt += `<img style="width: 220px; height: 200px" class="card-img-top embed-responsive-item" src="` + item.fileUploader + `" alt="Card image cap"/>`;
		                     txt += `<p class="fs-3 fw-bold " style="margin-top: 15px; color:black; text-align:center; font-size:13px; padding:0px;">` + item.fileName + `</p>`;
		                     txt += `</a>`;
		                     txt += `</div>`;
		                     
		                     // 5개마다 컨테이너 만들기 + txt 추가하기
		                     // 5개 이전까지는 기존 컨테이너에 txt 추가만 하기
		                     container = document.querySelector("#gallary");
		                     
		                     childElement = document.createElement("div");
		                     childElement.className = "childElement" + i;
		                     console.log("childElement" + i);
		                     container.append(childElement);
		                     
		                     document.querySelector(".childElement" + i).innerHTML = txt;
		                     	
		                     
		                  });   // end of each
					  }
                  }else{	// 프로젝트명, 카테고리명일 때
					  document.querySelector("#FileMsg").innerText = "조회할 폴더를 선택하세요.";
					  document.querySelector("#FileMsg").style.cssText = "margin-top: 20%; font-size: 1.5em; font-weight: bold; display: block;";
                  }

               },
               error : function() {
                  alert("error");
               }
            });
            
           });   // end of jstree
           
        }, // end of success
        error : function() {
           alert("error");
        } // end of error
    });

} //end of getJson

</script>