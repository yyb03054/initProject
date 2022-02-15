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
<title>INIT 스토어 - 상품 구매</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">


<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/css/main.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<link href="<c:url value="/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/css/goods.css"/>" rel="stylesheet">
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

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

$(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 3000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        autoControls: false, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
        slideWidth: 1260, // 크기
        slideMargin: 0,
        autoDelay: 0,
        responsive: true,
        controls : true,      
    });
    $("a[name='title']").on("click", function(e){ //제목 //name 이 title인거
    	console.log("잘들어옴");
    	e.preventDefault();
    	fn_openBoardDetail($(this));
    });
    
});
function fnCalCount(type, ths){
    var $input = $("#prdCnt").val();
    
    if(type=='p'){
        if($input < 10) 
        $("#prdCnt").val(Number($input)+1);
        
    }else{
        if($input >0) 
        	$("#prdCnt").val(Number($input)-1);    
        
        }
}
function fn_init_productList() {
           document.detailFormUser.pageIndex.value = 1; 
           document.detailFormUser.action = "<c:url value='/initProductList.do'/>";
           document.detailFormUser.submit();
        }
function fn_init_sellList() {
    document.detailFormUser.action = "<c:url value='/initSellList.do'/>";
    document.detailFormUser.submit();
 }
function enterkey() {
    if (window.event.keyCode == 13) {

         // 엔터키가 눌렸을 때 실행할 내용
         fn_init_productList();
    }
    
    
}


 function fn_init_order() {
	
   		alert ("관리자 페이지입니다.");
   	
 }


</script>
</head>
<body>
<form:form commandName="sellVO" id="detailFormUser" name="detailFormUser" onSubmit="return false">
<div class="container">
<br/>
<br/>
	<div class="container logo" style="float:center;"  align="center">
		<a href="/INIT_PRO/"><img src="${pageContext.request.contextPath}/images/logo.png" width="400" height="80" /><img src="${pageContext.request.contextPath}/images/admin.png" width="200" height="40" /></a>
	</div>
	<input type="hidden" id="prdNum" name = "prdNum" value="${sellVO.prdNum}" >
	<input type="hidden" id="shopCode" name = "shopCode" value="${sellVO.shopCode}" >
	<input type="hidden" id="selectedShop" name = "selectedShop" value="${sellVO.shopCode}" >
	<input type="hidden" id="prdPrice" name = "prdPrice" value="${sellVO.prdPrice}" >
	<div id="search">
              
                <ul>
                
                  <div class="form-group" style="float: right;">
                  
					<label for="searchKeyword" class="col-sm-2 control-label" style="visibility:hidden;display:none;"></label>
					
					<div class="col-sm-10" style="width:75%;">
						<input class="form-control" id="searchKeyword" placeholder="검색어를 입력해주세요" name="searchKeyword" style="width:300px;"value="${searchVO.searchKeyword}">
					</div>
					<div class="col-sm-10"  style="width:25%;">
					<span class="btn btn-default cal-btn">
                        <a href="javascript:fn_init_productList();" onkeyup="enterkey();">상품 검색</a>
                        <form:hidden path="pageIndex" />
                    </span>
					</div>
					
				</div>
                </ul>
           </div>
          
	
	<br/><br/><br/>
           <div class="form-group" style="float:left;">
            <a href="main.do" style="color:black;">메인</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="initProductList.do" style="color:black;">상품리스트</a> &nbsp;&nbsp;>&nbsp;&nbsp;
            <a href="javascript:fn_init_sellList();" style="color:black;">${sellVO.prdName}</a>
        
            </div>
           <br/>
	<div class="container">
		<form action="/order/orderResult" method="post">
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">주문하기</h1>
<table>
	<tbody>
	<tr>
		<%-- <div class="row"><h1 class="page-header" style="text-align: center; margin-bottom: 50px;">${sellVO.prdName}</h1>
			<input type="hidden" value="${sellVO.prdNum}" id="productId">
			<label for="prdNum">
			
			</label>
			
		</div> --%>
		<div align="center">

