<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.tabulator-col-title {
	color: black !important;
}

.tabulator-data-tree-branch {
	border-left: 2px solid black !important;
	border-bottom: 2px solid black !important;
}
.tabulator-row:hover {
    background-color: skyblue !important;
}

.gridBtn {
	margin-left: 5px;
}
</style>
<div class="content-page">
	<div class="content">

		<div class="row mt-3">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						<h4 class="header-title mb-4">회원관리</h4>

						<ul class="nav nav-tabs nav-bordered nav-justified">
							<li class="nav-item"><a href="javascript: gridRender();"
								id="member-management" class="nav-link active"> 회원관리 </a></li>
							<li class="nav-item"><a
								href="javascript: projectGridRender();" id="project-management"
								class="nav-link"> 프로젝트 관리 </a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="home-b2">
								<!-- <div id="jinoGridButtons" style="text-align: right;"></div> -->
								<div class="row">
								  <div id="jinoGridSearchBar">
								  </div>
								</div>
								
								<div id="jinoGrid"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- end card-->
			</div>
			<!-- end col -->
		</div>

	</div>
</div>

<script type="text/javascript">
$('#testbtn').on('click', function() {
	//alert('되냐?')
})

gridRender();

var minMaxFilterEditor = function(cell, onRendered, success, cancel, editorParams){

    var end;

    var container = document.createElement("span");

    //create and style inputs
    var start = document.createElement("input");
    start.setAttribute("type", "number");
    start.setAttribute("placeholder", "최소");
    start.setAttribute("min", 0);
    start.setAttribute("max", 100);
    start.style.padding = "4px";
    start.style.width = "50%";
    start.style.boxSizing = "border-box";

    start.value = cell.getValue();

    function buildValues(){
        success({
            start:start.value,
            end:end.value,
        });
    }

    function keypress(e){
        if(e.keyCode == 13){
            buildValues();
        }

        if(e.keyCode == 27){
            cancel();
        }
    }

    end = start.cloneNode();
    end.setAttribute("placeholder", "최대");

    start.addEventListener("change", buildValues);
    start.addEventListener("blur", buildValues);
    start.addEventListener("keydown", keypress);

    end.addEventListener("change", buildValues);
    end.addEventListener("blur", buildValues);
    end.addEventListener("keydown", keypress);


    container.appendChild(start);
    container.appendChild(end);

    return container;
 }

//custom max min filter function
function minMaxFilterFunction(headerValue, rowValue, rowData, filterParams){
    //headerValue - the value of the header filter element
    //rowValue - the value of the column in this row
    //rowData - the data for the row being filtered
    //filterParams - params object passed to the headerFilterFuncParams property

        if(rowValue){
            if(headerValue.start != ""){
                if(headerValue.end != ""){
                    return rowValue >= headerValue.start && rowValue <= headerValue.end;
                }else{
                    return rowValue >= headerValue.start;
                }
            }else{
                if(headerValue.end != ""){
                    return rowValue <= headerValue.end;
                }
            }
        }

    return true; //must return a boolean, true if it passes the filter.
}

