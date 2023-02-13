<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- 피커 -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"
/>
<link
  rel="stylesheet"
  type="text/css"
  href="https://npmcdn.com/flatpickr/dist/themes/dark.css"
/>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<style>
  .parent {
    width: 90%;
    margin: 10px auto;
    display: flex;
    flex-direction: row;
    overflow: auto;
    white-space: nowrap;
  }
  .container {
    min-width: 200px;
    min-height: 400px;
    height: auto;
    margin: 10px;
    padding: 10px;
    background-color: #b5c1dc57;
    border-radius: 8px;
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
          <div class="page-title-box">
            <h4 class="page-title">칸반보드</h4>
            <div>
              <ol class="breadcrumb m-0">
                <li class="breadcrumb-item">
                  <a href="javascript: void(0);">Codefox</a>
                </li>
                <li class="breadcrumb-item">
                  <a href="javascript: void(0);">Apps</a>
                </li>
                <li class="breadcrumb-item active">칸반보드</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
      <!-- end page title -->

      <!-- 작업추가 -->
      <button
        type="button"
        class="btn btn-primary width-lg waves-effect waves-light"
        onclick="insertModalOpen()"
      >
        일감 생성하기
      </button>
      <button
        type="button"
        class="btn btn-primary width-lg waves-effect waves-light"
        onclick="categoryModalOpen()"
      >
        <i class="fas fa-plus"></i> 카테고리 생성하기
      </button>
      <button
        type="button"
        class="btn btn-primary width-lg waves-effect waves-light"
        onclick="modeChange('project')"
      >
        칸반보드 - 프로젝트
      </button>
      <button
        type="button"
        class="btn btn-primary width-lg waves-effect waves-light"
        onclick="modeChange('personal')"
      >
        칸반보드 - 개인
      </button>
      <!-- 작업추가 end -->
      <div class="row justify-content-center">
        <div class="col-xl-10">
          <!-- Plans -->
          <div class="parent"></div>
          <div class="parent-personal"></div>
          <!-- end row -->
        </div>
        <!-- end col-->
      </div>
      <!-- end row -->
    </div>
    <!-- container -->
  </div>
  <!-- content -->
</div>

<!-- Add New Event MODAL -->
<div class="modal fade" id="event-modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header py-3 px-4 border-bottom-0 d-block">
        <button
          type="button"
          class="btn-close float-end"
          data-bs-dismiss="modal"
          aria-label="Close"
          onclick="insertModalClose()"
        ></button>
        <h5 class="modal-title" id="modal-title">작업 추가</h5>
      </div>
      <div class="modal-body px-4 pb-4 pt-0">
        <form
          class="needs-validation"
          name="event-form"
          id="form-event"
          novalidate
        >
          <div class="row">
            <div class="col-12">
              <div class="mb-3">
                <label class="form-label">Work Title</label>
                <input
                  class="form-control"
                  placeholder="작업명을 입력해주세요."
                  type="text"
                  name="title"
                  id="event-title"
                  required
                />
                <div class="invalid-feedback">작업 입력은 필수입니다.</div>
              </div>
              <div class="mb-3">
                <label class="form-label">Content</label>
                <input
                  class="form-control"
                  placeholder="내용을 입력해주세요."
                  type="text"
                  name="worker"
                  id="event-content"
                  required
                />
                <div class="invalid-feedback">내용을 입력해주세요.</div>
              </div>
            </div>
            <div class="col-12">
              <div class="mb-3">
                <label class="form-label">Category</label>
                <select
                  class="form-select"
                  name="category"
                  id="event-select-category"
                  required
                >
                  <option value="active" selected>미설정</option>
                  <option value="warning">DB</option>
                  <option value="info">FRONT</option>
                  <option value="success">BACK</option>
                </select>
                <div class="invalid-feedback">
                  Please select a valid event category
                </div>
              </div>
              <div class="mb-3">
                <label class="form-label">Worker</label>
                <select
                  class="form-select"
                  name="category"
                  id="event-worker"
                  required
                >
                  <option value="미배정" selected>미배정</option>
                  <option value="김진호">김진호</option>
                  <option value="허나훔">허나훔</option>
                  <option value="채진영">채진영</option>
                  <option value="송서영">송서영</option>
                  <option value="오지형">오지형</option>
                  <option value="배지영">배지영</option>
                </select>
                <div class="invalid-feedback">
                  Please select a valid event Worker
                </div>
              </div>
              <div class="mb-3">
                <label class="form-label">Date</label>

                <div style="display: flex; justify-content: space-around">
                  <div class="col-6">
                    <label class="form-label" for="birth">시작일</label>
                    <input
                      class="form-control"
                      id="birth"
                      pattern="\d{4}-\d{2}-\d{2}"
                      placeholder=""
                      required
                      th:field="*{birth2}"
                      type="text"
                      value=""
                    />
                  </div>
                  <div class="col-6">
                    <label class="form-label" for="birth2">종료일</label>
                    <input
                      class="form-control"
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
                <label class="form-label">File</label>
                <input
                  id="event-file"
                  name ="uploadFileAjax"
                  type="file"
                  multiple
                />
              </div>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-md-6 col-4">
              <button type="button" class="btn btn-danger" id="btn-reset-event">
                Reset
              </button>
            </div>
            <div class="col-md-6 col-8 text-end">
              <button
                type="button"
                class="btn btn-light me-1"
                id="btnModalClose"
                data-bs-dismiss="modal"
              >
                Close
              </button>
              <button type="button" class="btn btn-success" id="btn-save-event">
                Save
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
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
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
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
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

<!-- Detail MODAL -->
<div class="modal fade" id="detail-modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header py-3 px-4 border-bottom-0 d-block">
        <button
          type="button"
          class="btn-close float-end"
          data-bs-dismiss="modal"
          aria-label="Close"
          onclick="detailModalClose()"
        ></button>
        <h5 class="modal-title" id="modal-title">작업 수정</h5>
      </div>
      <div class="modal-body px-4 pb-4 pt-0">
        <form
          class="needs-validation"
          name="event-form"
          id="form-event"
          novalidate
        >
          <div class="row">
            <div class="col-12">
              <div class="mb-3">
                <label class="form-label">Work Title</label>
                <input type="hidden" id="topWorkNo-detail" value=""/>
                <input
                  class="form-control"
                  placeholder="작업명을 입력해주세요."
                  type="text"
                  name="title"
                  id="detail-title"
                  required
                />
                <div class="invalid-feedback">작업 입력은 필수입니다.</div>
              </div>
              <div class="mb-3">
                <label class="form-label">Content</label>
                <input
                  class="form-control"
                  placeholder="내용을 입력해주세요."
                  type="text"
                  name="worker"
                  id="detail-content"
                  required
                />
                <div class="invalid-feedback">내용을 입력해주세요.</div>
              </div>
            </div>
            <div class="col-12">
              <div class="mb-3">
                <label class="form-label">Category</label>
                <select
                  class="form-select"
                  name="category"
                  id="detail-select-category"
                  required
                >
                  <option value="active" selected>미설정</option>
                  <option value="warning">DB</option>
                  <option value="info">FRONT</option>
                  <option value="success">BACK</option>
                </select>
                <div class="invalid-feedback">
                  Please select a valid event category
                </div>
              </div>
              <div class="mb-3">
                <label class="form-label">Worker</label>
                <select
                  class="form-select"
                  name="category"
                  id="event-worker"
                  required
                >
                  <option value="미배정" selected>미배정</option>
                  <option value="id-1">아이디1</option>
                  <option value="id-2">아이디2</option>
                  <option value="id-3">아이디3</option>
                </select>
                <div class="invalid-feedback">
                  Please select a valid event Worker
                </div>
              </div>
              <div class="mb-3">
                <label class="form-label">Date</label>

                <div style="display: flex; justify-content: space-around">
                  <div class="col-6">
                    <label class="form-label" for="birth">시작일</label>
                    <input
                      class="form-control"
                      id="topWorkStart-detail"
                      pattern="\d{4}-\d{2}-\d{2}"
                      placeholder=""
                      required
                      th:field="*{topWorkStart-detail}"
                      type="text"
                      value=""
                    />
                  </div>
                  <div class="col-6">
                    <label class="form-label" for="birth2">종료일</label>
                    <input
                      class="form-control"
                      id="topWorkEnd-detail"
                      pattern="\d{4}-\d{2}-\d{2}"
                      placeholder=""
                      required
                      th:field="*{topWorkEnd-detail}"
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
                <label class="form-label">File</label>
                <input 
                	class="form-control" 
                	id="event-file"
                	type="file"
                	multiple
                />
              </div>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-md-6 col-4">
              <button type="button" class="btn btn-danger" id="btn-delete-detail" onclick="topWorkDelete()">
                Delete
              </button>
            </div>
            <div class="col-md-6 col-8 text-end">
              <button
                type="button"
                class="btn btn-light me-1"
                id="btnModalClose"
                data-bs-dismiss="modal"
                onclick="detailModalClose()"
              >
                Close
              </button>
              <button type="button" class="btn btn-success" id="btn-save-detail" onclick="topWorkUpdate()">
                Update
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

<!-- 템플릿거 -->
<script src="${pageContext.request.contextPath }/resources/dist/assets/js/vendor.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/dist/assets/js/app.min.js"></script>
<!-- 드래그 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
<!-- axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
//document.querySelector(".parent").style.display = "none";
  let mode = "";
  
  function modeChange(arg) {
	  mode = arg;
	  console.log(mode);
  }
  
  const COLORS = {};
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
  
  updateSelectBar();
  function updateSelectBar() {
	  const selectBar = document.querySelector("#event-select-category");
	  const selectBarDetail = document.querySelector("#detail-select-category");
	  //proNo를 받아와야하는데..일단 전체 불러오기로 하자
	  axios
	    .post("/kanban/categoryList")
	    .then((res) => {
	    	  const selectOptions = res.data;
	    	  console.log(selectOptions);
	    	  let text = "";
	    	  let count = 1;
	    	  for (item of selectOptions) {
	    		  
	    		  if (count == 1) {
		    		  text += `<option value="\${item.twCategoryNo}" selected>\${item.twCategoryName}</option>`;
	    		  } else {
		    		  text += `<option value="\${item.twCategoryNo}">\${item.twCategoryName}</option>`;
	    		  }
	    		  
	    		  count ++;
	    	  }
	    	  
	    	  selectBar.innerHTML = text;
	    	  selectBarDetail.innerHTML = text;
	    });
  }
  
  function detailOpen(topWorkNo) {
	  console.log("탑워크 피케이 : ", topWorkNo);
	  const obj = {
	    topWorkNo,
	  }
	  
	  axios
	    .post("/kanban/topWorkDetail", obj)
	    .then((res) => {
	    	  //console.log(res.data);
	    	  detailModalOpen(res.data);
	    });
  }
  
  function topWorkUpdate() {
	  const obj = {};
	  obj.topWorkNo = document.querySelector("#topWorkNo-detail").value;
	  obj.topWorkTitle = document.querySelector("#detail-title").value;
	  obj.topWorkContent = document.querySelector("#detail-content").value;
	  obj.topWorkStart = document.querySelector("#topWorkStart-detail").value.replace(" ", "T");
	  obj.topWorkEnd = document.querySelector("#topWorkEnd-detail").value.replace(" ", "T");
	  obj.twCategoryNo = document.querySelector("#detail-select-category").value;
	  
	  console.log(obj);
	  
	  axios
	    .post("/kanban/topWorkUpdate", obj)
	    .then((res) => {
	    	//console.log(res);
	    	//디테일에서 업데이트 성공 -> 모달 닫고 렌더링
	    	detailModalClose();
	    	kanbanRender();
	    });
  }
  
  function topWorkDelete() {
	  const obj = {};
	  obj.topWorkNo = document.querySelector("#topWorkNo-detail").value;
	  
	  if (!confirm("정말 삭제하시겠습니까?")) {
		  return;
	  }
	  //console.log(obj);
	  axios
	    .post("/kanban/topWorkDelete", obj)
	    .then((res) => {
	    	//console.log(res);
	    	//디테일에서 삭제 성공 -> 모달 닫고 렌더링
	    	detailModalClose();
	    	kanbanRender();
	    });
	  
  }
  
  function detailModalOpen(topWorkVO) {
	console.log(topWorkVO);
	//파라미터로 받은 객체로 값 채우기
	document.querySelector("#topWorkNo-detail").value = topWorkVO.topWorkNo;
	document.querySelector("#detail-title").value = topWorkVO.topWorkTitle;
	document.querySelector("#detail-content").value = topWorkVO.topWorkContent;
	document.querySelector("#topWorkStart-detail").value = topWorkVO.topWorkStart.replace("T", " ");
	document.querySelector("#topWorkEnd-detail").value = topWorkVO.topWorkEnd.replace("T", " ");
	document.querySelector("#detail-select-category").value = topWorkVO.twCategoryNo;
	
	
	document.querySelector("#detail-modal").classList.add("show");
	document.querySelector("#detail-modal").style.display = "block";
  }
  
  function detailModalClose() {
	//디테일모달같은 경우엔 굳이 값을 비워줄 필요가 없다.
	document.querySelector("#detail-modal").classList.remove("show");
    document.querySelector("#detail-modal").style.display = "none";
  }
  function selectColor(color) {
    //console.log(color);
    document.querySelector(
      "#dropdownMenuButton"
    ).className = `btn btn-\${color} dropdown-toggle`;
    const selected = `.color-\${color}`;
    const fontColor = document.querySelector(selected).innerText;
    document.querySelector("#dropBox-name").innerText = fontColor;

    //카테고리 추가시 색상코드 같이 보내기주기위한 색상값 저장
    //console.log(color.toUpperCase());
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
    //console.log(document.querySelector("#dropBox-colorCode"));
  }

  function selectColorUpdate(color) {
    //console.log(color);
    document.querySelector(
      "#dropdownMenuButton-update"
    ).className = `btn btn-\${color} dropdown-toggle`;
    const selected = `.updateColor-\${color}`;
    const fontColor = document.querySelector(selected).innerText;
    document.querySelector("#dropBox-name-update").innerText = fontColor;

    //카테고리 추가시 색상코드 같이 보내기주기위한 색상값 저장
    //console.log(color.toUpperCase());
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
    //console.log(document.querySelector("#dropBox-colorCode"));
  }

  function categoryUpdatePK(twCategoryNo) {
    //수정버튼 클릭시 인풋히든에 pk 세팅
    //console.log("피케이", twCategoryNo);
    document.querySelector("#dropBox-twCategoryNo-update").value = twCategoryNo;
  }

  function categoryUpdate() {
    //수정하기 버튼 클릭시 세팅 및 전송
    const twCategoryName = document.querySelector(
      "#category-name-update"
    ).value;
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
    };
    //console.log(obj);
    //업데이트 전송
    axios.post("/kanban/categoryUpdate", obj).then((res) => {
      console.log("카테고리 업데이트 성공");
      kanbanRender();
      categoryUpdateModalClose();
    });
  }

  //카테고리 생성하기
  kanbanRender();

  function kanbanRender() {
	
    axios
      .post("/kanban/categoryList") //실제로는 프로젝트 번호(팀번호)를 넘겨줘야함.
      .then((response) => {
        //console.log("카테고리", response.data);
        const json = response.data;
        //console.log(json);
        let text = "";
        
       	for (item of json) {
          text += `<div class="container \${item.twCategoryColor}" id="category-\${item.twCategoryNo}">`;
          text += `     <div class="filtered">\${item.twCategoryName}<button type="button" onclick="categoryUpdatePK(\${item.twCategoryNo})" class="btn btn-soft-secondary waves-effect category-update">`;
          text += `             수정`;
          text += `         <button type="button" class="btn btn-soft-secondary waves-effect category-delete"`;
          text += `                 style="background-color: \${item.twCategoryColor}">`;
          text += `             X`;
          text += `         </button>`;
          text += `     </div>`;
          text += `</div>`;
        }
       
        document.querySelector(".parent").innerHTML = text;
      })
      .then((response) => {
        topWorkListRender();
      }) //axios 카테고리 그리기 끝
      .then((response) => {
        //카테고리 div 만들어진 후 작업 div들 만들기
        const containers = document.querySelectorAll(".container");
        console.log("드래그콘테이너 : ", containers);
        drag(containers); //드래그를 추가하고나선 재렌더링시 드래그요소들 안그려짐

        //onclick으로 걸면 event객체 못쓴다
        const btnCategoryDelete = document.querySelectorAll(".category-delete");
        const btnCategoryUpdate = document.querySelectorAll(".category-update");

        //수정버튼 이벤트 주기
        for (item of btnCategoryUpdate) {
          //console.log("수정버튼들", item);
          //console.log("수정버튼 영역 카테고리 아이디 : ", item.parentNode.parentNode.id);
          const twCategoryNo = item.parentNode.parentNode.id.split("-")[1];
          console.log("수정할 카테고리 번호 : ", twCategoryNo);

          item.addEventListener("click", (event) => {
            categoryUpdateModalOpen();
          });
        }

        //삭제버튼 이벤트주기
        for (item of btnCategoryDelete) {
          const twCategoryNo = item.parentNode.parentNode.id.split("-")[1]; //여기로 이동
          //console.log(item);
          item.addEventListener("click", (event) => {
            //console.log(event.target.parentNode); //i 태그를 버튼 안에 쓰면 아이콘 눌렀을때 그게 타겟으로 잡힘
            //카테고리 pk 뽑아내기
            //console.dir(event.target.parentNode.parentNode.id.split("-")[1]);

            if (!confirm("정말 삭제하시겠습니까?")) {
              return;
            }

            const topWorkCategoryVO = {
              twCategoryNo,
            };

            axios
              .post("/kanban/categoryDelete", topWorkCategoryVO)
              .then((res) => {
                console.log(res);
                kanbanRender();
              });
          });
        }
      });
  } //칸반 렌더 끝

  const categoryModalInsert = () => {
	  const URLSearch = new URLSearchParams(location.search);
	  const proNo = URLSearch.get("proNo");

    const twCategoryName = document.querySelector("#category-name").value;
    const twCategoryColor = document.querySelector("#dropBox-colorCode").value;
    console.log(twCategoryName);
    console.log("인서트시 컬러", twCategoryColor);

    const obj = {
      twCategoryName,
      twCategoryColor,
      proNo,
    };

    axios.post("/kanban/categoryInsert", obj).then((response) => {
      console.log(response);
      kanbanRender();
      categoryModalClose();
      updateSelectBar();
    });
  };

  //우선 비동기로 목록을 불러와서 각각의 영역에 넣어줘야함
  //DB 연동해서 만든 후에 카테고리를 추가하는 기능을 만들어야함

  //피커
  const fp = flatpickr(document.getElementById("birth"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    onValueUpdate: () => {
      //console.log("업데이트");
    },
    onDayCreate: () => {
      //console.log("크리에이트");
    },
  });
  const fp2 = flatpickr(document.getElementById("birth2"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    onValueUpdate: () => {
      //console.log("업데이트");
    },
    onDayCreate: () => {
      //console.log("크리에이트");
    },
  });
  const fp3 = flatpickr(document.getElementById("topWorkStart-detail"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    onValueUpdate: () => {
      //console.log("업데이트");
    },
    onDayCreate: () => {
      //console.log("크리에이트");
    },
  });
  const fp4 = flatpickr(document.getElementById("topWorkEnd-detail"), {
    //'monthSelectorType' : 'static',
    locale: "ko",
    enableTime: "true",
    onValueUpdate: () => {
      //console.log("업데이트");
    },
    onDayCreate: () => {
      //console.log("크리에이트");
    },
  });
  //인서트용 모달
  var btnInsertModalClose = document.querySelector("#btnModalClose");
  var btnInsertModalReset = document.querySelector("#btn-reset-event");
  var btnInsertModalSave = document.querySelector("#btn-save-event");
	
  const insertModalOpen = () => {
    document.querySelector("#event-modal").classList.add("show");
    document.querySelector("#event-modal").style.display = "block";
  };

  const insertModalClose = () => {
    //닫기 전 값 초기화해주기 필요
    document.querySelector("#event-modal").classList.remove("show");
    document.querySelector("#event-modal").style.display = "none";
    //닫을때 입력된 데이터 날려버리기
    insertModalReset();
  };

  const insertModalReset = () => {
    document.querySelector("#event-title").value = "";
    document.querySelector("#event-content").value = "";
    //document.querySelector("#event-select-category").value = "";
    document.querySelector("#birth").value = "";
    document.querySelector("#birth2").value = "";
    document.querySelector("#event-worker").value = "미배정";
    document.querySelector("#event-file").value = "";
  };

  btnInsertModalReset.addEventListener("click", () => {
    insertModalReset();
  });

  btnInsertModalClose.addEventListener("click", () => {
    insertModalClose();
  });

  btnInsertModalSave.addEventListener("click", (event) => {
    const topWorkTitle = document.querySelector("#event-title").value;
    const topWorkContent = document.querySelector("#event-content").value;
    const twCategoryNo = document.querySelector("#event-select-category").value;
    const topWorkStart = document
      .querySelector("#birth")
      .value.replace(" ", "T");
    const topWorkEnd = document
      .querySelector("#birth2")
      .value.replace(" ", "T");
    const memberId = document.querySelector("#event-worker").value;
    //console.log("워커 : " + memId);
    
    const obj = {
      topWorkTitle,
      topWorkContent,
      twCategoryNo,
      topWorkStart,
      topWorkEnd,
      //topWorkState는 기본 0 -> 카테고리 이동시?
      //topWorkLike도 기본값 0
      //topWorkFile도 기본값 null인데 마이바티스에서 에러나니깐 서비스단에서 '0'으로 넣어줌.
      //topWorkProgress도 기본값 0
    };
    var inputFile = document.querySelector("#event-file");
    var files = inputFile.files;
	console.dir(files);

    //axios는 제이슨 직렬화 하지않고 그냥 보내야함.
    //헤더 설정은 별도로 필요 없다.
    //const json = JSON.stringify(obj);
    //const config = {"Content-Type" : "application/json"};
    //console.log(obj);
    
    let topWorkNo = "";
    
    axios.post("/kanban/insert", obj)
    .then((response) => {
      console.log("new topWorkNo : ", response.data);
      topWorkNo = response.data;
      kanbanRender();
      insertModalClose();
    })
    .then((res) => { //인서트 됐으면 관계테이블에 인서트
    	if (memberId == "미배정") {
    		return;
    	}
    	
    	const topWorkRelationVO = {};
    	topWorkRelationVO.memberId = memberId;
    	topWorkRelationVO.topWorkNo = topWorkNo;
    	
    	axios
    	  .post("/kanban/topWorkRelationInsert", topWorkRelationVO)
    	  .then((res) => {
    		//성공!!! 근데 무조건 추가할게 아니라 조건문으로 담당자 배정 했을때만 인서트해야함
    		  console.log(res); 
    	  });
    	
    })
    ;
  });

  //카테고리 모달(인서트)
  const btnCategoryModalCansel = document.querySelector("#category-cancel");

  const categoryModalOpen = () => {
    document.querySelector("#info-alert-modal").classList.add("show");
    document.querySelector("#info-alert-modal").style.display = "block";
  };

  const categoryModalClose = () => {
    document.querySelector("#info-alert-modal").classList.remove("show");
    document.querySelector("#info-alert-modal").style.display = "none";
  };
  //카테고리 모달(업데이트)
  const categoryUpdateModalOpen = (evnet) => {
    //console.dir(event.target.previousSibling);
    document.querySelector("#category-name-update").value =
      event.target.previousSibling.data;
    document.querySelector("#category-update-modal").classList.add("show");
    document.querySelector("#category-update-modal").style.display = "block";
  };
  const categoryUpdateModalClose = () => {
    document.querySelector("#category-name-update").value = "";
    document.querySelector("#category-update-modal").classList.remove("show");
    document.querySelector("#category-update-modal").style.display = "none";
  };

  //드래그 아이템들 그리기용
  function topWorkListRender() {
    axios
      .post("/kanban/list")
      .then((response) => {
        //console.log(response.data);
        //여기서 div를 만들어줘야함
        //일단은 모두 배정된 작업에 넣어버리기
        const json = response.data;

        let text = "";
        for (item of json) {
          console.log(item.topWorkTitle);
          text = "";
          text += `<div class="table-responsive draggable" onclick="detailOpen(\${item.topWorkNo})" id="\${item.topWorkNo}" style="margin: 10px;">`;
          text += `  <table class="table table-borderless mb-0">`;
          text += `      <thead class="table-active \${item.twCategoryNo}">`;
          text += `          <tr>`;
          text += `              <th>\${item.topWorkTitle}</th>`;
          text += `          </tr>`;
          text += `      <tbody class="table-light">`;
          text += `          <tr>`;
          text += `              <td>\${item.topWorkContent}</td>`;
          text += `          </tr>`;
          text += `      </tbody>`;
          text += `  </table>`;
          text += `</div>`;

          let categoryId = "#category-" + item.twCategoryNo;
          //원하는 위치에 인서트해주는(append처럼) 메소드 insertAdjacentHTML(위치, 문자열)
          document
            .querySelector(categoryId)
            .insertAdjacentHTML("beforeend", text);
        }
      })
      .then((res) => {
        //일단 컬러코드 적용을 억지로라도 해보기
        //1. thead클래스를 전부 가져온다
        //2. 클래스명과 pk가 일치하면 색상코드를 넣어준다.
        console.log(
          "컬러코드 타겟 : ",
          document.querySelectorAll(".draggable")
        );
        const targets = document.querySelectorAll(".draggable");
        for (item of targets) {
          //console.log("노드들");
          //console.log("타겟부모", item.parentNode.className.split(" ")[1]);
          let itemColor = item.parentNode.className.split(" ")[1];
          //console.dir(item.children[0].children[0]); //thead 다가져옴
          //테이블헤드 색상을 해당 카테고리의 색상으로 변경해준다.
          item.children[0].children[0].style.backgroundColor = itemColor;
          //이동이 완료되었을때 굳이 재랜더링은 안해줘도 될거같다.
          //어차피 본인페이지에도 이동 + 다른사람이 봤을때도 이동 됨.
        }
      });
  }

  //드래그 이벤트주기용
  function drag(target) {
    target.forEach((container) => {
      //인자로 자식 div들을 받음
      //console.log("드래그왜안돼 : ", container);
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
          console.log("이동중", event.from.id);
          //console.log("엔드아이템 : ", event.item.id);
          const topWorkNo = event.item.id; //내려놓은 아이템 pk번호
          const beforeTwCategoryNo = event.from.id.split("-")[1]; //도착한 곳 카테고리 pk번호
          const twCategoryNo = event.to.id.split("-")[1]; //도착한 곳 카테고리 pk번호
          console.log("topWorkNo = ", topWorkNo);
          //여기서 그 영역 div의 id를 가져와야함.
          //console.log("부모 : ", event.from);
          //console.log("시작한 부모아이디 : ", event.from.id);
          //console.log("도착한 부모요소 아이디 : ", event.to.id);//도착한 div영역
          const changeColor = event.to.className.split(" ")[1]; //도착한 div영역 컬러
          //console.dir(event.item.firstElementChild.children[0]); //thead
          event.item.firstElementChild.children[0].style.backgroundColor =
            changeColor;

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
          });
        },
      });
    });
  }

  function logInsert(map) {
    axios.post("/kanban/logInsert", map).then((res) => {
      console.log(res);
    });
  }
</script>
