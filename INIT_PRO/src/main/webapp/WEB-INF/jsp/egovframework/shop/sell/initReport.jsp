<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logoicon.png" style="height:20%;">
<title>INIT 스토어 - Reporting</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<c:set var="registerFlag" value="${empty sellVO.shopCode ? 'create' : 'modify'}"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/css/main.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<style type="text/css">
	#text_in_the_image{
		float: left;
		margin-top: 50px;
		margin-left: 130px;
		text-align: left;
	}
	
	#text_in_the_image h1{

		font-size: 5em;
		font-family: 'Impact';
	}
	
	#text_in_the_image h3{

		font-size: 3em;
		font-family: 'Copperplate';
	}	
	
	#text_in_the_image p{

		font-size: 8em;
		font-family: 'Impact';
	}	
	
	#text_in_the_image p span{
	
		text-align: center;
		font-family: 'Impact';
		color: red;
		text-shadow: 3px 4px 5px gray;
	}
	
	.container{
		margin-top: 50px;
	}
	
	.products li{
		list-style: none;
	}
	
	.products li .scale{
		text-align: center;
		font-family: '나눔명조 Bold';
	}
	
	.nav li{
		cursor: pointer;
	}
	
	 .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .swiper {
        margin-left: auto;
        margin-right: auto;
      }
	
</style>
<script type="text/javaScript" language="javascript" defer="defer">
function fn_init_productList() {
           document.detailFormUser.pageIndex.value = 1; 
           document.detailFormUser.action = "<c:url value='/initProductList.do'/>";
           document.detailFormUser.submit();
        }
function enterkey() {
    if (window.event.keyCode == 13) {

         // 엔터키가 눌렸을 때 실행할 내용
         fn_init_productList();
    }
}
function fn_init_update() {
	
    document.detailFormShop.action = "<c:url value="${registerFlag == 'create' ? '/addShop.do' : '/updateShopPost.do'}"/>";
    document.detailFormShop.submit();
 }
function fn_init_delete() {
   	document.detailFormShop.action = "<c:url value='/deleteShop.do'/>";
   	document.detailFormShop.submit();
}
function fn_select() { 
		document.detailFormShop.action = "<c:url value='/initReport.do'/>";
		document.detailFormShop.submit();
	
}
function fn_init_productList() {
	document.detailFormShop.pageIndex.value = 1;
   document.detailFormShop.action = "<c:url value='/initProductList.do'/>";
      document.detailFormShop.submit();
}

</script>
<style>
.slash {
  background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><line x1="0" y1="100%" x2="100%" y2="0" stroke="gray" /></svg>');
}
.backslash {
  background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><line x1="0" y1="0" x2="100%" y2="100%" stroke="gray" /></svg>');
}
</style>
</head>
<body>
<form:form commandName="searchVO" id="detailFormShop" name="detailFormShop" >
<div class="container">
	<div class="container logo" style="float:center;" align="center">
		<a href="/INIT_PRO/"><img src="${pageContext.request.contextPath}/images/logo.png" width="400" height="80" /><img src="${pageContext.request.contextPath}/images/admin.png" width="200" height="40" /></a>
	</div>
	<form:hidden path="pageIndex" />
	<div id="search">
              
                <ul>
                <div class="form-group" style="float:left;">
              <span class="btn btn-default cal-btn">
                        <a href="javascript:fn_init_productList();">상품 목록으로</a>
                    </span>
                    </div>
                  <div class="form-group" style="float: right;">
                  
					<label for="searchKeyword" class="col-sm-2 control-label" style="visibility:hidden;display:none;"></label>
				<%-- 	<form:form commandName="searchVO" id="searchForm" name="searchForm" method="post"  accept-charset="utf-8" onSubmit="return false"> --%>
					

				</div>
                </ul>
           </div>
          
	
	<br>
	<br>
	<div class="container">
	<div class="form-group" style="float:left;">
            <a href="main.do" style="color:black;">메인</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="initProductList.do"style="color:black;">상품리스트</a> 
            &nbsp;&nbsp;>&nbsp;&nbsp;<a>Reporting</a>
            </div>
           <br/>
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">Reporting</h1>
			