function projectGridRender() {
	document.querySelector("#member-management").classList.remove("active");
	document.querySelector("#project-management").classList.add("active");
	document.querySelector("#jinoGrid").innerHTML = "<div style='text-align: center;'><div class='spinner-border avatar-lg text-primary m-2'></div></div>";
	//데이터의 구조는 _children안에 있는 객체들은 하위..
	//0.프로젝트의 종류
	//1. 프로젝트 이름
	//2. 상위 작업
	//3. 하위작업
	//4단계의 트리구조
	/* 
	const obj = {
	  proNo: proNo,
	  proName: proName,
	  proType: proType,
	  pm: memberId,
	  _children: [
		{
		  twCategoryNo: twCategoryNo, 
		  twCategoryName: twCategoryName,
		  _children: [
			{
			  	topWorkNo: topWorkNo,
			  	topWorkTitle: topWorkTitle,
			  	topWorkMemberId: memberId,
			  	_children: [
			  	  {
			  	    subWorkNo: subWorkNo,
			  	    subWorkTitle: subWorkTitle,
			  	    subWorkMemberId: memberId,
			  	  },
			  	],
			},  
		  ],
		},
	  ]
	}
	 */
	//쿼리로 뽑는거보단.. 그냥 데이터 합치는게 나은듯
	//일단 모든데이터 다가져오기
	axios
	  .post("/admin/jino/getAllDatas")
	  .then((res) => {
		 //그리드 검색바 만들기
		 let searchText = ``;
		 searchText += `<div class="row">`;
		 searchText += `<div class="col-lg-2">`;
		 searchText += `<select id="filter-field" class="form-select">`;
		 searchText += `  <option>선택</option>`;
		 searchText += `  <option value="proName">프로젝트명</option>`;
		 searchText += `  <option value="memberId">PM</option>`;
		 searchText += `  <option value="twCategoryName">카테고리명</option>`;
		 searchText += `  <option value="topWorkTitle">상위작업명</option>`;
		 searchText += `  <option value="subWorkTitle">하위작업명</option>`;
		 searchText += `  <option value="function">진행도 < 3</option>`;
		 searchText += `</select>`;
		 searchText += `</div>`;
		 searchText += `<div class="col-lg-1">`;
		 searchText += `<select id="filter-type" class="form-select">`;
		 searchText += `  <option value="like">like</option>`;
		 searchText += `  <option value="=">=</option>`;
		 searchText += `  <option value="<"><</option>`;
		 searchText += `  <option value="<="><=</option>`;
		 searchText += `  <option value=">">></option>`;
		 searchText += `  <option value=">=">>=</option>`;
		 searchText += `  <option value="!=">!=</option>`;
		 searchText += `</select>`;
		 searchText += `</div>`;
		 searchText += `<div class="col-lg-3">`;
		 searchText += `  <input id="filter-value" class="form-control" type="text" placeholder="value to filter">`;
		 searchText += `</div>`;
		 searchText += `<div class="col-lg-1">`;
		 searchText += `  <button id="filter-clear" class="btn btn-primary waves-effect waves-light">Clear</button>`;
		 searchText += `</div>`;
		 searchText += `<div class="col-lg-5" id="jinoGridButtons" style="text-align: right;">`;
		 searchText += `</div>`;
		 searchText += `</div>`;
		 searchText += `</div>`;
         
         document.querySelector("#jinoGridSearchBar").innerHTML = searchText;
		 //console.log("모든 정보", res);
		 const allDatas = res.data;
		 const projectList = allDatas.projectList;
		 const twCategoryList = allDatas.twCategoryList;
		 const topWorkList = allDatas.topWorkList;
		 const subWorkList = allDatas.subWorkList;
		 const twRelationList = allDatas.twRelationList;
		 const proJSList = allDatas.proJSList;
		 //console.log("멤버정보 : ", proJSList);
		 for (let i = 0; i < projectList.length; i++) {
			 //멤버 넣기
			 /* const proMemberArray = [];
			 for (let z = 0; z < proJSList.length; z++) {
				 if (projectList[i].proNo == proJSList[z].proNo) {
					 proMemberArray.push(proJSList[z].memberId);
				 }
			 }
			 
			 projectList[i].member = proMemberArray; */
			 
			 //프로젝트 삭제여부
			 if (projectList[i].proDelete == "0") {
				 projectList[i].deleted = false;
			 } else {
				 projectList[i].deleted = true;
			 }
			 
			 const categoryArray = [];
			 for (let j = 0; j < twCategoryList.length; j++) {
				 //삭제여부
				 if (twCategoryList[j].twCategoryState == "0") {
					 twCategoryList[j].deleted = false;
				 } else {
					 twCategoryList[j].deleted = true;
				 }
				 //프로젝트 안에 카테고리 넣기
				 if (projectList[i].proNo == twCategoryList[j].proNo) {
					 categoryArray.push(twCategoryList[j]);
				 }
				 
				 const topWorkArray = [];
				 for (let k = 0; k < topWorkList.length; k++) {
					 //상위작업 삭제여부
					 if (topWorkList[k].topWorkDelete == "F") {
						 topWorkList[k].deleted = false;
					 } else {
						 topWorkList[k].deleted = true;
					 }
					 //카테고리 안에 상위작업 넣기
					 if (twCategoryList[j].twCategoryNo == topWorkList[k].twCategoryNo) {
						 topWorkArray.push(topWorkList[k]);
					 }
					 
					 const subWorkArray = [];
					 for (let l = 0; l < subWorkList.length; l++) {
						 //하위작업 삭제여부
						 if (subWorkList[l].subWorkDelete == "0") {
							 subWorkList[l].deleted = false;
						 } else {
							 subWorkList[l].deleted = true;
						 }
						 //상위작업 안에 하위작업 넣기
						 if (topWorkList[k].topWorkNo == subWorkList[l].topWorkNo) {
							 subWorkArray.push(subWorkList[l]);
						 }
					 }//네번째 for문
					 
					 topWorkList[k]._children = subWorkArray;
				 }//세번째 for문
				 
				 twCategoryList[j]._children = topWorkArray;
			 }//두번째 for문
			 
		   projectList[i]._children = categoryArray;
		 }//첫번째 for문
		 
		 console.log("트리데이터 : ", projectList);
		 
	     var table = new Tabulator("#jinoGrid", {
	         height:"700px",
	         reactiveData:true,
	         data: projectList,
	         dataTree:true,
	         dataTreeStartExpanded: false,
	         groupBy:"proType",
	         groupStartOpen: false,
	         pagination: "local",
	         paginationSize: 20,
	         placeholder:"데이터를 불러오고 있습니다.",
	         columns:[
	         //{title:"프로젝트 종류", field:"proType", width:150},
	         {title:"프로젝트 종류", field:"proType", width:150,},
	         {title:"프로젝트 이름", field:"proName", editor: "input", width:200},
	         {title:"PM", field:"memberId", width:150, editor: "input",},
	         {title:"카테고리 이름", field:"twCategoryName", editor: "input", width:150, responsive:2,}, //hide this column first
	         {title:"상위작업명", field:"topWorkTitle", editor: "input", width:200,},
	         {title:"진행도", field:"topWorkProgress", editor: "input", sorter:"number", hozAlign:"left", formatter:"progress", width:200, editable:true},
	         {title:"하위작업명", field:"subWorkTitle", editor: "input", width:200,},
	         {title:"삭제여부", field:"deleted", hozAlign:"center", formatter:"tickCross", sorter:"boolean",
	        	 cellClick:function(e, cell) {
	        		//console.log("뭐가뜨냐"); 
	        		//console.log("깊이 : ", cell._cell.row.element.classList[3].split("-")[3]);
	        		
	        		const depth = cell._cell.row.element.classList[3].split("-")[3];
	        		//depth 0 = 프로젝트, 1 = 카테고리, 2 = 상위작업, 3 = 하위작업
	        		
	        		const deleteFlag = cell._cell.row.data.deleted;
	        		console.log(cell._cell.row);
	        		console.log("depth : ", depth, "deleteFlag : ", deleteFlag);
	        		
	        		//프로젝트 삭제
	        		if (depth == "0") {
	        			//alert("해당 프로젝트를 삭제?");
	        			let swalTitle = '프로젝트를 삭제하시겠습니까?';
	        			let swalText = '관련된 하위 항목들이 모두 삭제처리됩니다.';
	        			let swalButton = '삭제';
	        			
	        			if (deleteFlag) {
	        				swalTitle = '프로젝트를 복구하시겠습니까?';
	        				swalText = '관련된 하위 항목들은 개별로 복구해야합니다.';
	        				swalButton = '복구';
	        			}
	        			
	        			Swal.fire({
						  title: swalTitle,
						  text: swalText,
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: swalButton,
						  cancelButtonText: '취소'
						}).then((result) => {
						  if (result.isConfirmed) {
							grid_completeAlert(deleteFlag);
						    
						    grid_changeDeletedMark(cell, depth);
	        			    grid_deleteProject(cell);
						  }
						});
	        			
	        		}
	        		//카테고리 삭제
	        		if (depth == "1") {
	        			let swalTitle = '카테고리를 삭제하시겠습니까?';
                        let swalText = '관련된 하위 항목들이 모두 삭제처리됩니다.';
                        let swalButton = '삭제';
                        
                        if (deleteFlag) {
                            swalTitle = '카테고리를 복구하시겠습니까?';
                            swalText = '관련된 하위 항목들은 개별로 복구해야합니다.';
                            swalButton = '복구';
                        }
                        
	        			Swal.fire({
                          title: swalTitle,
                          text: swalText,
                          icon: 'warning',
                          showCancelButton: true,
                          confirmButtonColor: '#3085d6',
                          cancelButtonColor: '#d33',
                          confirmButtonText: swalButton,
                          cancelButtonText: '취소'
                        }).then((result) => {
                          if (result.isConfirmed) {
                        	grid_completeAlert(deleteFlag);
                            
                            grid_changeDeletedMark(cell, depth);
                            grid_deleteTwCategory(cell);
                          }
                        });
	        		}
	        		//상위작업 삭제
	        		if (depth == "2") {
	        			let swalTitle = '상위작업을 삭제하시겠습니까?';
                        let swalText = '관련된 하위 항목들이 모두 삭제처리됩니다.';
                        let swalButton = '삭제';
                        
                        if (deleteFlag) {
                            swalTitle = '상위작업을 복구하시겠습니까?';
                            swalText = '관련된 하위 항목들은 개별로 복구해야합니다.';
                            swalButton = '복구';
                        }
	        			//alert("해당 상위작업을 삭제?"); -> 하위작업도 모두 같이 삭제처리해줘야함
	        			Swal.fire({
                          title: swalTitle,
                          text: swalText,
                          icon: 'warning',
                          showCancelButton: true,
                          confirmButtonColor: '#3085d6',
                          cancelButtonColor: '#d33',
                          confirmButtonText: swalButton,
                          cancelButtonText: '취소'
                        }).then((result) => {
                          if (result.isConfirmed) {
                        	grid_completeAlert(deleteFlag);
                            
                            grid_changeDeletedMark(cell, depth);
                            grid_deleteTopWork(cell);
                          }
                        });
	        			
	        		}
	        		//하위작업 삭제
	        		if (depth == "3") {
	        			let swalTitle = '하위작업을 삭제하시겠습니까?';
                        let swalText = '관련된 항목들이 모두 삭제처리됩니다.';
                        let swalButton = '삭제';
                        
                        if (deleteFlag) {
                            swalTitle = '하위작업을 복구하시겠습니까?';
                            swalText = '관련된 항목들은 개별로 복구해야합니다.';
                            swalButton = '복구';
                        }
                        
	        			Swal.fire({
                          title: swalTitle,
                          text: swalText,
                          icon: 'warning',
                          showCancelButton: true,
                          confirmButtonColor: '#3085d6',
                          cancelButtonColor: '#d33',
                          confirmButtonText: swalButton,
                          cancelButtonText: '취소'
                        }).then((result) => {
                          if (result.isConfirmed) {
                        	grid_completeAlert(deleteFlag);
                            
                            grid_changeDeletedMark(cell, depth);
                            grid_deleteSubWork(cell);
                          }
                        });
	        		}
	        		
	        	 },
	         },
	         //cellClick:function(e, cell){}
	         ],
	     });
	     
	     table.on("cellEdited", function(cell) {
	    	 //console.log("셀데이터 : ", cell);
	    	 //console.log(cell._cell);
	    	 //console.log("바뀐 컬럼명 : ", cell._cell.column.field);
	    	 //console.log("proNo : ", cell._cell.row.data.proNo);
	    	 //console.log("바뀌기 전 데이터 : ", cell._cell.oldValue);
	    	 //console.log("바뀐 후 데이터 : ", cell._cell.value);
	    	 const changeField = cell._cell.column.field;
	    	 
	    	 
	    	 //프로젝트명 변경시
	    	 if (changeField == "proName") {
	    		 grid_changeProjectName(cell);
	    	 }
	    	 
	    	 //팀장 변경시
	    	 if (changeField == "memberId") {
	    		 console.log(changeField);
	    		 console.log(cell._cell.row.data);
	    		 grid_changeProjectManager(cell);
	    	 }
	    	 
	    	 //카테고리 이름 변경시
	    	 if (changeField == "twCategoryName") {
	    		 grid_changeTwCategoryName(cell);
	    	 }
	    	 
	    	 //상위작업 제목 변경시
	    	 if (changeField == "topWorkTitle") {
	    		 grid_changeTopWorkTitle(cell);
	    	 }
	    	 
	    	 //상위작업의 진행도 변경시
	    	 if (changeField == "topWorkProgress") {
	    		 grid_changeTopWorkProgress(cell);
             }
	    	 
	    	 //하위작업 제목 변경시
	    	 if (changeField == "subWorkTitle") {
	    		 grid_changeSubWorkTitle(cell);
	    	 }
	    	 
	    	 Swal.fire({
	    		  position: 'top-end',
	    		  icon: 'success',
	    		  title: '수정이 완료되었습니다.',
	    		  showConfirmButton: false,
	    		  timer: 1500
	    		})
	    	 
	     });
	     
	     grid_createButtons(table);
	     //그리드 검색바
	     var fieldEl = document.getElementById("filter-field");
	     var typeEl = document.getElementById("filter-type");
	     var valueEl = document.getElementById("filter-value");
	     console.log("fieldEL", fieldEl);
	     
	   //Custom filter example
	     function customFilter(data){
	         return data.car && data.rating < 3;
	     }

	     //Trigger setFilter function with correct parameters
	     function updateFilter(){
	       var filterVal = fieldEl.options[fieldEl.selectedIndex].value;
	       var typeVal = typeEl.options[typeEl.selectedIndex].value;

	       var filter = filterVal == "function" ? customFilter : filterVal;

	       if(filterVal == "function" ){
	         typeEl.disabled = true;
	         valueEl.disabled = true;
	       }else{
	         typeEl.disabled = false;
	         valueEl.disabled = false;
	       }

	       if(filterVal){
	         table.setFilter(filter,typeVal, valueEl.value);
	       }
	     }
	     
	     
	     //updateFilter();

	     //Update filters on value change
	     document.getElementById("filter-field").addEventListener("change", updateFilter);
	     document.getElementById("filter-type").addEventListener("change", updateFilter);
	     document.getElementById("filter-value").addEventListener("keyup", updateFilter);

	     //Clear filters on "Clear Filters" button click
	     document.getElementById("filter-clear").addEventListener("click", function(){
	       fieldEl.value = "";
	       typeEl.value = "=";
	       valueEl.value = "";

	       table.clearFilter();
	     });

	     
	  });
	
}