</div>
<div class="row" style="float: left; text-align: center; width:50%;">
		<div align="center">
		<ul class="bxslider">
		<c:if test="${imgList[0].imgAddress == null}">
		<li><a><img src="${pageContext.request.contextPath}/images/noimg.jpg"  style="width:auto; height:500px;"></a></li>
		</c:if>
		<c:forEach var="imgList" items="${imgList}">
		    <li><a><img src="${pageContext.request.contextPath}/upload/${imgList.imgAddress}"  style="width:auto; height:500px;"></a></li>
      <!-- <li><a href="#"><img src="https://image.a-rt.com/art/product/2020/10/58054_1601963564155.jpg?shrink=580:580" ></a></li>
      <li><a href="#"><img src="https://image.a-rt.com/art/product/2020/10/21898_1601963565315.jpg?shrink=580:580" ></a></li>
      <li><a href="#"><img src="https://image.a-rt.com/art/product/2020/10/58054_1601963564155.jpg?shrink=580:580" ></a></li>
      <li><a href="#"><img src="https://image.a-rt.com/art/product/2020/10/21898_1601963565315.jpg?shrink=580:580" ></a></li> -->
  </c:forEach>
</ul>
		</div>
		</div>
		

		<div class="row productInfo" style="width: 40%; float: right;" >
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header"><span style="color:#5858FA;">${sellVO.brdName}&nbsp;&nbsp;&nbsp;</span><span>${sellVO.prdName}</span><br><small>${productInfo.productInfo}</small></h3>
			</div>
			<div class="form-group" style="text-align: right;">
				<span><img src="${pageContext.request.contextPath}/images/shop.png" width="5%", height="5%">&nbsp;${sellVO.shopName}</span>
			</div>
			<div class="form-group" id="price" style="text-align: left;">
				<label></label><span>
				<%-- <fmt:formatNumber value="${sellVO.prdPrice}" pattern="#,###"/> --%>
				<input type="hidden" value="${sellVO.prdPrice}" type="number"/></span><span></span>
		
				<label></label><span id="prdPriceSale"></span>
				
			</div>
			<input type="hidden" value="${sellVO.prdPrice}" id="price">
			<div class="form-group" style="text-align: left;">
				<label>배송비 : </label><span>&nbsp;<fmt:formatNumber value="${sellVO.delPrice}" type="number"/></span><span>&nbsp;원</span>
				<input type="hidden" id="delPrice" name = "delPrice" value="${sellVO.delPrice}">
			</div>
			<div class="form-group" style="text-align: left;">
				<span><img src="${pageContext.request.contextPath}/images/delivery.png" width="7%", height="7%">&nbsp;${sellVO.delName}</span>
				<input type="hidden" id="delCode" name = "delCode" value="${sellVO.delCode}">
			</div>
			<div class="form-group" style="text-align: left;">
				<label></label><span id="overseasDel">&nbsp;${sellVO.overseasDel}</span>
			</div>
			<div class="form-group" style="text-align: left;">
			<label>수량  </label>
			<!-- <button type ="button" onclick="fnCalCount('p',this);">+</button>
			<input  type="text" id="prdCnt" name="prdCnt" size = "10" value="1" class = "form-control order_Qty"/>
			<button type="button" onclick="fnCalCount('m', this);">-</button> -->
			 <select id="prdCnt" name="prdCnt" class="form-control order_Qty" >
			
				<option value="1" label="1" />
    			<option value="2" label="2" />
    			<option value="3" label="3" />
    			<option value="4" label="4" />
    			<option value="5" label="5" />
			</select> 
			</div>
			<div class="row" style="text-align: center; margin: 50px 0;">
				<label>상품가격 :&nbsp; <span id="totalPriceSale"><fmt:formatNumber value="${sellVO.prdPrice}" type="number"/></span>&nbsp;원</label><br/>
				<!-- <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> -->
				<label>배송비 :&nbsp;<span id="del_fee"><fmt:formatNumber value="${sellVO.delPrice}" type="number"/></span>&nbsp;원
				</label><br/>
				<label style="font-size: 1.5em;">총 결제금액 : <span id="totalPrice"><fmt:formatNumber value="${sellVO.prdPrice}" type="number"/></span>&nbsp;원
				<input type="hidden" id="amount" name="totalAmount">
				</label>
			</div>

							
		</tr>
	</tbody>
