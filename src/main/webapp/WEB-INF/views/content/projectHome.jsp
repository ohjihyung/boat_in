<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script>
//==================== 구글관련시작 ================================
var CLIENT_ID = '616281354554-lpmgnp2gmkaalfk8th0kbj77p0m720jg.apps.googleusercontent.com'; 
var API_KEY = 'AIzaSyABuxJp6UPLwsSvSlF9lLHChKCB40EyRK0';
var DISCOVERY_DOC = 'https://docs.googleapis.com/$discovery/rest?version=v1';
var DISCOVERY_SHHET = 'https://sheets.googleapis.com/$discovery/rest?version=v4';
var SCOPES = 'https://www.googleapis.com/auth/documents';
var SCOPES2 = 'https://www.googleapis.com/auth/spreadsheets';

var tokenClient;
var gapiInited = false;
var gisInited = false;

      /**
       * Callback after api.js is loaded.
       */
      function gapiLoaded() {
        gapi.load('client', initializeGapiClient);
      }

      /**
       * Callback after the API client is loaded. Loads the
       * discovery doc to initialize the API.
       */
      async function initializeGapiClient() {
        await gapi.client.init({
          apiKey: API_KEY,
          discoveryDocs: [DISCOVERY_DOC,DISCOVERY_SHHET],
        });
        gapiInited = true;
      }

      /**
       * Callback after Google Identity Services are loaded.
       */
      function gisLoaded() {
        tokenClient = google.accounts.oauth2.initTokenClient({
          client_id: CLIENT_ID,
          scope: SCOPES,SCOPES2,
          callback: '', // defined later
        });
        gisInited = true;
        
        console.log("gisLoaded : ", tokenClient);
      }

      /**
       *  Sign in the user upon button click.
       */
      function googleAuthLogin_H() {
        console.log("tokenClient", tokenClient);
        
        tokenClient.callback = async (resp) => {
          if (resp.error !== undefined) {
            throw (resp);
          }
          
          var title = $('#proName_H').val()
          //console.log("어스안 : "+ title)
          creatSheet(title);
          createDoc(title);
          await alertTimer();
          //console.log("-------타이머끝 ")
          setTimeout(() => {
              updateDocs(); 
              //console.log("업데이트 ")
              gdocsCheck();
           }, 3000);
          await removeAuthBtn_H();
        };

        if (gapi.client.getToken() === null) {
          // Prompt the user to select a Google Account and ask for consent to share their data
          // when establishing a new session.
          tokenClient.requestAccessToken({prompt: 'consent'});
        } else {
          // Skip display of account chooser and consent dialog for an existing session.
          tokenClient.requestAccessToken({prompt: ''});
        }
      }

        // gdocu 생성 함수
       function createDoc(title) {
            gapi.client.docs.documents.create({
                resource: {title: title}
              }).then(function (response) {
                  var docId= response.result.documentId
                  $('#docuId').val(docId)
              })
          }
        // gsheet 생성
      function creatSheet (title){
      gapi.client.sheets.spreadsheets.create({
          properties: {
            title: title,
          },
        }).then(function(response){
            var sheetId = response.result.spreadsheetId
            $('#sheetId').val(sheetId)
        })
          
      }
    function removeAuthBtn_H(){
        $('#authBtn').attr('type','hidden')
    }

    
    //값 확인용 왓다갓다힘들어 
    function checkValue_H(){
         alertTimer()
        
    }
//==================== 구글 끝 ================================
</script>



<!-- 피커 -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"
/>
<link
  rel="stylesheet"
  type="text/css"
  href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css"
/>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- 풀캘린더 -->
<link
    href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css"
    rel="stylesheet" /><!-- 겹침 -->

<!-- 티피 --><!-- 세개 겹침 -->
<link rel="stylesheet"
    href="https://unpkg.com/tippy.js@6/animations/scale.css" />
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>

<style>
  .parent {
    margin-top: 50px auto;
    margin-left: 10px;
    display: flex;
    flex-direction: row;
    /* justify-content: center; */
    overflow: auto;
    white-space: nowrap;
    background-color: white;
    border-radius: 0.5em;
  }
  .notBorder {
    border: 0px;
  }
  .categoryDiv {
    width: 250px;
  }
  #kanbanLeftBar {
    background-color: white;
    border-radius: 0.5em;
  }
  .container {
    min-width: 230px;
    min-height: 400px;
    height: auto;
    margin: 10px;
    padding: 10px;
    background-color: #b5c1dc57;
    border-radius: 8px;
  }
  .member-container {
    min-width: 230px;
    min-height: 400px;
    height: auto;
    margin: 10px;
    margin-right: 20px;
    padding: 10px;
    background-color: #b5c1dc57;
    border-radius: 8px;
  }
  .subwork-container {
    min-width: 230px;
    min-height: 400px;
    height: auto;
    margin: 10px;
    margin-right: 20px;
    padding: 10px;
    background-color: #b5c1dc57;
    border-radius: 8px;
  }
  .grid-container {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: 1fr 1fr 1fr;
    gap: 10px;
  }
  .grid-item {
    padding: 20px;
    margin-bottom: 0px;
  }
  .grid-item1 {
  padding: 20px;
  margin-bottom: 0px;
    grid-row-start: 1;
    grid-row-end: 4;
    grid-column-start: 1;
    grid-column-end: 3;
  }
  .grid-item2 {
  padding: 20px;
  margin-bottom: 0px;
    grid-column-start: 1;
    grid-column-end: 4;
  }
  .grid-item3 {
  padding: 20px;
  margin-bottom: 0px;
    grid-row-start: 1;
    grid-row-end: 3;
  }
  /* 인풋 테두리 지우기 */
  .input-K {
    border: 0px solid black;
  }
  .input-update-K {
    border: 1px solid gray;
  }
  .input-K:focus {
    outline: 0px solid gray;
  }
  .input-no-K {
    border: 0px solid black;
  }
  .input-no-K:focus {
    outline: 0px solid gray;
  }
  .twComent {
    border: 0px solid black;
  }
  .twComent:focus {
    outline: 0px solid gray;
  }
  .twComent-update {
    border: 1px solid gray;
  }
  .swComent {
    border: 0px solid black;
  }
  .swComent:focus {
    outline: 0px solid gray;
  }
  .swComent-update {
    border: 1px solid gray;
  }

#twImportanceCheckRadio {
    margin-top: 15px;
}
#contentDiv {
    margin-top: 15px;
}

.project-complete {
    margin-left: 10px;
    margin-right: 10px;
}

#projectResult {
    padding-left: 20px;
    padding-right: 20px;
    padding-top: 20px;
}

.table-borderless {
    cursor: pointer;
}

.dropdown-menu {
    
}

.home-drop {
  text-align: center;
  width: 200px;
}
#subwork-contentDiv, .ql-toolbar {
  background: white !important;
}
.ql-editor, #quillContainer {
  font-size: 1.5em  !important;
}
.change-subWork-div {
  margin-bottom: 20px;
}
</style>

<!-- content-page div가 있어야 내용이 출력된다. -->
<div class="content-page">
  <div class="content">
    <!-- Start Content-->
    <div class="container-fluid"> 
      <!-- start page title -->
      <div class="row">
        <div class="col-12">
          <div>
          
            <ul class="nav nav-tabs nav-bordered nav-justified">
            
                <li class="nav-item">
                    <a href="#home-b2" onclick="pageTap('home')" data-bs-toggle="tab" aria-expanded="false" class="nav-link active jino-em-b">
                        홈
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#profile-b2" onclick="pageTap('gantt')" data-bs-toggle="tab" aria-expanded="true" class="nav-link jino-em-b">
                        간트 차트
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#messages-b2" onclick="pageTap('kanban')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">
                        칸반 보드
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#messages-b2" onclick="pageTap('calendar')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">
                        캘린더
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#messages-b2" onclick="pageTap('dataRoom')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">
                        자료실
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#messages-b2" onclick="pageTap('gdocs')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">
                        공유문서 작성
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#messages-b2" onclick="pageTap('projectNotice')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">
                        공지사항
                    </a>
                </li>
            </ul>
          </div>
          
        </div>
      </div>
      <!-- end page title -->
      <div id="finish-marquee" style="margin: 10px; background: black; display: none;">
      </div>
      <!-- 작업추가 end -->
      <div id="kanbanTopDiv"></div>
      <div class="row justify-content-center spa"></div>
      
      <div class="row justify-content-center gantt" style="display: none;">
        <div class="row">
           <div class="col-lg-6">
             <div class="page-title-box">
               <h4 class="page-title">Gantt Chart</h4>
             </div>
           </div>
         
           <div class="col-lg-6" style="margin-top: 10px;" align="right">
             <button class="btn btn-success width-sm waves-effect waves-light" onclick="saveToExcel()">Excel 인쇄하기</button>
           </div>
         </div>
          
        <div id="gantt_wrap" style="width:98%; height:800px; margin-top: 0px;"></div>
        </div>
      </div>
      <!-- end row -->
      <div>
      
      </div>
    </div>
    <!-- container -->
  </div>
  <!-- content -->
</div>

<!-- 모달들 -->
<!-- 작업 인서트 모달 -->
<button type="button" id="btnWorkInsertModal" data-bs-toggle="modal" data-bs-target="#event-modal" style="display: none;"></button>
<div class="modal fade" id="event-modal" tabindex="-1">
  <div class="modal-dialog modal-full-width" style="width: 70%">
    <div class="modal-content">
      <div class="modal-header py-3 px-4 border-bottom-0 d-block">
        <button
          type="button"
          class="btn-close float-end"
          data-bs-dismiss="modal"
          aria-label="Close"
          onclick="insertModalClose()"
        ></button>
        <h5 class="modal-title jino-em-b" id="modal-title">새로운 작업 추가하기</h5>
        <button class="btn btn-soft-dark btn-lg waves-effect waves-light" onclick="dataInsert()">데이터 넣기</button>
      </div>
      <div class="modal-body px-4 pb-4 pt-0">
        <form
          class="needs-validation"
          name="event-form"
          id="form-event"
          novalidate
        >
          <div class="row">
            <div class="col-6">
              <div class="mb-3">
                <label class="form-label jino-em-b">작업명</label>
                <input
                  class="form-control jino-em"
                  placeholder="작업명을 입력해주세요."
                  type="text"
                  name="title"
                  id="event-title"
                  required
                />
                <div class="invalid-feedback">작업 입력은 필수입니다.</div>
              </div>
               <div class="mb-3">
                <label class="form-label jino-em-b">카테고리</label>
                <input type="text"
                  class="form-control jino-em"
                  name="category"
                  id="event-select-category"
                  value= ""
                  readonly
                />
                <input type="hidden" id="event-hidden-category" value=""/>
                <div class="invalid-feedback">
                  Please select a valid event category
                </div>
              </div>
              <div class="mb-3">
              <label class="form-label jino-em-b">작업자 (최대 3명)</label>
              <select  
                 class="form-control" 
                 id="event-worker" 
                 data-width="100%" 
                 multiple="multiple" 
                 placeholder="작업 담당자를 지정하세요."
                 >
               </select>
              </div>
              <div class="mb-3">
                <label class="form-label jino-em-b">기간</label>

                <div style="display: flex; justify-content: space-around">
                  <div class="col-6">
                    <label class="form-label jino-em" for="birth">시작일</label>
                    <input
                      class="form-control jino-em"
                      id="birth"
                      pattern="\d{4}-\d{2}-\d{2}"
                      placeholder=""
                      required
                      th:field="*{birth}"
                      type="text"
                      value=""
                      onchange="settingInsertFlatPickr()"
                    />
                  </div>
                  <div class="col-6">
                    <label class="form-label jino-em" for="birth2">종료일</label>
                    <input
                      class="form-control jino-em"
                      id="birth2"
                      pattern="\d{4}-\d{2}-\d{2}"
                      placeholder=""
                      required
                      th:field="*{birth2}"
                      type="text"
                      value=""
                    />
                  </div>
                </div>

                <div class="invalid-feedback">
                  Please select a valid event day
                </div>
              </div>
              <div class="mb-3">
                <label class="form-label jino-em-b">파일 첨부</label>
                <input
                  class="form-control jino-em"
                  id="event-file"
                  name="uploadFileAjax"
                  type="file"
                  multiple
                />
              </div>
            </div>
            <div class="col-6" style="margin-top: 36px;">
             <!-- 퀼 에디터 들어갈 자리 -->
             <div class="mb-3" id="quillContainer2" style="height: 80%; margin-bottom: 1em;">
                 <div id="contentDiv2"></div>
             </div>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-md-6 col-4">
            </div>
            <div class="col-md-6 col-8 text-end">
              <button
                type="button"
                class="btn btn-danger me-1 jino-em-b"
                id="btnModalClose"
                data-bs-dismiss="modal"
                style="width: 40%;"
              >
                취소하기
              </button>
              <button type="button" class="btn btn-primary jino-em-b" id="btn-save-event" style="width: 40%;">
                추가하기
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <!-- end modal-content-->
  </div>
  <!-- end modal dialog-->
</div>
<!-- end modal-->

<!-- Category 추가 모달 -->
<div
  id="info-alert-modal"
  class="modal fade"
  tabindex="-1"
  role="dialog"
  aria-hidden="true"
>
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body p-4">
        <div class="text-center">
          <i class="dripicons-information h1 text-info"></i>
          <h4 class="mt-2">Add Category</h4>
          <p class="mt-3">
            <input
              class="form-control"
              id="category-name"
              type="text"
              placeholder="Enter Category Name."
              required
            />
          </p>
          <!-- 색상 선택 드롭박스 -->
          <div class="dropdown" style="margin: 10px">
            <input type="hidden" id="dropBox-colorCode" value="#ECF2F5" />
            <button
              class="btn btn-light dropdown-toggle"
              type="button"
              id="dropdownMenuButton"
              data-bs-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              <font id="dropBox-name">색상</font
              ><i class="mdi mdi-chevron-down"></i>
            </button>
            <div class="dropdown-menu home-drop" aria-labelledby="dropdownMenuButton">
              <a class="dropdown-item" href="javascript: selectColor('light')"
                ><font class="text-dark color-light">색상</font></a
              >
              <a class="dropdown-item" href="javascript: selectColor('primary')"
                ><font class="text-primary color-primary">파랑</font></a
              >
              <a class="dropdown-item" href="javascript: selectColor('success')"
                ><font class="text-success color-success">연두</font></a
              >
              <a class="dropdown-item" href="javascript: selectColor('info')"
                ><font class="text-info color-info">하늘</font></a
              >
              <a class="dropdown-item" href="javascript: selectColor('warning')"
                ><font class="text-warning color-warning">주황</font></a
              >
              <a class="dropdown-item" href="javascript: selectColor('danger')"
                ><font class="text-danger color-danger">빨강</font></a
              >
              <a class="dropdown-item" href="javascript: selectColor('dark')"
                ><font class="text-dark color-dark">검정</font></a
              >
              <a class="dropdown-item" href="javascript: selectColor('purple')"
                ><font class="text-purple color-purple">보라</font></a
              >
              <a class="dropdown-item" href="javascript: selectColor('pink')"
                ><font class="text-pink color-pink">분홍</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColor('secondary')"
                ><font class="text-secondary color-secondary">회색</font></a
              >
            </div>
          </div>
          <!-- 드롭박스 끝 -->
          <button
            id="category-add"
            onclick="categoryModalInsert()"
            type="button"
            class="btn btn-primary waves-effect waves-light"
            data-bs-dismiss="modal"
          >
            추가
          </button>
          <button
            id="category-cancel"
            onclick="categoryModalClose()"
            type="button"
            class="btn btn-danger waves-effect waves-light"
            data-bs-dismiss="modal"
          >
            취소
          </button>
        </div>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- 카테고리 수정 모달 -->
<div
  id="category-update-modal"
  class="modal fade"
  tabindex="-1"
  role="dialog"
  aria-hidden="true"
>
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body p-4">
        <div class="text-center">
          <i class="dripicons-information h1 text-info"></i>
          <h4 class="mt-2">Update Category</h4>
          <p class="mt-3">
            <input
              class="form-control"
              id="category-name-update"
              type="text"
              placeholder="Enter Category Name."
              required
            />
          </p>
          <!-- 색상 선택 드롭박스 -->
          <div class="dropdown" style="margin: 10px">
            <input
              type="hidden"
              id="dropBox-colorCode-update"
              value="#ECF2F5"
            />
            <!-- 수정버튼 누르면 여기에 피케이값 저장됨 -->
            <input type="hidden" id="dropBox-twCategoryNo-update" value="" />
            <button
              class="btn btn-light dropdown-toggle"
              type="button"
              id="dropdownMenuButton-update"
              data-bs-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              <font id="dropBox-name-update">색상</font
              ><i class="mdi mdi-chevron-down"></i>
            </button>
            <div class="dropdown-menu home-drop" aria-labelledby="dropdownMenuButton">
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('light')"
                ><font class="text-dark updateColor-light">색상</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('primary')"
                ><font class="text-primary updateColor-primary">파랑</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('success')"
                ><font class="text-success updateColor-success">연두</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('info')"
                ><font class="text-info updateColor-info">하늘</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('warning')"
                ><font class="text-warning updateColor-warning">주황</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('danger')"
                ><font class="text-danger updateColor-danger">빨강</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('dark')"
                ><font class="text-dark updateColor-dark">검정</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('purple')"
                ><font class="text-purple updateColor-purple">보라</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('pink')"
                ><font class="text-pink updateColor-pink">분홍</font></a
              >
              <a
                class="dropdown-item"
                href="javascript: selectColorUpdate('secondary')"
                ><font class="text-secondary updateColor-secondary"
                  >회색</font
                ></a
              >
            </div>
          </div>
          <!-- 드롭박스 끝 -->
          <button
            id="category-update"
            type="button"
            onclick="categoryUpdate()"
            class="btn btn-primary waves-effect waves-light"
            data-bs-dismiss="modal"
          >
            수정
          </button>
          <button
            id="category-update-cancel"
            onclick="categoryUpdateModalClose()"
            type="button"
            class="btn btn-danger waves-effect waves-light"
            data-bs-dismiss="modal"
          >
            취소
          </button>
        </div>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<!-- TopWork detail Right modal content -->
<div id="topWork-detail-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="fullWidthModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-full-width" role="document" style="width: 70%;"><!-- 백그라운드 컬러 주면 뭔가 이상.. -->
        <div class="modal-content" style="">
            <form action="" id="myFrm">
            <div class="modal-header" id= "detail-modal-header" style="">
                  <div style="display: inline" id="goTopWork"></div>
                  <h2 id="">
                  <input type="text" class="input-K" id="detail-WorkTitle" name="workTitle" value="" readonly style="height: 40px;"/></h2>
                  <button type="button" class="btn-close jino-em-b" onclick="detailModalToggle_K()"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body" id="detail-modal-body" style="max-height: 700px; overflow: auto; background: #f1f1f1;">
                  <input type="hidden" value="" id="hidden-topWorkNo" name="topWorkNo"/>
                  <input type="hidden" value="" id="hidden-subWorkNo" name="subWorkNo"/>
                  <input type="hidden" value="" id="hidden-topWorkComentNo"/>
                  <input type="hidden" value="" id="hidden-subWorkComentNo"/>
                  <input type="hidden" value="" id="hidden-workMode"/><!-- 상위: TopWrok / 하위: SubWork -->
                  <input type="hidden" value="" id="hidden-categoryNo"/>
                  <input type="hidden" value="" id="hidden-categoryName"/>
                  <div class="mb-3" id=""  style="">
                    <div class="mb-3" id="detail-button-div">
                      <!-- 하위일감 생성-->
                      <button type=button class="auth-pmpl btn btn-soft-dark btn-lg waves-effect waves-light" id="btnSubWorkInput" onclick="subWorkInputShow()">
                        <i class="mdi mdi-tournament mdi-rotate-270"></i> 하위 작업 추가
                      </button>
                      <button type=button class="auth-pmpl btn btn-soft-danger btn-lg waves-effect waves-light" id="btnMemberChange" onclick="memberChange()">
                        <i class="mdi mdi-paperclip mdi-rotate-45"></i> 작업자 변경하기 
                      </button>
                      <button type=button class="auth-pmpl btn btn-soft-dark btn-lg waves-effect waves-light" id="btnFileAdd" onclick="btnFileAdd_K()">
                        <i class="mdi mdi-paperclip mdi-rotate-45"></i> 파일 첨부 
                      </button>
                      <button type=button id="btnWorkFileList" class="btn btn-soft-dark btn-lg waves-effect waves-light" onclick="showFileList()">
                        <i class="mdi mdi-paperclip mdi-rotate-45"></i> 첨부된 파일 : 0개
                      </button>
                      <!-- 파일 첨부용 인풋 -->
                      <input type="file" id="fileInput_K" multiple style="display: none;" onchange="fileAdd_K(this)"/>
                      <button type="button" id="btnUpdate" class="auth-pmpl btn btn-soft-dark btn-lg waves-effect waves-light" onclick="updateWork()">
                        <i class="mdi mdi-wrench"></i> 수정하기
                      </button>
                      <button type="button" id="btnDelete" class="auth-pmpl btn btn-soft-dark btn-lg waves-effect waves-light" onclick="workDelete()">
                        삭제하기
                      </button>
                      <button type="button" id="btnComplete" class="auth-pmpl btn btn-success btn-lg waves-effect waves-light" onclick="completeWork()">
                        작업 완료 승인하기
                      </button>
                      <button type="button" id="btnReject" class="auth-pmpl btn btn-danger btn-lg waves-effect waves-light" onclick="rejectWork()">
                        작업 반려하기
                      </button>
                  </div>
                  
                  <div id="workFileListDiv" class="jino-em-b"></div>
                  <div id="subWorkDetailDiv" style="display: none;"></div>
                  
                  
                  <div id="subWorkInput" style="display: none;">
                  <div class="row">
                    <div class="col-md-6">
                      <div> 
                        <font class="jinoFont">담당자 선택 : </font>
                            <select class="form-select"
                                    id="sub-worker"
                                    data-width="100%"
                                    multiple
                                    >
                            </select>
                        </div>
                        <div> 
                            <font class="jinoFont">하위 작업 제목 : </font>
                            <input id="subwork-insert-title" class="form-control subwork-class" type="text"/>
                        </div>
                        
                        <div class="row">
                          <div class="col-md-6"> 
                            <font class="jinoFont">시작일 : </font> 
                            <input class="form-control subwork-class" id="subStart" pattern="\d{4}-\d{2}-\d{2}"
                              placeholder="" required th:field="*{subStart}" type="text" style="width: 100%" value=""
                              onchange="settingSubWorkFlatPickr()"/>
                          </div>
                          <div class="col-md-6"> 
                            <font class="jinoFont">종료일 : </font> 
                            <input class="form-control subwork-class" id="subEnd" pattern="\d{4}-\d{2}-\d{2}"
                              placeholder="" required th:field="*{subEnd}" type="text" style="width: 100%" value=""
                              />
                          </div>
                        </div>
                        
                        <div>
                          <font class="jinoFont">첨부파일</font>
                          <input type="file" class="form-control subwork-class" id="subWorkInsertFile" multiple/>
                        </div>
                    </div>
                    
                    
                    <div class="col-md-6">
                      <div style="height: 400px;"> 
                            <font class="jinoFont">하위 작업 내용 : </font> 
                            <!-- <input id="subwork-insert-content" class="form-control subwork-class" type="text"/> -->
                            <div class="mb-3" id="subwork-quillContainer" style="height: 300px; margin-bottom: 1em;">
                              <div id="subwork-contentDiv" class="jino-em"></div>
                            </div>
                            
                        </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-6" style="display: flex;">
                      <button type=button style="width: 50%; margin: 10px;"class="btn btn-danger btn-lg jino-em-b" onclick="detailModalToggle_K()">취소하기</button>
                      <button type=button style="width: 50%; margin: 10px;"class="btn btn-primary btn-lg jino-em-b" onclick="insertSubWork()">추가하기</button>
                    </div>
                  </div>
                  
                  </div>
                  <!-- 하위 일감 끝 -->
                  
                  </div>
                  <div class="topWorkDiv" id="topWorkDiv" style="">
                  <div class="grid-container">
                      <div class="grid-item1 card" style="border-right: 0px solid #C1C1C1; padding-right: 10px;">
                          <!-- <div class="form-check form-switch"> 팀장, 리더만 수정가능 나머진 disabled
                               <input type="checkbox" class="form-check-input" id="customSwitch1">
                               <label class="form-check-label" for="customSwitch1">수정하기</label>
                          </div> -->
                          <div style="text-align: right;">
                            
                          </div>
                          <div class="mb-3" id="" style="border-top: 0px solid #C1C1C1;">
                              <div><font class="jinoFont" id="projectFont">프로젝트 : </font><input type="text" class="input-no-K" id="detail-WorkProject" class="" value="" readonly/></div>
                          </div>
                          <div class="mb-3" id="detail-WorkWorker">
                              <div class="spinner-border text-blue m-2" role="status"></div>
                          </div>
                          
                          <div class="mb-3" id="detail-WorkDate">
                                
                                <font class="jinoFont">시작일 : </font><input type="text" 
                                                class="input-K" 
                                                id="detail-WorkStart" 
                                                name="detail-WorkStart" 
                                                pattern="\d{4}-\d{2}-\d{2}"
                                                placeholder=""
                                                required
                                                th:field="*{detail-WorkStart}"
                                                value ="" 
                                                readonly
                                                onchange="settingDetailFlatPickr()"
                                                />
                                <font class="jinoFont">종료일 : </font><input type="text" 
                                                class="input-K" 
                                                id="detail-WorkEnd" 
                                                name="detail-WorkStart" 
                                                pattern="\d{4}-\d{2}-\d{2}"
                                                placeholder=""
                                                required
                                                th:field="*{detail-WorkEnd}"
                                                value ="" 
                                                readonly
                                                />
                          </div>
        
                          <div class="mb-3" id="detail-WorkPosition">
                              <div><font class="jinoFont">진행도</font> 
                                <div style="width: 70%;">
                                   <tc-range-slider
                                        value="50"
                                        step="1"
                                        slider-bg-fill="blue" 
                                        animate-onclick="1s" 
                                        generate-labels="true"
                                        generate-labels-units="%"
                                        slider-width="100%"
                                        id="slider-1">
                                    </tc-range-slider>
                                </div>
                              </div>
                          </div>
                          
                          <div class="mb-3" id="">
                              <div><font class="jinoFont">작업 여부 : </font> 
                                   <input type="text" class="input-no-K" id="detail-topWorkState" name="topWorkState" class="" value="" readonly/></div>
                          </div>
                          
                          <div id="importance-update" style="display: none;">
                          <font class="jinoFont">중요도</font> 
                            <select class="form-select jino-select" name="topWorkImportance" id="topWorkImportance" aria-label="Floating label select example">
                              <option value="0" selected>일반</option>
                              <option value="1">중요</option>
                              <option value="2">긴급</option>
                            </select>
                          </div>
                          <div class="mb-3" id="twImportance">
                          <font class="jinoFont">중요도</font> 
                              <div id="twImportanceCheckRadio" class="form-check mb-2">
                                <input type="radio" class="form-check-input" id="detail-topWorkImportance" name="" value="" checked/>
                                <label id="twImportanceLabel" class="form-check-label" for="detail-topWorkImportance">일반</label>
                              </div>
                          </div>
        
                          <div style="border-top: 0px solid #C1C1C1">
                            <font class="jinoFont">설명 : </font>
                          </div>
                          <div class="mb-3" id="quillContainer" style="height: 350px; margin-bottom: 1em; overflow: auto;">
                              <div id="contentDiv"></div>
                          </div>
                          
                          <div class="mb-3 jino-em-b" id="detail-topWork-subWorkList" style="border-top: 0px solid #c1c1c1; padding-top: 10px;">
                            <!-- 하위작업 -->
                            <button type="button" style="width: 100%;"class="btn btn-outline-primary waves-effect waves-light">하위작업들</button>
                        </div>
                          
                        </form>
                      </div><!-- 그리드 아이템1 끝 -->
                      <!-- <a href="#" onclick="window.open('https://192.168.144.32', 'pop01', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no')">화상</a> -->
                      <div class="grid-item card" style="border-bottom: 0px solid #c1c1c1;">
                          <div class="mb-3" id="detail-topWorkFile">
                              <!-- 첨부파일 -->
                              <table id="topWorkFileTable" class="jino-15">
                                    <thead>
                                        <tr>
                                            <th>관련된 파일</th>
                                            <th>타입</th>
                                        </tr>
                                    </thead>
                                    <tbody id="detail-fileTbody">
                                    </tbody>
                              </table>
                          </div>
                      </div>
                      
                      <div class="grid-item card" style="border-bottom: 0px solid #c1c1c1;">
                        <div id="selectChart" style="height:100%; width:100%">
                            <canvas id="myChart"></canvas>
                        </div>
                      </div>
                      
                      <div class="grid-item card" style="border-bottom: 0px solid #c1c1c1;">
                          <div class="mb-3" id="topWorkLogTableDiv">
                              <!-- 작업로그 -->
                              <table id="topWorkLogTable" class="jino-15">
                                    <thead>
                                        <tr>
                                            <th>로그 기록</th>
                                            <th>날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody id="detail-topWorkLog">
                                    </tbody>
                              </table>
                          </div>
                      </div>
                      
                      <div class="grid-item2 card" id="commentDiv" style="border: 0px solid gray;">
                          <div class="mb-3" id="detail-topWorkComent-insert">
                              <!-- 댓글 작성-->
                             <font class="jinoFont">댓글 작성하기</font>
                             <form action="" id="frm-workComent" style="margin-top: 10px;">
                                 <div class="input-group">
                                     <input type="text" id="comentContent" class="form-control" placeholder="내용을 입력하세요.." aria-label="Recipient's username">
                                     <button class="btn btn-lg input-group-text btn-primary waves-effect waves-light" type="submit">작성</button>
                                 </div>
                                 <input type="file" class="form-control" id="twComentFile" multiple/>
                             </form>
                          </div>
                      </div>
                      <div class="grid-item2 card" style="border-top: 1px solid #F1F1F1;">
                      <!-- 댓글 리스트 -->
                          <div class="mb-3 jino-em" id="detail-workComent">
                              <!-- 댓글 리스트-->
                              <div class="spinner-border text-blue m-2" role="status"></div>
                          </div>
                              <input type="file" id="comentFileInput" multiple onchange="fileAdd_K(this)" style="display: none;"/>
                      </div>
                  </div>
                  </div><!-- topWorkInput end -->
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 멤버체인지모달 -->
<!-- Full width modal content -->
<div id="member-change-modal" class="modal fade" tabindex="-1" role="dialog"
    aria-labelledby="fullWidthModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-full-width" style="width: 70%;">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="fullWidthModalLabel" style="font-weight: bold;">담당자 변경하기</h2>
                <button type="button" class="btn-close jino-em-b" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            
            <div class="modal-body">
                <div class="row">
                  <font class="jinoFont">새로 배정할 담당자를 선택하세요.</font>
                </div>
                <div class="row" style="margin-top: 25px;">
                    <div class="col-md-6">
                      <font class="jinoFont">멤버 리스트 : </font>
                      <div id="memberListArea" class="member-container"></div>
                    </div>
                    <div class="col-md-6">
                      <font class="jinoFont">담당자 (최대 3명) </font>
                      <div id="memberChoiceArea" class="member-container" style="margin-right: 10px;"></div>
                    </div>
                </div>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary jino-em-b"
                    data-bs-dismiss="modal"> &nbsp;취소&nbsp; </button>
                <button type="button" class="btn btn-primary jino-em-b" onclick="saveWorkerList()">담당자 변경하기</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 하위작업 담당자교체 모달 -->