function grid_completeAlert(deleteFlag) {
	if (deleteFlag) {
        Swal.fire(
          '복구되었습니다!',
          '',
          'success'
        )
          
      } else {
        Swal.fire(
          '삭제되었습니다!',
          '',
          'success'
        )
          
      }
}


function grid_changeDeletedMark(cell, depth) {
	// 체크표시 바꾸기
    if (cell._cell.row.data.deleted) {
        cell._cell.row.data.deleted = false;
    } else {
        cell._cell.row.data.deleted = true;
        grid_changeChildrenMark(cell, depth);
    }
	
	
}

function grid_changeChildrenMark(cell, depth) {
	//깊이에 따라 다 마크 바꿔저ㅜ야함
    //0 = 프로젝트 => 카테고리 => 상위작업 => 하위작업
    if (depth == "0") {
        const twCategoryList = cell._cell.row.data._children;
        
        for (twCategoryVO of twCategoryList) {
            twCategoryVO.deleted = true; //true가 삭제 (삭제할때만 필요함.)
            
            const topWorkList = twCategoryVO._children;
            
            for (topWorkVO of topWorkList) {
                topWorkVO.deleted = true;
                
                const subWorkList = topWorkVO._children;
                
                for(subWorkVO of subWorkList) {
                    subWorkVO.deleted = true;   
                }
            }
        }
    }
    if (depth == "1") {
        const topWorkList = cell._cell.row.data._children;
        
        for (topWorkVO of topWorkList) {
            topWorkVO.deleted = true;
            
            const subWorkList = topWorkVO._children;
            
            for(subWorkVO of subWorkList) {
                subWorkVO.deleted = true;   
            }
        }
    }
    
    if (depth == "2") {
        const subWorkList = cell._cell.row.data._children;
        
        for(subWorkVO of subWorkList) {
            subWorkVO.deleted = true;   
        }
    }
}

