<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#container {
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
</head>
<body>

<div id="container">
    <form action="/alram/login" method="post">
        아이디 : <input type="text" name="memId"/><br/>
        비밀번호 : <input type="text" name="memPw"/>
        <button type="submit">로그인</button>
    </form>
</div>
</body>
</html>