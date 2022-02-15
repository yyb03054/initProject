<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logoicon.png" style="height:20%;">
<title>INIT 스토어 - 판매처수정</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    
 
    <script type="text/javaScript" language="javascript" defer="defer">

        function fn_init_save() {
        	frm = document.shopForm;
            			frm.action = "<c:url value='/addShop.do'/>";
               frm.submit();
               opener.parent.location.reload();
        }
     </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<form:form commandName="sellVO" id="shopForm" name="shopForm">
<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
    		<colgroup>
    			<col width="150"/>
    			<col width="?"/>
    		</colgroup>
    		
    		<!-- ---------------------------------상품번호---------------------------------------- -->
    		
    		<tr>
    			<td class="tbtd_caption"><label for="shopName"><spring:message code="title.sell.shopName" /></label></td>
    			<td class="tbtd_content">
    				<form:input path="shopName" size="20" maxlength="100" cssClass="text" />
    				&nbsp;<form:errors path="shopName" />
    				
    			</td>
    		</tr>
    		
    		
    		
    		
    		</table>
    		
    		 <div id="sysbtn">
             <ul>
                 <li>
    		 									<span class="btn_blue_l">
                        <a href="javascript:fn_init_save();"><spring:message code="button.create" />
                        </a>
                        <img src="<c:url value='/images/egovframework/shop/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
    												</span>
    		
    		
    										</li>
              </ul>
       </div>
    		</form:form>
</body>
</html>