function grid_deleteProject(cell) {
	const grid_proNo = cell._cell.row.data.proNo;
    
    const projectVO = {
      proNo: grid_proNo,    
    };
    
    axios
      .post("/admin/jino/deleteProject", projectVO)
      .then((res) => {
    	  
      });
}

function grid_deleteTwCategory(cell) {
	const twCategoryNo = cell._cell.row.data.twCategoryNo;
    
    const twCategoryVO = {
      twCategoryNo, 
    };
    
    axios
      .post("/admin/jino/deleteTopWorkCategory", twCategoryVO)
      .then((res) => {
          
      });
}

function grid_deleteTopWork(cell) {
	const topWorkNo = cell._cell.row.data.topWorkNo;
    
    const topWorkVO = {
      topWorkNo,
    };
    
    axios
      .post("/admin/jino/deleteTopWork", topWorkVO)
      .then((res) => {
         console.log(res); 
      });
}

function grid_deleteSubWork(cell) {
	const subWorkNo = cell._cell.row.data.subWorkNo;
    
    const subWorkVO = {
      subWorkNo,
    };
    
    axios
      .post("/admin/jino/deleteSubWork", subWorkVO)
      .then((res) => {
          console.log(res);
      });
}

function grid_createButtons(table) {
	const buttonsDiv = document.querySelector("#jinoGridButtons");
    
    let buttonText = ``;
    buttonText += `<button class="gridBtn btn btn-success width-sm waves-effect waves-light" id="print-table">프린트 하기</button>`;
    buttonText += `<button class="gridBtn btn btn-success width-sm waves-effect waves-light" id="download-json">JSON 다운로드</button>`;
    buttonText += `<button class="gridBtn btn btn-success width-sm waves-effect waves-light" id="download-xlsx">XLSX 다운로드</button>`;
    buttonText += `<button class="gridBtn btn btn-success width-sm waves-effect waves-light" id="download-pdf">PDF 다운로드</button>`;
    
    buttonsDiv.innerHTML = buttonText;
    
    document.getElementById("download-json").addEventListener("click", function(){
        table.download("json", "BoatIn.json");
    });
    
    document.getElementById("download-xlsx").addEventListener("click", function(){
        table.download("xlsx", "BoatIn.xlsx", {sheetName:"My Data"});
    });
    
    document.getElementById("download-pdf").addEventListener("click", function(){
        table.download("pdf", "BoatIn.pdf", {
            orientation:"portrait", //set page orientation to portrait
            title:"Example Report", //add title to report
        });
    });
    
    document.getElementById("print-table").addEventListener("click", function(){
    	   table.print(false, true);
    });
}