</table>
</div>
		 
		<div class="row" style="text-align: center; margin: 80px 0;">
		<c:set value="${memberInfo}" var="vo"/>
			<h1 class="page-header">주문정보 확인</h1>
			<h4 style="color: red;">주문자 정보와 배송지가 다른 경우 직접 입력해주세요.</h4>
		</div>
		<div class="row">
			<div class="form-horizontal">
				<%-- <div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10">
						<input class="form-control" id="userName" placeholder="이름" name=""userName"" value="${vo.userid}" readonly>
					</div>
				</div> --%>
				
				<div class="form-group">
					<label for="userName" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10">
						<input class="form-control" id="userName" placeholder="이름" name="userName" >
					</div>
				</div>				
				<div class="form-group">
					<label for="userAddress" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-10">
						<input class="form-control" style="display:inline-flex; width:100px;" type="text" id="postCode" name="postCode"  placeholder="우편번호" readonly>
						<input type="button" class="btn btn-default btn-sm" id="searchAdd" value="우편번호 찾기"><br/><br/>
						<input class="form-control" type="text" id="roadAdd" name="roadAdd" placeholder="도로명주소" readonly><br/>
						<input class="form-control" type="text" id="detailAdd" name="detailAdd" placeholder="상세주소">
					</div>
				</div>				
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="userEmail" placeholder="이메일" name="userEmail" >
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">휴대전화 번호</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="userPhone" placeholder="휴대전화 번호  ex) 01x-1234-5678" name="userPhone" >
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">배송 메세지</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="delMessage" placeholder="배송 메세지" name="delMessage">
					</div>
				</div>				
			</div>
		</div><!-- class=row -->
		
		
		
		<div class="row" style="text-align: center; margin: 80px 0;">

			<hr>
			<div class="row" style="text-align: center; margin: 50px 0;">
				<label>상품가격 :&nbsp; <span id="prdPrice1"><fmt:formatNumber value="${sellVO.prdPrice}" type="number"/></span>&nbsp;원</label>
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				<label>배송비 :&nbsp;<span id="del_fee"><fmt:formatNumber value="${sellVO.delPrice}" type="number"/></span>&nbsp;원
				</label>
				<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
				<label style="font-size: 1.5em;">총 결제금액 : <span id="totalPrice1"></span>&nbsp;원
				<input type="hidden" id="amount" name="totalAmount">
				</label>
			</div>
			<div>
				<!-- <button class="btn btn-default cal-btn" type="submit">결제하기</button> -->
				<span class="btn btn-default cal-btn">
                        <a href="javascript:fn_init_order();">결제하기</a>
                    </span>
				<span class="btn btn-default cal-btn">
				<input type="hidden" id="selectedId" name = "selectedId" value="${sellVO.prdNum}"/>
                        <a href="javascript:fn_init_sellList();">돌아가기</a>
                    </span>
			</div>
		</div>
		</form>
	</div>
	<footer>
 <jsp:include page="footer.jsp"></jsp:include>
 </footer> 
</div>
</form:form>
<script type="text/javascript">
	