<!-- Full width modal content -->
<div id="subwork-change-modal" class="modal fade" tabindex="-1" role="dialog"
    aria-labelledby="fullWidthModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-full-width" style="width: 70%;">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="fullWidthModalLabel" style="font-weight: bold;">하위작업 담당자 변경하기</h2>
                <button type="button" class="btn-close jino-em-b" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            
            <div class="modal-body">
                <div class="row">
                  <font class="jinoFont">새로 작업을 배정할 담당자를 선택하세요.</font>
                </div>
                <div class="row" style="margin-top: 25px;">
                    <div class="col-md-3" style="margin-top: 60px;">
                      <font class="jinoFont" style="margin-left: 10px;">하위작업 리스트 </font>
                      <div id="subWorkListArea" class="subWork-container subwork-container" style="margin-top: 30px;"></div>
                    </div>
                    <div class="col-md-9">
                      <font class="jinoFont">담당자 </font>
                      <div id="subWorkMemberArea" class="subWork-member-container" style="display: flex;"></div>
                    </div>
                </div>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary jino-em-b"
                    data-bs-dismiss="modal" id="sub-member-change-cancel-btn"> &nbsp;닫기&nbsp; </button>
                <button type="button" onclick="setChangeMember()" class="btn btn-primary jino-em-b"
                    data-bs-dismiss="">저장하기</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 프로젝트 종료 모달 -->
<div id="project-finish-modal" class="modal fade" tabindex="-1" role="dialog"
    aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-full-width" style="width: 50%;">
        <div class="modal-content">
            <div class="modal-header" style="background: #338CD4;">
                <h4 class="modal-title" id="standard-modalLabel"><font class="jinoFont" style="color:white">프로젝트 평가하기</font></h4>
                <button type="button" class="btn-close btn-close-white jino-em-b" data-bs-dismiss="modal"
                    aria-label="Close" onclick="finishModalToggle()"></button>
            </div>
            <div class="modal-body" style="background-color: #f1f1f1;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row card project-complete" style="padding: 10px;"><font class="jinoFont">종료 이유를 선택하세요.</font>
                            <select class="form-select jino-select" id="project-finish-reason" style="margin-top: 10px;">
                                <option>프로젝트 완료</option>
                                <option>프로젝트 기간 종료</option>
                                <option>프로젝트 취소</option>
                                <option>기타</option>
                            </select>
                        </div>
                        <div class="row card project-complete" id="projectResult">목표 달성률
                            <div>총 작업</div>
                            <div>완료된 작업</div>
                            <div>달성률</div>
                        </div> <!-- 자동 입력 -->
                    </div>
                    <div class="col-md-6" style="padding-right: 20px;">
                      <div class="card">
                         <div style="height: 87px;">
                           <img class="icon-colored" style="height: 42px;" alt src="/assets/images/icons/overtime.svg" title="overtime.svg">
                           <font class='jinoFont' id="completeProjectPeriod">프로젝트 기간 : </font>
                         </div>
                      </div>
                      <div class="card" id="completeRatioChart" style="width: 100%; height: 300px;">완료율 차트</div>
                    </div>
                    
                </div><!-- end row -->
                <div class="row card project-complete" style="padding: 10px;">
                    <div class="row">
                         <div style="margin-bottom: 10px;"><font class="jinoFont">참여 멤버 평가</font></div>
                         <div class="row" id="memberRating" style="height: 200px; overflow: auto;">
                         
                             <div class="col-md-6">아이디</div>
                             <div class="col-md-6">
                               <select class="form-select jino-select">
                                 <option value="5">⭐⭐⭐⭐⭐</option>
                                 <option value="4">⭐⭐⭐⭐</option>
                                 <option value="3">⭐⭐⭐</option>
                                 <option value="2">⭐⭐</option>
                                 <option value="1">⭐</option>
                               </select>
                             </div>
                         </div>
                     </div>
                </div>
                
                <div class="modal-footer" style="padding: 0px;">
                    <button class="btn btn-primary width-lg waves-effect waves-light jino-em-b" onclick="finishProjectUpdate()">종결</button>
                    <button class="btn btn-danger width-lg waves-effect waves-light jino-em-b" onclick="finishModalToggle()">취소</button>
                </div>
          </div><!-- modal-body -->  
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<button type="button" id="btnTopWorkModal" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#topWork-detail-modal" style="display: none;">topWorkModal</button>
<button type="button" id="btnSubWorkModal" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#subWork-detail-modal" style="display: none;">subWorkModal</button>
<button type="button" id="btnMemberChangeModal" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#member-change-modal" style="display: none;">Full width Modal</button>
<button type="button" id="btnSubWorkChangeModal" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#subwork-change-modal" style="display: none;">Full width Modal</button>
<button type="button" id="btnProjectFinishModal" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#project-finish-modal" style="display: none;">Full width Modal</button>
<!-- tippy 차트용 -->
<div id="tippyContainer">
  <div id="tippyChart" style="display: none;"><div class="spinner-border text-primary m-2" role="status"></div></div>
</div>

<!-- 구글 -->
<script  src="https://apis.google.com/js/api.js" onload="gapiLoaded()"></script>
<script  src="https://accounts.google.com/gsi/client" onload="gisLoaded()"></script>

<!-- 드래그 --><!-- 겹침 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>

<!-- 차트js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<!-- 풀캘린더 --><!-- 겹침 -->
<!-- fullcalendar 언어 CDN --><!-- 겹침 -->
<!-- 풀캘린더 데이트 포맷 --><!-- 겹침 -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script> 

<script src="https://cdn.jsdelivr.net/npm/toolcool-range-slider/dist/plugins/tcrs-generated-labels.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/toolcool-range-slider/dist/plugins/tcrs-binding-labels.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/toolcool-range-slider/dist/toolcool-range-slider.min.js"></script>
<!-- 스크롤리 -->
<script src="https://cdn.jsdelivr.net/npm/seamless-scroll-polyfill@latest/lib/bundle.min.js"></script>

<!-- select2 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> -->
<script>

const URLSearch = new URLSearchParams(location.search);
var proNo = "";
var currentTap_PH_K = "";
//피커 기간설정용 전역변수
//changeTitle()에서 설정된다.
var currentProStartDay = "";
var currentProEndDay = "";
var beforeCategory = "";
var mode = "";
var COLORS = {};
COLORS.LIGHT = "#ECF2F5";
COLORS.PRIMARY = "#338CD4";
COLORS.SUCCESS = "#78C350";
COLORS.INFO = "#45BBE0";
COLORS.WARNING = "#FF9800";
COLORS.DANGER = "#F7531E";
COLORS.DARK = "#333A46";
COLORS.PURPLE = "#8892D6";
COLORS.PINK = "#F06292";
COLORS.SECONDARY = "#6C757D";

changeTitle(); //여기서 프로젝트 번호, 기간 들어감
pageTap('home');
checkAuth();
//타임아웃 안걸면 너무 빨리 실행돼서 마큐를 못찾음
setTimeout(checkProjectFinish, 100);


function getAuth() {
    const map = {
      memberId,
      proNo,
    };
    
    axios
      .post("/projoin/checkAuth", map)
      .then((res) => {
         ////console.log("권한 : ", res);
         return res.data;
      });
}

function checkAuth(arg) {
    //해당 멤버가 그 프로젝트의 팀장 or 리더가 아니면
    //파일 첨부와 수정, 삭제, 승인, 반려 버튼 숨기기
    //칸반보드의 카테고리 +와 작업 +버튼 숨기기
    const map = {
      memberId,
      proNo,
    };
    
    axios
      .post("/projoin/checkAuth", map)
      .then((res) => {
         ////console.log("권한 : ", res);
         const proJSVO = res.data;
         
         //3이면 숨기지만 하위작업일 경우엔 보여줘야함
         if (proJSVO.proAuth == "3") {
             const authElements = document.querySelectorAll(".auth-pmpl");
             authElements.forEach(authElement => {
                 ////console.log("숨겨야할 버튼들 : ", authElement);
                 authElement.style.display = "none";
             });
         } else {
             
         }
         
      });
}

function renderGantt() {
    // 간트 그리드(시트) 에 출력할 칼럼 필드 들 작성함.
    // 아래는 기본값으로 위치 또는 임의 작성으로 개발자는 작성 가능합니다.
    var myColumnLayout = [
            //AUIGantt.defaultColumnInfo.index, // 기본 정보 필드
            AUIGantt.defaultColumnInfo.name, // 작업 이름 필드
            //AUIGantt.defaultColumnInfo.period, // 기간 필드
            AUIGantt.defaultColumnInfo.start, // 작업 시작 날짜 필드
            AUIGantt.defaultColumnInfo.end, // 작업 종료 날짜 필드
            //AUIGantt.defaultColumnInfo.predecessor, // 선행 관계 필드
            //AUIGantt.defaultColumnInfo.resource, // 자원 필드
            AUIGantt.defaultColumnInfo.progress,// 진행률 필드
            //AUIGantt.defaultColumnInfo.startActual,
            //AUIGantt.defaultColumnInfo.endActual,
    ];
    //맨 앞 요소로 작업번호 추가
    myColumnLayout.splice(0, 0, {
        headerText: "작업번호",
        dataField: "workNo",
        dataType: "numeric",
        width: 70,
    });
    
    var ganttProps = {
               // 편집 가능 여부
               editable : false,
               // 인덱스 1에 트리 칼럼을 만듬. 즉, 설정한 columnLayout 기준임.
               treeColumnIndex: 0,
               rowHeight: 40,
               headerHeight: 60,
               showAutoNoDataMessage: true,
               tooltipSensitivity : 0,
               showTooltip: true,
               showTooltipHeader : true,
               showRowNumColumn: true,
               showProjectStartLine: true,
               showProjectEndLine: true,
               // 간트 그리드(시트) 레이아웃 (필수 정의해야 함)
               columnLayout : myColumnLayout,
    };
    
    // 실제로 #gantt_wrap 에 간트차트 생성
    document.querySelector("#gantt_wrap").innerHTML = "";
    AUIGantt.destroy();
    
    myGanttID = AUIGantt.create("#gantt_wrap", ganttProps);
    //여기서 색상 지정!
    AUIGantt.bind(myGanttID, "ready", function(event) {
        // 처음에 rowIndex 0, columnIndex 1 에 엑셀처럼 선택자 만들기.
        ////console.log("이거모냐 : ", myGanttID);
        AUIGantt.setChartStyles(myGanttID, {
            "headerBgColors":["#F8F8F8","#EEEEEE"],
            "headerLineColor":"#BDBDBD",
            "headerMajorFont":"bold 15px 맑은 고딕",
            "headerMinorFont":"normal 15px 맑은 고딕",
            "headerMajorColor":"#000000","headerMinorColor":"#000000",
            "headerSatColor":"#0000FF",
            "headerSunColor":"#FF0000",
            "headerUserColor":"#FF0000",
            "rowBgColors":["#FAFAFA","#FFFFFF"],
            "verticalLineColor":"#DCDCDC",
            "horizontalLineColor":"#DCDCDC",
            "holidayBgColor":"rgba(200,200,200, 0.25)",
            "branchBgColor":"#555555",
            "branchBgFont":"15px",
            "branchProgressColor":"#008299",
            "taskBgColor":"#B2CCFF",
            "taskProgressColor":"#6A84B7",
            "taskBaselineColor":"#F29661",
            "milestoneBgColor":"#0B7903",
            "connectorColor":"#4374D9",
            "projectStartLineColor":"#008299",
            "projectEndLineColor":"#008299",
            "todayLineColor":"#FF5E00",
            "projectStartLineWidth":1,
            "projectEndLineWidth":1,
            "todayLineWidth":2,
            "font":"bold 15px 맑은 고딕",
            "color":"#222",
            "leftColor":"#222",
            "branchBaselineColor":"#F29661",
            "milestoneBaselineColor":"#F29661",
            "barLabelFont":"bold 15px 맑은 고딕",
            "barLabelFontColor":"#222222",
            "barLabelLeftFontColor":"#222222",
            "textPadding":10,
            "textTopPadding":0
        });
    });
    AUIGantt.createNewDocument(myGanttID, 100);
    // 간트차트에 새 문서 작성하기를 초기화면으로 지정
    
    //초기에 좌측 사이즈 비율
    AUIGantt.setSplitterSize(myGanttID, "40%");
    getGanttData();
    
    //클릭시 이벤트
    /* 
    AUIGantt.bind(myGanttID, "cellClick", function( event ) {
          //alert("rowIndex : " + event.rowIndex);
          ////console.log(event.item.workNo);
          ////console.log(event);
          ////console.log(AUIGantt.getSelectedItems(myGanttID));
          //이거다.
          AUIGantt.setChartStyles(myGanttID, {
              "taskBgColor": event.item.twCategoryColor,
          });
          
          ////console.log("선택 행 : ", AUIGantt.getSelectedItems(myGanttID));
          
          var uuid = AUIGantt.getRowIdByTaskNo(myGanttID, 1);
          //console.log(uuid);
          AUIGantt.updateRowsById(myGanttID, {
                "uuid" : uuid,
                "color" : "red",
          });
          
          const workNo = event.item.workNo;
          
          if (workNo.split("-")[0] == "S") {
              //console.log("이건하위작업입니다.");
              return;
          }
          
          //detailTopWork_K(workNo);
    });
    
    AUIGantt.bind(myGanttID, "cellDoubleClick", function( event ) {
          //alert("rowIndex : " + event.rowIndex);
          ////console.log(event);
        AUIGantt.getSelectedItems(myGanttID);
    });
     */
}

function getGanttData() {
    axios
      .post(`/kanban/list?proNo=\${proNo}&mode=project`)
      .then((res) => {
          ////console.log(res.data);
          const workList = res.data;
          
          for (work of workList) {
              work.id = "T" + work.topWorkNo;
              work.topWorkStart = work.topWorkStart.split("T")[0];
              work.topWorkEnd = work.topWorkEnd.split("T")[0];
          }
          
          //하위작업 => parent 계층구조만들기
          //일단 해당 프로젝트의 하위작업 전부 가져오기
          const proVO = {
            proNo,    
          };
          
          axios
            .post("/subWork/selectAllSubWork", proVO)
            .then((res) => {
                const subWorkList = res.data;
                ////console.log("subWorkList", subWorkList);
                //포맷맞추기
                for (subWork of subWorkList) {
                    subWork.id = "S" + subWork.subWorkNo;
                    subWork.parent = "T" + subWork.topWorkNo;
                    subWork.topWorkNo = "S-" + subWork.subWorkNo;
                    subWork.topWorkStart = subWork.subWorkStart.split("T")[0];
                    subWork.topWorkEnd = subWork.subWorkEnd.split("T")[0];
                    //subWork.subWorkStart = subWork.subWorkStart.split("T")[0];
                    //subWork.subWorkEnd = subWork.subWorkEnd.split("T")[0];
                    subWork.topWorkTitle = subWork.subWorkTitle
                    workList.push(subWork);
                    ////console.log("subWork", subWork);
                }
                
                //한번만 넣을 수 있음. 데이터 가공 다 해야함.
                ////console.log(workList);
                setData2Gantt(workList);
                //setData2Gantt(subWorkList);
            });
          
      });
}

function setData2Gantt(orgData) {
    // 기본 필드에 해당되는 필드 매핑 처리
    var fieldMap = {
            workNo : "topWorkNo", // 인덱스
            name : "topWorkTitle", // 작업 이름 필드
            //period : null, // 기간 필드
            start : "topWorkStart", // 작업 시작 날짜 필드
            end : "topWorkEnd", // 작업 종료 날짜 필드
            //predecessor : null, // 선행 관계 필드
            //resource : null, // 자원 필드
            progress : "topWorkProgress", // 진행률 필드
            twCategoryColor: "twCategoryColor",
            //startActual: "subWorkStart",
            //endActual: "subWorkEnd",
    };
    
    
    //id와 parent로 계층형 구조 실현
    var gData = AUIGantt.utils.converter(orgData, fieldMap, "id", "parent"); 
    AUIGantt.setGanttData(myGanttID, gData);
};

//엑셀로 저장
function saveToExcel() {
    var exportProps = {
        timeLabelWidth : 30, // 타임 1유닛의 크기
        includeGantt : true  // 간트 차트 엑셀 포함 여부
    };
    
    AUIGantt.exportToXlsx(myGanttID, exportProps);
};

function pageTap(arg) {
    //칸반 관련 메뉴는 칸반 들어가야만 보이도록 설정
    ////console.log(arg);
    document.querySelector(".spa").style.display = "block";
    
    if (currentTap_PH_K == "gantt") {
      document.querySelector(".gantt").style.display = "none";
      AUIGantt.destroy();
    }
    
    if (arg == "kanban") {
        currentTap_PH_K = "kanban";
        kanbanRender('project');
        //$(".spa").load("/project/kanban_spa");
        
        $("#event-worker").select2({
            placeholder: '작업 담당자를 지정하세요.',
            dropdownParent: $('#event-modal'),
            allowClear: true,
            maximumSelectionLength: 3,
        });
        
        
        //$("#event-worker").val([]).trigger('change');
    }
    
    if (arg == "home") {
        currentTap_PH_K = "home";
        $(".spa").load("/project/home_spa");
    }
    
    if (arg == "calendar") {
        currentTap_PH_K = "calendar";
        $(".spa").load("/project/calendar_spa"); //spa 클래스에 jsp를 로드해준다!
    }
    
    if (arg == "dataRoom") {
        currentTap_PH_K = "dataRoom";
        $(".spa").load("/project/dataRoom_spa"); //spa 클래스에 jsp를 로드해준다!
    }
    
    if (arg == "gdocs") {
        currentTap_PH_K = "gdocs";
        $(".spa").load("/project/gdocs_spa"); 
    }
    if (arg == "projectNotice") {
        currentTap_PH_K = "projectNotice";
        $(".spa").load("/project/projectNotice_spa"); //spa 클래스에 jsp를 로드해준다!
    }
    
    if (arg == "gantt") {
        //안쓰니까 일단 비우게
        ////console.log(document.querySelector(".spa"));
        currentTap_PH_K = "gantt";
        document.querySelector(".spa").style.display = "none";
        document.querySelector(".gantt").style.display = "block";
        renderGantt();
    }
}

function completeWork() {
    ////console.log("작업완료승인");
    const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    const topWorkVO = {
      topWorkNo,        
    };
    
    axios
      .post("/kanban/topWorkComplete", topWorkVO)
      .then((res) => {
         const topWorkNo = res.data;
         Swal.fire({
             icon: 'success',
             title: '작업 승인',
             text: '해당 작업을 승인 / 완료 처리하였습니다.',
           });
         
         makeWorkAlarm('Complete');
         //여기서 이상함
         detailTopWork_K(topWorkNo);
      });
}

function rejectWork() {
    ////console.log("작업완료거부");
    const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    const topWorkVO = {
      topWorkNo,        
    };
    axios
      .post("/kanban/topWorkReject", topWorkVO)
      .then((res) => {
          const topWorkNo = res.data;
          //반려
          Swal.fire({
               icon: 'success',
               title: '작업 반려',
               text: '해당 작업을 반려 / 보완요청 처리하였습니다.',
             });
          
          makeWorkAlarm('Reject');
          
          //여기서 데이터테이블에 뭔가 에러가 남
          detailTopWork_K(topWorkNo);
          
      });
}

function renderWorkFileList() {
    const mode = document.querySelector("#hidden-workMode").value;
    const workVO = {};
    let workFileURL;
    
    if (mode == "TopWork" || mode == "TopWorkComent") {
        workVO.topWorkNo = document.querySelector("#hidden-topWorkNo").value;
        workFileURL = "/fileListOnlyTopWork";
        
    } else {
        workVO.subWorkNo = document.querySelector("#hidden-subWorkNo").value;
        workFileURL = "/fileListOnlySubWork";
    }
    
    axios
      .post(workFileURL, workVO)
      .then((res) => {
         const fileList = res.data;
         
         if (fileList.length > 0) {
           document.querySelector("#btnWorkFileList").innerHTML = `첨부된 파일 : \${fileList.length}개`;   
         } else {
           document.querySelector("#btnWorkFileList").innerHTML = `첨부된 파일 : 0개`;
         }
         
         
      });
}