function gridRender() {
	//멤버 서치바
	let searchText = ``;
	searchText += `<div class="row">`;
	searchText += `<div class="col-lg-2">`;
    searchText += `<select id="filter-field" class="form-select">`;
    searchText += `  <option>선택</option>`;
    searchText += `  <option value="memberId">아이디</option>`;
    searchText += `  <option value="memberName">이름</option>`;
    searchText += `  <option value="memberPhone">전화번호</option>`;
    searchText += `  <option value="memberBirth">생년월일</option>`;
    searchText += `  <option value="memberRegdate">가입일</option>`;
    searchText += `</select>`;
    searchText += `</div>`;
	searchText += `<div class="col-lg-1">`;
    searchText += `<select id="filter-type" class="form-select">`;
    searchText += `  <option value="like">like</option>`;
    searchText += `  <option value="=">=</option>`;
    searchText += `  <option value="<"><</option>`;
    searchText += `  <option value="<="><=</option>`;
    searchText += `  <option value=">">></option>`;
    searchText += `  <option value=">=">>=</option>`;
    searchText += `  <option value="!=">!=</option>`;
    searchText += `</select>`;
    searchText += `</div>`;
	searchText += `<div class="col-lg-3">`;
    searchText += `  <input id="filter-value" class="form-control" type="text" placeholder="value to filter">`;
    searchText += `</div>`;
	searchText += `<div class="col-lg-1">`;
    searchText += `  <button id="filter-clear" class="btn btn-primary waves-effect waves-light">Clear</button>`;
    searchText += `</div>`;
    searchText += `<div class="col-lg-5" id="jinoGridButtons" style="text-align: right;">`;
    searchText += `</div>`;
    searchText += `</div>`;
    searchText += `</div>`;
    
    document.querySelector("#jinoGridSearchBar").innerHTML = searchText;
	
    document.querySelector("#project-management").classList.remove("active");
	document.querySelector("#member-management").classList.add("active");
	document.querySelector("#jinoGrid").innerHTML = "<div style='text-align: center;'><div class='spinner-border avatar-lg text-primary m-2'></div></div>";

    axios
      .get("/admin/jino/getAllMember")
      .then((res) => {
    	  console.log("잘왓니 멤버", res);
    	  const gridMemberData = res.data;
    	  
    	  return gridMemberData;
      })
      .then((gridMemberData) => {
    	//define some sample data
    	     var table = new Tabulator("#jinoGrid", {
    	            height: 700, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
    	            data: gridMemberData, //assign data to table
    	            layout:"fitColumns", //fit columns to width of table (optional)
    	            pagination: "local",
    	            paginationSize: 20,
    	            columns:[ //Define Table Columns
    	                
    	                //타이틀은 헤드명, filed는 멤버변수명으로 지정해서 쓰면 된다.
    	                {title:"회원 ID", field:"memberId", width:250,},
    	                {title:"이름", field:"memberName", editor: "input", width:150,},
    	                {title:"전화번호", field:"memberPhone", editor: "input", width:150,},
    	                {title:"생년월일", field:"memberBirth", editor: "input", width:150,},
    	                {title:"가입일", field:"memberRegdate", editor: "input", width:150,},
    	                {title:"소개", field:"memberInfo", editor: "input", width:500},
    	                //{title:"이름", field:"memberName", hozAlign:"left", formatter:"progress"},
    	                //{title:"Favourite Color", field:"col"},
    	                //{title:"Date Of Birth", field:"dob", sorter:"date", hozAlign:"center"},
    	            ],
    	        });

    	        //trigger an alert message when the row is clicked
    	        table.on("rowClick", function(e, row) { 
    	            //alert("Row " + row.getData().id + " Clicked!!!!");
    	        });
    	        
    	        table.on("cellEdited", function(cell) {
   	        	  //console.log("셀데이터 : ", cell);
   	              //console.log(cell._cell);
   	              console.log("바뀐 컬럼명 : ", cell._cell.column.field);
   	              //console.log("바뀌기 전 데이터 : ", cell._cell.oldValue);
   	              //console.log("바뀐 후 데이터 : ", cell._cell.value);
   	              const changeField = cell._cell.column.field;
   	              
   	              if (changeField == "memberName") {
   	            	grid_changeMemberName(cell);
   	              }
   	              
   	              if (changeField == "memberPhone") {
   	            	grid_changeMemberPhone(cell);
   	              }
   	              
   	              if (changeField == "memberBirth") {
   	            	grid_changeMemberBirth(cell);
   	              }
   	              
   	              if (changeField == "memberRegdate") {
   	            	grid_changeMemberRegdate(cell);
   	              }
   	              
   	              if (changeField == "memberInfo") {
   	            	grid_changeMemberInfo(cell);
   	              }
   	              
   	              
   	              
	   	          Swal.fire({
	                  position: 'top-end',
	                  icon: 'success',
	                  title: '수정이 완료되었습니다.',
	                  showConfirmButton: false,
	                  timer: 1500
	                });
	   	          
    	        });
    	        
    	        grid_createButtons(table);
    	      //그리드 검색바
                var fieldEl = document.getElementById("filter-field");
                var typeEl = document.getElementById("filter-type");
                var valueEl = document.getElementById("filter-value");
                console.log("fieldEL", fieldEl);
                
              //Custom filter example
                function customFilter(data){
                    return data.car && data.rating < 3;
                }

                //Trigger setFilter function with correct parameters
                function updateFilter(){
                  var filterVal = fieldEl.options[fieldEl.selectedIndex].value;
                  var typeVal = typeEl.options[typeEl.selectedIndex].value;

                  var filter = filterVal == "function" ? customFilter : filterVal;

                  if(filterVal == "function" ){
                    typeEl.disabled = true;
                    valueEl.disabled = true;
                  }else{
                    typeEl.disabled = false;
                    valueEl.disabled = false;
                  }

                  if(filterVal){
                    table.setFilter(filter,typeVal, valueEl.value);
                  }
                }
                
                
                //updateFilter();

                //Update filters on value change
                document.getElementById("filter-field").addEventListener("change", updateFilter);
                document.getElementById("filter-type").addEventListener("change", updateFilter);
                document.getElementById("filter-value").addEventListener("keyup", updateFilter);

                //Clear filters on "Clear Filters" button click
                document.getElementById("filter-clear").addEventListener("click", function(){
                  fieldEl.value = "";
                  typeEl.value = "=";
                  valueEl.value = "";

                  table.clearFilter();
                });
      });
    
}

