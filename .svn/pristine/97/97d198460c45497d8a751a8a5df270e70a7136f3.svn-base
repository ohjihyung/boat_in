<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>LOG-IN</title>
</head>
<style>
input[type=button] {
	background-color: white;
	color: black;
}

input[type=button]:hover {
	background-color: skyblue;
	color: white;
}

div {
	margin-right: 150px;
}
</style>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" id="nav">HELLO</a>
		</div>
	</nav>
	<br />
	<br />
	<div style="display: flex;">

		<div id="root" style='display: inline-flex; flex-direction: column;'>
			아이디 : <input type="text" name="mem_id" id="mem_id" /> 비밀번호 : <input
				type="text" name="mem_pass" id="mem_pass" /> 이름 : <input type="text"
				name="mem_name" id="mem_name" /> <input type="button" id="loginBtn"
				value="LOG-IN" onclick="" />
		</div>

		<div id="container"></div>
		<div id="bodyDiv"></div>

	</div>
</body>
<script>
var flagImage = false;
var flagWork = false;
var flagInner = false;

const btn = document.querySelector("#loginBtn");

btn.addEventListener("click", () => loginAsync());

const loginAsync = () => {
	const mem_id = document.querySelector("#mem_id").value; 
	const mem_pass = document.querySelector("#mem_pass").value;
	const mem_name = document.querySelector("#mem_name").value;
	
	const request = getRequest("/exam/login");
	request.send("mem_id=" + mem_id + "&mem_pass=" + mem_pass + "&mem_name=" + mem_name);
	
	request.onreadystatechange = function () {
		if (request.readyState === 4 && request.status === 200) { //조건 두개 다 써야 한번만 실행
			const target = document.querySelector("#root");
			const json = request.response;
			console.log(json);
			const data = JSON.parse(json);
			const name = data.mem_id;
			console.log(data);
			console.log(data.mem_id);
			console.log(data.mem_pass);
			
			text = "";
			text += "[로그인 회원 정보]<br/>";
			text += "아이디 : " + data.mem_id + "<br/>";
			text += "이름 : " + data.mem_name + "<br/>";
			text += data.mem_name + "님 환영합니다. <br/>";
			
			target.innerHTML = text;
			document.querySelector("#nav").innerHTML = "HELLO! " + data.mem_name;
			menu();
		}
	}
}

function menu() {
	const container = document.querySelector("#container");
	
	text = "";
	text += "[메뉴를 선택하세요]<br/>";
	text += "<hr/>";
	text += "<a href=javascript:library()>1. [내 자료실]</a> <br/>";
	text += "<a href=javascript:goGallery()>2. [내 갤러리]</a> <br/>";
	
	container.innerHTML = text;
}

const goGallery = () => location.href = "/exam/goGallery";

const library = () => {
	const request = getRequest("/exam/library");
	request.send();
	
	request.onreadystatechange = () => {
		if (request.readyState === 4 && request.status === 200) {
			const target = document.querySelector("#bodyDiv");
			const data = request.response;
			const json = JSON.parse(data);
			
			text = "";
			for (let key in json) {
				text += "<input type=button value=" + json[key] + " onclick=clickDir()><br/>";
				text += "<div id=bodyDiv-child-" + json[key] +"></div>";
			}
			
			target.innerHTML = text;
		}
	};
};

const clickDir = () => {
	
	console.log(event.target.value); //폴더명 가져옴.
	const myTarget = event.target;
	const dirName = event.target.value;
	let targetDiv = "";
	console.log("내 타겟 :", myTarget);
	console.log("dirName : " + dirName);
	
	if (dirName === "image") {
		targetDiv = "bodyDiv-child-image";
		flagImage = changeBtn(flagImage, myTarget, targetDiv);
		//if (flagImage) dirAsync(dirName);
		
/*  	if (flagImage) {
			console.log("image if in");
			event.target.style.color = "black";
			event.target.style.backgroundColor = "white";
			document.querySelector("#bodyDiv-child-image").innerHTML = "";
			flagImage = false;
		} else {
			console.log("image else in");
			event.target.style.color = "white";
			event.target.style.backgroundColor = "skyblue";
			flagImage = true;
			dirAsync(dirName);
		} */
		 
	}
	
	if (dirName === "work") {
		targetDiv = "bodyDiv-child-work";
		flagWork = changeBtn(flagWork, myTarget, targetDiv);
		//if (flagWork) dirAsync(dirName);
		
	/* if (flagWork) {
			console.log("work if in");
            event.target.style.color = "black";
            event.target.style.backgroundColor = "white";
            document.querySelector("#bodyDiv-child-work").innerHTML = ""; //여기가 문제.
            flagWork = false;
        } else {
        	console.log("work else in");
        	event.target.style.color = "white";
            event.target.style.backgroundColor = "skyblue";
            flagWork = true;
            dirAsync(dirName);
        }  */
	}
	
	if (flagImage || flagWork) dirAsync(dirName);
};

const dirAsync = (dirName) => {
	const request = getRequest("/exam/library");
    request.send("dirName=" + dirName);
    
    request.onreadystatechange = () => {
        if (request.readyState === 4 && request.status === 200) {
            const target = document.querySelector("#bodyDiv-child-" + dirName);
            const data = request.response;
            const json = JSON.parse(data);
            
            text = "";
            
            if (dirName == "work") {
	            for (let key in json) {
	                text += "┗<input type=button class=work value=" + json[key] + " onclick=clickInnerDir()><br/>";
		            text += "<div id=" + json[key] + "></div>";
	            }
	            
            } else {
	            for (let key in json) {
	                text += "┗<input type=button value=" + json[key] + " ><br/>";
	            }
	            
            } 
            
            target.innerHTML = text;
        }
    };
};
const clickInnerDir = () => {
   //console.log(event.target.value); //폴더명 가져옴.
   const innerDirName = event.target.value;
   const myTarget = event.target;
   
   flagInner = changeBtn(flagInner, myTarget, myTarget.value); //flagInner로 changeBtn()의 반환값을 받아야만 값이 바뀌는 것을 받을 수 있음!
   
   if (flagInner) innerDirAsync(myTarget.value);
};

const innerDirAsync = (innerDirName) => {
 	const dirName = event.target.className;
 	
	const request = getRequest("/exam/library");
    request.send("dirName=" + dirName + "&innerDirName=" + innerDirName);
	
    request.onreadystatechange = () => {
    	if (request.readyState === 4 && request.status === 200) {
    		const target = document.getElementById(innerDirName);
    		const data = request.response;
    		const json = JSON.parse(data);
    		console.log(json);
    		
    		let text = "";
    		
    		for (let key in json) {
                text += "<div id=" + innerDirName + ">";
                text += "&nbsp;&nbsp;&nbsp;┗<input type=button value=" + json[key] + "><br/>";
                text += "</div>";
            }
    		
    		target.innerHTML = text;
    	}
    };
};

const getRequest = (path) => {
	const request = new XMLHttpRequest();
	request.open("POST", path, true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    
    return request;
};

//액션 함수
changeBtn = (flag, target, targetDiv) => {
	console.log("플래그뭐야 : ", flag);
	console.dir(flag);
	if (flag) {
	    target.style.color = "black";
	    target.style.backgroundColor = "white";
	    document.getElementById(targetDiv).innerHTML = "";
	    console.log("in");
	} else {
	    console.log("else");
	    target.style.color = "white";
	    target.style.backgroundColor = "skyblue";
	    //비동기 함수가 실행될 자리
	}
	
    return flag = !flag;
};
</script>
</html>