function showFileList(arg) {
    //파일리스트를 펼친 채로 수정버튼을 누를 경우
    if (arg == "updateMode2") {
        ////console.log("모드2임");
        let workFileList = document.querySelectorAll(".fileList");
        workFileList.forEach(fileList => {
            fileList.style.display = "";
        });
        return;
    }
    //이미 펼쳐져있으면 다시 접고 리턴
    const divText = document.querySelector("#workFileListDiv").innerHTML;
    
    if (divText != "") {
        document.querySelector("#workFileListDiv").innerHTML = "";
        return;
    }
    ///////////////////////////////
    
    //workFileListDiv
    const mode = document.querySelector("#hidden-workMode").value;
    const workVO = {};
    ////console.log("쇼 모드 : ", mode);
    
    if (mode == "TopWork" || mode == "TopWorkComent") {
        workVO.topWorkNo = document.querySelector("#hidden-topWorkNo").value;
        workFileURL = "/fileListOnlyTopWork";
        
    } else {
        workVO.subWorkNo = document.querySelector("#hidden-subWorkNo").value;
        workFileURL = "/fileListOnlySubWork";
    }
    
    axios
    .post(workFileURL, workVO)
    .then((res) => {
       const fileList = res.data;
       
       if (fileList.length == 0) {
           return;
       }
       
       let text = ``;
       
       for (fileVO of fileList) {
           text += `<div style="display: inline">`;
           text += ` <a href="/resources/upload/\${fileVO.filePath}" class="badge badge-soft-secondary fileLNo2-\${fileVO.fileLNo2}" download="\${fileVO.fileRealName.split('.')[0]}"><i class="mdi mdi-file-document-outline mdi-18px"></i> \${fileVO.fileRealName}</a>`;
           text += `<i onclick="fileListDelete(this)" class="mdi mdi-close fileList" style="display: none;"></i> `;
           text += `</div>`;
       }
       
       ////console.log("리스트 추가할 파일들 : ", text);
       document.querySelector("#workFileListDiv").innerHTML = text;
       const workFileList = document.querySelectorAll(".fileList");
       
       if (arg == "updateMode") {
         ////console.log("workFileList", workFileList);
         workFileList.forEach(workFile => {
             workFile.style.display = "";
         });
         
       }
       
       if (arg == "updateComplete") {
         workFileList.forEach(workFile => {
             workFile.style.display = "none";
         });
         
       }
    });
}

//김진호
//본문 첨부파일 삭제누를시
function fileListDelete(arg) {
    //console.dir(arg.parentElement.children[0]);
    //const targetFileNo = arg.parentElement.children[0].classList[2].split("-")[1];
    ////console.log("targetFileNo", targetFileNo);
    //색깔 바꾸기
    const targetFile = arg.parentElement.children[0];
    const flag = arg.parentElement.children[0].classList[1];
    
    //만약 삭제체크했다가 다시누르면
    if (flag == "badge-soft-danger") {
        targetFile.classList.replace("badge-soft-danger", "badge-soft-secondary");
        targetFile.classList.remove("deleteFileList");
        
        return;
    }
    
    targetFile.classList.replace("badge-soft-secondary", "badge-soft-danger");
    targetFile.classList.add("deleteFileList");
}
//김진호
//파일 추가 버튼 클릭시
function btnFileAdd_K() {
    document.querySelector("#fileInput_K").click();
}
//김진호
//파일 선택시
//상위에서 파일추가 후 하위 이동해서 다시 파일추가 -> 함수 실행안됨
function fileAdd_K(fileData, state, comentNo) {
    let mode = document.querySelector("#hidden-workMode").value;
    let twCategoryNo = document.querySelector("#hidden-categoryNo").value;
    let twCategoryName = document.querySelector("#hidden-categoryName").value;
    let topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    let topWorkTitle = document.querySelector("#detail-WorkTitle").value;
    
    if (!state) {
        //state가 null일땐 댓글에서 파일 추가할 경우
        comentNo = document.querySelector("#hidden-topWorkComentNo").value;
        
        if (comentNo) { //코멘트 번호가 있을 때
            state = "TopWorkComent";
        }
        
        let subWorkComentClass = document.querySelector("#hidden-subWorkComentNo").classList;
        if (subWorkComentClass.length > 0) {
            state = "SubWorkComent";
            comentNo = document.querySelector("#hidden-subWorkComentNo").value; 
        }
    }
    
    const workVO = {
      proNo,
      twCategoryNo,
      twCategoryName,
      topWorkNo,
      topWorkTitle,
    };
    
    if (state == "TopWorkComent" && comentNo != null) {
        //console.log("코멘트맞음");
        mode = state;
        //console.log("최종 mode : ", mode);
    } 
    
    if (state == "SubWorkComent" && comentNo != null) {
        mode = state;
        //console.log("최종 mode : ", mode);
    }
    
    if (mode == "SubWork" || mode == "SubWorkComent") {
        workVO.subWorkNo = document.querySelector("#hidden-subWorkNo").value;
    }
    
    //console.dir(fileData.files[0]);
    //추가된 파일 배열
    const fileList = fileData.files;
    const formData_K = new FormData();
    
    for(var i = 0; i < fileList.length; i++){
        formData_K.append("uploadFile", fileList[i]);   
    }
    
    const jsonObj = {
        projectId: proNo, 
        categoryName :twCategoryName,
        topWorkTitle : topWorkTitle,
        twCategoryNo : twCategoryNo,
        topWorkNo : topWorkNo,
        mode: mode,
        comentNo: comentNo,
        uploader: memberId,
    };
    
    if (mode == "SubWork" || mode == "SubWorkComent") {
        jsonObj.subWorkNo = document.querySelector("#hidden-subWorkNo").value;
    }
    
    let jsonData = JSON.stringify(jsonObj);
    
    formData_K.append("jsonData", jsonData);

    $.ajax({
        url : '/uploadAjaxAction',
        processData : false,
        contentType : false,
        data : formData_K,
        type : 'POST',
        dataType : 'json',
        success : function(result){
            //인풋 비워주기
            fileData.value = "";
            document.querySelector("#hidden-topWorkComentNo").value = "";
            document.querySelector("#hidden-subWorkComentNo").value = "";

            if (mode == "TopWork" || mode == "TopWorkComent") {
                //console.log("탑으로간다");
                detailTopWork_K(topWorkNo);
            } else {
                //console.log("서브로간다");
                detailTopWork_K(topWorkNo, workVO.subWorkNo);
            }
            //클래스 지워주기
            document.querySelector("#hidden-subWorkComentNo").classList.remove("hidden-SubWorkComent");
        }
    }); 
    
}

//테이블 파일 삭제 함수
function fileTableDelete(arg) {
    ////console.log(arg.parentElement.children[0].classList[2].split("-")[1]);
    const fileLNo2 = arg.parentElement.children[0].classList[2].split("-")[1];
    const fileRow = arg.parentElement.children[0];
    
    fileRow.classList.replace("badge-soft-secondary", "badge-soft-danger");
    fileRow.classList.add("deletFileRow")
}
//김진호
//댓글 파일 삭제하기 함수
function comentFileDelete(fileLNo2, mode) {
    const iTargets = document.querySelectorAll(".i-" + fileLNo2);
    iTargets.forEach((iTarget) => {
        iTarget.style.display = "none";
    });
    
    //파일 삭제됐으면 x표아이콘 지워주기
    if (mode == "SubWorkComent") {
        document.querySelector(".itag-S" + fileLNo2).remove();
    } else {
        document.querySelector(".itag-T" + fileLNo2).remove();
    }
    
    ////console.log(fileLNo2); 삭제할 파일 번호(Isdelete 업데이트)
    const fileVO = {
        fileLNo2,
    };
    
    axios
      .post("/fileDelete",fileVO)
      .then((res) => {
          let topWorkNo = document.querySelector("#hidden-topWorkNo").value;
          let subWorkNo = document.querySelector("#hidden-subWorkNo").value;
          
      });
}
//김진호
//댓글에서 파일 추가하기
function btnComentFileAdd(comentNo, workNo, mode) {
    if (mode == "TopWorkComent") {
        document.querySelector("#hidden-topWorkComentNo").value = comentNo;
    } else {
        document.querySelector("#hidden-subWorkComentNo").value = comentNo;
        //하위작업 댓글에서 한 경우엔 #hidden-subWorkComentNo에 클래스 하나 추가한다.
        document.querySelector("#hidden-subWorkComentNo").classList.add("hidden-SubWorkComent");
    }
    
    document.querySelector("#comentFileInput").click();
}

//김진호
//작업 생성시 작업자에게 알람 보내주는 함수
function makeWorkAlarm(mode) {
    const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    const workers = document.querySelectorAll(".worker-list");
    
    workers.forEach(worker => {
        const inData = {
          proNo,
          topWorkNo
        };
        
        let ment = '';
        
        if (mode == 'TopWork') ment = 'TopWorkComentAlarm';
        if (mode == 'Complete') ment = 'WorkRecognizeAlarm';
        if (mode == 'Reject') ment = 'WorkRecognizeReferAlarm';
        if (mode == 'SubWork') {
            ment = 'SubWorkComentAlarm';
        }
        
        updateAlarm(memberId, ment, worker.classList[1], inData);
    });
    
}
//김진호
//댓글 입력
var frmWorkComent = document.querySelector("#frm-workComent");
frmWorkComent.addEventListener("submit", (event) => {
    event.preventDefault();
    const mode = document.querySelector("#hidden-workMode").value;
    
    const workComentVO = {};
    workComentVO.memberId = memberId;
    
    if (mode == "TopWork") {
        workComentVO.topWorkNo = document.querySelector("#hidden-topWorkNo").value;
        workComentVO.twComentContent = document.querySelector("#comentContent").value;
        //댓글
        makeWorkAlarm('TopWork');
    }  else {
        workComentVO.subWorkNo = document.querySelector("#hidden-subWorkNo").value;
        workComentVO.topWorkNo = document.querySelector("#hidden-topWorkNo").value;
        workComentVO.swComentContent = document.querySelector("#comentContent").value;
        //댓글
        makeWorkAlarm('SubWork');
    }
    //console.log("보낼 객체 : ", workComentVO);
    let comentInsertURL = (mode == "TopWork") ? "/kanban/topWorkComentInsert" : "/subWork/subWorkComentInsert";
    axios
      .post(comentInsertURL, workComentVO)
      .then((res) => {
         ////console.log("댓글 작성 후 ", res.data);
         comentNo = res.data;
         document.querySelector("#comentContent").value = "";
         //일단 여기 위까지 댓글분류(상위,하위) 완료
         //twComentFile -> comentFile로 이름 변경 X. 이미 다양한 곳에서 사용중...
         //console.log("댓글작성시 인풋파일길이 : ", document.querySelector("#twComentFile").files.length);
         let inputFile = document.querySelector("#twComentFile");
         if (inputFile.files.length > 0) {
             //console.log("inputFile", inputFile);
             console.dir(inputFile);
             let state = (mode == "TopWork") ? "TopWorkComent" : "SubWorkComent";
             //파일 업로드 전송
             fileAdd_K(inputFile, state, comentNo);
             //초기화
             document.querySelector("#twComentFile").value = "";
         }
         let topWorkNo = document.querySelector("#hidden-topWorkNo").value;
         let subWorkNo = document.querySelector("#hidden-subWorkNo").value;
         
         if (mode == "TopWork") {
             detailTopWork_K(topWorkNo);
         } else {
             detailTopWork_K(topWorkNo, subWorkNo);
         }
         
      });
});
//김진호
//상위작업 댓글 삭제 (상태값 변경)
//파라미터 - 상위작업댓글번호, 상위작업번호
function twComentDelete(twComentNo, topWorkNo) {
    ////console.log(twComentNo);
    const twComentVO = {
      twComentNo,
    };
    
    axios
      .post("/kanban/topWorkComentDelete", twComentVO)
      .then((res) => {
        ////console.log(res);
        detailTopWork_K(topWorkNo);
      });
}
//김진호
//하위작업 댓글 삭제 (상태값 변경)
//파라미터 - 하위작업댓글번호, 하위작업번호
function swComentDelete(swComentNo, subWorkNo) {
    ////console.log(twComentNo);
    const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    const swComentVO = {
      swComentNo,
    };
    
    axios
      .post("/subWork/subWorkComentDelete", swComentVO)
      .then((res) => {
        detailTopWork_K(topWorkNo, subWorkNo);
      });
}
//김진호
//상위작업 댓글 수정
function twComentUpdate(twComentNo, topWorkNo) {
    //상위작업 댓글
    //첨부파일 x버튼 활성화
    const iTargets = document.querySelectorAll(".ix");
    const twComentInput = document.querySelector("#twComentInput-" + twComentNo);
    //console.log(twComentInput);
    if (twComentInput.readOnly) {
        twComentInput.className = "twComent-update";
        twComentInput.readOnly = false;
        iTargets.forEach(iTarget => {
            //console.log("몇명이나 되냐");
            iTarget.style.display = "";
        });
    } else {
        iTargets.forEach(iTarget => {
            iTarget.style.display = "none";
        });
        //여기서 컨트롤러 보내야함
        twComentInput.className = "twComent";
        twComentInput.readOnly = true;
        const twComentContent = twComentInput.value;
        const twComentVO = {
          twComentNo,
          topWorkNo,
          twComentContent,
        };
        //console.log(twComentVO);
        axios
          .post("/kanban/topWorkComentUpdate", twComentVO)
          .then((res) => {
             //console.log(res); 
          });
    }
    
}
//김진호
//하위작업 댓글 수정
function swComentUpdate(swComentNo, subWorkNo) {
    //하위작업 댓글
    //첨부파일 x버튼 활성화
    const iTargets = document.querySelectorAll(".ix");
    const swComentInput = document.querySelector("#swComentInput-" + swComentNo);
    //console.log(swComentInput);
    if (swComentInput.readOnly) {
        swComentInput.className = "swComent-update";
        swComentInput.readOnly = false;
        
        iTargets.forEach(iTarget => {
            iTarget.style.display = "";
        });
        
    } else {
        iTargets.forEach(iTarget => {
            iTarget.style.display = "none";
        });
        
        //여기서 컨트롤러 보내야함
        swComentInput.className = "swComent";
        swComentInput.readOnly = true;
        const swComentContent = swComentInput.value;
        const swComentVO = {
          swComentNo,
          subWorkNo,
          swComentContent,
        };
        axios
          .post("/subWork/subWorkComentUpdate", swComentVO)
          .then((res) => {
          });
    }
    
}
//김진호
//상위작업 댓글 펼치기(페이징)
function twComentAddList(topWorkNo, subWorkNo) {
    let detailMode = "TopWork";
    if (subWorkNo != null) {
        detailMode = "SubWork";
    }
    
    const workVO = {};
    let comentURL;
    
    if (detailMode == "TopWork") {
        workVO.topWorkNo = topWorkNo;
        comentURL = "/kanban/topWorkComentList";
    } else {
        workVO.topWorkNo = topWorkNo;
        workVO.subWorkNo = subWorkNo;
        comentURL = "/subWork/subWorkComentList";
    }
    
    axios
      .post(comentURL, workVO)
      .then((res) => {
          const workComentList = document.querySelector("#detail-workComent");
          const comentList = res.data;
          let comentText = ``;
          if (comentList.length < 1) {
              comentText = '작성된 댓글이 없습니다.';
          } else {
              for (let i = 0; i < comentList.length; i++) { 
                  let comentMap = {};
                  
                  if (detailMode == "TopWork") {
                      comentMap.key = "T"
                      comentMap.comentNo = comentList[i].twComentNo;
                  } else {
                      comentMap.key = "S"
                      comentMap.comentNo = comentList[i].swComentNo;
                  }
                  
                  let coment = comentList[i];
                  if (detailMode == "TopWork") {
                      comentText += `<div class="border border-0 p-2 mb-3">`;
                      comentText += `    <div class="d-flex align-items-start">`;
                      comentText += `        <img class="me-2 avatar-sm rounded-circle" src="${pageContext.request.contextPath }/resources/dist/assets/images/users/blank_progile.png" alt="Generic placeholder image">`;
                      comentText += `        <div class="w-100">`;
                      comentText += `            <h5 class="m-0">\${coment.memberId}</h5>`;
                      comentText += `            <p class="text-muted"><small>\${coment.twComentDate}</small></p>`;
                      comentText += `        </div>`;
                      comentText += `    </div>`;
                      comentText += `    <p><input type="text" class="twComent form-control" id="twComentInput-\${coment.twComentNo}" value="\${coment.twComentContent}" readonly/></p>`;
                      comentText += `    <div class="mt-2 comentFile c\${coment.twComentNo}"></div>`;
                      comentText += `    <div class="mt-2">`;
                      comentText += `        <a href="javascript: void(0);" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-heart-outline"></i> Like</a>`;
                      comentText += `        <a href="javascript: twComentUpdate('\${coment.twComentNo}','\${coment.topWorkNo}');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-file-document-edit"></i> 편집</a>`;
                      comentText += `        <a href="javascript: twComentDelete('\${coment.twComentNo}', '\${coment.topWorkNo}');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-delete"></i> 삭제</a>`;
                      comentText += `        <a href="javascript: btnComentFileAdd('\${coment.twComentNo}', '\${coment.topWorkNo}', 'TopWorkComent');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-file-plus-outline"></i> 파일 추가</a>`;
                      comentText += `    </div>`;
                      comentText += `</div>`;
                  } else {
                      //하위작업 댓글인 경우
                      comentText += `<div class="border border-0 p-2 mb-3">`;
                      comentText += `    <div class="d-flex align-items-start">`;
                      comentText += `        <img class="me-2 avatar-sm rounded-circle" src="${pageContext.request.contextPath }/resources/dist/assets/images/users/blank_progile.png" alt="Generic placeholder image">`;
                      comentText += `        <div class="w-100">`;
                      comentText += `            <h5 class="m-0">\${coment.memberId}</h5>`;
                      comentText += `            <p class="text-muted"><small>\${coment.swComentDate}</small></p>`;
                      comentText += `        </div>`;
                      comentText += `    </div>`;
                      comentText += `    <p><input type="text" class="twComent form-control" id="swComentInput-\${coment.swComentNo}" value="\${coment.swComentContent}" readonly/></p>`;
                      comentText += `    <div class="mt-2 comentFile c\${coment.swComentNo}"></div>`;
                      comentText += `    <div class="mt-2">`;
                      comentText += `        <a href="javascript: void(0);" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-heart-outline"></i> Like</a>`;
                      comentText += `        <a href="javascript: swComentUpdate('\${coment.swComentNo}','\${coment.subWorkNo}');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-file-document-edit"></i> 편집</a>`;
                      comentText += `        <a href="javascript: swComentDelete('\${coment.swComentNo}', '\${coment.subWorkNo}');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-delete"></i> 삭제</a>`;
                      comentText += `        <a href="javascript: btnComentFileAdd('\${coment.swComentNo}', '\${coment.subWorkNo}', 'SubWorkComent');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-file-plus-outline"></i> 파일 추가</a>`;
                      comentText += `    </div>`;
                      comentText += `</div>`;
                  }
              }
                  comentText += `<div>`;
                  if (detailMode == "TopWork") {
                    comentText += `<button type="button" class="btn btn-primary btn-lg" onclick="detailTopWork_K('\${workVO.topWorkNo}')">댓글 접기</button>`;
                  } else {
                    comentText += `<button type="button" class="btn btn-primary btn-lg" onclick="detailTopWork_K('\${workVO.topWorkNo}', \${workVO.subWorkNo})">댓글 접기</button>`;
                  }
                  comentText += `</div>`;
          }
          workComentList.innerHTML = comentText;
          
          return comentText;
      })
      .then((res) => {
          axios
          .post("/searchComentFile")
          .then((res) => {
              //console.log("댓글자료들 목록 : ", res.data);
              const comentFileList = res.data;
              let insertText = ``;
              const comentFileDivs = document.querySelectorAll(".comentFile");
              
              for (let i = 0; i < comentFileList.length; i++) { //자료가 있는 댓글들 순회
                  let fileComentNo = comentFileList[i].fileComentNo; //T,20 or S,20 이런식
                  let comentType = (detailMode == "TopWork") ? "T" : "S"; 
                  
                  if (fileComentNo.split(",")[0] == comentType) { //굳이?
                       
                      let targetComentNumber = fileComentNo.split(",")[1];
                      //이중 for문(div들 순회)
                      for (let j = 0; j < comentFileDivs.length; j++) {
                          let targetDivNumber = comentFileDivs[j].classList[2].substr(1);
                          
                          if (targetComentNumber == targetDivNumber) {
                              //댓글 플래그
                              let txt = ``;
                              
                              if (detailMode == "TopWork") {
                                  //상위작업 댓글일 경우
                                  txt += ` <a href="/resources/upload/\${comentFileList[i].filePath}" download="\${comentFileList[i].fileRealName.split('.')[0]}"`;
                                  txt += ` class="badge badge-soft-secondary i-\${comentFileList[i].fileLNo2}"><i class="mdi mdi-file-document-outline mdi-18px"></i> \${comentFileList[i].fileRealName}</a> `;
                                  txt += `<i onclick="comentFileDelete('\${comentFileList[i].fileLNo2}')" class="mdi mdi-close i-\${comentFileList[i].fileLNo2} itag-T\${comentFileList[i].fileLNo2} ix" style="display: none;"></i>`;
                              } else {
                                  //하위작업 댓글일 경우
                                  txt += ` <a href="/resources/upload/\${comentFileList[i].filePath}" download="\${comentFileList[i].fileRealName.split('.')[0]}"`;
                                  txt += ` class="badge badge-soft-secondary i-\${comentFileList[i].fileLNo2}"><i class="mdi mdi-file-document-outline mdi-18px"></i> \${comentFileList[i].fileRealName}</a> `;
                                  txt += `<i onclick="comentFileDelete('\${comentFileList[i].fileLNo2}', 'SubWorkComent')" class="mdi mdi-close i-\${comentFileList[i].fileLNo2} itag-S\${comentFileList[i].fileLNo2} ix" style="display: none;"></i>`;
                              }
                              
                              comentFileDivs[j].innerHTML += txt;
                          }
                      }
                  } 
              }
          });
      });
}
//김진호
//모달-업데이트
//수정버튼 클릭시 인풋 리드온리 해제
//다시 클릭시 저장
function updateWork() {
     //멤버편집
     //OJH
     const beforeTopWorkTitle = document.querySelector("#detail-WorkTitle").value;
     
     //버튼 '수정하기 -> 저장하기'
     const btnUpdate = document.querySelector("#btnUpdate");
     btnUpdate.innerHTML = `<i class="mdi mdi-wrench"></i> 저장하기`;
     
     //진행도 수정가능하게
     document.querySelector("#slider-1").disabled = "";
     
     //파일목록 펼치기
     const workFileListDiv = document.querySelector("#workFileListDiv");
     //console.log("workFileListDiv.innerHTML : ", workFileListDiv.innerHTML);
     if (workFileListDiv.innerHTML != "") {
         showFileList('updateMode2');
     } else {
         showFileList('updateMode'); //얘가 비동기임..
     }
     
     const fileTables = document.querySelectorAll(".fileTable");
      fileTables.forEach(fileTable => {
          fileTable.style.display = "";
      }); 
     
    let updateMode = document.querySelector("#hidden-workMode").value;
    let arrs = document.querySelectorAll(".input-K");
     
    //중요도 활성화 (탑워크만)
    if (updateMode == "TopWork") {
        document.querySelector("#twImportance").style.display = "none";
        document.querySelector("#importance-update").style.display = "block";
    }
    //하위작업, 상위작업 리스트 숨기기(에디터가 선넘음) & 오버플로우 없애기 (이중 스크롤 문제)
    document.querySelector("#detail-topWork-subWorkList").style.display = "none";
    document.querySelector("#quillContainer").style.overflow = "";
    
    //에디터
    hljs.configure({   // optionally configure hljs
      languages: ['javascript', 'html']
    });
    
    var toolbarOptions = [
        ['bold', 'underline'],        // toggled buttons
        ['blockquote', 'code-block'],

        [{ 'header': 1 }, { 'header': 2 }],               // custom button values
        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
        //[{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
        //[{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
        [{ 'direction': 'rtl' }],                         // text direction

        //[{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

        [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
        //[{ 'font': [] }],
        //[{ 'align': [] }],

        //['clean']                                         // remove formatting button
      ];
    
    //혹시 모르니 리셋
    //document.querySelector("#quillContainer").innerHTML = `<div id="contentDiv"></div>`;
    var quill = new Quill("#contentDiv", {
        theme: 'snow',
        modules: {
          toolbar: toolbarOptions,
          syntax: true,
        },
        placeholder: '내용을 입력하세요..',
    });
    
    $("#toolbar").append($(".ql-toolbar"));
    //원래 내용 가져오기
    let contentURL;
    const workVO = {};
    
    if (updateMode == "TopWork") {
        contentURL = "/kanban/topWorkDetail";
        workVO.topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    } else {
        contentURL = "/subWork/subWorkDetail";
        workVO.subWorkNo = document.querySelector("#hidden-subWorkNo").value;
    }
    
    axios
      .post(contentURL, workVO)
      .then((res) => {
          ////console.log("객체 조회", res.data);
          const vo = res.data;
          originWorkContent = (updateMode == "TopWork") ? vo.topWorkContent : vo.subWorkContent;
          //에디터에 삽입
          const value = quill.clipboard.convert(originWorkContent);
          quill.setContents(value, 'silent');
      });
    ///////////////////////////////수정완료시
    if (arrs.length < 1) {
        //여기가 수정완료시
         btnUpdate.innerHTML = `<i class="mdi mdi-wrench"></i> 수정하기`;
        //빨간 파일들 삭제 처리하기
        ////console.log("deleteFileList", deleteFileList);
        const deleteFileList = document.querySelectorAll(".deleteFileList");
        deleteFileList.forEach(deleteFile => {
            ////console.log("삭제할 본문파일 : ", deleteFile.classList[2].split("-")[1]);
            let deletFileLNo2 = deleteFile.classList[2].split("-")[1];
            
            let deleteFileVO = {
              fileLNo2 : deletFileLNo2,
            }
            
            axios
              .post("/fileDelete", deleteFileVO)
              .then((res) => {
                 //console.log("과연 삭제 결과는??", res); 
              });
        });
        
        showFileList('updateComplete');
        //파일 테이블에서 빨간놈들 찾아서 지우기
        fileTables.forEach(fileTable => {
          fileTable.style.display = "none";
        }); 
        
        const tableFiles = document.querySelectorAll(".deletFileRow");
        //console.log("삭제대상파일 : ", tableFiles);
        
        tableFiles.forEach(tableFile => {
            //console.log("삭제대상파일 클래스 : ", tableFile.classList[2].split("-")[1]);
            const fileLNo2 = tableFile.classList[2].split("-")[1];
            const fileVO = {
              fileLNo2,
            };
            
            axios //순회하며 파일 삭제처리하기
              .post("/fileDelete", fileVO)
              .then((res) => {
                  ////console.log(res);
              });
        });
        //수정시엔 quill.setText('Hello\n');
        const quillContent = document.querySelector("#topWorkDiv").querySelector(".ql-editor").innerHTML;
        
        console.log("업데이트 할 내용 : ", quillContent);
        //console.log("이래도 나오나", quill.getContents());
        //퀼즈 에디터 관련 초기화
        document.querySelector("#quillContainer").innerHTML = `<div id="contentDiv"></div>`;
        document.querySelector("#quillContainer").style.overflow = "auto";
        document.querySelector("#detail-topWork-subWorkList").style.display = "block";
        
        arrs = document.querySelectorAll(".input-update-K");
        arrs.forEach(arr => {
            arr.readOnly = true;
            arr.className = "input-K";
            
            if (arr.id == "detail-WorkContent") {
                arr.className = "input-K form-control";
            }
        });
        
        const workVO = {};
        const $slider = document.getElementById('slider-1');
        //console.log("슬라이더값 : ", $slider.value);
        if ($slider.value == "100") {
            //승인완료 알람을 팀장에게 전송
            const alarmProVO = {
              proNo,    
            };
            
            axios
              .post("/project/selectProject", alarmProVO)
              .then((res) => {
                 const proVO = res.data;
                 const pm = proVO.memberId;
                 alarmProVO.topWorkNo = document.querySelector("#hidden-topWorkNo").value;
                 
                 updateAlarm(memberId, 'WorkRecognizeWaitingAlarm', pm, alarmProVO);
              });
        }
        //업데이트워프
        //멤버를 수정하려면 기존 멤버의 관계번호에 그 멤버 아이디를 업데이트해야함
        //1명에서 2명으로 늘어나면 새로 인서트해야함
        
        if (updateMode == "TopWork") {
            workVO.topWorkNo = document.querySelector("#hidden-topWorkNo").value;
            workVO.topWorkTitle = document.querySelector("#detail-WorkTitle").value;
            //날짜는 캘린더와 피커 포맷이 안맞아서 T를 항상 바꿔줘야함.
            workVO.topWorkStart = document.querySelector("#detail-WorkStart").value.replace(" ", "T");
            workVO.topWorkEnd = document.querySelector("#detail-WorkEnd").value.replace(" ", "T");
            workVO.topWorkImportance = document.querySelector("#topWorkImportance").value;
            workVO.topWorkContent = quillContent;
            //console.log("상위 저장된 진행률 : ", $slider.value);
            workVO.topWorkProgress = $slider.value;
            workVO.twCategoryNo = document.querySelector("#hidden-categoryNo").value;
            workVO.beforeTopWorkTitle = beforeTopWorkTitle;
            //OJH
            //잠깐지워놓기
            topworkUpdate_O(workVO);
            
            const state = document.querySelector("#detail-topWorkState").value;
            if (state == "작업 대기") workVO.topWorkState = 0;
            if (state == "진행 중") workVO.topWorkState = 1;
            if (state == "승인 대기") workVO.topWorkState = 2;
            if (state == "반려 / 보완요청") workVO.topWorkState = 3;
            if (state == "승인 완료") workVO.topWorkState = 4;
            
            document.querySelector("#detail-WorkPosition").style.display = "";
        } else {
            workVO.subWorkNo = document.querySelector("#hidden-subWorkNo").value;
            workVO.topWorkNo = document.querySelector("#hidden-topWorkNo").value;
            workVO.subWorkTitle = document.querySelector("#detail-WorkTitle").value;
            workVO.subWorkStart = document.querySelector("#detail-WorkStart").value.replace(" ", "T");
            workVO.subWorkEnd = document.querySelector("#detail-WorkEnd").value.replace(" ", "T");
            workVO.subWorkImportance = document.querySelector("#topWorkImportance").value;
            workVO.subWorkContent = quillContent;
            workVO.subWorkProgress = $slider.value;
            workVO.subWorkState = document.querySelector("#detail-topWorkImportance").value;
            //하위작업일 경우 진행도 x
            document.querySelector("#detail-WorkPosition").style.display = "none";
        }
        //*********************************************************
        //로그 - 진행률 기록하기 -> 서버에서 하기
        //*********************************************************
        let originProgress = 0;
        
        if (updateMode == "TopWork") {
            originProgress = document.querySelector("#hidden-topWorkNo").value;
        } else {
            originProgress = document.querySelector("#hidden-subWorkNo").value;
        }
        
        //console.log("새로운 업데이트 객체 : ", workVO);
        let updateURL = (updateMode == "TopWork") ? "/kanban/topWorkUpdate_K" : "/subWork/subWorkUpdate_K";
            axios
            .post(updateURL, workVO)
            .then((res) => {
                //업데이트하면 렌더링 다시 해줘야 할 듯.
                //업데이트 완료시 진행도 디스에이블
                document.querySelector("#slider-1").disabled = "true";
                
                if (updateMode == "TopWork") {
                  //칸반보드 렌더링
                  const changedTitle = workVO.topWorkTitle;
                  const targetNo = `.th-\${workVO.topWorkNo}`;
                  //console.log("changedTitle : ", changedTitle);
                  //console.log("targetNo : ", targetNo);
                  
                  const targetTH = document.querySelector(targetNo);
                  targetTH.innerText = changedTitle;
                  
                  detailTopWork_K(workVO.topWorkNo);
                } else {
                  
                  detailTopWork_K(workVO.topWorkNo, workVO.subWorkNo);
                }
                
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: '수정이 완료되었습니다.',
                    showConfirmButton: false,
                    timer: 1500
                })
            });
        
        return;
    }
    //입력을 위해 리드온리 풀어주는 곳
    arrs.forEach(arr => {
        arr.readOnly = false;
        arr.className = "input-update-K";
        
        if (arr.id == "detail-WorkContent") {
            arr.className = "input-update-K form-control";
        }
    });
}