function grid_changeMemberName(cell) {
	const grid_memberId = cell._cell.row.data.memberId;
    const memberName = cell._cell.value;
    const memberVO = {
      memberId: grid_memberId,
      memberName,
    };
    
    axios
      .post("/admin/jino/updateMemberName", memberVO)
      .then((res) => {
         console.log(res); 
      });
}

function grid_changeMemberPhone(cell) {
	const grid_memberId = cell._cell.row.data.memberId;
    const memberPhone = cell._cell.value;
    const memberVO = {
      memberId: grid_memberId,
      memberPhone,
    };
    
    axios
      .post("/admin/jino/updateMemberPhone", memberVO)
      .then((res) => {
         console.log(res); 
      });
}

function grid_changeMemberBirth(cell) {
	const grid_memberId = cell._cell.row.data.memberId;
    const memberBirth = cell._cell.value;
    const memberVO = {
      memberId: grid_memberId,
      memberBirth,
    };
    
    axios
      .post("/admin/jino/updateMemberBirth", memberVO)
      .then((res) => {
         console.log(res); 
      });
}

function grid_changeMemberRegdate(cell) {
	const grid_memberId = cell._cell.row.data.memberId;
    const memberRegdate = cell._cell.value;
    const memberVO = {
      memberId: grid_memberId,
      memberRegdate,
    };
    
    axios
      .post("/admin/jino/updateMemberRegdate", memberVO)
      .then((res) => {
         console.log(res); 
      });
}

