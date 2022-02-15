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
<title>INIT 스토어 - 판매처 수정</title>
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

</script>
</head>
<body>
<form:form commandName="sellVO" id="detailFormShop" name="detailFormShop" >
<div class="container">
	<div class="container logo" style="float:center;">
		<a href="/INIT_PRO/"><img src="${pageContext.request.contextPath}/images/logo.png" width="400" height="80" /><img src="${pageContext.request.contextPath}/images/admin.png" width="200" height="40" /></a>
	</div>
	
	<div id="search">
              
                <ul>
                
                  <div class="form-group" style="float: right;">
                  
					<label for="searchKeyword" class="col-sm-2 control-label" style="visibility:hidden;display:none;"></label>
				<%-- 	<form:form commandName="searchVO" id="searchForm" name="searchForm" method="post"  accept-charset="utf-8" onSubmit="return false"> --%>
					<div class="col-sm-10" style="width:75%;">
						<input class="form-control" id="searchKeyword" placeholder="검색어를 입력해주세요" name="searchKeyword" style="width:300px;"value="${searchVO.searchKeyword}">
					</div>
					<div class="col-sm-10"  style="width:25%;">
					<span class="btn btn-default cal-btn">
                        <a href="javascript:fn_init_productList();" onkeyup="enterkey();">검색</a>
                        <form:hidden path="pageIndex" />
                    </span>
					</div>
					<%-- </form:form> --%>
				</div>
                </ul>
           </div>
          
	
	<br>
	<br>
	<div class="container">
	<div class="form-group" style="float:left;">
            <a href="main.do" style="color:black;">메인</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="initProductList.do"style="color:black;">관리자 상품리스트</a> 
            &nbsp;&nbsp;>&nbsp;&nbsp;<a href="initShopList.do" style="color:black;">판매처 리스트</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a>${sellVO.shopName}</a>
            </div>
           <br/>
		<form action="/order/orderResult" method="post">
		<div class="row qnas" style="text-align: center;">
		<c:if test="${registerFlag == 'modify'}">
			<h1 class="page-header">판매처 수정</h1>
			</c:if>
		<c:if test="${registerFlag == 'create'}">
		<h1 class="page-header">판매처 등록</h1>
		</c:if>	
<table>
	<tbody>
		<div class="row">
			<div class="form-horizontal">
			 <c:if test="${registerFlag == 'modify'}">
				<div class="form-group">
					<label for="shopCode" class="col-sm-2 control-label">판매처 코드</label>
					<div class="col-sm-10">
						<input class="form-control" id="shopCode" placeholder="ID" name="shopCode" value="${sellVO.shopCode}" readonly/>
					</div>
				</div>
				</c:if>
				<div class="form-group">
					<label for="shopName" class="col-sm-2 control-label">판매처 이름</label>
					<div class="col-sm-10">
						<input class="form-control" id="shopName" placeholder="판매처 이름을 입력해주세요" name="shopName" value="${sellVO.shopName}">
					</div>
				</div>
				<div class="form-group">
					<label for="ceo" class="col-sm-2 control-label">대표자</label>
					<div class="col-sm-10">
						<input class="form-control" id="ceo" placeholder="대표자 이름을 입력해주세요" name="ceo" value="${sellVO.ceo}">
					</div>
				</div>	
				<div class="form-group">
					<label for="shopAdd" class="col-sm-2 control-label">판매처 주소</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" placeholder="주소를 입력해주세요" id="shopAdd" name="shopAdd" value="${sellVO.shopAdd}">
					</div>
				</div>							
			</div>
		</div>
		<div class="form-gorup" style="float:right;">
		<span class="btn btn-default cal-btn">
		 <c:if test="${registerFlag == 'create'}">
     <a href="javascript:fn_init_update();">등록&nbsp;</a>
     </c:if>
     <c:if test="${registerFlag == 'modify'}">
     <a href="javascript:fn_init_update();">수정&nbsp;</a>
     </c:if>
 	</span>
 	<c:if test="${registerFlag == 'modify'}">
 	<span class="btn btn-default cal-btn">
     <a href="javascript:fn_init_delete();">삭제</a>
 	</span>
 	</c:if>
  </div>

							

	</tbody>
</table>

</div>
<footer>
 <jsp:include page="footer.jsp"></jsp:include>
 </footer>
		</form>
	</div>

<script type="text/javascript">
	

		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
		
	
	
</script>
</div>
</form:form>
</body>
</html>