//김진호
//모달-디테일
//디테일에서 수정하기 누르면 -> 모달 닫히면 안되고 내용만 다시 그려져야함
//개인 칸반부터 바꾸자
function detailModalToggle_K() {
    //$("#topWorkLogTable").DataTable().clear();
    document.querySelector("#btnTopWorkModal").click();
}

function subModalToggle_K() {
    document.querySelector("#btnSubWorkModal").click();
}

function tableClear() {
    document.querySelector("#topWorkLogTable").remove();
    const topWorkLogTableDiv = document.querySelector("#topWorkLogTableDiv");
    topWorkLogTableDiv.innerHTML = `<table id="topWorkLogTable" class="jino-15"></table>`;
    
    document.querySelector("#topWorkFileTable").remove();
    const fileDiv = document.querySelector("#detail-topWorkFile");
    fileDiv.innerHTML = `<table id="topWorkFileTable" class="jino-15"></table>`;
}

function subWorkInputShow() {
    //하위작업란 초기화
    const subWorkElements = document.querySelectorAll(".subwork-class");
    subWorkElements.forEach(element => {
        element.value = "";
    });
    
    const topWorkStartDay = document.querySelector("#detail-WorkStart").value;
    const topWorkEndDay = document.querySelector("#detail-WorkEnd").value;
    //console.log("topWorkStartDay", topWorkStartDay, "topWorkEndDay", topWorkEndDay);
    makeInsertSubWorkFlatPickr(topWorkStartDay, topWorkEndDay);
    //settingSubWorkFlatPickr();
    //버튼 클릭시 담당자만 클릭할 수 있다는 예외처리 필요.
    document.querySelector(".topWorkDiv").style.display = "none"; //우선 
    const view = document.querySelector("#subWorkInput").style.display;
    
    if (view == "block") { //두번클릭시 닫힘
      document.querySelector("#subwork-quillContainer").innerHTML = `<div id="subwork-contentDiv"></div>`;
      document.querySelector("#subWorkInput").style.display = "none";
      document.querySelector(".topWorkDiv").style.display = "";
      return;
    }
    
    //퀼
    insertSubWorkModalQuillRender();
    
    document.querySelector("#subWorkInput").style.display = "block";
    document.querySelector("#subwork-insert-title").focus();
}

//김진호
//하위작업 생성 함수
function insertSubWork() {
    const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    const topWorkRNo = $("#sub-worker > option:selected").attr("value2");
    const subWorkContent = document.querySelector("#subwork-contentDiv").children[0].innerHTML;
    const subWorkTitle = document.querySelector("#subwork-insert-title").value;
    const subWorkStart = document.querySelector("#subStart").value.replace(" ", "T");
    const subWorkEnd = document.querySelector("#subEnd").value.replace(" ", "T");
    
    if (!subWorkStart || !subWorkEnd) {
        //알러트 뜰 곳
        Swal.fire({
          icon: 'error',
          title: '기간 설정 없음',
          text: '시작일과 종료일을 설정해주세요!',
        });
        
        return;
    }
    
    const subWorkVO = {
      topWorkNo,
      topWorkRNo,
      subWorkContent,
      subWorkTitle,
      subWorkStart,
      subWorkEnd
    };
    
    if (subWorkContent == "" || subWorkContent == null) {
        alert("내용을 입력하세요");
        return;
    }
    
    axios
      .post("/subWork/subWorkInsert", subWorkVO)
      .then((res) => {
         //반환값은 subWorkNo
         const subWorkNo = res.data;
         const twCategoryNo = document.querySelector("#hidden-categoryNo").value;
         const twCategoryName = document.querySelector("#hidden-categoryName").value;
         const topWorkTitle = document.querySelector("#detail-WorkTitle").value;
         const mode = "SubWork";
         
         const subWorkFileList = document.querySelector("#subWorkInsertFile").files;
         const formData_K = new FormData();
         
         for (var i = 0; i < subWorkFileList.length; i++) {
           formData_K.append("uploadFile", subWorkFileList[i]);   
         }
         
         const jsonObj = {
                    projectId: proNo, 
                    categoryName :twCategoryName,
                    topWorkTitle : topWorkTitle,
                    twCategoryNo : twCategoryNo,
                    topWorkNo : topWorkNo,
                    subWorkNo : subWorkNo,
                    mode: mode,
                    uploader: memberId,
         };
         
         let jsonData = JSON.stringify(jsonObj);
         formData_K.append("jsonData", jsonData);
         
         $.ajax({
                url : '/uploadAjaxAction',
                processData : false,
                contentType : false,
                data : formData_K,
                type : 'POST',
                dataType : 'json',
                success : function(result){
                    //인풋 비워주기
                    document.querySelector("#subWorkInsertFile").value = "";
                    //바로 해당 작업 열어주기
                    detailTopWork_K(topWorkNo, subWorkNo);
                }
         });
         
         document.querySelector(".topWorkDiv").style.display = "";
         document.querySelector("#subWorkInput").style.display = "none";
         detailTopWork_K(topWorkNo); //여기서 사실 서브워크를 바로 보여줘야함
      });
}

//김진호
//작업자 변경하기 시작 함수
function memberChange() {
    //현재 작업자 저장하기
    const currentMemberList = [];
    const memberTags = document.querySelectorAll(".worker-list");
    
    memberTags.forEach(memberTags => {
        let memberId = memberTags.classList[1];
        currentMemberList.push(memberId);
    });
    
    //프로젝트 전체 작업자 불러오기
    const proVO = {
      proNo,    
    };
    
    axios
      .post("/project/memberList", proVO)
      .then((res) => {
         ////console.log("참가멤버 리스트 : ", res);
         const joinMemberList = res.data;
         
         return joinMemberList;
      })
      .then((memberList) => {
          ////console.log("전달받은 멤버리스트 : ", memberList);
          //모달 하나를 더 만들어서 그걸 토글.
          detailModalToggle_K();
          memberChangeModalOpen(memberList);
      });
    
}

//김진호
//작업자 변경시 기존 작업자 리스트 얻어오는 함수
function getOriginMemberList() {
    const workers = document.querySelectorAll(".worker-list");
    const workerArr = [];
    
    workers.forEach(worker => {
    	console.log("worker", worker);
      workerArr.push(worker.classList[1]);
    });
    
    return workerArr;
}

//김진호
//작업자 변경 모달 그린 후 열어주는 함수
function memberChangeModalOpen(memberList) {
    //console.log("함수로 전달된 리스트 : ", memberList);
    memberChangeModalToggle();
    
    const proVO = {
      proNo,    
    };
    
    axios
      .post("/project/memberList", proVO)
      .then((res) => {
         const memberList = res.data;
         let txt = ``;
         
         for (member of memberList) {
           txt += `<div class="draggable rounded mb-2">`;
           txt += `<a href='#' class='worker-list-new \${member.memberId} list-group-item list-group-item-action' style="border: none;">`;
           txt += `<div class="list-group list-group-horizontal" id="teamMemberPrint">`;
           
           if (member.memberPic == null) {
               txt += `<img src="${pageContext.request.contextPath }/resources/dist/assets/images/users/blank_progile.png" class="rounded-circle img-fluid avatar-md img-thumbnail bg-transparent" alt="">`;
           } else {
               txt += `<img src="${pageContext.request.contextPath }\${member.memberPic}" class="rounded-circle img-fluid avatar-md img-thumbnail bg-transparent" alt="">`;
           }
           
           txt += `<div class="w-100 ms-2">`;
           txt += `    <h5 class="mb-1" style="font-weight: bold;">\${member.memberName}</h5>`;
           txt += `    <h5 class="mb-1" style="font-weight: bold;">\${member.memberId}</h5>`;
           txt += `</div>`;
           txt += `</div>`;
           txt += `</a>`;
           txt += `</div>`;
         }
         
         document.querySelector("#memberListArea").innerHTML = txt;
         memberDrag();
      });
}

//김진호
//작업자 변경하는 함수.
//하위 작업이 있을 경우 subWorkChangeModalSetting 으로 넘어감
function saveWorkerList() {
    const choiceArea = document.querySelector("#memberChoiceArea");
    const selectedMemberList = choiceArea.querySelectorAll(".worker-list-new");
    const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    
    const originMemberArray = getOriginMemberList();
    const newMemberArray = [];
    
    if (selectedMemberList.length > 0) {
      selectedMemberList.forEach(selectedMember => {
          ////console.log("작업자 : ", selectedMember.classList[1]);
          let memId = selectedMember.classList[1];
          
          newMemberArray.push(memId);
      });
      
    } else {
        //console.log("선택된 작업자가 없습니다.");
        return;
    }
    
    //각각의 배열을 객체에 담기
    const map = {
      originMemberArray,
      newMemberArray,
      topWorkNo,
    };
    
    axios
      .post("/kanban/memberChangeCheck", map)
      .then((res) => {
         let result = res.data;
         //console.log("result", result);
         
         if (result == "작업자 변경 성공") {
             Swal.fire({
                  icon: 'success',
                  title: '변경 완료',
                  text: '작업자가 변경되었습니다!',
            });
          detailModalToggle_K();
          detailTopWork_K(topWorkNo);
             
         } else {
             Swal.fire({
                  title: '기존 작업자에게 하위작업이 있습니다!',
                  text: "하위작업에 새로운 작업자를 배정해주세요.",
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: '배정하기',
                  cancelButtonText: '취소'
                }).then((result) => {
                  if (result.isConfirmed) {
                      subWorkChangeModalSetting(map);
                  } else {
                      memberChangeModalToggle();
                      return;
                  }
                })
         }
      });
      
}


//김진호
//작업자 변경시 하위작업이 있을 경우.
//하위작업과 새로 배정된 작업자들을 세팅해서 그려주고
//재배치할 수 있도록 해준다.
function subWorkChangeModalSetting(map) {
    //console.log("전달받은 맵 : ", map);
     document.querySelector("#subWorkListArea").innerHTML = "";
     document.querySelector("#subWorkMemberArea").innerHTML = "";
    //map에는 newMemberArray, originMemberArray가 있음.
    //필요한건 newMemberArray
    axios
      .post("/subWork/getChangeSubWork", map)
      .then((res) => {
         //테이블 그려야할 대상
         console.log("재설정해야하는 하위작업 : ", res);
         const subWorkList = res.data;
         let text = ``;
         
         for (subWork of subWorkList) {
             text += `<div class="subWorkNo-\${subWork.subWorkNo} change-subWork-div">`;
             text += `<div class="table-responsive rounded draggable">`;
             text += `<table class="table table-borderless mb-0">`;
             text += `<thead class="table bg-primary" style="color: white;">`;
             text += `<tr><th>하위작업</th></tr>`;
             text += `</thead>`;
             text += `<tbody class="table-light">`;
             text += `<tr><td style="font-weight: bold;">\${subWork.subWorkTitle}</td></tr>`;
             text += `</tbody>`;
             text += `</table>`;
             text += `</div>`;
             text += `</div>`;
         }
         document.querySelector("#subWorkListArea").innerHTML = text;
         
        //멤버 영역 그리기(이미 어레이로 있음)
        let newMemberList = map.newMemberArray;
        axios
          .post("/member/selectMemberChangeList", newMemberList)
          .then((res) => {
        	  newMemberList = res.data;
        	  text = ``;
        	  for (let i = 0; i < newMemberList.length; i++) {
                  let member = newMemberList[i];
                  console.log("member : ", member); //아이디 밖에 없음.
                  text += `<div style="margin-left: 20px;">`;
                  text += `<div class="row">`;
                  //여기 안에 프로필 사진 드가야함 근디 어렵네.
                  text += `<a href='#' class='change-new-member \${member.memberId} list-group-item list-group-item-action' style="border: none;">`;
                  text += `<div class="list-group list-group-horizontal" id="teamMemberPrint">`;
                  
                  if (member.memberPic == null) {
                      text += `<img src="${pageContext.request.contextPath }/resources/dist/assets/images/users/blank_progile.png" class="rounded-circle img-fluid avatar-md img-thumbnail bg-transparent" alt="">`;
                  } else {
                      text += `<img src="${pageContext.request.contextPath }\${member.memberPic}" class="rounded-circle img-fluid avatar-md img-thumbnail bg-transparent" alt="">`;
                  }
                  
                  text += `<div class="w-100 ms-2 \${member.memberId}">`;
                  text += `    <h5 class="mb-1" style="font-weight: bold;">\${member.memberName}</h5>`;
                  text += `    <h5 class="mb-1" style="font-weight: bold;">\${member.memberId}</h5>`;
                  text += `</div>`;
                  text += `</div>`;
                  text += `</a>`;
                  text += `</div>`;
                  text += `<div class="subwork-container \${member.memberId}">`;
                  text += `</div>`;
                  text += `</div>`;
              }
        	  document.querySelector("#subWorkMemberArea").innerHTML = text;
        	  subWorkChangeModalToggle();
        	  const subWorkContainers = document.querySelectorAll(".subwork-container");
              subWorkContainers.forEach(subWorkContainer => {
                    new Sortable(subWorkContainer, {
                          group: {
                            name: "shared-subWork", //이게 같은 Sortable 객체들끼리 이동 가능
                          },
                          swapThreshold: 1,
                          animation: 150,
                          ghostClass: "blue-background-class",
                          //sort: false, 이거 false하면 원래 영역 내에서는 안움직임
                          onChoose: function (event) {
                            //클릭한 아이템
                            //선택한 영역 안에 테이블 목록
                          },
                          filter: ".filtered",
                          onEnd: function (event) {
                            //내려놓았을때!
                            //console.log("이동중", event);
                            //console.log("이동된 하위작업 : ", event.item.className);
                            ////console.log("새로 배정된 작업자 : ", event.to.classList[1]);
                            const subWorkNo = event.item.className.split("-")[1];
                            const newMemberId = event.to.classList[1];
                            const subWorkArray = [];
                            subWorkArray.push(subWorkNo);
                            subWorkArray.push(newMemberId);
                            map.updateSubWorkVO = subWorkArray;
                            //map.updateSubWorkVO = [subWorkNo, newMemberId];
                            ////console.log("최종 맵 : ", map);
                            ////console.log("최종 멤버 : ", map.newMemberArray)
                            //맵은 에러가 너무 많아서 버린다..
                            const area = document.querySelector("#memberChoiceArea");
                            const selectedMembers = area.querySelectorAll(".worker-list-new");
                            ////console.log("selectedMembers", selectedMembers);
                            ////console.log("새로 배정된 작업자 : ", event.to.classList[1]);
                            const workerArray = [];
                            let newWorker = event.to.classList[1];
                            const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
                            
                            selectedMembers.forEach(selectedMember => {
                               //console.log("새로 선정된 사람 : ", selectedMember.classList[1]); 
                               workerArray.push(selectedMember.classList[1]);
                            });
                            //console.log("새로운 작업자들 : ", workerArray);
                            //console.log("하위작업 담당자 : ", newWorker);
                            const workerMap = {
                              workerArray,
                              newWorker,
                              subWorkNo,
                              topWorkNo,
                            };
                            
                            //console.log("전송할 맵 : ", workerMap);
                            if (newWorker == "subwork-container") {
                                //console.log("이건 전송안해");
                                return;
                            }
                          }
                        });
                });
          });
      });
}

function subWorkChangeModalToggle() {
    document.querySelector("#btnSubWorkChangeModal").click();
}

//멤버드래그
function memberDrag() {
    const memberContainers = document.querySelectorAll(".member-container");
    memberContainers.forEach(memberContainer => {
        new Sortable(memberContainer, {
              group: {
                name: "shared-member", //이게 같은 Sortable 객체들끼리 이동 가능
              },
              swapThreshold: 1,
              animation: 150,
              ghostClass: "blue-background-class",
              //sort: false, 이거 false하면 원래 영역 내에서는 안움직임
              onChoose: function (event) {
                //클릭한 아이템
                //선택한 영역 안에 테이블 목록
              },
              filter: ".filtered",
              onEnd: function (event) {
                //내려놓았을때!
                //console.log("이동중", event);
                ////console.log(event.to.querySelectorAll(".worker-list"));
                const choiceMembers = event.to.querySelectorAll(".worker-list");
                choiceMembers.forEach(choiceMember => {
                  ////console.log("담당자로 배정되는 사람 : ", choiceMember.classList[1]);    
                });
              }
            });
    });
}

function memberChangeModalToggle() {
    document.querySelector("#memberListArea").innerHTML = "";
    document.querySelector("#memberChoiceArea").innerHTML = "";
    document.querySelector("#btnMemberChangeModal").click();
}