function grid_changeMemberInfo(cell) {
	const grid_memberId = cell._cell.row.data.memberId;
    const memberInfo = cell._cell.value;
    const memberVO = {
      memberId: grid_memberId,
      memberInfo,
    };
    
    axios
      .post("/admin/jino/updateMemberInfo", memberVO)
      .then((res) => {
         console.log(res); 
      });
}

function grid_changeSubWorkTitle(cell) {
    const subWorkNo = cell._cell.row.data.subWorkNo;
    const subWorkTitle = cell._cell.value;
    
    const subWorkVO = {
       subWorkNo,
       subWorkTitle,
    };
    
    axios
      .post("/admin/jino/updateSubWorkTitle", subWorkVO)
      .then((res) => {
         console.log(res); 
      });
}

function grid_changeTopWorkTitle(cell) {
    const twCategoryNo = cell._cell.row.data.twCategoryNo;
    const topWorkNo = cell._cell.row.data.topWorkNo;
    const topWorkTitle = cell._cell.value;
    
    const topWorkVO = {
      twCategoryNo,
      topWorkNo,
      topWorkTitle,
    };
    
    axios
      .post("/admin/jino/updateTopWorkTitle", topWorkVO)
      .then((res) => {
         console.log(res); 
      });
}

function grid_changeTwCategoryName(cell) {
    const grid_proNo = cell._cell.row.data.proNo;
    const twCategoryNo = cell._cell.row.data.twCategoryNo;
    const twCategoryName = cell._cell.value;
    
    const twCategoryVO = {
      proNo: grid_proNo,
      twCategoryNo,
      twCategoryName,
    };
    
    axios
      .post("/admin/jino/updateCategoryName", twCategoryVO)
      .then((res) => {
         console.log(res); 
      });
}