<div id="table1">
           <div class="form-group" style="float:right;">
           <label for="searchCondition" style="visibility:hidden;"></label><span>연도 : </span>
        				<form:select path="searchConditionY" cssClass="use" value="${searchVO.searchConditionY}" >
        					<form:option value="0" label="전체" />
        					<form:option value="1" label="2020년" />
        					<form:option value="2" label="2021년" />
        				</form:select>
        	
           <label for="searchCondition" style="visibility:hidden;"></label><span>월 : </span>
        				<form:select path="searchCondition" cssClass="use" value="${searchVO.searchCondition}">
        					<form:option value="0" label="전체" />
        					<form:option value="1" label="1월" />
        					<form:option value="2" label="2월" />
        					<form:option value="3" label="3월" />
        					<form:option value="4" label="4월" />
        					<form:option value="5" label="5월" />
        					<form:option value="6" label="6월" />
        					<form:option value="7" label="7월" />
        					<form:option value="8" label="8월" />
        					<form:option value="9" label="9월" />
        					<form:option value="10" label="10월" />
        					<form:option value="11" label="11월" />
        					<form:option value="12" label="12월" />
        				</form:select>
        			<span class="btn btn-default cal-btn"><a href="javascript:fn_select();">검색</a></span>
        		</div>		
              <table class="table table-striped table-bordered table-hover" width="100%" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
                 <caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
                 <colgroup>
                    <col width="200"/>
                    <c:forEach var="shopList" items="${shopList}" varStatus="status">
                    <col width="50"/>
                    <col width="150"/>
                    </c:forEach>
                 </colgroup>
                 <tr >
                 
                    <th align="center" class="backslash"rowspan="2">   <span style="float:right;margin-right:30px;">판매처</span><br/><br/><span style="text-align:left;margin-left:40px;">상품</span></th>
                 
                 <c:forEach var="shopList" items="${shopList}" varStatus="status">
                    <th align="center" style="text-align:center;"colspan="2">${shopList.shopName}</th>
                 </c:forEach>
                 </tr>
                 <tr >
                 <c:forEach var="shopList" items="${shopList}" varStatus="status">
                    <th align="center" style="text-align:center;">수량</th>
                    <th align="center" style="text-align:center;">가격</th>
                 </c:forEach>
                 </tr>
				                <c:set var = "total1" value = "0" /><c:set var = "total1c" value = "0" />
				                <c:set var = "total2" value = "0" /><c:set var = "total2c" value = "0" />
				                <c:set var = "total3" value = "0" /><c:set var = "total3c" value = "0" />
				                <c:set var = "total4" value = "0" /><c:set var = "total4c" value = "0" />
                  <c:forEach var="reportList" items="${reportList}" varStatus="status">
                  <tr>
                  <td align="center" class="listtd"><c:out value="${reportList.prdName}"/>&nbsp;</td>
                  <td align="center" class="listtd"><c:out value="${reportList.shop1c}"/>&nbsp;</td>
                  <td align="right" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${reportList.shop1}"/></td>
                  <td align="center" class="listtd"><c:out value="${reportList.shop2c}"/>&nbsp;</td>
                  <td align="right" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${reportList.shop2}"/> </td>
                  <td align="center" class="listtd"><c:out value="${reportList.shop3c}"/>&nbsp;</td>
                  <td align="right" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${reportList.shop3}"/> </td>
                  <td align="center" class="listtd"><c:out value="${reportList.shop4c}"/>&nbsp;</td>
                  <td align="right" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${reportList.shop4}"/> </td>
                   <c:set var = "total1" value = "${total1+reportList.shop1}" /><c:set var = "total1c" value = "${total1c+reportList.shop1c}" />
                   <c:set var = "total2" value = "${total2+reportList.shop2}" /><c:set var = "total2c" value = "${total2c+reportList.shop2c}" />
                   <c:set var = "total3" value = "${total3+reportList.shop3}" /><c:set var = "total3c" value = "${total3c+reportList.shop3c}" />
                   <c:set var = "total4" value = "${total4+reportList.shop4}" /><c:set var = "total4c" value = "${total4c+reportList.shop4c}" />
                  </tr>
                  </c:forEach>
                  <tr>
                  <td align="center" class="listtd">합계</td>
                  <td align="center" class="listtd"><c:out value="${total1c}"/></td>
                  <td align="right" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total1}"/></td>
                  <td align="center" class="listtd"><c:out value="${total2c}"/></td>
                  <td align="right" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total2}"/></td>
                  <td align="center" class="listtd"><c:out value="${total3c}"/></td>
                  <td align="right" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total3}"/></td>
                  <td align="center" class="listtd"><c:out value="${total4c}"/></td>
                  <td align="right" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total4}"/></td>
                  </tr>
                <%--  <c:forEach var="shopList" items="${shopList}" varStatus="status">
                     <tr style = "cursor:pointer;" onClick = " javascript:fn_init_sellList('<c:out value="${product.prdNum}"/>'); ">
                     <c:set var="num" value="${paginationInfo.totalRecordCount+1-((searchVO.pageIndex-1)*searchVO.recordCountPerPage+status.count)}"/>
                     <c:choose>
                     <c:when test="${num ge 0}">
                        <td align="center" class="listtd"><img src="${pageContext.request.contextPath}/upload/${product.imgAddress}" width = "100" height = "100"/></td>
																								<td align="center" class="listtd"><c:out value="${shopList.shopCode}"/>&nbsp;</td>
                        <td align="center" class="listtd"><c:out value="${shopList.shopName}"/>&nbsp;</td>
                        <input type="hidden" value="${product.prdNum}" id="prdNum" name="prdNum"/>
                        <td align="center" class="listtd"><c:out value="${shopList.ceo}"/>&nbsp;</td>
                        <td align="center" class="listtd"><c:out value="${shopList.shopAdd}"/>&nbsp;</td>
																								
                     <td align="center" class="listtd" onclick ="event.cancelBubble=true;">    
                        <div id="sysbtn">
														                     <span class="btn btn-default cal-btn">
														                         <a href="javascript:fn_init_select('<c:out value="${shopList.shopCode}"/>');">수정</a>
														                      </span>
														              
														           </div>
       												  </td>
           
    																	</tr>
              </c:forEach> --%>
         
              </table>
           </div>

</div>
	</div>

<script type="text/javascript">
	

		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
		
	
	
</script>
<footer>
 <jsp:include page="footer.jsp"></jsp:include>
 </footer>
</div>
</form:form>
</body>
</html>