//김진호
//상세보기모달
//디테일워프
function detailTopWork_K(topWorkNo, subWorkNo, change) {
    tableClear();
    //멤버 프로필이 좀 늦게 업데이트됨
    document.querySelector("#detail-WorkWorker").innerHTML = `<div class="spinner-border text-blue m-2" role="status"></div>`;;
    //타이틀 비우기
    document.querySelector("#goTopWork").innerHTML = "";
    //열기전 수정모드, 하위작업추가 모드였으면 다시 복구시키기
    const btnUpdate = document.querySelector("#btnUpdate");
    document.querySelector("#subWorkInput").style.display = "none";
    document.querySelector("#topWorkDiv").style.display = "";
    btnUpdate.innerHTML = `<i class="mdi mdi-wrench"></i> 수정하기`;
    let inputK = document.querySelectorAll(".input-update-K");
    inputK.forEach(item => {
        item.classList.replace("input-update-K", "input-K");
    });
    //파일리스트 펼쳐져있으면 접기
    document.querySelector("#workFileListDiv").innerHTML = "";
    
    //만약 두번째파라미터 subWorkNo가 하위작업번호가 아니라 changeTopWork이면 스크롤을 올려준다. 
    //그리고 subWorkNo는 가짜이므로 다시 null로 전환해준다. (어차피 상위작업 조회로 넘어가는것이므로);
    if (subWorkNo == "changeTopWork") {
        subWorkNo = null;
        document.querySelector("#detail-modal-body").scroll({
            top:0,
            left:0,
            behavior: 'smooth'
        });
    }
    
    //디테일시 스크롤바 올려주기(상위, 하위 이동할때만..?)
    if (change == 'change') {
        document.querySelector("#detail-modal-body").scroll({
            top:0,
            left:0,
            behavior: 'smooth'
        });
    }
    
    //레인지바
    const $slider = document.getElementById('slider-1');

    //레인지바 움직일때
    $slider.addEventListener('change', (evt) => {
      ////console.log("진행률 : ", evt.detail.value);
    });
    // change value
    //$slider.value = 70;
    // or 
    // $slider.setAttribute('value', '50');
    // get value
    ////console.log($slider.value);
    let detailMode = "TopWork";
    if (subWorkNo != null) {
        //console.log("새로운 로직 : ", topWorkNo, subWorkNo);
        detailMode = "SubWork";
    }
    //하위작업 보기일때 작성자와 멤버아이디가 같으면 버튼 활성화 시키기
    if (detailMode == "SubWork") {
    	document.querySelector("#btnSubWorkInput").style.display = "none";
    }
    //상위 -> 하위 -> 다시 상위 누를시
    if (detailMode == "TopWork") {
        document.querySelector("#hidden-subWorkNo").value = "";
    }
    
    //히든인풋에 현재 보고있는게 상위인지 하위인지 구분해주기
    document.querySelector("#hidden-workMode").value = detailMode;
    
    //중요도 비활성화
    document.querySelector("#twImportance").style.display = "block";
    document.querySelector("#importance-update").style.display = "none";
    
    //퀼즈 에디터 초기화
    document.querySelector("#quillContainer").innerHTML = `<div id="contentDiv"></div>`;
    
    ////console.log("새로운 디테일 눌렸다. topWorkNo : ", topWorkNo);
    const titleInput = document.querySelector("#detail-WorkTitle");
    const workerDiv = document.querySelector("#detail-WorkWorker");
    const projectInput = document.querySelector("#detail-WorkProject");
    const dateStart = document.querySelector("#detail-WorkStart");
    const dateEnd = document.querySelector("#detail-WorkEnd");
    const stateInput = document.querySelector("#detail-topWorkState");
    const importanceInput = document.querySelector("#detail-topWorkImportance");
    const contentDiv = document.querySelector("#contentDiv");
    const logTbody = document.querySelector("#detail-topWorkLog");
    const fileDiv = document.querySelector("#detail-topWorkFile");
    const fileTable = document.querySelector("#topWorkFileTable");
    const detailButtonDiv = document.querySelector("#detail-button-div");
    const categoryNoHidden = document.querySelector("#hidden-categoryNo");
    const categoryNameHidden = document.querySelector("#hidden-categoryName");
    
    //종속관계 추가해야함
    //중요도 추가해야함
    const vo = {
      topWorkNo,
    };
    let detailURL = "/kanban/topWorkDetail";
    
    // * 하위작업일 경우 pk 추가 및 URL 변경
    if (detailMode == "SubWork") {
        vo.subWorkNo = subWorkNo;
        detailURL = "/subWork/subWorkDetail";
    }
    
    //모달 열기 전 채워주기
    //1. pk로 데이터 가져오기
    axios
      .post(detailURL, vo)
      .then((res) => {
          //console.log("디테일의데이터: ", res.data); //기존 vo + 프로젝트명까지 나옴. + 관계번호까지 추가 (멤버아이디는 여러명이면 에러. 삭제.)
          const workVO = res.data;//디테일할 topWorkVO 혹은 subWorkVO
          
          //하위작업추가 버튼 //밑에누면 느려서 여기에서 해야함
          //접속한 사람과 담당자가 같을 경우 하위작업추가 버튼 보여주기
          const btnSubWorkInput = document.querySelector("#btnSubWorkInput");
          const btnFileAdd = document.querySelector("#btnFileAdd");
          const btnUpdate = document.querySelector("#btnUpdate");
          const btnDelete = document.querySelector("#btnDelete");
          const btnComplete = document.querySelector("#btnComplete");
          const btnReject = document.querySelector("#btnReject");
          btnComplete.style.display = "none";
          btnReject.style.display = "none";
          
           axios
             .post("/kanban/selectMemberList", workVO)
             .then((res) => {
                const memList = res.data;
                ////console.log("해당 작업의 담당자 리스트", memList);
                //워프
                let memberCheckFlag = false;
                
                for (member of memList) {
                    console.log("작업자 목록 : ", member.memberId);
                    
                     if (memberId == member.memberId || memberCheckFlag == true) {
                       btnSubWorkInput.style.display = "";
                       btnFileAdd.style.display = "";
                       
                     } else {
                       btnSubWorkInput.style.display = "none";
                       btnFileAdd.style.display = "none";
                      
                     }
                     
                     if (member.memberId == memberId || memberCheckFlag == true) {
                         btnUpdate.style.display = "";
                         memberCheckFlag = true;
                     } else {
                    	 //이러면 첫번째때 풀려도 두번째때 none으로 된다.
                         btnUpdate.style.display = "none";
                     }
                     
                     btnDelete.style.display = "none";
                     
                     //하위작업은 멤버가 무조건 한명이라 굳이 플래그 조건을 걸 필요없음
                     if (memberId == member.memberId && detailMode == "SubWork") {
                       btnSubWorkInput.style.display = "none";
                       btnUpdate.style.display = "";
                       btnDelete.style.display = "";
                     }
                     
                }
                //멤버가 팀장 리더일때의 버튼 제어
                const map = {
                  memberId,
                  proNo,
                }
                
                axios
                  .post("/projoin/checkAuth", map)
                  .then((res) => {
                     ////console.log("권한 : ", res);
                     const proAuth = res.data.proAuth;
                     
                     if (proAuth == "1" || proAuth == "2") {
                         //PM or PL 일때 버튼 보이게 복구
                         const authElements = document.querySelectorAll(".auth-pmpl");
                         
                         authElements.forEach(authElement => { //승인과 반려 버튼은 안보이도록
                             if (authElement.id == "btnComplete" || authElement.id == "btnReject") {
                               authElement.style.display = "none"; 
                             } else {
                               authElement.style.display = ""; 
                             }
                             
                         });
                         
                         if (detailMode == "TopWork" && workVO.topWorkState == "2") {
                             btnComplete.style.display = "";
                             btnReject.style.display = "";
                         }
                         
                     }
                  });
                //팀장버튼제어 끝
             });
          //기본버튼제어 끝
          
          //중요도, 상태값은 무조건 있어야함
          let topWorkImportance = ``;
          let topWorkState = ``;
          let importanceText = ``;
          
          if (detailMode == "TopWork") {
              //만약 배정된 사람과 접속한 사람이 같다면 하위작업 추가 버튼 나오게
              document.querySelector("#hidden-topWorkNo").value = workVO.topWorkNo;
              titleInput.value = workVO.topWorkTitle;
              projectInput.value = workVO.proName;
              dateStart.value = workVO.topWorkStart.replace("T", " ");
              dateEnd.value = workVO.topWorkEnd.replace("T", " ");
              contentDiv.innerHTML = workVO.topWorkContent;
              topWorkImportance = workVO.topWorkImportance;
              topWorkState = workVO.topWorkState;
              
              $slider.value = workVO.topWorkProgress;
              document.querySelector("#slider-1").disabled = "true";
              
              categoryNoHidden.value = workVO.twCategoryNo;
              document.querySelector("#detail-WorkPosition").style.display = "";
              //카테고리 정보 가져와서 히든에 넣어놓기 (여기에 카테고리 정보 다 있음.)
              //타이틀 색상변경도 여기서 할 것
              axios
                .post("/kanban/categorySelect", workVO)
                .then((res) => {
                    const cateVO = res.data;
                    //console.log("카테고리 정보 : ", res.data);
                    categoryNameHidden.value = res.data.twCategoryName;
                    //document.querySelector("#detail-WorkTitle").style.borderLeft = `15px solid \${cateVO.twCategoryColor}`;
                    //document.querySelector("#detail-WorkTitle").style.marginLeft = `10px`;
                    document.querySelector("#detail-modal-header").style.borderLeft = `20px solid \${cateVO.twCategoryColor}`;
                });
              
              //중요도
              importanceText = `<font class="jinoFont">중요도</font>`;
              
              if (topWorkImportance == "0") {
                  importanceText += `<div id="twImportanceCheckRadio" class="form-check mb-2 form-check-primary">`;
                  importanceText += `  <input type="radio" class="form-check-input" id="detail-topWorkImportance" name="" value="0" checked/>`;
                  importanceText += `  <label id="twImportanceLabel" class="form-check-label" for="detail-topWorkImportance">일반</label>`;
              }
              if (topWorkImportance == "1") {
                  importanceText += `<div id="twImportanceCheckRadio" class="form-check mb-2 form-check-danger">`;
                  importanceText += `  <input type="radio" class="form-check-input" id="detail-topWorkImportance" name="" value="1" checked/>`;
                  importanceText += `  <label id="twImportanceLabel" class="form-check-label" for="detail-topWorkImportance">중요</label>`;
              }
              if (topWorkImportance == "2") {
                  importanceText += `<div id="twImportanceCheckRadio" class="form-check mb-2 form-check-warning">`;
                  importanceText += `  <input type="radio" class="form-check-input" id="detail-topWorkImportance" name="" value="2" checked/>`;
                  importanceText += `  <label id="twImportanceLabel" class="form-check-label" for="detail-topWorkImportance">긴급</label>`;
              }
              
              importanceText += `</div>`;
              document.querySelector("#twImportance").innerHTML = importanceText;
              
          } else {
        	  //하위
        	  document.querySelector("#btnSubWorkInput").style.display = "none";
        	  
              document.querySelector("#hidden-topWorkNo").value = workVO.topWorkNo;
              document.querySelector("#hidden-subWorkNo").value = workVO.subWorkNo;
              titleInput.value = workVO.subWorkTitle;
              dateStart.value = workVO.subWorkStart.replace("T", " ");
              dateEnd.value = workVO.subWorkEnd.replace("T", " ");
              contentDiv.innerHTML = workVO.subWorkContent;
              ////console.log("workVO.subWorkContent", workVO.subWorkContent);
              
              $slider.value = workVO.subWorkProgress;
              document.querySelector("#detail-WorkPosition").style.display = "none";
              //projectInput.value = item.proName; 하위작업일경우엔 프로젝트 이름 따로 가져와야할듯..
              //하위작업에 없는 정보 -> proName, importance, state -> 어차피 입력되어있을거지만 만들어놔야할듯
              axios //하위지만 상위에서 가져올 데이터들
                .post("/kanban/topWorkDetail", workVO)
                .then((res) => {
                    projectInput.value = res.data.proName;
                    topWorkImportance = res.data.topWorkImportance;
                    topWorkState = res.data.topWorkState;
                    
                    ////console.log("서브 res.data : ", res.data);
                    
                    //중요도
                    importanceText = `<font class="jinoFont>중요도</font>`;
                    
                    if (topWorkImportance == "0") {
                        importanceText += `<div id="twImportanceCheckRadio" class="form-check mb-2 form-check-primary">`;
                        importanceText += `  <input type="radio" class="form-check-input" id="detail-topWorkImportance" name="" value="0" checked/>`;
                        importanceText += `  <label id="twImportanceLabel" class="form-check-label" for="detail-topWorkImportance">일반</label>`;
                    }
                    if (topWorkImportance == "1") {
                        importanceText += `<div id="twImportanceCheckRadio" class="form-check mb-2 form-check-danger">`;
                        importanceText += `  <input type="radio" class="form-check-input" id="detail-topWorkImportance" name="" value="1" checked/>`;
                        importanceText += `  <label id="twImportanceLabel" class="form-check-label" for="detail-topWorkImportance">중요</label>`;
                    }
                    if (topWorkImportance == "2") {
                        importanceText += `<div id="twImportanceCheckRadio" class="form-check mb-2 form-check-warning">`;
                        importanceText += `  <input type="radio" class="form-check-input" id="detail-topWorkImportance" name="" value="2" checked/>`;
                        importanceText += `  <label id="twImportanceLabel" class="form-check-label" for="detail-topWorkImportance">긴급</label>`;
                    }
                    
                    importanceText += `</div>`;
                    document.querySelector("#twImportance").innerHTML = importanceText;
                    
                    //색 채우기
                    if (topWorkState == "3") {
                        stateInput.value = "반려 / 보완요청";
                        stateInput.style.color = "#F7531E";
                    }
                    
                    if (topWorkState == "4") {
                        stateInput.value = "승인 완료";
                        stateInput.style.color = "#66A644";
                    }
                    
                    if (topWorkState != "3" && topWorkState != "4") {
                        stateInput.style.color = "";
                    }
                });
              
          }
          
          //작업 상태 topWorkState
          if (topWorkState == "0") stateInput.value = "작업 대기";
          if (topWorkState == "1") stateInput.value = "진행 중";
          if (topWorkState == "2") stateInput.value = "승인 대기";
          
          if (topWorkState == "3") {
              stateInput.value = "반려 / 보완요청";
              stateInput.style.color = "#F7531E";
          }
          
          if (topWorkState == "4") {
              stateInput.value = "승인 완료";
              stateInput.style.color = "#66A644";
          }
          
          if (topWorkState != "3" && topWorkState != "4") {
              stateInput.style.color = "";
          }
          
          
          //스피너를 보여주고 싶으니깐 의도적으로 모달쇼 밑에서 다시 처리해주자
          //순서 : 0. 담당자 1. 로그 2. 첨부파일 3. 댓글
          //0. 담당자 -> 프로필 이미지로 표시해줌.
          let memberListURL = (detailMode == "TopWork") ? "/kanban/selectMemberList" : "/subWork/selectMemberListSubWork";
          
          axios
            .post(memberListURL, workVO)
            .then((res) => {
                //console.log("멤버 : ", res);
                const memberList = res.data;
                console.log("memberList", memberList);
                
                //let txt = `<font class="jinoFont">작업자</font> <div class="list-group list-group-horizontal" id="teamMemberPrint">`;
                let selectText = `<font class="jinoFont">작업자</font> <div class="list-group list-group-horizontal" id="teamMemberPrint">`;
                //여기서 하위 작업자 셀렉트박스도 채우기
                let newMemberText = `<font class="jinoFont">작업자</font> <div class="list-group list-group-horizontal" id="teamMemberPrint">`;
                
                //하위작업(멤버가 한명일 경우) => 어차피 한명이니까 리스트 타입이 아닐것.
                if (detailMode == "SubWork") {
                	newMemberText +=  `<div class="col-4" style="display: flex;">  
				                    <div style="position: relative;">
				                       <img id ="memberImg-sub" src="\${memberList.memberPic}" class="rounded-circle avatar-md img-thumbnail bg-transparent" alt=""> 
				                       <i id = "memberState-sub" class="mdi mdi-circle h3 text-secondary" style="position: absolute; top: 30px; left: 40px; cursor:pointer;"\></i>
				                    </div> 
				                    <div class="worker-list \${memberList.memberId} ms-2">
				                       <h5 class="mb-1" id="memberName-sub" >
				                       \${memberList.memberName} 
				                       <i id ="memberAuth-sub"></i>
				                       </h5>
				                       <p id  ="memberAuthName-sub"></p>
				                    </div>
				                    <div class="mt-2 dropend">
				                       <a   href="#" onclick="" class="dropdown-toggle"id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > <i class="mdi mdi-chevron-right h2"></i>
				                       </a>
				                       <div id="dropMenu-sub"class="dropdown-menu mb-4 dropMenu" aria-labelledby="dropdownMenuButton">
				                             <a class="dropdown-item" href="#">쪽지보내기</a>
				                             <a class="dropdown-item" href="#">채팅하기</a>
				                              </div>
				                    </div>
				                 </div>`;
				                 
                    workerDiv.innerHTML = newMemberText;
                    
                    var memberStateId = '#memberState-sub';
                    var memberState = memberList.memberState;
                     if (memberState == '0' || memberState== '1'|| memberState== '2') {
                         $(memberStateId).attr('class','mdi mdi-circle h3 text-success');
                         $(memberStateId).attr('title',"접속중")
                       } else if (memberList.memberState == "3" ) {
                         $(memberStateId).attr('class',"mdi mdi-circle h3 text-warning")
                         $(memberStateId).attr('title',"부재중")
                       }else if (memberList.memberState == "4" ) {
                         $(memberStateId).attr('class',"mdi mdi-circle h3 text-secondary")
                         $(memberStateId).attr('title',"비접속")
                       } 
                       
                    //PM PL 상태체크  1PM 2PL 3member
                    var memberAuth = '#memberAuth-sub';
                    var memberAuthName = '#memberAuthName-sub';
                     if(memberList.proAuth == '1'){
                        $(memberAuth).attr('class','mdi mdi-check-decagram text-danger ms-1');
                        $(memberAuthName).text('PM')
                          }else if(memberList.proAuth == '2'){
                        $(memberAuth).attr('class','mdi mdi-check-decagram text-primary ms-1');
                        $(memberAuthName).text('PL')
                          }else if(memberList.proAuth == '3'){
                        $(memberAuthName).text('MEMBER')
                          }   
                       
//                     //기본이미지 사진
                    var memberImg = '#memberImg-sub';
                     if(memberList.memberPic == '0'){
                        $(memberImg).attr('src','/resources/dist/assets/images/users/blank_progile.png');
                          }
                    
                    
                } else {
                	
                	 for (let i = 0; i < memberList.length; i++) {
                         newMemberText +=   `<div class="col-4" style="display: flex;">  
                                                 <div style="position: relative;">
                                                    <img id ="memberImg\${i}" src="\${memberList[i].memberPic}" class="rounded-circle avatar-md img-thumbnail bg-transparent" alt=""> 
                                                    <i id = "memberState\${i}" class="mdi mdi-circle h3 text-secondary" style="position: absolute; top: 30px; left: 40px; cursor:pointer;"\></i>
                                                 </div> 
                                                 <div class="worker-list \${memberList[i].memberId} ms-2">
                                                    <h5 class="mb-1" id="memberName\${i}" >
                                                    \${memberList[i].memberName} 
                                                    <i id ="memberAuth\${i}"></i>
                                                    </h5>
                                                    <p id  ="memberAuthName\${i}"></p>
                                                 </div>
                                                 <div class="mt-2 dropend">
                                                    <a   href="#" onclick="" class="dropdown-toggle"id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > <i class="mdi mdi-chevron-right h2"></i>
                                                    </a>
                                                    <div id="dropMenu\${i}"class="dropdown-menu mb-4 dropMenu" aria-labelledby="dropdownMenuButton">
                                                          <a class="dropdown-item" href="#">쪽지보내기</a>
                                                          <a class="dropdown-item" href="#">채팅하기</a>
                                                           </div>
                                                 </div>
                                              </div>`;
                                              
                         selectText += `<option value="\${memberList[i].memberId}" value2="\${memberList[i].topWorkRNo}">\${memberList[i].memberName}(\${memberList[i].memberId})</option>`;
                     }
                	 
                    workerDiv.innerHTML = newMemberText;
                    
                    for (let i = 0; i < memberList.length; i++) {
                    	var memberStateId = '#memberState'+i;
                        var memberState = memberList[i].memberState;
                         if (memberState == '0' || memberState== '1'|| memberState== '2') {
                             $(memberStateId).attr('class','mdi mdi-circle h3 text-success');
                             $(memberStateId).attr('title',"접속중")
                           } else if (memberList[i].memberState == "3" ) {
                             $(memberStateId).attr('class',"mdi mdi-circle h3 text-warning")
                             $(memberStateId).attr('title',"부재중")
                           }else if (memberList[i].memberState == "4" ) {
                             $(memberStateId).attr('class',"mdi mdi-circle h3 text-secondary")
                             $(memberStateId).attr('title',"비접속")
                           } 
                           
                        //PM PL 상태체크  1PM 2PL 3member
                        var memberAuth = '#memberAuth'+i
                        var memberAuthName = '#memberAuthName'+i
                         if(memberList[i].proAuth == '1'){
                            $(memberAuth).attr('class','mdi mdi-check-decagram text-danger ms-1');
                            $(memberAuthName).text('PM')
                              }else if(memberList[i].proAuth == '2'){
                            $(memberAuth).attr('class','mdi mdi-check-decagram text-primary ms-1');
                            $(memberAuthName).text('PL')
                              }else if(memberList[i].proAuth == '3'){
                            $(memberAuthName).text('MEMBER')
                              }   
                           
//                         //기본이미지 사진
                        var memberImg = '#memberImg'+i
                         if(memberList[i].memberPic == '0'){
                            $(memberImg).attr('src','/resources/dist/assets/images/users/blank_progile.png');
                              }
                    }
                    
                    const subWorkerSelectBox = document.querySelector("#sub-worker");
                    subWorkerSelectBox.innerHTML = selectText;
                    
                    $("#sub-worker").select2({
                        dropdownParent: $('#topWork-detail-modal'),
                        placeholder: '하위 작업 담당자를 지정하세요.',
                        allowClear: true,
                        maximumSelectionLength: 1,
                    });
                    
                    $("#sub-worker").val([]).trigger('change');
                    $("#sub-worker").val([memberId]).trigger('change');
                }
            });
          //1. 로그
          let logURL = (detailMode == "TopWork") ? "/kanban/logList" : "/subWork/subWorkLogList";
          
          axios
            .post(logURL, workVO)
            .then((res) => {
                ////console.log(res.data); log 객체 리스트
                
                let tableText = ``;
                tableText += `<thead>`;
                tableText += `    <tr>`;
                tableText += `        <th>로그</th>`;
                tableText += `        <th>날짜</th>`;
                tableText += `    </tr>`;
                tableText += `</thead>`;
                tableText += `<tbody id="detail-topWorkLog">`;
                tableText += `</tbody>`;
                
                document.querySelector("#topWorkLogTable").innerHTML = tableText;
                
                //logTable.destroy();
                const logTable = $('#topWorkLogTable').DataTable({
                    destroy: true,
                    order: [[0, 'desc']],
                    ordering: true,
                    responsive:false,
                    //retrieve: true,
                    bAutoWidth: false,
                    bAutoHeigth: false,
                    //scrollX: true,
                    //scrollY: 380,
                    //scrollCollapse:true,
                    searching: false,
                    //paging: true,
                    destroy: true,
                    pageLength: 7,
                    lengthMenu: [5, 7, 10],
                    columnDefs: [
                        {width: 250, targets: 0},
                        {width: 40, targets: 1},
                    ],
                    //data: logList,
                    language: {
                        emptyTable: "로그 내역이 없습니다.",
                        lengthMenu: "_MENU_ 개씩 보기",
                        info: "총 _TOTAL_건",
                        infoEmpty: "데이터 없음",
                        infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
                        search: "",
                        zeroRecords: "일치하는 데이터가 없습니다.",
                        loadingRecords: "로딩중...",
                        processing: "잠시만 기다려 주세요.",
                        paginate: {
                          next: "다음",
                          previous: "이전",
                        },
                      },
                    
                });
                
                logTable.clear().draw();
                
                const logList = res.data;
                
                for (log of logList) {
                    console.log("log : ", log);
                    if (log.proLogContent.length > 16) {
                        log.proLogContent = log.proLogContent.substr(0,20) + "...";
                    }
                    
                    logTable.row.add([
                        `<td>\${log.proLogContent}</td>`,
                        `<td>\${log.proLogDate}</td>`
                    ]).draw(false);
                }
                
                    
                
                document.querySelector(".no-footer").style.width = "380px !important;"
            });
          
          //2-0. 본문 첨부파일 버튼
          renderWorkFileList();
          //2. 첨부파일 -> 우선 상위든 하위든 관련 자료 다 나오게. -> 팀원들과 협의 필요
          //<a href="resources/upload/filepath" download="리얼네임(확장자빼고)">
          let selectFileURL = (detailMode == "TopWork") ? "/selectFile" : "/selectFileSubWork";
          
          axios
            .post(selectFileURL, workVO)
            .then((res) => {
                //여기서 파일목록 조회
                //console.log("파일 테이블 조회 목록 : ", res);
                const fileTableArr = [];
                const fileList = res.data;
                
                let tableText = ``;
                tableText += `<thead>`;
                tableText += `    <tr>`;
                tableText += `        <th>관련된 파일</th>`;
                tableText += `        <th>타입</th>`;
                tableText += `    </tr>`;
                tableText += `</thead>`;
                tableText += `<tbody id="detail-fileTbody">`;
                tableText += `</tbody>`;
                
                document.querySelector("#topWorkFileTable").innerHTML = tableText;
                
                let fileTable = $('#topWorkFileTable').DataTable({
                    destroy: true,
                    order: [[1, 'asc']],
                    ordering: true,
                    responsive:false,
                    //retrieve: true,
                    bAutoWidth: false,
                    bAutoHeigth: false,
                    //scrollX: true,
                    //scrollY: 380,
                    //scrollCollapse:true,
                    searching: false,
                    //autoWidth: false,
                    //paging: true,
                    pageLength: 7,
                    lengthMenu: [5, 7, 10],
                    columnDefs: [
                        {width: 250, targets: 0},
                        {width: 40, targets: 1},
                    ],
                    //data: fileList,
                    language: {
                        emptyTable: "첨부된 파일이 없습니다.",
                        lengthMenu: "_MENU_ 개씩 보기",
                        info: "총 _TOTAL_건",
                        infoEmpty: "데이터 없음",
                        infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
                        search: "",
                        zeroRecords: "일치하는 데이터가 없습니다.",
                        loadingRecords: "로딩중...",
                        processing: "잠시만 기다려 주세요.",
                        paginate: {
                          next: "다음",
                          previous: "이전",
                        },
                      },
                    
                });
                
                fileTable.clear().draw();
                
                for (fileVO of fileList) {
                    fileVO.type = fileVO.fileRealName.split('.')[1];
                    let t = `<a href="/resources/upload/\${fileVO.filePath}" class="badge badge-soft-secondary fileLNo2-\${fileVO.fileLNo2}" download="\${fileVO.fileRealName.split('.')[0]}"><i class="mdi mdi-file-document-outline mdi-18px"></i> \${fileVO.fileRealName}</a>`
                    t += `<i onclick="fileTableDelete(this)" class="mdi mdi-close fileTable" style="display: none;"></i>`
                    fileVO.fileRealName = t;
                    
                    fileTable.row.add([
                        `<td>\${fileVO.fileRealName}</td>`,
                        `<td>\${fileVO.type}</td>`
                    ]).draw(false);
                }
            });
          //3. 관련 하위작업 (하위작업일땐 관련 상위 작업)
          let subWorkListURL = (detailMode == "TopWork") ? "/subWork/subWorkList" : "/kanban/topWorkDetail";
          
          axios
            .post(subWorkListURL, workVO)//item은 디테일 할 topWorkVo 혹은 subWorkVO
            .then((res) => {
                ////console.log("하위작업", res);
                const detailWorkList = document.querySelector("#detail-topWork-subWorkList");
                const workList = res.data;
                let subText = `하위 작업`;
                
                if (detailMode == "SubWork") {
                    subText = `<font class="jinoFont">상위 작업</font>`;
                    subText += `<button type="button" onclick="detailTopWork_K('\${topWorkNo}', 'changeTopWork')" style="width: 100%; text-align: left;"class="btn btn-outline-primary waves-effect waves-light">\${workList.topWorkTitle}</button>`
                    document.querySelector("#goTopWork").innerHTML = `<h2><a href="javascript: detailTopWork_K('\${topWorkNo}')">\${workList.topWorkTitle}</a> / </h2>`;

                } else { //상위작업일 경우
                    if (workList < 1) {
                        //하위작업이 없을 경우
                        subText += ` - 하위 작업이 없습니다.`;
                    } else {
                        //하위작업이 있을 경우
                        for (subWork of workList) {
                            subText += `<button type="button" onclick="detailTopWork_K('\${topWorkNo}', '\${subWork.subWorkNo}', 'change')" style="width: 100%; text-align: left;"class="btn btn-outline-primary waves-effect waves-light">\${subWork.subWorkTitle}</button>`;
                        }
                    }
                    
                }
                
                detailWorkList.innerHTML = subText;
            });
          //4. 댓글 플래그
          let comentURL = (detailMode == "TopWork") ? "/kanban/topWorkComentList" : "/subWork/subWorkComentList";
          axios
            .post(comentURL, workVO)
            .then((res) => {
                ////console.log(res);
                //const topWorkComentList = document.querySelector("#detail-topWorkComent");
                //const twComentList = res.data;
                const workComentList = document.querySelector("#detail-workComent");
                const comentList = res.data;
                
                //첨부파일 가져오기
                //for문으로 axios써야함
                let comentText = ``;
                if (comentList.length < 1) {
                    comentText = '작성된 댓글이 없습니다.';
                } else {
                    for (let i = 0; i < comentList.length; i++) { 
                        //4개정도 보여주기
                        if (i == 4) {
                            break;
                        }
                        
                        //console.log("댓글정보 : ", res.data); //comentList
                        let comentMap = {};
                        
                        if (detailMode == "TopWork") {
                            comentMap.key = "T"
                            comentMap.comentNo = comentList[i].twComentNo;
                        } else {
                            comentMap.key = "S"
                            comentMap.comentNo = comentList[i].swComentNo;
                        }
                        
                        let coment = comentList[i];
                        //console.log("코멘트 멤버 : ", coment);
                        if (detailMode == "TopWork") {
                            <!-- Story Box-->
                            comentText += `<div class="border border-0 p-2 mb-3">`;
                            comentText += `    <div class="d-flex align-items-start">`;
                            comentText += `        <img class="me-2 avatar-sm rounded-circle" src="\${coment.memberPic}" alt="Generic placeholder image">`;
                            comentText += `        <div class="w-100">`;
                            comentText += `            <h5 class="m-0">\${coment.memberId}</h5>`;
                            comentText += `            <p class="text-muted"><small>\${coment.twComentDate}</small></p>`;
                            comentText += `        </div>`;
                            comentText += `    </div>`;
                            comentText += `    <p><input type="text" class="twComent form-control" id="twComentInput-\${coment.twComentNo}" value="\${coment.twComentContent}" readonly/></p>`;
                            comentText += `    <div class="mt-2 comentFile c\${coment.twComentNo}"></div>`;
                            comentText += `    <div class="mt-2">`;
                            comentText += `        <a href="javascript: twComentUpdate('\${coment.twComentNo}','\${coment.topWorkNo}');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-file-document-edit"></i> 편집</a>`;
                            comentText += `        <a href="javascript: twComentDelete('\${coment.twComentNo}', '\${coment.topWorkNo}');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-delete"></i> 삭제</a>`;
                            comentText += `        <a href="javascript: btnComentFileAdd('\${coment.twComentNo}', '\${coment.topWorkNo}', 'TopWorkComent');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-file-plus-outline"></i> 파일 추가</a>`;
                            comentText += `    </div>`;
                            comentText += `</div>`;
                        } else {
                            //하위작업 댓글인 경우
                            <!-- Story Box-->
                            comentText += `<div class="border border-0 p-2 mb-3">`;
                            comentText += `    <div class="d-flex align-items-start">`;
                            comentText += `        <img class="me-2 avatar-sm rounded-circle" src="\${coment.memberPic}" alt="Generic placeholder image">`;
                            comentText += `        <div class="w-100">`;
                            comentText += `            <h5 class="m-0">\${coment.memberId}</h5>`;
                            comentText += `            <p class="text-muted"><small>\${coment.swComentDate}</small></p>`;
                            comentText += `        </div>`;
                            comentText += `    </div>`;
                            comentText += `    <p><input type="text" class="twComent form-control" id="swComentInput-\${coment.swComentNo}" value="\${coment.swComentContent}" readonly/></p>`;
                            comentText += `    <div class="mt-2 comentFile c\${coment.swComentNo}"></div>`;
                            comentText += `    <div class="mt-2">`;
                            comentText += `        <a href="javascript: swComentUpdate('\${coment.swComentNo}','\${coment.subWorkNo}');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-file-document-edit"></i> 편집</a>`;
                            comentText += `        <a href="javascript: swComentDelete('\${coment.swComentNo}', '\${coment.subWorkNo}');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-delete"></i> 삭제</a>`;
                            comentText += `        <a href="javascript: btnComentFileAdd('\${coment.swComentNo}', '\${coment.subWorkNo}', 'SubWorkComent');" class="btn btn-lg btn-link text-muted"><i class="mdi mdi-file-plus-outline"></i> 파일 추가</a>`;
                            comentText += `    </div>`;
                            comentText += `</div>`;
                        }
                        
                        
                    }
                    
                    if (comentList.length > 4) {
                        comentText += `<div>`;
                        
                        if (detailMode == "TopWork") {
                            comentText += `<button type="button" class="btn btn-primary btn-lg" onclick="twComentAddList('\${workVO.topWorkNo}')">남은 댓글 \${comentList.length - 4}개 보기</button>`;
                        } else {
                            comentText += `<button type="button" class="btn btn-primary btn-lg" onclick="twComentAddList('\${workVO.topWorkNo}', '\${workVO.subWorkNo}')">남은 댓글 \${comentList.length - 4}개 보기</button>`;
                        }
                        
                        comentText += `</div>`;
                    }
                }
                
                workComentList.innerHTML = comentText;
                
                return comentText;
            })
            .then((res) => {
                
                axios
                .post("/searchComentFile")
                .then((res) => {
                    //console.log("댓글자료들 목록 : ", res.data);
                    ////console.log("이건되것지", comentFileDivs);
                    const comentFileList = res.data;
                    let insertText = ``;
                    const comentFileDivs = document.querySelectorAll(".comentFile");
                    
                    for (let i = 0; i < comentFileList.length; i++) { //자료가 있는 댓글들 순회
                        //TopWork에서 작성된 댓글일 경우
                        ////console.log("fileComentNo : ", fileComentNo);
                        let fileComentNo = comentFileList[i].fileComentNo; //T,20 or S,20 이런식
                        let comentType = (detailMode == "TopWork") ? "T" : "S"; 
                        
                        
                        if (fileComentNo.split(",")[0] == comentType) { //굳이?
                            let targetComentNumber = fileComentNo.split(",")[1];
                            //이중 for문(div들 순회)
                            for (let j = 0; j < comentFileDivs.length; j++) {
                                let targetDivNumber = comentFileDivs[j].classList[2].substr(1);
                                
                                if (targetComentNumber == targetDivNumber) {
                                    
                                    let txt = ``;
                                    if (detailMode == "TopWork") {
                                        //상위작업 댓글일 경우
                                        txt += ` <a href="/resources/upload/\${comentFileList[i].filePath}" download="\${comentFileList[i].fileRealName.split('.')[0]}"`;
                                        txt += ` class="badge badge-soft-secondary i-\${comentFileList[i].fileLNo2}"><i class="mdi mdi-file-document-outline mdi-18px"></i> \${comentFileList[i].fileRealName}</a> `;
                                        txt += `<i onclick="comentFileDelete('\${comentFileList[i].fileLNo2}')" class="mdi mdi-close i-\${comentFileList[i].fileLNo2} itag-T\${comentFileList[i].fileLNo2} ix" style="display: none;"></i>`;
                                    } else {
                                        //하위작업 댓글일 경우
                                        txt += ` <a href="/resources/upload/\${comentFileList[i].filePath}" download="\${comentFileList[i].fileRealName.split('.')[0]}"`;
                                        txt += ` class="badge badge-soft-secondary i-\${comentFileList[i].fileLNo2}"><i class="mdi mdi-file-document-outline mdi-18px"></i> \${comentFileList[i].fileRealName}</a> `;
                                        txt += `<i onclick="comentFileDelete('\${comentFileList[i].fileLNo2}', 'SubWorkComent')" class="mdi mdi-close i-\${comentFileList[i].fileLNo2} itag-S\${comentFileList[i].fileLNo2} ix" style="display: none;"></i>`;
                                    }
                                    comentFileDivs[j].innerHTML += txt;
                                }
                            }
                        } 
                    }
                });
            });
            
          //차트그리기
          //차트 초기화 ㅋㅋ
          document.querySelector("#selectChart").innerHTML = `<canvas id="myChart"></canvas>`;
          
          //차트에 들어갈 데이터 -> 변경해야함
          //라벨은 데이터 건수
          let chartURL = (detailMode == "TopWork") ? "/kanban/logListChart" : "/subWork/subWorkLogList";
          axios
            .post(chartURL, workVO)
            .then((res) => {
                //차트에 쓸 데이터
                console.log("차트에쓰는 로그데이터", res.data);
                const chartLogList = res.data;
                const chartData = [];
                const dayList = [];
                
                if (chartLogList.length > 7) {
                    for (let i = (chartLogList.length - 7); i < chartLogList.length; i++) {
                        dayList.push(chartLogList[i].proLogDate);
                        chartData.push(chartLogList[i].proLogProgressNew);
                    }
                    
                } else{
                    for (logItem of chartLogList) {
                        dayList.push(logItem.proLogDate);
                        chartData.push(logItem.proLogProgressNew);
                        console.log("라벨즈로 쓸거 : ", dayList);
                        console.log("데이터로 쓸거 : ", chartData);
                    }
                }
                
                //chartData.splice(0,0,"0");
                console.log("데이터로 쓸거 : ", chartData);
                
                let datasetsArr = [];
                
                let datasets = {};
                datasets.label = "진행률(%)";
                datasets.data = chartData;
                datasets.borderColor = "skyblue";
                datasets.backgroundColor = "blue";
                datasets.fill = false;
                datasets.tension = 0.5;
                datasets.pointStyle = 'circle';
                datasets.pointRadius = "4";
                datasets.pointHoverRadius = "7";
                datasets.pointHoverBackgroundColor = "#FC96FA";
                
                datasetsArr.push(datasets);
                
                const totalData = {
                  labels: dayList,
                  datasets: datasetsArr,
                }
                
              var context = document.getElementById('myChart').getContext('2d');
              var myChart = new Chart(context, {
                 type: 'line',
                 data: totalData,
                 options: {
                     maintainAspectRatio: false,
                     title: {
                         display: true,
                         text: "최근 7일 진행률 변화",
                     },
                     scales: {
                         yAxes: [{
                             ticks: {
                                 display: true,
                                 min: 0,
                                 max: 100,
                                 stepSize: 20,
                             },
                         }],
                     },
                     legend: {
                        display: false 
                     },
                     tooltips: {
                         callbacks: {
                             labe: function(tooltipItem, data) {
                                 return tooltipItem.yLabel.toString() + "%"; 
                             },
                          style: {
                        	  fontSize: '20px',
                          },
                         }
                     },
                     animation: {
                        
                     },
                 }
              });
              
              //하위작업일 경우 차트
              if (detailMode == "SubWork") {
                  //console.log("그냥찌르기 : ", workVO);
                  
                  axios
                    .post("/kanban/topWorkDetail", workVO)
                    .then((res) => {
                      const topWorkVO = res.data;
                      document.querySelector("#selectChart").innerHTML = `<div id="subWorkChart"></div>`;
                      
                      var options = {
                              chart: {
                                  height: '100%',
                                  type: 'radialBar',
                              },
                              series: [topWorkVO.topWorkProgress],
                              labels: [topWorkVO.topWorkTitle],
                            }
                      
                      const subWorkChart = document.querySelector("#subWorkChart");
                      const subChart = new ApexCharts(document.querySelector("#subWorkChart"), options);
                      subChart.render();
                    });
                  
              }
              
            });
          
          //모달 토글(조건문없으면 댓글 접을때 닫혀버림)
          if (document.querySelector("#topWork-detail-modal").className == "modal fade") {
              detailModalToggle_K();
          }
      });
    
}//디테일 함수 끝

