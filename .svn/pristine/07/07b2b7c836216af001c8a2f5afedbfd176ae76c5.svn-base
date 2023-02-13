<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <h2 id="memId">${memberVO.memId }님 안녕하세요.</h2>
    <hr/>
    <div style="flex-direction: row;">
        <h3>admin에게 알람 보내기</h3>
        <form action="#" id="sendFrm-admin">
	        내용 : <input type="text" id="content-admin"/>
	        <input type="submit" value="send"/>
        </form>
        <hr/>
        <div class="dropdown">
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" id="alramList-admin">
        admin 미확인 알람
    </button>
    <div class="dropdown-menu" id="dropList-admin">
        <!-- 여기에 알람 리스트 -->
      <a class="dropdown-item" href="#"></a>
    </div>
    </div>
    <div>    
        <h2>member에게 알람 보내기</h2>
        <form action="#" id="sendFrm-member">
	        내용 : <input type="text" id="content-member"/>
	        <input type="submit" value="send"/>
        </form>
        <hr/>
        <div class="dropdown">
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" id="alramList-member">
        member 미확인 알람
    </button>
    <div class="dropdown-menu" id="dropList-member">
        <!-- 여기에 알람 리스트 -->
      <a class="dropdown-item" href="#"></a>
    </div>
    </div>
        
    
  </div>
</div>
  
  <!-- 알람 모달 -->
  <div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">알람 내역</h4>
        <button type="button" class="close" data-dismiss="modal" onclick="modalClose()">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="alramContent">
        Modal body..
      </div>
      <div class="modal-body" id="alramDate">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="modalClose()">Close</button>
      </div>

    </div>
  </div>
</div>
  
</body>

<script>
//우선 먼저 시작
alramChk("admin");
alramChk("member");
//미확인 알람이 있으면 표시
setInterval(() => alramChk("admin"), 5000);
setInterval(() => alramChk("member"), 5000);

var adminFrm = document.querySelector("#sendFrm-admin");

adminFrm.addEventListener("submit", (event) => {
	event.preventDefault();
	//console.log(event.target);
	const alramContent = document.querySelector("#content-admin").value;
	const alramId = "admin";
	
	const map = {alramContent, alramId};
	
	const obj = {};
	obj.method = "post";
	obj.header = "json";
	obj.url = "/alram/insert";
	obj.sendData = JSON.stringify(map);
	
	myAsync(obj, (response) => {
		console.log(response);
	});
});

var memberFrm = document.querySelector("#sendFrm-member");

memberFrm.addEventListener("submit", (event) => {
    event.preventDefault();
    const alramContent = document.querySelector("#content-member").value;
    const alramId = "member";
    
    const map = {alramContent, alramId};
    
    const obj = {};
    obj.method = "post";
    obj.header = "json";
    obj.url = "/alram/insert";
    obj.sendData = JSON.stringify(map);
    
    myAsync(obj, (response) => {
        console.log(response);
    });
});

function alramDetail() {
	const alramId = "admin"
	
    const map = { alramId };
    
    const obj = {};
    obj.method = "post";
    obj.url = "/alram/myList";
    obj.header = "json";
    obj.sendData = JSON.stringify(map);
    
    myAsync(obj, (response) => {
    	   
    });
}

function alramChk(arg) {
	const map = { alramId : arg };
	
	const obj = {};
	obj.method = "post";
	obj.url = "/alram/myList";
	obj.header = "json";
	obj.sendData = JSON.stringify(map);
	
	myAsync(obj, (response) => {
		const json = JSON.parse(response);
		console.log(json);
		
		if (arg == "admin") {
			var root = document.querySelector("#alramList-admin");
			var dropList = document.querySelector("#dropList-admin");
		} else {
			var root = document.querySelector("#alramList-member");
			var dropList = document.querySelector("#dropList-member");
		}
		
		if (json.length == 0) {
			root.innerHTML = "미확인 알람이 없습니다.";
			return;
		} 
		
		root.innerHTML = `admin 미확인 알람 \${json.length} 개`;
		
		text = "";
		for (item of json) {
			text += `<a class="dropdown-item" href="javascript: modalOpen('\${item.alramNo}',
				                                    '\${item.alramContent}', '\${item.alramDate}')">
			\${item.alramContent}
			</a>`;
		}
		
		dropList.innerHTML = text;
	});
}

function modalOpen(alramNo, alramContent, alramDate) {
	document.querySelector("#alramContent").innerText = alramContent;
	document.querySelector("#alramDate").innerText = alramDate;
	
	$("#myModal").show();
	
	//수정
	const map = { alramNo };
	
	const obj = {};
	obj.method = "post";
	obj.header = "json";
	obj.url = "/alram/update";
	obj.sendData = JSON.stringify(map);
	
	myAsync(obj, (response) => {});
	
	//목록초기화
	alramChk("admin");
	alramChk("member");
}

function modalClose() {
	$("#myModal").hide();
}

function myAsync(obj, pCb) {
    let header =
      obj.header == "json"
        ? "application/json"
        : "application/x-www-form-urlencoded";
    
    const xhr = new XMLHttpRequest();
    xhr.open(obj.method, obj.url, true);
    xhr.setRequestHeader("Content-type", header);
  
    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4 && xhr.status === 200) {
        pCb(xhr.responseText);
      }
    };
  
    xhr.send(obj.sendData);
}
</script>
</html>