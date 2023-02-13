<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<style>
img {
	width: 150px;
	height: 150px;
}
</style>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="navbar-header">
			<a class="navbar-brand" href="/exam/start">로그인 페이지</a>
		</div>
	</nav>




	<div id="root">
		<div id="mainDir"></div>
	</div>

</body>
<script>
var flagImage = false;
var flagWork = false;
var flagInner = false;

window.onload = () => {
	mainDirAjax();
};

function getRequest(path) {
    const request = new XMLHttpRequest();
    request.open("POST", path, true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    
    return request;
}


const mainDirAjax = () => {
	const request = getRequest("/exam/library");
	request.send();
	
	request.onreadystatechange = () => {
        if (request.readyState === 4 && request.status === 200) {
            const target = document.querySelector("#mainDir");
            const data = request.response;
            const json = JSON.parse(data);
            
            text = "";
            text += "<div 'style=display: flex;'>";
            for (let key in json) {
            	text += "<div style='display: inline-flex;flex-direction:column;'>";
            	if (json[key].includes(".")) {
            		text += "<div><a href=#><img src=https://cdn-icons-png.flaticon.com/512/6583/6583130.png></div>";
	                text += "<button class='btn btn-primary'>" + json[key] + "</button></a><br/>";
            	} else {
	                text += "<div><a href=#><img src=https://cdn-icons-png.flaticon.com/512/3767/3767084.png></div>";
	                text += "<button class=btn onclick=clickDir()>" + json[key] + "</button></a><br/>";
            	}
                text += "<div id=bodyDiv-child-" + json[key] +"></div>";
                text += "</div>";
            }
            text += "</div>";
            target.innerHTML = text;
        }
    };
	
};

const clickDir = () => {
	//console.log(event.target.innerText);
	const dirName = event.target.innerText;
	
	if (dirName === "image") {
        if (flagImage) {
            console.log("image if in");
            document.querySelector("#bodyDiv-child-image").innerHTML = "";
            flagImage = false;
        } else {
            console.log("image else in");
            flagImage = true;
            dirAjax(dirName);
        }
        
    }
    
    if (dirName === "work") {
        if (flagWork) {
            console.log("work if in");
            document.querySelector("#bodyDiv-child-work").innerHTML = "";
            flagWork = false;
        } else {
            console.log("work else in");
            flagWork = true;
            dirAjax(dirName);
        }
    }
    
};

const dirAjax = (dirName) => {
	console.log(dirName);
	const request = getRequest("/exam/library");
	request.send("dirName=" + dirName);
	
	request.onreadystatechange = () => {
        if (request.readyState === 4 && request.status === 200) {
            const target = document.querySelector("#bodyDiv-child-" + dirName);
            const data = request.response;
            const json = JSON.parse(data);
            const path = "C:\\ddit\\Framwork\\Spring\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\DevProject\\resources\\mybox\\image";
            text = "";
            
            if (dirName == "work") {
                	text += "<div 'style=display: flex;'>";
                for (let key in json) {
                	text += "<div style='display: inline-flex;flex-direction:column;'>";
                	text += "<div><a href=#><img src=https://cdn-icons-png.flaticon.com/512/3767/3767084.png></div>";
                    text += "<input type=button class=work value=" + json[key] + " onclick=clickInnerDir()>";
                    text += "<div id=" + json[key] + "></div>";
                    text += "</div>"
                }
                
            } else {
            	text += "<div 'style=display: flex;'>";
                for (let key in json) {
                	text += "<div style='display: inline-flex;flex-direction:column;'>";
                    text += "<div><img src=/resources/mybox/image/" + json[key] + "></div>";
                    text += "<a href=/exam/showImg?fileName=" + json[key] + "><button class='btn btn-primary'>" + json[key] + " 보기</button></a>";
                    text += "</div>"
                }
                
            } 
                    text += "</div>"
            
            target.innerHTML = text;
        }
    };
};

const clickInnerDir= () => {
	const innerDirName = event.target.value;
	
	 if (flagInner) {
	       document.getElementById(innerDirName).innerHTML = "";
	       flagInner = false;
	       console.log("innerDirName if in & flagInner = ", flagInner);
	   } else {
	       flagInner = true;
	       console.log("innerDirName else in & flagInner = ", flagInner);
	       innerDirAjax(innerDirName);
	   }
};

const innerDirAjax = (innerDirName) => {
	console.log(innerDirName);
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
                text += "<img src=https://cdn-icons-png.flaticon.com/512/6583/6583130.png><input type=button class='btn btn-primary' value=" + json[key] + "><br/>";
                text += "</div>";
            }
            
            target.innerHTML = text;
        }
    };
};
</script>
</html>