//김진호
//1. 전체 멤버리스트로 받기 -> 2. 초대 완성되면 해당 프로젝트 참가인원만 받기
renderWorkerList_K(proNo);
//김진호
//해당 프로젝트 참가인원 불러온 후 작업생성 셀렉트태그에 옵션태그 그려주는 함수
function renderWorkerList_K(proNo) {
    const workerList = document.querySelector("#event-worker");
    const proVO = {
      proNo,    
    };
    ////console.log("워커리스트 : ", workerList);
    axios
      .post("/project/memberList", proVO)
      .then((res) => {
         const memberList = res.data;
         //console.log("멤버리스트 : ", memberList);
         let text = "";
         
         text += ``;
         for (item of memberList) {
             text += `<option value="\${item.memberId}">\${item.memberName}(\${item.memberId})</option>`;
         }
         
         workerList.innerHTML = text;
         
      });
}

//김진호
//칸반에서 프로젝트 or 개인 선택시 실행되는 함수
function modeChange(arg) {
    mode = arg;
    kanbanRender(arg);
}

 
function topWorkUpdate() { //안씀
    const obj = {};
    obj.proNo = proNo;
    obj.topWorkNo = document.querySelector("#topWorkNo-detail").value;
    obj.topWorkTitle = document.querySelector("#detail-title").value;
    obj.topWorkContent = document.querySelector("#detail-content").value;
    obj.topWorkStart = document.querySelector("#topWorkStart-detail").value.replace(" ", "T");
    obj.topWorkEnd = document.querySelector("#topWorkEnd-detail").value.replace(" ", "T");
    obj.twCategoryNo = document.querySelector("#detail-select-category").value;
    
    // ojh 오지형  상위작업 변경시 해당 파일 추가나, 상위작업 이름변경  0106
    ////console.log("업데이트 오지형 데이터 :",obj);
 
    axios
      .post("/kanban/topWorkUpdate", obj)
      .then((res) => {
          ////console.log(res);
          //디테일에서 업데이트 성공 -> 모달 닫고 렌더링
          detailModalClose();
          kanbanRender();
          topworkUpdate_O(obj); //ojh 수정할시 진짜 폴더랑 이름 수정 
      });
}

//OJH  상위작업 변경시 해당 파일 추가나, 상위작업 이름변경  0106
function topworkUpdate_O(obj){
    //OJH
    $.ajax({
        url : '/topworkUpdate_O',
        method : 'POST',
        dataType : 'text',
        contentType: "application/json; charset=UTF-8",
        data : JSON.stringify(obj),
        success : function(res){
            //console.log(res);
        }
    });
}                              

//김진호
//작업 삭제 함수로 분류해서 보내주는 함수.
function workDelete() {
    Swal.fire({
          title: '정말 삭제하시겠습니까?',
          text: "삭제된 데이터는 복구되지 않습니다.",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '네, 삭제하겠습니다.',
          cancelButtonText: '취소'
        }).then((result) => {
          if (result.isConfirmed) {
              const detailMode = document.querySelector("#hidden-workMode").value;
              //console.log("detailMode", detailMode);
              
              if (detailMode == "TopWork") {
                topWorkDelete();
              } else {
                subWorkDelete();
              }
              
          }
        });
}

//김진호
//하위작업 삭제 함수 (실제 db 삭제 안하고 상태값 변경)
function subWorkDelete() {
    const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    const subWorkNo = document.querySelector("#hidden-subWorkNo").value;
    
    const subWorkVO = {
      subWorkNo,
      topWorkNo,
    }
    
    axios
      .post("/subWorkFileDelete", subWorkVO)
      .then((res) => {
          
      });
    //하위작업 F->T로 변경
    axios
      .post("/subWork/subWorkDelete", subWorkVO)
      .then((res) => {
        //리턴값은 topWorkNo
        //하위 삭제하면 상위 상세페이지 보여주기
        Swal.fire({
              icon: 'success',
              title: '삭제 완료',
              text: '작업이 삭제되었습니다!',
        });
        
        detailTopWork_K(topWorkNo);
      });
}

//김진호
//상위작업 삭제 함수 (실제 db 삭제 안하고 상태값 변경)
function topWorkDelete() {
    const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
    
    const obj = {};
    obj.topWorkNo = topWorkNo;
    
        //console.log(obj);
        //OJH 상위작업 삭제시 해당하는 파일 삭제여부 설정하기 
        //하위도 지우는 로직 추가해야함
        $.ajax({
            url : '/topWorkDelFile',
            method : 'POST',
            data : {topWorkNo : obj.topWorkNo},
            dataType : 'text',
            success : function(result){
                //console.log(result);
            }
        });
    
    axios
      .post("/kanban/topWorkDelete", obj)
      .then((res) => {
          //디테일에서 삭제 성공 -> 모달 닫고 렌더링
          //detailModalClose();
          //kanbanRender();
          //pageTap(currentTap_PH_K);
          //모달 토글 및 칸반 렌더?
          Swal.fire({
            icon: 'success',
            title: '삭제 완료',
            text: '작업이 삭제되었습니다!',
          });
          
          detailModalToggle_K();
          //console.log("currentTap_PH_K", currentTap_PH_K);
          
          if (currentTap_PH_K == "kanban") {
            kanbanRender('project');
          }
          
          if (currentTap_PH_K == "calendar") {
            calendarRender_C_K('project');
          }
      });
    
}

//김진호
//카테고리 생성시 색상 코드 변경 함수
function selectColor(color) {
  ////console.log(color);
  document.querySelector(
    "#dropdownMenuButton"
  ).className = `btn btn-\${color} dropdown-toggle`;
  const selected = `.color-\${color}`;
  const fontColor = document.querySelector(selected).innerText;
  document.querySelector("#dropBox-name").innerText = fontColor;

  //카테고리 추가시 색상코드 같이 보내기주기위한 색상값 저장
  ////console.log(color.toUpperCase());
  let saveColor = "";
  if (color.toUpperCase() == "LIGHT") saveColor = COLORS.LIGHT;
  if (color.toUpperCase() == "PRIMARY") saveColor = COLORS.PRIMARY;
  if (color.toUpperCase() == "SUCCESS") saveColor = COLORS.SUCCESS;
  if (color.toUpperCase() == "INFO") saveColor = COLORS.INFO;
  if (color.toUpperCase() == "WARNING") saveColor = COLORS.WARNING;
  if (color.toUpperCase() == "DANGER") saveColor = COLORS.DANGER;
  if (color.toUpperCase() == "DARK") saveColor = COLORS.DARK;
  if (color.toUpperCase() == "PURPLE") saveColor = COLORS.PURPLE;
  if (color.toUpperCase() == "PINK") saveColor = COLORS.PINK;
  if (color.toUpperCase() == "SECONDARY") saveColor = COLORS.SECONDARY;

  document.querySelector("#dropBox-colorCode").value = saveColor;
  ////console.log(document.querySelector("#dropBox-colorCode"));
}

//김진호
//카테고리 생성시 색상 코드 변경 함수
function selectColorUpdate(color) {
  ////console.log(color);
  document.querySelector(
    "#dropdownMenuButton-update"
  ).className = `btn btn-\${color} dropdown-toggle`;
  const selected = `.updateColor-\${color}`;
  const fontColor = document.querySelector(selected).innerText;
  document.querySelector("#dropBox-name-update").innerText = fontColor;

  
  //카테고리 추가시 색상코드 같이 보내기주기위한 색상값 저장
  ////console.log(color.toUpperCase());
  let saveColor = "";
  if (color.toUpperCase() == "LIGHT") saveColor = COLORS.LIGHT;
  if (color.toUpperCase() == "PRIMARY") saveColor = COLORS.PRIMARY;
  if (color.toUpperCase() == "SUCCESS") saveColor = COLORS.SUCCESS;
  if (color.toUpperCase() == "INFO") saveColor = COLORS.INFO;
  if (color.toUpperCase() == "WARNING") saveColor = COLORS.WARNING;
  if (color.toUpperCase() == "DANGER") saveColor = COLORS.DANGER;
  if (color.toUpperCase() == "DARK") saveColor = COLORS.DARK;
  if (color.toUpperCase() == "PURPLE") saveColor = COLORS.PURPLE;
  if (color.toUpperCase() == "PINK") saveColor = COLORS.PINK;
  if (color.toUpperCase() == "SECONDARY") saveColor = COLORS.SECONDARY;

  document.querySelector("#dropBox-colorCode-update").value = saveColor;
  ////console.log(document.querySelector("#dropBox-colorCode"));
}

function categoryUpdatePK(twCategoryNo) {
  //수정버튼 클릭시 인풋히든에 pk 세팅
  ////console.log("피케이", twCategoryNo);
  document.querySelector("#dropBox-twCategoryNo-update").value = twCategoryNo;
  
}

//김진호
//카테고리 수정 함수
function categoryUpdate() {
  //수정하기 버튼 클릭시 세팅 및 전송
  const twCategoryName = document.querySelector(
    "#category-name-update"
  ).value;
  //console.log("twCategoryName",twCategoryName);
  const twCategoryColor = document.querySelector(
    "#dropBox-colorCode-update"
  ).value;
  const twCategoryNo = document.querySelector(
    "#dropBox-twCategoryNo-update"
  ).value;
  //업데이트 객체 세팅
  const obj = {
    twCategoryName,
    twCategoryColor,
    twCategoryNo,
    proNo,
  };
  
  // 오지형  카테고리 이름 수정시 폴더 이름 변경 
  //console.log("카테고리 이전이름 :", beforeCategory);
  //console.log("카테고리 수정이름 :", twCategoryName);
  //console.log("프로젝트 번호 : ", proNo);
  const fileobj_O = {
          "beforeCategory" : beforeCategory,
          "updateCategory" : twCategoryName,
          "proNo" : proNo,
          'twCategoryNo' : twCategoryNo
  } 
  
   $.ajax({
      url : "/updateCategoryFileLocation",
      type : "POST",
      data : fileobj_O,
      success : function(result){
          ////console.log(result);
      }
  }); // end of ajax
  
  ////console.log(obj);
  //업데이트 전송
  axios.post("/kanban/categoryUpdate", obj).then((res) => {
    ////console.log("카테고리 업데이트 성공");
    kanbanRender();
    categoryUpdateModalClose();
  });
}

//피커
//서브작업 생성시 날짜 범위를 그냥 쓰면 메인작업기간이 24시간일 경우 하위작업 생성이 불가해서
//시작일에서 -1일 해줘야한다.
//매개변수는 상위작업의 시작일을 받음
//리턴값은 시작일 -1일
function makeStartDay(arg) {
    let arg1 = arg.split(" ")[0];
    let arg2 = arg.split(" ")[1];
    let day = Number(arg1.split("-")[2]) - 1; //시작일 - 1
    
    if (day == 0) day = 1;

    if (day < 10) {
      arg1 = `\${arg1.split("-")[0]}-\${arg1.split("-")[1]}-0\${day} \${arg2}`;
    } else {
      arg1 = `\${arg1.split("-")[0]}-\${arg1.split("-")[1]}-\${day} \${arg2}`;
    }
    
    return arg1;
}

//makeInsertTopWorkFlatPickr
//makeDetailTopWorkFlatPickr
//makeInsertSubWorkFlatPickr
//김진호
//상위작업 생성시 플랫피커 생성 함수
function makeInsertTopWorkFlatPickr(startDay, endDay) {
	makeStartDay(startDay);
	
    var fp = flatpickr(document.getElementById("birth"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    enable: [
        {
            from: startDay,
            to  : endDay,
        }
    ],
    });
    var fp2 = flatpickr(document.getElementById("birth2"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    enable: [
        {
            from: startDay,
            to  : endDay,
        }
    ],
    });
}

//김진호
//상위작업 생성시 플랫피커 세팅 함수
function settingInsertFlatPickr() {
    const startDay = document.querySelector("#birth").value;
    
    var fp2 = flatpickr(document.getElementById("birth2"), {
        //'monthSelectorType' : 'static',
        locale: "ko",
        enableTime: "true",
        enable: [
            {
                from: startDay,
                to  : currentProEndDay,
            }
        ],
        });
}

//김진호
//상위작업 상세보기시 플랫피커 생성 함수
function makeDetailTopWorkFlatPickr(startDay, endDay) {
    var topStart = flatpickr(document.getElementById("detail-WorkStart"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    enable: [
        {
            from: startDay,
            to  : endDay,
        }
    ],
    });
    var topEnd = flatpickr(document.getElementById("detail-WorkEnd"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    enable: [
        {
            from: startDay,
            to  : endDay,
        }
    ],
    });
}

//김진호
//상위작업 상세보기시 플랫피커 세팅 함수
function settingDetailFlatPickr() {
    const startDay = document.querySelector("#detail-WorkStart").value;
    var topEnd = flatpickr(document.getElementById("detail-WorkEnd"), {
        //'monthSelectorType' : 'static',
        locale: "ko",
        enableTime: "true",
        enable: [
            {
                from: startDay,
                to  : currentProEndDay,
            }
        ],
        });
}

//김진호
//하위작업 생성시 플랫피커 생성 함수
function makeInsertSubWorkFlatPickr(startDay, endDay) {
	console.log("하위 선택 가능일 : ", startDay, endDay);
	//시작일 선택시에 startDay에서 하루 빼야함.
	startDay = makeStartDay(startDay);
	console.log("함수 통과 후 하위 선택 가능일 : ", startDay, endDay);
	
    var subStart = flatpickr(document.getElementById("subStart"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    enable: [
        {
            from: startDay,
            to  : endDay,
        }
    ],
    });
    var subEnd = flatpickr(document.getElementById("subEnd"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    enable: [
        {
            from: startDay,
            to  : endDay,
        }
    ],
    });
}

