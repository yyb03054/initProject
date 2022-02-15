<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="examination.*"%>
    
<%
				UserInfo user = new UserInfo("한국인","1004","200");
				ProductInfo product = new ProductInfo();
				String code = request.getParameter("code");
				product.setCode(code);
				product.find();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="result.jsp" id="searchForm" name="searchForm">
				<h2 align="center">제품코드 조회 결과</h2>
	   <table border="1" align="center" cellspacing="0">
	   				<tr>
	   								<td colspan="2" align="center">
	   												제조사 조회 결과
	   								</td>
	   				</tr>
	   				<tr>
	   								<td>
	   												제품코드
	   								</td>
	   								<td align="center">
	   												<%=product.getCode() %>
	   								</td>
	   				</tr>
	   				<tr>
	   								<td>
	   												제품코드
	   								</td>
	   								<td align="center">
	   												<%=product.getName() %>
	   								</td>
	   				</tr>
	   				
	   				<tr>
	   								<td>
	   												조회일시
	   								</td>
	   								<td align="center">
	   												<%=product.getDate() %>
	   								</td>
	   				</tr>
	   				
	   				<tr>
	   								<td colspan="2" align="center">
	   											<button type="button" class="btn btn-secondary" id="" onclick="location.href='javascript:history.back()'">확인</button>
	   								</td>
	   				</tr>
	   </table>
	   <div align="center">
	   				작성자 : <%=user.getName() %> 비번 : <%=user.getCode() %> 작성일 : <%=user.getDate() %>
	   </div>
  </form>
</body>
</html>