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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logoicon.png" style="height:20%;">
<meta charset="UTF-8">
<title>INIT 스토어 - 구매내역</title>
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
function fn_init_orderList() {
    document.detailFormOrder.action = "<c:url value='/initOrderList.do'/>";
    document.detailFormOrder.submit();
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
<form:form commandName="sellVO" id="detailFormOrder" name="detailFormOrder" >
<div class="container">
	<div class="container logo" style="float:center;">
		<a href="/INIT_PRO/"><img src="${pageContext.request.contextPath}/images/logo.png" width="400" height="80" /><img src="${pageContext.request.contextPath}/images/admin.png" width="200" height="40" /></a>
	</div>
	
	<div id="search">
              
   <ul>
      <div class="form-group" style="float:left;">
          <span class="btn btn-default cal-btn">
               <a href="javascript:fn_init_orderList();">이전 페이지로</a>
          </span>
      </div>
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
          
	
	<br/><br/><br/>
           <div class="form-group" style="float:left;">
            <a href="main.do" style="color:black;">메인</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="initProductList.do"style="color:black;">상품리스트</a> &nbsp;&nbsp;>&nbsp;&nbsp;<a href="initOrderList.do" style="color:black;">구매내역 리스트</a>
            </div>
           <br/>
	<div class="container">
		<form action="/order/orderResult" method="post">
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">구매내역 상세</h1>
			
<table>
	<tbody>
		<div class="row">
		
			<div class="form-horizontal">
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">주문번호 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px;">&nbsp;${sellVO.orderNum}</span></div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">상품번호 | 상품명 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px; display:inline-flex;">&nbsp;${sellVO.prdNum}</span>&nbsp;
							<span class="form-control" style="width:400px; display:inline-flex;">${sellVO.prdName}</span>
							</div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">판매처코드 | 판매처명 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px; display:inline-flex;">&nbsp;${sellVO.shopCode}</span>&nbsp;
							<span class="form-control" style="width:400px; display:inline-flex;">${sellVO.shopName}</span>
							</div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">배송업체코드 | 업체명 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px; display:inline-flex;">&nbsp;${sellVO.delCode}</span>&nbsp;
							<span class="form-control" style="width:400px; display:inline-flex;">${sellVO.delName}</span>
							</div>
						</div>

						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">원가 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px;">&nbsp;<fmt:formatNumber value="${sellVO.prdPrice}" type="number"/>원</span></div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">할인가 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px; display:inline-flex;">&nbsp;<fmt:formatNumber value="${sellVO.prdPriceSale}" type="number"/>원&nbsp;</span>
							<span class="form-control" style="width:65px; display:inline-flex;">${sellVO.salePer}&nbsp;%</span>
							</div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">배송비 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px;">&nbsp;<fmt:formatNumber value="${sellVO.delPrice}" type="number"/>원</span></div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">결제금액 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px;">&nbsp;<fmt:formatNumber value="${sellVO.totalPrice}" type="number"/>원</span></div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">수량 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px;">&nbsp;${sellVO.prdCnt}</span></div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">주문자 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px;">&nbsp;${sellVO.userName}</span></div>
						</div>
		
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">주소 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:100px;">&nbsp;${sellVO.postCode}</span></div>
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10"><span class="form-control" style="width:600px;">&nbsp;${sellVO.roadAdd}</span></div>
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10"><span class="form-control" style="width:600px;">&nbsp;${sellVO.detailAdd}</span></div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">이메일 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px;">&nbsp;${sellVO.userEmail}</span></div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">전화번호 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px;">&nbsp;${sellVO.userPhone}</span></div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">배송메세지 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:600px;">&nbsp;${sellVO.delMessage}</span></div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">주문시간 : </label>
							<div class="col-sm-10"><span class="form-control" style="width:200px;">&nbsp;${sellVO.orderDate}</span></div>
						</div>


						
			</div>
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