//김진호
//하위작업 생성시 플랫피커 세팅 함수
function settingSubWorkFlatPickr() {
    ////console.log("상위작업 종료일 : ", document.querySelector("#detail-WorkEnd").value);
    const startDay = document.querySelector("#subStart").value;
    const endDay = document.querySelector("#detail-WorkEnd").value;
    var subEnd = flatpickr(document.getElementById("subEnd"), {
        //'monthSelectorType' : 'static',
        locale: "ko",
        enableTime: "true",
        enable: [
            {
                from: startDay,
                to  : endDay,
            }
        ],
        });
}

//인서트용 모달
var btnInsertModalClose = document.querySelector("#btnModalClose");
var btnInsertModalReset = document.querySelector("#btn-reset-event");
var btnInsertModalSave = document.querySelector("#btn-save-event");

//김진호
//인서트용 모달 오픈 함수
function insertModalOpen_New(twCategoryNo, calendarMode) {
	$("#event-worker").val([]).trigger('change');
	$("#event-worker").val([memberId]).trigger('change');
    const vo = {
      twCategoryNo,
    };
    
    axios
      .post("/kanban/categorySelect", vo)
      .then((res) => {
         ////console.log(res);
         const twCategoryVO = res.data;
         
         insertModalReset(calendarMode);
         //카테고리는 채워넣기
         document.querySelector("#event-select-category").value = twCategoryVO.twCategoryName;
         document.querySelector("#event-hidden-category").value = twCategoryVO.twCategoryNo;
         
         insertModalQuillRender();
         
         document.querySelector("#btnWorkInsertModal").click();
      });
}

//김진호
//인서트 모달 닫기 함수
var insertModalClose = () => {
	//닫기 전 값 초기화해주기 필요
	document.querySelector("#event-modal").classList.remove("show");
	document.querySelector("#event-modal").style.display = "none";
	//닫을때 입력된 데이터 날려버리기
	insertModalReset();
};

//김진호
//인서트 모달 닫기 전 내용 비워주는 함수
var insertModalReset = (calendarMode) => {
	document.querySelector("#event-title").value = "";
	
	if (!calendarMode) { //달력일땐 안지움
	    document.querySelector("#birth").value = "";
	    document.querySelector("#birth2").value = "";
	} else {
	    $("#contextMenu")
	    .removeClass("contextOpened")
	    .css({
	      display: "none",
	    });
	}
	document.querySelector("#event-file").value = "";
};

//김진호
//인서트모달 닫기버튼 이벤트 리스터
btnInsertModalClose.addEventListener("click", () => {
	const workerDiv = document.querySelector("#event-worker");
	insertModalClose();
});

//최초 상위작업 생성모달에서만 실행. (칸반 & 캘린더)
btnInsertModalSave.addEventListener("click", (event) => {
    const topWorkTitle = document.querySelector("#event-title").value;
    const topWorkContent = document.querySelector(".ql-editor").innerHTML;
    const twCategoryNo = document.querySelector("#event-hidden-category").value;
    const topWorkStart = document.querySelector("#birth").value.replace(" ", "T");
    const topWorkEnd = document.querySelector("#birth2").value.replace(" ", "T");
    const selectMemberList = document.querySelector("#event-worker").selectedOptions;
    
    //멤버 선택했는지 안했는지
    if (selectMemberList.length == 0) {
    	Swal.fire({
            icon: 'error',
            title: '작업자 선택안됨',
            text: '작업자를 선택해 주세요!',
          });
          
          return;
    }
    
    //제목 입력했는지 유효성 체크
    if (!topWorkTitle) {
        //알러트 뜰 곳
        Swal.fire({
          icon: 'error',
          title: '제목 없음',
          text: '제목을 입력해 주세요!',
        });
        
        return;
    }
    
    //작업자 선택했는지
    //날짜 선택했는지 유효성 체크
    if (!topWorkStart || !topWorkEnd) {
        //알러트 뜰 곳
        Swal.fire({
          icon: 'error',
          title: '기간 설정 없음',
          text: '시작일과 종료일을 설정해 주세요!',
        });
        
        return;
    }
    
    function insertFile(topWorkNo){
        // 일감생성하기 시 처리되는 파일  01/02 오지형
        var formData_O = new FormData();
        //const inputFile = document.querySelector("#event-file");
        var inputFile = $("input[name='uploadFileAjax']");
        ////console.log("inputFile : ", inputFile); // <input type="file"> tag
        var files = inputFile[0].files;
        
        if (files.length == 0) {
            return;
        }
    
        for(var i = 0; i < files.length; i++){
            formData_O.append("uploadFile",files[i]);   
         }
        
        
        var twCategoryName = document.querySelector("#event-select-category").value;
        var topWorkTitle_O = document.querySelector("#event-title").value;
        var twCategoryNo_O = document.querySelector("#event-hidden-category").value;
        ////console.log("twCategoryName",twCategoryName);
        var userEmail_O = localStorage.getItem("id");
        //var mode = document.querySelector("#hidden-topWorkNo").value;
        let jsonData = JSON.stringify({ projectId: proNo, 
                                        categoryName :twCategoryName,
                                        topWorkTitle : topWorkTitle_O,
                                        twCategoryNo : twCategoryNo_O,
                                        topWorkNo : topWorkNo,
                                        mode: "TopWork",
                                        userEmail_O : userEmail_O,
                                        uploader: memberId,
                                    });
        
        //console.log("파일 jsonData :", jsonData);
        
        formData_O.append("jsonData", jsonData);    
    
        $.ajax({
            url : '/uploadAjaxAction',
            processData : false,
            contentType : false,
            data : formData_O,
            type : 'POST',
            dataType : 'json',
            success : function(result){
                ////console.log("origin result",result);
            }
        }); // end of ajax 
        //console.log("원하는데이터 :", topWorkNo);
    }
    
    const obj = {
      topWorkTitle,
      topWorkContent,
      twCategoryNo,
      topWorkStart,
      topWorkEnd,
      proNo,
    };
    
    let topWorkNo = "";
    axios.post("/kanban/insert", obj)
    .then((response) => {
      ////console.log("new topWorkNo : ", response.data);
      topWorkNo = response.data;
      //console.log("인서트시 넘버 : ", topWorkNo);
      insertFile(topWorkNo);
      pageTap(currentTap_PH_K); //탭을 다시 불러오는 식으로 리렌더링..
      document.querySelector("#btnWorkInsertModal").click();
      
      //알람
      //작업 부여된 멤버리스트
      //selectMemberList
      for (selectMember of selectMemberList) {
          //console.log("selectMember : ", selectMember);
          const dataObj = {
            proNo,
            topWorkNo,
          };
          
          updateAlarm(memberId, "TopWorkInsertAlarm", selectMember.value, dataObj);
          //data = proNo, 
      }
    })
    .then((res) => { //인서트 됐으면 관계테이블에 인서트
        //멤버가 여러명일 수 있으니 반복문으로
        for (member of selectMemberList) {
          const topWorkRelationVO = {}; 
          ////console.log("선택된 멤버 : ", member.value);
          topWorkRelationVO.memberId = member.value;
          topWorkRelationVO.topWorkNo = topWorkNo;
          
          axios
            .post("/kanban/topWorkRelationInsert", topWorkRelationVO)
            .then((res) => {
                //성공
                ////console.log("다중멤버:", res.data);
            });
        }
    });
}); //endof modalOpen

//카테고리 모달(인서트)
var btnCategoryModalCansel = document.querySelector("#category-cancel");

var categoryModalOpen = () => {
	document.querySelector("#info-alert-modal").classList.add("show");
	document.querySelector("#info-alert-modal").style.display = "block";
};

var categoryModalClose = () => {
	document.querySelector("#category-name").value = "";
	document.querySelector("#info-alert-modal").classList.remove("show");
	document.querySelector("#info-alert-modal").style.display = "none";
};
//카테고리 모달(업데이트)
var categoryUpdateModalOpen = () => {
	const twCategoryNo = document.querySelector("#dropBox-twCategoryNo-update").value;
	const targetCategoryDiv = document.querySelector(`#clickCategoryTarget-\${twCategoryNo}`);
	const targetDivColor = targetCategoryDiv.children[1].classList[1];
	console.log("twCategoryNo", twCategoryNo, "targetDivColor", targetDivColor);
	
	if (targetDivColor == COLORS.LIGHT)     selectColorUpdate('light'); 
	if (targetDivColor == COLORS.PRIMARY)   selectColorUpdate('primary');
	if (targetDivColor == COLORS.SUCCESS)   selectColorUpdate('success');
	if (targetDivColor == COLORS.INFO)      selectColorUpdate('info');
	if (targetDivColor == COLORS.WARNING)   selectColorUpdate('warning');
	if (targetDivColor == COLORS.DANGER)    selectColorUpdate('danger');
	if (targetDivColor == COLORS.DARK)      selectColorUpdate('dark');
	if (targetDivColor == COLORS.PURPLE)    selectColorUpdate('purple');
	if (targetDivColor == COLORS.PINK)      selectColorUpdate('pink');
	if (targetDivColor == COLORS.SECONDARY) selectColorUpdate('secondary');
	
	beforeCategory = event.target.parentNode.parentNode.parentNode.children[0].innerText; // 수정전 카테고리 저장 
	document.querySelector("#category-name-update").value = beforeCategory;
	//console.log("befortCategory : ", beforeCategory);
	
	document.querySelector("#category-update-modal").classList.add("show");
	document.querySelector("#category-update-modal").style.display = "block";
};
var categoryUpdateModalClose = () => {
	document.querySelector("#category-name-update").value = "";
	document.querySelector("#category-update-modal").classList.remove("show");
	document.querySelector("#category-update-modal").style.display = "none";
};

var categoryModalInsert = () => {
      const twCategoryName = document.querySelector("#category-name").value;
      const twCategoryColor = document.querySelector("#dropBox-colorCode").value;
      ////console.log(twCategoryName);
      ////console.log("인서트시 컬러", twCategoryColor);

      const obj = {
        twCategoryName,
        twCategoryColor,
        proNo,
      };

      axios.post("/kanban/categoryInsert", obj).then((response) => {
        ////console.log(response);
        kanbanRender();
        categoryModalClose();
        //updateSelectBar();
      });
    };

//김진호
//상위작업 제목 변경 함수
function changeTitle() {
    const SearchProNo = URLSearch.get("proNo");
    const SearchTopWorkNo = URLSearch.get("topWorkNo");
    const SearchProNoticeNo = URLSearch.get("proNoticeNo");
    
    if (SearchProNo == null) {
        return;
    }
    
    proNo = SearchProNo;
    
    //console.log("SearchTopWorkNo", SearchTopWorkNo);
    if (SearchTopWorkNo != null) {
        ////console.log("왜 이거안해");
        detailTopWork_K(SearchTopWorkNo);
        history.replaceState(null, null, '?proNo=' + proNo);
    }
    
    if (SearchProNoticeNo != null) {
        pageTap('projectNotice');
        history.replaceState(null, null, '?proNo=' + proNo);
    }
    
    
    //프로젝트 기간 찾아오기
    const projectVO = {
      proNo,
    };
    
    axios
      .post("/project/getProjectPeriod", projectVO)
      .then((res) => {
          ////console.log("프로젝트 기간 : ", res);
          const projectVO = res.data;
          currentProStartDay = projectVO.proStart;
          currentProEndDay = projectVO.proEnd;
          //타이틀 변경
          document.title = "프로젝트 : " + projectVO.proName;
          
          makeInsertTopWorkFlatPickr(currentProStartDay, currentProEndDay);
          makeDetailTopWorkFlatPickr(currentProStartDay, currentProEndDay);
          //makeInsertSubWorkFlatPickr()
      });
}

//김진호
//파라미터(이동 전, 후 카테고리 정보)로 로그 테이블에 인서트 하는 함수.
function logInsert(map) {
      axios.post("/kanban/logInsert", map).then((res) => {
        ////console.log(res);
      });
    }