function numberWithCommas(num) { 
    var parts = num.toString().split("."); 
    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (parts[1] ? "." + parts[1] : ""); 
}
	$(document).ready(function() {
		
		var selectedId = $("#productId").val();
		var overseasDel = "<c:out value='${sellVO.overseasDel}'/>";
		var price = "<c:out value='${sellVO.prdPrice}'/>";
		var del_fee = "<c:out value='${sellVO.delPrice}'/>";
		/* var totalPrice = Number(price) + Number(del_fee);
		$("#totalprice").html(totalPrice); */
		/* $("#totalprice1").html(totalPrice); */
		
		if(overseasDel == "Y")
		{
			overseasDel = '본 상품은 해외배송이 가능합니다.';
		}
		else if(overseasDel == "N")
		{
			overseasDel = '본 상품은 국내배송만 가능합니다.';
		}
		$("#overseasDel").html(overseasDel);
		
		 $("select[name='prdCnt']").click(function() { 
			var qty = $(".order_Qty").val();
			var amount = price * qty;
			var prdPriceSale = (1-((maxPer)/100)) * (detailFormUser.prdPrice.value);      // 할인된 가격
			var qty = $(".order_Qty").val();
			var amountSale = (Math.ceil(prdPriceSale/10)*10)*qty;
	  var totalAmountSale = Number(amountSale) + Number(del_fee);
			 totalAmount = Number(amountSale) + Number(del_fee);
			 totalAmountSale = numberWithCommas(totalAmountSale);
			 prdPriceSale = numberWithCommas(prdPriceSale);
			 amountSale = numberWithCommas(amountSale);
				 /* totalAmount = Number(amount) + Number(del_fee);  */
				/* $("#prdPrice").html(amount); */
				$("#prdPrice1").html(amountSale);
				$("#delPrice").html(del_fee);
				 $("#totalPrice").html(totalAmountSale);
				$("#totalPrice1").html(totalAmountSale);
				$("#totalPriceSale").html(amountSale);
				$("#amount").val(totalAmount);
				
				/* test='<input type="hidden" id="totalPrice" name="totalPrice" value="'+ totalAmountSale +'"/>'
				$("#totalPriceSale").append(test); */
		 }); 
		
		 
		 var form = new FormData(document.getElementById('detailFormUser'));
		 var now=new Date();
		 var year = now.getFullYear();
			var month = now.getMonth() + 1;   
			var date = now.getDate();      
			if((month+"").length < 2) {  // 월이 한자리 수인 경우 앞에 0을 붙여줘서 두자리로 만들어 준다.
			     month = "0" + month;
			    }
			 
			    if((date+"").length < 2) {       // 일이 한자리 수인 경우 앞에 0을 붙여준다.
			     date = "0" + date;
			    }
			today = year +"" + month + "" + date;
			prdNum : $("#prdNum").val();
			shopCode : $("#shopCode").val();
			prdPrice : $("#prdPrice").val();
			var maxPer = 0;
			var maxSaleNum;
			
  $.ajax({
     url : "saleList.do"
/*            , enctype: 'multipart/form-data' */
   , type : 'POST'
   , processData : false
   , contentType : false 
   , data : form
   , datatype : "text"
   /* , cache : false */
   , success:function(data) {
	
			for(var i=0; i < data.saleList.length; i++)
			{
				start_date = $("#start_date").val();
				end_date = $("#end_date").val();
				
											if(data.saleList[i].saleSdateC <= today && today<= data.saleList[i].saleFdateC){
															if(maxPer <= data.saleList[i].salePer){
															maxPer = data.saleList[i].salePer;
															maxSaleNum = data.saleList[i].saleNum;
															maxSaleSdate = data.saleList[i].saleSdate;
															maxSaleFdate = data.saleList[i].saleFdate;
															maxSaleName = data.saleList[i].saleName;
															}
											}
			}
			var del_fee = "<c:out value='${sellVO.delPrice}'/>";
			var prdPrice = detailFormUser.prdPrice.value;
			var prdPriceSale = (1-((maxPer)/100)) * (detailFormUser.prdPrice.value);
			var amountSale = (Math.ceil(prdPriceSale/10)*10);
			var totalPriceSale = Number(amountSale) + Number(del_fee);
			var totalPrice = Number(prdPrice) + Number(del_fee);
			if(!maxPer==0)
			{
				totalPriceSale = numberWithCommas(totalPriceSale);
				prdPriceSale = numberWithCommas(Math.ceil(prdPriceSale/10)*10);
				prdPrice = numberWithCommas(prdPrice);
				test = '<label>가격 : &nbsp;</label><span>&nbsp;<del>'+prdPrice+'</del></span><span style="font-size:20px;">&nbsp;'
				+ '&nbsp;'+prdPriceSale+'</span>&nbsp;원 <input type="hidden" id="prdPriceSale" name="prdPriceSale" value = "'+ Math.ceil(prdPriceSale/10)*10 +'"/>'
				+ '<input type="hidden" id="salePer" name="salePer" value="'+ maxPer +'"/>';
				/* + '<input type="hidden" id="totalPrice" name="totalPrice" value="'+ totalPrice +'"/>'; */
				
				totalPrice = numberWithCommas(totalPrice);
				totalPriceSale = numberWithCommas(totalPriceSale);
			$('#prdPriceSale').append(test);
			/* $("#prdPriceSale").html(Math.ceil(prdPriceSale/10)*10); */
			/* $("#prdPrice").html(amountSale); */
			$("#prdPrice1").html(totalPriceSale); 
			$("#totalPrice").html(totalPriceSale);
			$("#totalPriceSale").html(totalPriceSale);
			$("#totalPrice1").html(totalPriceSale);
			/* $('#prdPriceSale').append('<input type="hidden" id="prdPriceSale" name="prdPriceSale" value="'+ Math.ceil((prdPriceSale)/10)*10 + '"/>'); */
			}
			else{
				prdPriceSale = numberWithCommas(prdPriceSale);
				prdPrice = numberWithCommas(prdPrice);
				test = '<label>가격 : &nbsp;</label><span style="font-size:20px;">'+prdPrice+'</span><span>&nbsp;원</span><input type="hidden" id="prdPriceSale" name="prdPriceSale" value = "'+ prdPrice +'"/>';
				/* +  '<input type="hidden" id="totalPrice" name="totalPrice" value="'+ totalPriceSale +'"/>'; */
				totalPrice = numberWithCommas(totalPrice);
				totalPriceSale = numberWithCommas(totalPriceSale);
				
				$('#prdPriceSale').append(test);
				$("#totalPrice").html(totalPrice);
				$("#totalPrice1").html(totalPrice);
				$('#salePrice').append('<a>  등록된 할인이 없습니다. </a>');
			}
   }
  });
		/* $(".back_btn").click(function(event) {
			event.preventDefault();
			location.assign("/product/show/" + productId);
		});

		$("#mycart_btn").click(function(event) {
			event.preventDefault();
			location.assign("/order/mycart/" + userid);
			
		});
		
		$("li").on('click', function() {
			var productDist = $(this).attr("value");
			location.assign("/product/" + productDist);
		});
		
		$("#go_to_member_insert").click(function(event) {
			event.preventDefault();
			
			location.assign("/member/insert");
		});
		
		$("#mypage_btn").click(function(event) {
			event.preventDefault();
			var userid = $("#login_userid").val();
			
			location.assign("/member/read/" + userid);
		})
		
		$("#logout_btn").click(function(event) {
			event.preventDefault();
			
			var logout = confirm("로그아웃 하시겠습니까?");
			
			if (logout) {
				location.assign("/member/logout");
			}
		});
		
		$("#go_to_adminPage").click(function(event) {
			event.preventDefault();
			
			location.assign("/admin/main");
		
		});
		*/
		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
		
		
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function postcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.address; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postCode').value = data.zonecode;
	                document.getElementById("roadAdd").value = roadAddr;
	                
	            }

	        }).open();
	    } 
	
	});
	
</script>

</body>
</html>
