<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logoicon.png" style="height:20%;">
<title>INIT 스토어 - 로그인</title>

<script>
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var userId = $("#userId").val();
            var userPw = $("#userPw").val();
            if(userId == ""){
                alert("아이디를 입력하세요.");
                $("#userId").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(userPw == ""){
                alert("아이디를 입력하세요.");
                $("#userPw").focus();
                return;
            }
            // 폼 내부의 데이터를 전송할 주소
            document.form1.action="${path}/member/loginCheck.do"
            // 제출
            document.form1.submit();
        });
    });
</script>

<style>
	a {
		text-decoration:none;
	}
	
	.Action {
		border:1px solid #bebebe;
		font-size:20px;
		width:410px;
		height:50px;
		background-color:salmon;
		color:white;
	}
</style>



</head>
<body>
<br><br><br>
	<h3 align="center" style="font-size:40px;">관리자 로그인</h3>
	<form name="form1" method="post">
        <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                <td><input name="userId" id="userId"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="userPw" id="userPw"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="btnLogin">로그인</button>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
    </form>
<!-- 	<form name="frm" method="POST" action="login.do">
	<table align="center" cellspacing="15" width="300" style="margin:auto;">
		<tr>
			<td>
				<input type="text" name="adminId" placeholder="아이디" size="50" style="padding:15px;" maxlength="20">
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="adminPw" placeholder="비밀번호"size="50" style="padding:15px;" maxlength="15">
			</td>
		</tr>
	</table>
		<p align="center">
			<input type="submit" class="Action" value="로그인">
		</p>
	</form> -->
</body>
</html>