//김진호
//상위작업 인서트 모달 퀼 에디터 렌더링 함수
function insertModalQuillRender() {
    document.querySelector("#quillContainer2").innerHTML = `<div id="contentDiv2"></div>`;
    
    var toolbarOptions = [
        ['bold', 'underline'],        // toggled buttons
        ['blockquote', 'code-block'],

        [{ 'header': 1 }, { 'header': 2 }],               // custom button values
        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
        //[{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
        //[{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
        [{ 'direction': 'rtl' }],                         // text direction

        //[{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

        [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
        //[{ 'font': [] }],
        //[{ 'align': [] }],

        //['clean']                                         // remove formatting button
      ];
    
    var quill = new Quill("#contentDiv2", {
        theme: 'snow',
        modules: {
          toolbar: toolbarOptions,
          syntax: true,
        },
        placeholder: '내용을 입력하세요..',
    });
    
    $("#toolbar").append($(".ql-toolbar"));
}

//김진호
//하위작업 인서트 모달 퀼 에디터 렌더링 함수
function insertSubWorkModalQuillRender() {
    //초기화
    document.querySelector("#subwork-quillContainer").innerHTML = `<div id="subwork-contentDiv"></div>`;
    
    var toolbarOptions = [
        ['bold', 'underline'],        // toggled buttons
        ['blockquote', 'code-block'],

        [{ 'header': 1 }, { 'header': 2 }],               // custom button values
        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
        //[{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
        //[{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
        [{ 'direction': 'rtl' }],                         // text direction

        //[{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

        [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
        //[{ 'font': [] }],
        //[{ 'align': [] }],

        //['clean']                                         // remove formatting button
      ];
    
    var quill = new Quill("#subwork-contentDiv", {
        theme: 'snow',
        modules: {
          toolbar: toolbarOptions,
          syntax: true,
        },
        placeholder: '내용을 입력하세요..',
    });
    
    $("#toolbar").append($(".ql-toolbar"));
}
 
///////////////////////////////////////////////////////////////////////////
///칸반 - 시작
///////////////////////////////////////////////////////////////////////////
//kanban();

function kanbanRenderComplete_K() {
    kanbanRender('complete');
}
//기본 칸반조회는 프로젝트로 설정
//kanbanRender('project'); 
//개인 칸반 
function kanbanRenderPersonal_K() {
    //작업 상태별로 새롭게 그려줘야함
    //필요한 파라미터 - proNo, memberId
    //카테고리 -> 고정된 카테고리.
    //작업 -> 조회할 테이블 - TOPWORK_RELATION (TOPWORK와 조인)
    //개인전용카테고리 불러와서 그리기 -> 이동시에 카테고리가 바뀌는게 아니라 상태값이 바뀜.
    //-> 첨에 작업 뿌려줄때 상태값에 따라 뿌리기(0, 1, 2)
    const obj = {
      proNo,
      memberId,
    };
    
    axios
      .post("/kanban/categoryPersonal")
      .then((res) => {
         ////console.log(res); 해당 프로젝트 내에서 나로 배정된 작업만 가져옴
        const json = res.data;
        //console.log("개인카테고리 : ", res.data);
        
        //let text = '<div class="col-xl-10">';
            let text = '<div class="card-body">'; //이렇게 그리는 부분은 함수로 빼서 돌려쓰기
            text += `<div class="row" style="flex-wrap: nowrap; min-height: 670px;">`;
            text += `  <div class="col-lg-2" id="kanbanLeftBar">`;
            text += '  </div>';
            text += '<div class="parent col-lg-10">';
            
            for (item of json) {
                text += `<div style="margin: 10px;" class="categoryDiv" id="clickCategoryTarget-\${item.twCategoryNo}">`;
                text += `       <div class="filtered row" style="border-left: 10px solid \${item.twCategoryColor}; border-bottom: 5px solid #E6EAF3; margin: 10px;">`;
                //네임태그
                text += `<div class="col-lg-11 jino-em-b" style="overflow: auto;" >`;
                if (item.twCategoryNo == 0) text += `배정된 작업`;
                if (item.twCategoryNo == 1) text += `진행중인 작업`;
                if (item.twCategoryNo == 2) text += `승인대기 작업`;
                if (item.twCategoryNo == 3) text += `반려 / 수정요청 작업`;
                text += `</div>`;
                text += `</div>`;
              
                text += `<div class="container \${item.twCategoryColor} state-\${item.twCategoryNo}"`;
                text += ` id="category-\${item.twCategoryNo}">`;
                text += `</div>`;
                text += '</div>';
            }
         
            text += '</div>';
            text += '</div>';
           
           document.querySelector(".spa").innerHTML = text;
           //정렬
           document.querySelector(".parent").style.justifyContent = "center";
           kanbanLeftBarRender('personal');
           
           axios
             .post("/kanban/topWorkMyList", obj)
             .then((res) => {
                 //console.log("개인칸반의 작업들 : ", res.data);
                 const json1 = res.data;
                  let text1 = "";
                  for (item of json1) {
                    const endDay = item.topWorkEnd.split("T")[0];
                    let today = new Date();
                    
                    //console.log(item.topWorkTitle);
                    text1 = "";
                    text1 += `<div class="table-responsive draggable jino-17" onclick="detailTopWork_K(\${item.topWorkNo})" id="\${item.topWorkNo}" style="margin: 10px;">`;
                    text1 += `  <table class="table table-borderless mb-0" id="tableColor-\${item.topWorkNo}">`;
                    
                    if (item.topWorkState == 3) {
                      text1 += `      <thead class="table-danger \${item.twCategoryNo}">`;
                    } else {
                      text1 += `      <thead class="table-light \${item.twCategoryNo}">`;
                    }
                    
                    text1 += `          <tr>`;
                    text1 += `              <th style="border-bottom: 1px solid gray;" class="th-\${item.topWorkNo}">\${item.topWorkTitle}</th>`;
                    text1 += `          </tr>`;
                    
                    if (item.topWorkState == 3 || today > new Date(endDay)) {
                      text1 += `      <tbody class="table-danger">`;
                    } else {
                      text1 += `      <tbody class="table-light">`;
                    }
                    
                    text1 += `          <tr>`;
                    
                    if (today > new Date(endDay)) {
                      text1 += `              <td><i class="mdi mdi-update"></i>  \${item.topWorkEnd.replace("T", " ")}</td>`;
                    } else {
                      text1 += `              <td><i class="mdi mdi-update mdi-spin"></i>  \${item.topWorkEnd.replace("T", " ")}</td>`;
                    }
                    
                    text1 += `          </tr>`;
                    text1 += `      </tbody>`;
                    text1 += `  </table>`;
                    text1 += `</div>`;
                  
                    //개인보드는 상태별로 분류하므로 상태로 카테고리 아이디 잡아주면 딱 맞음.
                    let categoryId = "#category-" + item.topWorkState;
                    //console.log("categoryId ", categoryId);
            
                    //원하는 위치에 인서트해주는(append처럼) 메소드 insertAdjacentHTML(위치, 문자열)
                    ////console.log("카테고리디브없다구?", document.querySelector(categoryId)); db..필요한정보만가져와야함
                    if (item.topWorkState != "4") {
                     //console.log("그려질 태그 : ", document.querySelector(categoryId));
                     document.querySelector(categoryId).innerHTML += text1;
                     //console.log("뭐야대체 : ", document.querySelector(`#tableColor-\${item.twCategoryNo}`));
                     document.querySelector(`#tableColor-\${item.topWorkNo}`).style.borderLeft = "10px solid " + document.querySelector(categoryId).classList[1];
                    }
                  }
             })
             .then((res) => {
                //일단 컬러코드 적용을 억지로라도 해보기
                 //1. thead클래스를 전부 가져온다
                 //2. 클래스명과 pk가 일치하면 색상코드를 넣어준다.
                 //console.log("컬러코드 타겟 : ",document.querySelectorAll(".draggable"));
                 const targets = document.querySelectorAll(".draggable");
                 for (item of targets) {
                   ////console.log("노드들");
                   ////console.log("타겟부모", item.parentNode.className.split(" ")[1]);
                   let itemColor = item.parentNode.className.split(" ")[1];
                   //console.dir(item.children[0].children[0]); //thead 다가져옴
                   //테이블헤드 색상을 해당 카테고리의 색상으로 변경해준다.
                   item.children[0].children[0].style.backgroundColor = itemColor;
                   //이동이 완료되었을때 굳이 재랜더링은 안해줘도 될거같다.
                   //어차피 본인페이지에도 이동 + 다른사람이 봤을때도 이동 됨.
                 }
             });
      })
      .then((res) => {
          //작업까지 그리기 완료 => 그리고나서 드래그 주기
          const containers = document.querySelectorAll(".container");
          drag(containers, 'personal');
          
      });
}

    function kanbanRender(arg) {
      let mode = arg; //project 아니면 personal -> 파라미터를 회원아이디로 받으면될듯
      
      if (mode == 'personal') { 
          kanbanRenderPersonal_K();
          
      } else {
      axios
        .post(`/kanban/categoryList?proNo=\${proNo}&mode=\${mode}`) //실제로는 프로젝트 번호(팀번호)를 넘겨줘야함.
        .then((response) => {
          ////console.log("카테고리", response.data);
          const json = response.data;
          ////console.log(json);
          let text = '<div class="card-body">'; //이렇게 그리는 부분은 함수로 빼서 돌려쓰기
          text += `<div class="row" style="flex-wrap: nowrap; min-height: 670px;">`;
          text += `  <div class="col-lg-2" id="kanbanLeftBar">`;
          text += '  </div>';
          text += '<div class="parent col-lg-10">';
          for (item of json) {
            text += `<div style="margin: 10px;" class="categoryDiv" id="clickCategoryTarget-\${item.twCategoryNo}">`;
            text += `       <div class="filtered row" style="border-left: 10px solid \${item.twCategoryColor}; border-bottom: 5px solid #E6EAF3; margin: 10px;">`;
            
            //네임태그
            text += `<div class="col-lg-7 jino-em-b" style="overflow: auto;" >`;
            text += `\${item.twCategoryName}`;
            text += `</div>`;
            //나머지 버튼들
            text += `<div class="col-lg-5 category-btn-div">`;
            text += `<button type="button" onclick="categoryUpdatePK(\${item.twCategoryNo})" class="btn btn-outline-secondary waves-effect category-update notBorder">`;
            text += `               <i class="mdi mdi-refresh"></i>`;
            text += `           <button type="button" class="btn btn-outline-secondary waves-effect category-delete notBorder">`;
            text += `               <i class="mdi mdi-window-close"></i>`;
            text += `           </button>`;
            text += `</div>`;
            //버튼 끝
            //필터 로우 닫기
            text += `       </div>`;
            
            text += `  <div class="container \${item.twCategoryColor}" id="category-\${item.twCategoryNo}">`;
            text += `  </div>`;
            text += `</div>`;
          }
          text += '</div>';
          text += '</div>';
          text += '</div>';
          
          document.querySelector(".spa").innerHTML = text;
          
          if (json.length < 1) { //카테고리가 아직 생성되지 않은 프로젝트의 경우
              document.querySelector(".parent").innerHTML = `<div class="row"><h1 class="align-self-center">생성된 카테고리가 없습니다.</h1></div>`;
          }
         
          //카테고리 정렬잡기
          if (json.length > 4) {
              //console.log("=====================================");
              console.dir(document.querySelector(".parent"));
              document.querySelector(".parent").style.justifyContent = "";
          } else {
              document.querySelector(".parent").style.justifyContent = "center";
          }
          
        })
        .then((response) => {
          topWorkListRender(mode);
        }) //axios 카테고리 그리기 끝
        .then((response) => {
          //카테고리 div 만들어진 후 작업 div들 만들기
          const containers = document.querySelectorAll(".container");
          ////console.log("드래그콘테이너 : ", containers);
          drag(containers); //드래그를 추가하고나선 재렌더링시 드래그요소들 안그려짐

          //onclick으로 걸면 event객체 못쓴다
          const btnCategoryDelete = document.querySelectorAll(".category-delete");
          const btnCategoryUpdate = document.querySelectorAll(".category-update");

          //수정버튼 이벤트 주기
          for (item of btnCategoryUpdate) {
            ////console.log("수정버튼들", item);
            ////console.log("수정버튼 영역 카테고리 아이디 : ", item.parentNode.parentNode.id);
            const twCategoryNo = item.parentNode.parentNode.id.split("-")[1];
            ////console.log("수정할 카테고리 번호 : ", twCategoryNo);

            item.addEventListener("click", (event) => {
              categoryUpdateModalOpen();
            });
          }

          //삭제버튼 이벤트주기
          for (item of btnCategoryDelete) {
              //console.log("item.parentNode.parentNode.parentNode.id", item.parentNode.parentNode.parentNode.id);
            const twCategoryNo = item.parentNode.parentNode.parentNode.id.split("-")[1]; //여기로 이동
            ////console.log("카테고리 번호 뭔데 : ", twCategoryNo);
            //console.dir(item.parentNode.parentNode.lastChild);
            ////console.log(item);
            item.addEventListener("click", (event) => {
              ////console.log(event.target.parentNode); //i 태그를 버튼 안에 쓰면 아이콘 눌렀을때 그게 타겟으로 잡힘
              //카테고리 pk 뽑아내기
              //console.dir(event.target.parentNode.parentNode.id.split("-")[1]);
              Swal.fire({
				  title: '정말 삭제하시겠습니까?',
				  text: "삭제한 데이터는 되돌릴 수 없습니다!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제하기',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.isConfirmed) {
					  
				    Swal.fire(
				      '삭제 완료!',
				      '카테고리를 삭제했습니다!',
				      'success'
				    )
				    
				    // ojh 카테고리 삭제시 해당 카테고리 들고 백단 가기
				    $.ajax({
		                url: '/deleteCategoryFile',
		                method : 'post',
		                data : {twCategoryNo : twCategoryNo},
		                type : 'text',
		                  success : function(result){
		                    //console.log(result);
		                    
		                  }
		              });
				    
				    //김진호
				    //카테고리 삭제 
				    const topWorkCategoryVO = {
			                twCategoryNo,
		            };
	
		            axios
		              .post("/kanban/categoryDelete", topWorkCategoryVO)
		              .then((res) => {
		                ////console.log(res);
		                kanbanRender();
		              });
				    
				    
				  }
				});
              
              /* 
              if (!confirm("정말 삭제하시겠습니까?")) {
                return;
              }
               */
              
            });
          }
        })
        .then((res) => {
            //레프트바 그리기
            kanbanLeftBarRender('project');
        });
      } //조건문 긑
      
      //종결된 프로젝트시 버튼지우기
      
    } //칸반 렌더 끝

    //칸반레프트바
    function kanbanLeftBarRender(mode) {
        
        axios
          .post(`/kanban/categoryList?proNo=\${proNo}&mode=\${mode}`)
          .then((res) => {
             const categoryList = res.data;
             //console.log("레프트바 그려줄 카테고리들 : ", categoryList);
             
             let text = ``;
             text += `<button class="btn btn-soft-primary waves-effect waves-light jino-em-b" style="width: 90%; margin: 10px;" onclick="modeChange('project')">`;
             text += `프로젝트 작업 보드`;
             text += `</button>`;
             text += `<button class="btn btn-soft-primary waves-effect waves-light jino-em-b" style="width: 90%; margin: 10px;" onclick="modeChange('personal')">`;
             text += `개인 작업 보드`;
             text += `</button>`;
             text += `<button class="btn btn-soft-primary waves-effect waves-light jino-em-b" style="width: 90%; margin: 10px;" onclick="modeChange('complete')">`;
             text += `완료된 작업 보드`;
             text += `</button>`;

             if (mode != 'personal') {
               text += `<button class="auth-pmpl btn btn-outline-primary waves-effect waves-light jino-em-b" id="btnNewCategory"style="width: 90%; margin: 10px;" onclick="categoryModalOpen()">`;
               text += `<i class="mdi mdi-plus"></i> 카테고리 생성하기`;
               text += `</button>`;
             }
             
             let number = 1;
             for (category of categoryList) {
            	 console.log("카테고리 리스트가 어떻게 넘어오니? : ", category);
                 text += `<div style="border-left: 10px solid \${category.twCategoryColor}; margin: 10px;">`;
                 text += `<button class="btn btn-white waves-effect btn-\${category.twCategoryNo} number-\${number}" id="what" onclick="clickCategory(\${category.twCategoryNo})">`
                 text += `\${category.twCategoryName}<br>`;
                 text += `</button>`
                 text += `</div>`;
                 
                 number ++;
             }
             
             document.querySelector("#kanbanLeftBar").innerHTML = text;
             checkAuth();
             addCategoryBtnRemove();
          });
    }

    //좌측 카테고리 클릭시 깜박임
    function clickCategory(twCategoryNo) {
        ////console.log("깜박일 자식 : clickCategoryTarget-", twCategoryNo);
        ////console.log(document.querySelector(target));
        let target = `#clickCategoryTarget-\${twCategoryNo}`;
        const targetDiv = document.querySelector(target);
        const parent = document.querySelector(".parent");
        //class="btn btn-white waves-effect btn-\${category.twCategoryNo} number-\${number}"
        const clickBtn = document.querySelector(`.btn-\${twCategoryNo}`);
        const number = Number(clickBtn.classList[4].split("-")[1]);
        console.log("number", number);
        //각 카테고리별 위치값 차이는 x, 270px;
        //5번째 카테고리가 보이려면 스크롤 값 204,
        //최초에 204고 나머진 270씩
        //6번째 470
        //7번째 740 -> 270차이
        //8번째 1010
        //console.log("parent.scrollLeft", parent.scrollLeft);
        //console.log("getBoundingClientRect().x", targetDiv.getBoundingClientRect().x);
        //console.log("coordinate:", coordinate);
        //console.log(window.pageXOffset);
        
        let coordinate = 0;
        
        if (number == 5) {
            coordinate = 204;
        } else if (number > 5) {
            coordinate = 200 + ((number - 5) * 270);
        } else {
            coordinate = 0;
        }
        
        parent.scrollLeft = coordinate;
        
        targetDiv.style.backgroundColor = "gray";
        
        setTimeout(changeDivColor, 250, targetDiv);
    }

    function changeDivColor(targetDiv) {
        targetDiv.style.backgroundColor = "";
    }


    //드래그 아이템들 그리기용
    function topWorkListRender(mode) {
      ////console.log("topWorkListRender의 모드 : ", mode);
      
      axios
        .post(`/kanban/list?proNo=\${proNo}&mode=\${mode}`)
        .then((response) => {
          ////console.log(response.data);
          //여기서 div를 만들어줘야함
          //일단은 모두 배정된 작업에 넣어버리기
          const json = response.data;
          ////console.log("작업들 : ", response.data);

          let text = "";
          for (item of json) {
            const endDay = item.topWorkEnd.split("T")[0];
            let today = new Date();
            
            ////console.log("날짜 지난 경우 - today : ", today, " endDay : ", endDay, today > new Date(endDay));
            ////console.log("날짜 안지난 경우 - today : ", today, " endDay : ", endDay, today < new Date(endDay));
            ////console.log(item.topWorkTitle);
            text = "";
            
            text += `<div class="table-responsive draggable jino-17" onclick="detailTopWork_K(\${item.topWorkNo})" id="\${item.topWorkNo}" style="margin: 10px;">`;
            
            if (mode == 'complete') {
              text += `  <table class="table table-borderless mb-0 filtered">`;
            } else {
              text += `  <table class="table table-borderless mb-0">`;
            }
            
            if (item.topWorkState == 3) {
              text += `      <thead class="table-danger \${item.twCategoryNo}">`;
            } else {
              text += `      <thead class="table-light \${item.twCategoryNo}">`;
            }
            
            text += `          <tr>`;
            text += `              <th style="border-bottom: 1px solid gray;" class="th-\${item.topWorkNo}">\${item.topWorkTitle}</th>`;
            text += `          </tr>`;
            
            if (item.topWorkState == 3 || today > new Date(endDay)) {
              text += `      <tbody class="table-danger">`;
            } else {
              text += `      <tbody class="table-light">`;
            }
              
            text += `          <tr>`;
            if (today > new Date(endDay)) {
              text += `              <td><i class="mdi mdi-update"></i>  \${item.topWorkEnd.replace("T", " ")}</td>`;
            } else {
              text += `              <td><i class="mdi mdi-update mdi-spin"></i>  \${item.topWorkEnd.replace("T", " ")}</td>`;
            }
            text += `          </tr>`;
            text += `      </tbody>`;
            text += `  </table>`;
            text += `</div>`;
            text += `</div>`; 

            let categoryId = "#category-" + item.twCategoryNo;
            //원하는 위치에 인서트해주는(append처럼) 메소드 insertAdjacentHTML(위치, 문자열)
            ////console.log("카테고리디브없다구?", document.querySelector(categoryId)); db..필요한정보만가져와야함
            
            document
              .querySelector(categoryId)
              .insertAdjacentHTML("beforeend", text);
            
            ////console.log("tables", tables);
            
            if (mode == 'complete') {
                tableColorChange('success');
            }
            
          }
          
          axios
          .post(`/kanban/categoryList?proNo=\${proNo}&mode=\${mode}`)
          .then((res) => {
              ////console.log("카테고리 조회 결과 : ", res.data);
              const categoryList = res.data;
              for (item of categoryList) {
                  let text2 = ``;
                  text2 += `<div class="row">`;
                  text2 += `<button type="button" class="auth-pmpl btnWorkPlus filtered btn btn-outline-light waves-effect"`;
                  text2 += ` style="color: black;" onclick="insertModalOpen_New(\${item.twCategoryNo})">`;
                  text2 += `<i class="mdi mdi-plus-circle-outline mdi-24px"></i>`;
                  text2 += `</button>`;
                  
                  if (mode == 'complete') {
                      text2 = ``;
                  }
                  
                  let categoryId = "#category-" + item.twCategoryNo;
                  document.querySelector(categoryId).innerHTML += text2;
                  checkAuth();
              }
              
              //플러스버튼 종결시엔 지우기
              finishRemoveBtn_kanban();
          });
            
        })
        .then((res) => {
          //일단 컬러코드 적용을 억지로라도 해보기
          //1. thead클래스를 전부 가져온다
          //2. 클래스명과 pk가 일치하면 색상코드를 넣어준다.
          ////console.log("컬러코드 타겟 : ",document.querySelectorAll(".draggable"));
          
          const targets = document.querySelectorAll(".draggable");
          for (item of targets) {
            ////console.log("노드들");
            ////console.log("타겟부모", item.parentNode.className.split(" ")[1]);
            let itemColor = item.parentNode.className.split(" ")[1];
            //console.dir(item.children[0].children[0]); //thead 다가져옴
            //테이블헤드 색상을 해당 카테고리의 색상으로 변경해준다.
            item.children[0].style.borderLeft = `10px solid \${itemColor}`;
            //이동이 완료되었을때 굳이 재랜더링은 안해줘도 될거같다.
            //어차피 본인페이지에도 이동 + 다른사람이 봤을때도 이동 됨.
          }
        });
      
      
    }

    //드래그 이벤트주기용
    function drag(target, mode) {
      target.forEach((container) => {
        //인자로 자식 div들을 받음
        ////console.log("드래그왜안돼 : ", container);
        new Sortable(container, {
          group: {
            name: "shared", //이게 같은 Sortable 객체들끼리 이동 가능
          },
          swapThreshold: 1,
          animation: 150,
          ghostClass: "blue-background-class",
          //sort: false, 이거 false하면 원래 영역 내에서는 안움직임
          onChoose: function (event) {
            //클릭한 아이템
            //선택한 영역 안에 테이블 목록
          },
          filter: ".filtered",
          onEnd: function (event) {
              
            //내려놓았을때!
            ////console.log("이동중", event);
            ////console.log("엔드아이템 : ", event.item.id);
            const topWorkNo = event.item.id; //내려놓은 아이템 pk번호
            const beforeTwCategoryNo = event.from.id.split("-")[1]; //도착한 곳 카테고리 pk번호
            const twCategoryNo = event.to.id.split("-")[1]; //도착한 곳 카테고리 pk번호
            //여기서 그 영역 div의 id를 가져와야함.
            ////console.log("부모 : ", event.from);
            ////console.log("시작한 부모아이디 : ", event.from.id);
            ////console.log("도착한 부모요소 아이디 : ", event.to.id);//도착한 div영역
            //console.dir(event.item.children[0]);
            
            //테이블 컬러 변경
            if (event.to.id == "category-3") {
                const theadNumber = event.item.children[0].tHead.classList[1];
                event.item.children[0].tHead.className = `table-danger \${theadNumber}`;
                event.item.children[0].tBodies[0].className = "table-danger";
            }
            
            if (event.from.id == "category-3" && event.to.id != "category-3") {
                const theadNumber = event.item.children[0].tHead.classList[1];
                event.item.children[0].tHead.className = `table-light \${theadNumber}`;
                event.item.children[0].tBodies[0].className = "table-light";
            }
            
            const changeColor = event.to.className.split(" ")[1]; //도착한 div영역 컬러
            //console.dir(event.item.firstElementChild.children[0]); //thead
            event.item.firstElementChild.style.borderLeft = `10px solid \${changeColor}`;
            
            if (mode == 'personal') { //이동한 영역으로 상태값을 바꿔줘야한다.
                const topWorkState = event.to.id.split("-")[1];
                ////console.log("바꿀 상태값 : ", topWorkState);
                const topWorkVO = {
                    topWorkNo,
                    topWorkState,
                };
                
                axios
                  .post("/kanban/moveState", topWorkVO)
                  .then((res) => {
                     //console.log(res); 
                  });
                
            } else {

              // OJH 파일 변경을위한 JSON
           var obj_O = {
              topWorkNo :topWorkNo ,
              beforeTwCategoryNo : beforeTwCategoryNo,
              twCategoryNo : twCategoryNo
            }

            const obj = {
              topWorkNo,
              twCategoryNo,
            };

            const map = {
              topWorkNo,
              beforeTwCategoryNo,
              twCategoryNo,
            };

            axios.post("/kanban/topWorkMove", obj).then((res) => {
              logInsert(map); //topWorkNo로 프로젝트번호 따와야함.
            })
            .then((res) => {
                $.ajax({
                    url : '/topWorkMovedUpdate',
                    method : 'POST',
                    dataType : 'text',
                    contentType: "application/json; charset=UTF-8",
                    data : JSON.stringify(obj_O),
                    success : function(res){
                        ////console.log(res);
                    }
                });
            });
          }
          }///조건문 if-else 끝
        });
      });
    }

    
function tableColorChange(mode) {
    let color = mode;
    
    const tables = document.querySelectorAll(".table-borderless");
    tables.forEach(table => {
        ////console.log(table.tHead.classList);
        let tableWorkNo = table.tHead.classList[1];
        table.tHead.className = `table-\${color} \${tableWorkNo}`;
        table.tHead.classList[0] = `table-\${color}`;
        table.tBodies[0].className = `table-\${color}`;
    });
}
    
/////////////////////////////////////////////////////////////////////////////////////////////
/////////                     칸반 끝                    ////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
/////////                     캘린더 시작                ////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
/////////                     프로젝트 종료               ////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
function finishModalToggle() {
    document.querySelector("#btnProjectFinishModal").click();
}

function finishProjectUpdate() {
    const finishReason = document.querySelector("#project-finish-reason").value;
    const memberGrades = document.querySelectorAll(".project-finish-grade");
    const memberGradeArray = [];
    
    memberGrades.forEach(memberGrade => {
        ////console.log("아이디 : ", memberGrade.classList[2]);
        ////console.log("평가점수 : ", memberGrade.value);
        const memberGradeMap = {};
        
        memberGradeMap.memberId = memberGrade.classList[2];
        memberGradeMap.memberGrade = memberGrade.value;
        
        memberGradeArray.push(memberGradeMap);
    });
    
    const finishMap = {
      proNo,
      finishReason,
      memberGradeArray,
    };
    
    Swal.fire({
          title: '프로젝트를 종료하시겠습니까?',
          text: "모든 작업이 종료처리되며 데이터는 보관됩니다.",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '종결처리',
          cancelButtonText: '종결처리'
        }).then((result) => {
          if (result.isConfirmed) {
              axios
              .post("/project/finishProject", finishMap) //여기서 관련 작업 모두 종료시켜야함
              .then((res) => {
                 ////console.log(res); 
                 
                 //알러트
                 Swal.fire(
                      '프로젝트 종료!',
                      '프로젝트가 종료되었습니다. 고생하셨습니다!',
                      'success'
                    )
                    
                 //모달닫기
                  finishModalToggle();
                 //페이지 렌더 ㄴㄴ
                 const finishMarquee = document.querySelector("#finish-marquee");
                 finishMarquee.innerHTML = `<marquee><font class="jinoFont" style="color: red; font-size: 30px;">종료된 프로젝트입니다.</font></marquee>`;
                 finishMarquee.style.display = "";
                 finishRemoveBtn();
              });
          }
        })
    
}

function finishProject() {
    Swal.fire({
      title: '종료 전에 프로젝트에 대해 평가 해주세요!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '평가하기',
      cancelButtonText: '취소'
    }).then((result) => {
      if (result.isConfirmed) {
        const memberRatingDiv = document.querySelector("#memberRating");
        
        const projectVO = {
          proNo,    
        };
        
        //멤버채우기
        axios
          .post("/project/memberList", projectVO)
          .then((res) => {
             ////console.log("참여인원 : ", res.data);
             const memberList = res.data;
             let text = ``;
             let i = 0;
             for (member of memberList) {
                 text += `<div class="col-md-4">`;
                 text += `<div style="position: relative;">`;
                 text += `   <img id ="memberImg\${i}" src="\${member.memberPic}" class="rounded-circle avatar-md img-thumbnail bg-transparent" alt="">`; 
                 text += `   <i id = "memberState\${i}" class="mdi mdi-circle h3 text-secondary" style="position: absolute; top: 30px; left: 40px"\></i>`;
                 text += `</div>`;
                 text += `<div class="ms-2">`;
                 text += `   <h5 class="mb-1" id="memberName\${i}" >`;
                 text += `   \${member.memberName} `;
                 text += `   <i id ="memberAuth\${i}"></i>`;
                 text += `   </h5>`;
                 text += `   <p id  ="memberAuthName\${i}"></p>`;
                 text += `</div>`;
                 text += `</div>`;
                 text += `<div class="col-md-8">`;
                 text += `  <font class="jinoFont">평가 : </font>`;
                 text += `  <select class="form-select project-finish-grade \${member.memberId}">`;
                 text += `    <option value="5">⭐⭐⭐⭐⭐</option>`;
                 text += `    <option value="4">⭐⭐⭐⭐</option>`;
                 text += `    <option value="3">⭐⭐⭐</option>`;
                 text += `    <option value="2">⭐⭐</option>`;
                 text += `    <option value="1">⭐</option>`;
                 text += `  </select>`;
                 text += `</div>`;
                 
                 i++;
             }
             
             memberRatingDiv.innerHTML = text;
             
             return projectVO;
          })
          .then((projectVO) => {
              //여기에선 프로젝트 정보
              axios
                .post("/project/getProjectResult", projectVO)
                .then((res) => {
                    ////console.log("맵데이터 : ", res);
                    const map = res.data;
                    const projectResult = document.querySelector("#projectResult");
                    const completeRatioChart = document.querySelector("#completeRatioChart");
                    const completeProjectPeriod = document.querySelector("#completeProjectPeriod");
                    completeProjectPeriod.innerHTML = `소요기간 : \${map.projectStart} ~ \${map.projectEnd}`;
                    //기간
                    let resultText = ``;
                    resultText += `<div class="widget-rounded-circle card bg-info shadow-none">`;
                    resultText += `    <div class="card-body">`;
                    resultText += `        <div class="row">`;
                    resultText += `            <div class="col-6">`;
                    resultText += `                <h2 class="text-white mt-2"><span class="counter jino-em">\${map.totalCount}</span></h2>`;
                    resultText += `                <p class="text-white mb-0 text-truncate jino-em-b">총 작업 수</p>`;
                    resultText += `            </div>`;
                    resultText += `            <div class="col-6">`;
                    resultText += `                <div class="avatar-lg rounded-circle bg-soft-light ms-auto">`;
                    resultText += `                    <i class="fe-layers font-24 avatar-title text-white"></i>`;
                    resultText += `                </div>`;
                    resultText += `            </div>`;
                    resultText += `        </div>`; <!-- end row-->
                    resultText += `    </div>`;
                    resultText += `</div>`; <!-- end widget-rounded-circle-->
                    resultText += `<div class="widget-rounded-circle card bg-primary shadow-none">`;
                    resultText += `    <div class="card-body">`;
                    resultText += `        <div class="row">`;
                    resultText += `            <div class="col-6">`;
                    resultText += `                <h2 class="text-white mt-2"><span class="counter jino-em">\${map.completeCount}</span></h2>`;
                    resultText += `                <p class="text-white mb-0 text-truncate jino-em-b">완료 작업 수</p>`;
                    resultText += `            </div>`;
                    resultText += `            <div class="col-6">`;
                    resultText += `                <div class="avatar-lg rounded-circle bg-soft-light ms-auto">`;
                    resultText += `                    <i class="fe-layers font-24 avatar-title text-white"></i>`;
                    resultText += `                </div>`;
                    resultText += `            </div>`;
                    resultText += `        </div>`; <!-- end row-->
                    resultText += `    </div>`;
                    resultText += `</div>`; <!-- end widget-rounded-circle-->
                    
                    projectResult.innerHTML = resultText;
                    ////console.log("평가 모달 띄우기");
                    finishModalToggle();
                    //띄운 이후에 렌더링
                    
                    return map.completeRatio;
                })
                .then((ratio) => {
                    completeChartRender(ratio);
                    
                    $('.counter').counterUp({
                        delay: 10,
                        time: 1000,
                    });
                });
          });
        
      }
    })
}

function completeChartRender(ratio) {
    var completeChartOptions = {
            series: [ratio],
            chart: {
            height: 350,
            type: 'radialBar',
            offsetY: -10
          },
          plotOptions: {
            radialBar: {
              startAngle: -135,
              endAngle: 135,
              dataLabels: {
                name: {
                  fontSize: '16px',
                  color: undefined,
                  offsetY: 120
                },
                value: {
                  offsetY: 76,
                  fontSize: '22px',
                  color: undefined,
                  formatter: function (val) {
                    return val + "%";
                  }
                }
              }
            }
          },
          fill: {
            type: 'gradient',
            gradient: {
                shade: 'dark',
                shadeIntensity: 0.15,
                inverseColors: false,
                opacityFrom: 1,
                opacityTo: 1,
                stops: [0, 50, 65, 91]
            },
          },
          stroke: {
            dashArray: 4
          },
          labels: ['완료율'],
          };

          var chart = new ApexCharts(document.querySelector("#completeRatioChart"), completeChartOptions);
          chart.render();
}

function checkProjectFinish() {
    const vo = {
      proNo 
    };
    
    axios
      .post("/project/selectProject", vo)
      .then((res) => {
         projectVO = res.data;
         ////console.log("projectVO", projectVO);
         
         if (projectVO.proFinish == "1") {
             //console.log("지워야해", document.querySelector("#detail-button-div"));
             document.querySelector("#detail-button-div").style.display = "none";
             document.querySelector("#commentDiv").style.display = "none";
             document.querySelector("#projectFont").innerText = "프로젝트(종료됨) : ";
             document.querySelector("#finish-marquee").style.display = "";
             document.querySelector("#btnFinishProject").style.display = "none";
             document.querySelector("#finish-marquee").innerHTML = `<marquee><font class="jinoFont" style="color: red; font-size: 30px;">종료된 프로젝트입니다.</font></marquee>`;
         }
      });
}

function finishRemoveBtn() {
    //김진호 - 버튼지우기
    const finishMarquee = document.querySelector("#finish-marquee");
    
    if (finishMarquee.style.display == "") {
        document.querySelector("#btnFinishProject").style.display = "none";
        
        const removeBtns = document.querySelectorAll(".remove-finish");
        
        removeBtns.forEach(removeBtn => {
            removeBtn.style.display = "none";
        });
        
    }
}

function finishRemoveBtn_kanban() {
    let finished= finishFlag();
    
    console.log("finished", finished);
    
    if (finished) {
        const workPlusBtns = document.querySelectorAll(".btnWorkPlus");
        console.log("workPlusBtns", workPlusBtns);
        
        workPlusBtns.forEach(workPlusBtn => {
            workPlusBtn.style.display = "none";
        });
        
    }
}

function addCategoryBtnRemove() {
    let finished= finishFlag();
    
    if (finished) {
        document.querySelector("#btnNewCategory").style.display = "none";
        
        const categoryBtnDivs = document.querySelectorAll(".category-btn-div");
        categoryBtnDivs.forEach(categoryBtnDiv => {
            categoryBtnDiv.style.display = "none";
        });
    }
    
    
}

function finishFlag() {
    const finishMarquee = document.querySelector("#finish-marquee");
    
    if (finishMarquee.style.display == "none") {
        return false;
    } else {
        return true;
    }
}

function checkMemberLength() {
	const selectBar = document.querySelector("#event-worker");
	const selectBarLength = selectBar.selectedOptions.length;
	if (selectBarLength == 3) {
		//console.log("세명이다!!!!");
		//selectBar.setAttribute('disabled', true);
	}
}

function setChangeMember() {
	//모두 배정안하면 리턴
	const searchArea = document.querySelector("#subWorkListArea");
	const listLength = searchArea.querySelectorAll(".change-subWork-div").length;
	
	if (listLength > 0) {
	  Swal.fire({
	  	  icon: 'error',
	  	  title: '담당자 설정 안됨',
	  	  text: '서브 작업의 담당자를 모두 설정해주세요!',
	  	})
	  	
	  return;
	}
	
	const topWorkNo = document.querySelector("#hidden-topWorkNo").value;
	const changeSubWorkDivs = document.querySelectorAll(".change-subWork-div");
	const changeMap = {};
	changeSubWorkDivs.forEach(changeSubWorkDiv => {
		//console.log(changeSubWorkDiv);
		const subWorkNo = changeSubWorkDiv.classList[0].split("-")[1];
		//console.dir(changeSubWorkDiv);
		//console.log("하위작업 번호 : ", subWorkNo, "새로운 담당자 : ", changeSubWorkDiv.parentElement.classList[1]);
		changeMap[subWorkNo] = changeSubWorkDiv.parentElement.classList[1];
	});
	
	const newWorkList = document.querySelectorAll(".change-new-member");
    const newWorkArray = [];
    newWorkList.forEach(newWork => {
        //console.log("newWork", newWork.classList[1]);
        newWorkArray.push(newWork.classList[1]);
    });
    
    console.log("changeMap", changeMap);
    console.log("newWorkArray", newWorkArray);
    const multipleMap = {
	  changeMap,
	  newWorkArray,
	  topWorkNo,
    };
    console.log("multipleMap", multipleMap);
    
    axios
      .post("/subWork/setChangeSubWork", multipleMap)
      .then((res) => {
    	  //console.log("제발 좀 되어라,,,");
    	  //console.log(res.data);
    	  Swal.fire({
              icon: 'success',
              title: '변경 완료!',
              text: '담당자를 변경하고 서브 작업을 재배치했습니다!',
            });
    	  //디테일 다시 보여주장
    	  detailTopWork_K(topWorkNo);
      });
}

function dataInsert() {
	document.querySelector("#event-title").value = "오지형작업";
	document.querySelector(".ql-editor").innerHTML = "<h1>실력테스트!</h1>";
	document.querySelector("#birth").value = "2023-02-14T12:00";
	document.querySelector("#birth2").value = "2023-02-15T12:00";
	
	$("#event-worker").val([]).trigger('change');
	$("#event-worker").val(['ddit404@naver.com']).trigger('change');
}

</script>