function grid_changeProjectName(cell) {
    const grid_proNo = cell._cell.row.data.proNo;
    const proName = cell._cell.value;
    
    const projectVO = {
      proNo: grid_proNo,
      proName,
    };
    
    axios
      .post("/admin/jino/updateProjectName", projectVO)
      .then((res) => {
         //console.log(res); 
      });
}

function grid_changeProjectManager(cell) {
	const grid_proNo = cell._cell.row.data.proNo;
	const proManager = cell._cell.value;
	
	const proJSVO = {
	  proNo: grid_proNo,
	  memberId: proManager,
	};
	
	axios
	  .post("/admin/jino/updateProjectManager", proJSVO)
	  .then((res) => {
		  
	  });
}

function grid_changeTopWorkProgress(cell) {
    const topWorkNo = cell._cell.row.data.topWorkNo;
    const topWorkProgress = cell._cell.value;
    
    const topWorkVO = {
      topWorkNo,
      topWorkProgress,
    };
    
    axios
      .post("/admin/jino/updateTopWorkProgress", topWorkVO)
      .then((res) => {
         console.log(res); 
      });
}


function grid_searchBarRender(table) {
	//그리드 검색바
    var fieldEl = document.getElementById("filter-field");
    var typeEl = document.getElementById("filter-type");
    var valueEl = document.getElementById("filter-value");
    console.log("fieldEL", fieldEl);
    
  //Custom filter example
    function customFilter(data){
        return data.car && data.rating < 3;
    }

    //Trigger setFilter function with correct parameters
    function updateFilter(){
      var filterVal = fieldEl.options[fieldEl.selectedIndex].value;
      var typeVal = typeEl.options[typeEl.selectedIndex].value;

      var filter = filterVal == "function" ? customFilter : filterVal;

      if(filterVal == "function" ){
        typeEl.disabled = true;
        valueEl.disabled = true;
      }else{
        typeEl.disabled = false;
        valueEl.disabled = false;
      }

      if(filterVal){
        table.setFilter(filter,typeVal, valueEl.value);
      }
    }
    
    //Update filters on value change
    document.getElementById("filter-field").addEventListener("change", updateFilter);
    document.getElementById("filter-type").addEventListener("change", updateFilter);
    document.getElementById("filter-value").addEventListener("keyup", updateFilter);

    //Clear filters on "Clear Filters" button click
    document.getElementById("filter-clear").addEventListener("click", function(){
      fieldEl.value = "";
      typeEl.value = "=";
      valueEl.value = "";

      table.clearFilter();
    });
};
</script>