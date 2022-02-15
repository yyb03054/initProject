<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  /**
  * @Class Name : initSellRegister.jsp
  * @Description : Sell Register 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <c:set var="registerFlag" value="${empty sellVO.shopCode ? 'create' : 'modify'}"/>

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logoicon.png" style="height:20%;">
<title>INIT 스토어 - 상품별 판매처수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/css/main.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

   
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery-ui-custom.css'/>"  />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.jqgrid.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.multiselect.css'/>" />

<script src="<c:url value='/js/jqgrid/jquery.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/jqgrid/jquery-ui-custom.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/jqgrid/jquery.layout.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/jqgrid/grid.locale-en.js'/>" type="text/javascript"></script>
<script type="text/javascript">
   $.jgrid.no_legacy_api = true;
   $.jgrid.useJSON = true;
</script>
<script src="<c:url value='/js/jqgrid/ui.multiselect.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/jqgrid/jquery.jqGrid.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/jqgrid/jquery.tablednd.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/jqgrid/jquery.contextmenu.js'/>" type="text/javascript"></script>
    <script type="text/javaScript" language="javascript" defer="defer">

        /* 글 목록 화면 function */
        function fn_init_selectList() {
           	document.detailForm.action = "<c:url value='/initSellList.do'/>";
           	document.detailForm.submit();
        }
        function fn_init_selectList1() {
           	document.detailForm.action = "<c:url value='/initSellList1.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_init_delete() {
           	document.detailForm.action = "<c:url value='/deleteSell.do'/>";
           	document.detailForm.submit();
        }
        function fn_init_deleteSale(saleNum) {
        				document.saleForm.selectedSale.value = saleNum;
           	document.saleForm.action = "<c:url value='/deleteSale.do'/>";
           	document.saleForm.submit();
        }

        /* 글 등록 function */
       
        function fn_init_save() {
        	frm = document.detailForm;
        	
		            	/* frm.selectedId.value=prdNum; */
            			frm.action = "<c:url value="${registerFlag == 'create' ? '/addSellPost.do' : '/updateSell.do'}"/>";
               frm.submit();
               
           
        }
        
        function showPopup() { 
        	window.open("shopRegister.do", "판매처 등록", "width=400, height=300, left=100, top=50"); 
        	}
        
         function showPopupSale() {
        	/*  post submit 방식으로 윈도우오픈 */
        	window.open("addSale.do", "할인 등록", "width=850, height=450, left=100, top=50");
        	openWin.document.getElementById("c_prdNum").value = document.getElementById("p_prdNum").value;
        	openWin.document.getElementById("c_shopCode").value = document.getElementById("p_shopCode").value;
        	openWin.document.getElementById("c_shopName").value = document.getElementById("p_shopName").value; 
        	} 
         
         function showPopupSaleReg(saleNum) {
        
         	 document.detailForm.selectedSale.value = saleNum;
        	 document.detailForm.action = "<c:url value='/saleRegister.do'/>";
             document.detailForm.submit();   
              
         	  /*  window.open("saleRegister.do", "할인 등록", "width=600, height=300, left=100, top=50"); 
         	  openWin.document.getElementById("saleName").value = document.getElementById("saleNum").value; */
         /* 	 var frmPop= document.frmPopup;
             var url = 'saleRegister.do';
             window.open('','popupView','옵션');  
              
             frmPop.action = url;
             frmPop.target = 'popupView'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
             frmPop.selectedSale.value = saleNum;
             frmPop.submit();  */
         	} 
        
       /*  
       
        function comma(str) {

            str = String(str);

            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');

        }
        function uncomma(str) {

            str = String(str);

            return str.replace(/[^\d]+/g, '');

        }
        function inputNumberFormat(obj) {

            obj.value = comma(uncomma(obj.value));

        }
        function formatNumber(n) {
        	var reg = /(^[+-]?\d+)(\d{3})/;    // 정규식(3자리마다 ,를 붙임)
        	n += ''; // ,를 찍기 위해 숫자를 문자열로 변환
        	while (reg.test(n)) // n값의 첫째자리부터 마지막자리까지
        	n = n.replace(reg, '$1' + ',' + '$2');   //인자로 받은 n 값을 ,가 찍힌 값으로 변환시킴
        	return n; // 바뀐 n 값을 반환.
        	 }
        
        	function changeValue(num){
        	    document.getElementById('t1').value=formatNumber(num);
        	 }
        	 */
        	 

    	 $(document).ready (function(){  	 
    		 
    		 var params = {
    																	selectedId :  $("#prdNum").val(),
                     selectedShop : $("#shopCode").val()
                }
        	 $.ajax({
        	       url:'ajaxList.do',
        	       dataType: 'json',
        	       type:"post",
        	       data: params,
        	       success:function(data){
        	         if ( data.saleList.length > 0 ) {
        	                 /* $ ( '#saleList' ).find ( 'saleList' ).remove (); */
        	                 /* $ ( '#saleList' ).append ( "<option value='none'>선택</option>" ); */
        	                 for ( var _idx = 0 ; _idx < data.saleList.length ; _idx++ ) {
        	                	 
        	                	 /* $ ( '#saleList' ).append ( "<option value='"+data.saleList[_idx].saleNum+"'>" + data.saleList[_idx].saleName + '</option>' ); */
        	                	 /* $ ( '#saleName' ).append ( "<c:out value="+data.saleList[_idx].saleName+"	  />' ); */
        	                	 
        	                	 
        	                			 
        	                 }
        	                 
        	           }else{
        	           /*  $ ( '#saleList' ).find ( 'saleList' ).remove ();
        	            $ ( '#saleList' ).append ( "<option value=''>선택</option>" ); */
        	           }
        	       } 
      	      });
    	 });
 $(document).ready (function(){
	   var salePer = $("#salePer").val();
	   var prdPrice = $("#prdPrice").val();
	   var salePrice = Number(prdPrice) * (1-Number(salePer)/100);
	   $("#salePrice").html(Math.ceil(salePrice/10)*10+"원"); 
	   
			 var form = new FormData(document.getElementById('detailForm'));
			 /* var now=new Date();
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
    /*   , type : 'POST'
       , processData : false
       , contentType : false 
       , data : form
       , datatype : "text"
       /* , cache : false */
  /*     , success:function(data) {
  	
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
				if(!maxPer==0)
				{
				$('#saleList').append('<a>  할 인 명  : </a>');
				$('#saleList').append('<span>'+	maxSaleName +'<span/><br/>');
				$('#saleList').append('<a>  할 인 율  : </a>');
				$('#saleList').append('<span>'+	maxPer +'% <span/><br/>');
				$('#saleList').append('<a>할인기간 : </a>');
				$('#saleList').append('<span>'+	maxSaleSdate +'<span/>');
				$('#saleList').append('<a>~</a>');
				$('#saleList').append('<span>'+	maxSaleFdate +'<span/><br/>');
				$('#saleList').append('<a>할인가격 : </a>');
				$('#saleList').append('<span>'+	(1-(maxPer/100)) *prdPrice.value +'원<span/><br/>');
				}
				else{
					$('#saleList').append('<a>  등록된 할인이 없습니다. </a>');
				}
}
	  }); */
});
        
 
 
 function fn_deleteSale(saleNum){
	 var yn = confirm("할인을 삭제하시겠습니까?");
	    var params = {
	             selectedSale : saleNum ,
	             selectedId : $("#prdNum").val(),
	             selectedShop : $("#shopCode").val()
	        }
			if(yn){
	      $.ajax({            // HTTP method type(GET, POST) 형식이다.
	         data:params,
	         dataType : "json",
	         url : 'deleteSale.do',    // 컨트롤러에서 대기중인 URL 주소이다.
	         type:'POST'
	         , success : function (data) { // controllor에서 list를 return 받았음
	        	  alert("삭제되었습니다.");
	         location.reload();
	          },
	          error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	              alert("통신 실패.")
	          }
	      });
			}
 }
 function fn_init_sellList() {
	    document.detailForm.action = "<c:url value='/initSellList.do'/>";
	    document.detailForm.submit();
	 }
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<div class="container">
	<div class="container logo" style="float:center;">
		<a href="/INIT_PRO/"><img src="${pageContext.request.contextPath}/images/logo.png" width="400" height="80" /><img src="${pageContext.request.contextPath}/images/admin.png" width="200" height="40" /></a>
	</div>
<form:form commandName="sellVO" id="detailForm" name="detailForm">
    <div id="container">
    	<!-- 타이틀 -->
    	<br/><br/><br/>
           <div class="form-group" style="float:left;">
            <a href="main.do" style="color:black;">메인</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="initProductList.do" style="color:black;">상품리스트</a> &nbsp;&nbsp;>&nbsp;&nbsp;<a>
           <a href="javascript:fn_init_sellList();">${sellVO.prdName}</a>
            </a>
            </div>
           <br/>
    	<div class="row qnas" style="text-align: center;">
    	<c:if test="${registerFlag == 'modify'}">
			<h1 class="page-header">판매처 수정</h1>
			</c:if>
			<c:if test="${registerFlag == 'create'}">
			<h1 class="page-header">판매처 등록</h1>
			</c:if>
       <!-- // 타이틀 -->
<table>
	<tbody>
		<div class="row">
			<div class="form-horizontal">
			 <c:if test="${registerFlag == 'modify'}">
				<div class="form-group">
					<label for="prdNum" class="col-sm-2 control-label">상품번호</label>
					<%-- <input type="hidden" id="p_prdNum"  value="${sellVO.prdNum}"/>
					<input type="hidden" id="p_shopCode" value="${sellVO.shopCode}"/>
					<input type="hidden" id="p_shopNum"  value="${sellVO.shopName}"/> --%>
					<div class="col-sm-10">
						<input class="form-control" id="prdNum" placeholder="ID" name="prdNum" value="${sellVO.prdNum}" readonly/>
					</div>
				</div>
				</c:if>
				<c:if test="${registerFlag == 'create'}">
				<input type="hidden" id="prdNum" name="prdNum" value="${sellVO.prdNum}"/>
				</c:if>
				<div class="form-group">
					<label for="prdName" class="col-sm-2 control-label">상품명</label>
					<div class="col-sm-10">
						<input class="form-control" id="shopName" placeholder="상품명을 입력해주세요" name="prdName" value="${sellVO.prdName}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="brdCode" class="col-sm-2 control-label">브랜드</label>
					<div class="col-sm-10">
						<input class="form-control" id="brdName" placeholder="상품명을 입력해주세요" name="prdName" value="${sellVO.brdName}" readonly>
						<input type="hidden" id="brdCode" name="brdCode" value="${sellVO.brdCode}"/>
					</div>
				</div>	
				<div class="form-group">
					<label for="shopName" class="col-sm-2 control-label">판매처</label>
					<div class="col-sm-10">
					<c:if test="${registerFlag == 'modify'}">
						<input class="form-control" id="shopName" name="shopName" value="${sellVO.shopName}" readonly/>
						<input type="hidden" id="shopCode" name="shopCode" value="${sellVO.shopCode}"/>
						</c:if>
					<c:if test="${registerFlag == 'create'}">
							<form:select class="form-control" path="shopCode" cssClass="use" style="display: block;
    width: 200px;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;">
    <c:if test="${registerFlag == 'create'}">
    <option value="none" style="text-align:center;">===== 선택 =====</option>
    </c:if>
                    <c:forEach var="shopList" items="${shopList}">
                               <form:option value="${shopList.shopCode}" label="${shopList.shopName}"/>
                    </c:forEach>
     </form:select>
     </c:if>
					</div>
				</div>
				
				<div class="form-group">
					<label for="delCode" class="col-sm-2 control-label">배송업체</label>
					<div class="col-sm-10">
						<form:select class="form-control" path="delCode" cssClass="use" style="display: block;
    width: 200px;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;">
    <c:if test="${registerFlag == 'create'}">
    <option value="none" style="text-align:center;">===== 선택 =====</option>
    </c:if>
                    <c:forEach var="delList" items="${delList}">
                               <form:option value="${delList.delCode}" label="${delList.delName}"/>
                    </c:forEach>
     </form:select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="prdPrice" class="col-sm-2 control-label">상품 가격</label>
					<div class="col-sm-10">
						<input class="form-control" id="prdPrice" placeholder="상품가격을 입력해주세요" name="prdPrice" value="${sellVO.prdPrice}">
					</div>
				</div>
				
				<div class="form-group">
					<label for="delPrice" class="col-sm-2 control-label">배송비</label>
					<div class="col-sm-10">
						<input class="form-control" id="delPrice" placeholder="배송비를 입력해주세요" name="delPrice" value="${sellVO.delPrice}">
					</div>
				</div>
				
				<div class="form-group">
					<label for="delCode" class="col-sm-2 control-label" >해외배송여부</label>
					<div class="col-sm-10" >
						<form:select path="overseasDel" cssClass="use" style="display: block;
    width: 120px;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;">
    					<form:option style="text-align:center;" value="Y" label="가능" />
    					<form:option style="text-align:center;" value="N" label="불가능" />
				</form:select>	
					</div>
				</div>
				<c:if test="${registerFlag == 'modify'}">
    <c:if test="${sellVO.saleNum==null }">
    <div class="form-group" style="text-align: left;">
			<label class="col-sm-2 control-label">할인</label>
			<div class="col-sm-10"><span class="form-control" style="width:200px; display:inline-flex;" readonly>금일은 할인이 없습니다.</span>
							</div>
							</div>
			</c:if>
			<c:if test="${sellVO.saleNum!=null }">
				<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">할인번호 | 할인명</label>
							<div class="col-sm-10"><span class="form-control" style="width:70px; display:inline-flex;" readonly>&nbsp;${sellVO.saleNum}&nbsp;</span>
							<span class="form-control" style="width:400px; display:inline-flex;" readonly>${sellVO.saleName}&nbsp;</span>
							</div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">할인율 | 할인가격</label>
							<input type="hidden" id="salePer" name="salePer" value="${sellVO.salePer}"/>
							<div class="col-sm-10"><span class="form-control" style="width:70px; display:inline-flex;" readonly>&nbsp;${sellVO.salePer}&nbsp;%</span>
							<span class="form-control" style="width:400px; display:inline-flex;" readonly id="salePrice">&nbsp;원</span>
							</div>
						</div>
						
						<div class="form-group" style="text-align: left;">
							<label class="col-sm-2 control-label">할인기간</label>
							<div class="col-sm-10">
							<span class="form-control" style="width:130px; display:inline-flex;" readonly>&nbsp;${sellVO.saleSdate}&nbsp;</span>&nbsp;~&nbsp;
							<span class="form-control" style="width:130px; display:inline-flex;" readonly>&nbsp;${sellVO.saleFdate}</span>
							</div>
						</div>
			</c:if>
				</c:if>
				
				
			</div>
		</div>
		<div class="col-sm-10"  style="float:right; width:25%;">
                       <span class="btn btn-default cal-btn">
                           <a href="javascript:fn_init_selectList();">목록</a>
                       </span>
                       
                       <span class="btn btn-default cal-btn">
                       <c:if test="${registerFlag == 'create'}">
                           <a href="javascript:fn_init_save();">등록</a>
                       </c:if>
                       <c:if test="${registerFlag == 'modify'}">
                           <a href="javascript:fn_init_save();">수정</a>
                       </span>
                       <span class="btn btn-default cal-btn">
                            <a href="javascript:fn_init_delete();">삭제</a>
                       </span>
                       </c:if>
                    </div>
							

	</tbody>
</table>
<c:if test="${registerFlag == 'modify'}">
<div id="table1" style="vertical-align:middle;">
              <table class="table table-striped table-bordered table-hover" width="100%" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
                 <caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
                 <colgroup>
                    <col width="100"/>
                    <col width="150"/>
                    <col width="150"/>
                    <col width="150"/>
                    <col width="80"/>
                    <col width="80"/>
                 </colgroup>
                 <tr >
                    <th align="center" style="text-align:center;">할인율</th>
                    <th align="center" style="text-align:center;">할인명</th>
                    <th align="center" style="text-align:center;">할인시작일자</th>
                    <th align="center" style="text-align:center;">할인종료일자</th>
                    <th align="center" style="text-align:center;">수정</th>
                    <th align="center" style="text-align:center;">삭제</th>

                 </tr>
                 
                 <%-- <input id="shopCode" name="shopCode" type="hidden" value="${sellVO.shopCode}"/> --%>
                  <input id="selectedShop" name="selectedShop" type="hidden" value="${sellVO.shopCode}"/>
                  
                 <c:forEach var="saleList" items="${saleList}" varStatus="status">
                     <tr style = " vertical-align:middle; cursor:pointer;" onClick = " javascript:fn_init_sellList('<c:out value="${saleList.saleName}"/>');" >
                        <td align="center" class="listtd" id="salePer"><c:out value="${saleList.salePer}"/>%&nbsp;</td>
                        <td align="center" class="listtd" id="saleName"><c:out value="${saleList.saleName}"/>&nbsp;</td>
                        <td align="center" class="listtd" id="saleSdate"><c:out value="${saleList.saleSdate}"/>&nbsp;</td>
                        <td align="center" class="listtd" id="saleFdate"><c:out value="${saleList.saleFdate}"/></a>&nbsp;</td>
                     			<td align="center" class="listtd" onclick ="event.cancelBubble=true;">    
                     			
                
														           
														             
                       <span class="btn btn-default cal-btn" style="float:center;">
                           <a href="javascript:showPopupSaleReg('<c:out value="${saleList.saleNum}"/>');">수정</a>
                       </span>
                    
														          
														           <td align="center" class="listtd" onclick ="event.cancelBubble=true;"> 
														           
														           
                       <span class="btn btn-default cal-btn">
                           <a href="javascript:fn_deleteSale('<c:out value="${saleList.saleNum}"/>');">삭제</a>
                       </span>
                
														           </td>
														           
														           
														           
														           
														           <input type="hidden" id="start_date" value="${saleList.saleSdate.replace('-','')}"/>
																									<input type="hidden" id="end_date" value="${saleList.saleFdate.replace('-','')}"/>
																									<input type="hidden" id="saleNum" value="${saleList.saleNum}"/>
																									<form>
																									<%-- <input type="hidden" id="prdNum" name="prdNum" value="<c:out value='${sellVO.prdNum}'/>"/> --%>
																									<%-- <input type="hidden" id="selectedId" name="selectedId" value="<c:out value='${sellVO.prdNum}'/>"/> --%>
																									<input type="hidden" id="selectedSale" name= "selectedSale" value="${saleList.saleNum}"/>
																									<%-- <input type="hidden" id="shopCode" name= "shopCode" value="${sellVO.shopCode}"/> --%>
																									</form>
       												  </td>
           
    																	</tr>
              </c:forEach>
              
               
              
            
         
              </table>
               
           </div>
           </c:if>
           
    	<!-- // 타이틀 -->
    	<div id="table">
    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
    		<colgroup>
    			<col width="150"/>
    			<col width="?"/>
    		</colgroup>
    		<!-- --------------------등록------------------- -->
    		<%-- <c:if test="${registerFlag == 'create'}">
    		
    		<!-- ---------------------------------상품번호---------------------------------------- -->
    		
    		<tr>
    			<td class="tbtd_caption"><label for="prdNum"><spring:message code="title.sell.prdNum" /></label></td>
    			<td class="tbtd_content">
    				<form:input path="prdNum" size="70" maxlength="100" cssClass="essentiality" readonly="true" />
    				&nbsp;<form:errors path="prdNum" />
    				
    			</td>
    		</tr>
    		<!-- ---------------------------------상품명---------------------------------------- -->
    		<tr>
    			<td class="tbtd_caption"><label for="prdName"><spring:message code="title.sell.prdName" /></label></td>
    			<td class="tbtd_content">
    				<form:input path="prdName" size="70" maxlength="100" cssClass="essentiality" readonly="true"/>
    				&nbsp;<form:errors path="prdName" />
    			</td>
    		</tr>
    		
    	
    		<!-- ---------------------------------브랜드---------------------------------------- -->
    			<tr>
    			<td class="tbtd_caption"><label for="brdName"><spring:message code="title.sell.brdName" /></label></td>
    				<td class="tbtd_content">
    				<form:input path="brdCode" size="70" maxlength="100" cssClass="essentiality" readonly="true"/>
    				&nbsp;<form:errors path="brdCode" />
    			</td>
    			</tr>
    			
    			<!-- ---------------------------------판매처---------------------------------------- -->
    			
    				<tr>
    			<td class="tbtd_caption"><label for="shopCode"><spring:message code="title.sell.shopCode" /></label></td>
    			<td class="tbtd_content">
    				<form:select path="shopCode" cssClass="use">
    				<option value="none">=== 선택 ===</option>
							  						<c:forEach var="shopList" items="${shopList}">
							   									 <form:option value="${shopList.shopCode}" label="${shopList.shopName}"/>
							  						</c:forEach>
  								</form:select>
    			</td>
    		</tr>
    		
    		<!-- ---------------------------------배송업체---------------------------------------- -->
    		
   			<tr>
    			<td class="tbtd_caption"><label for="delCode"><spring:message code="title.sell.delCode" /></label></td>
    			<td class="tbtd_content">
    				  <form:select path="delCode" cssClass="use">
    				 <option value="none">=== 선택 ===</option>
							  						<c:forEach var="delList" items="${delList}">
							   									 <form:option value="${delList.delCode}" label="${delList.delName}"/>
							  						</c:forEach>
  								</form:select>
    				</td>
  				</tr>

   
					<!-- ---------------------------------판매가격---------------------------------------- -->
    		
    		<tr>
    			<td class="tbtd_caption"><label for="prdPrice"><spring:message code="title.sell.prdPrice" /></label></td>
    			<td class="tbtd_content">
    				<form:input  path="prdPrice" maxlength="10" cssClass="txt"/>
    				&nbsp;<form:errors path="prdPrice" />
    				
    			</td>
    		</tr>
    
    		
 	    <!-- ---------------------------------배송비---------------------------------------- -->
    		
    		<tr>
		    			<td class="tbtd_caption"><label for="delPrice"><spring:message code="title.sell.delPrice" /></label></td>
		    			<td class="tbtd_content">
		    				<form:input  path="delPrice" maxlength="10" cssClass="txt"/>
		    				&nbsp;<form:errors path="delPrice" />	
		    			</td>
    		</tr>
    		
    		
    		
    		<!-- ---------------------------------이미지번호---------------------------------------- -->
    		
    			<tr>
		    			<td class="tbtd_caption"><label for="imgNum"><spring:message code="title.sell.imgNum" /></label></td>
		    			<td class="tbtd_content">
		    				<form:input  path="imgNum" maxlength="10" cssClass="txt"/>
		    				&nbsp;<form:errors path="imgNum" />	
		    			</td>
    		</tr>
    	            
    

      </td>      
    	
    		         <!-- ---------------------------------이미지주소---------------------------------------- -->
    		 <tr>
    			<td class="tbtd_caption"><label for="imgAddress"><spring:message code="title.sell.imgAddress" /></label></td>
    			<td class="tbtd_content">
    				<form:input  path="imgAddress" maxlength="100" cssClass="txt"/>
    				&nbsp;<form:errors path="imgAddress" />
    			</td>
    		</tr>
    		
    		
							  <!-- ---------------------------------해외배송여부---------------------------------------- -->
    	 	<tr>
    			<td class="tbtd_caption"><label for="overseasDel"><spring:message code="title.sell.overseasDel" /></label></td>
    			<td class="tbtd_content">
    	<form:select path="overseasDel" cssClass="use">
    					<form:option value="Y" label="Yes" />
    					<form:option value="N" label="No" />
				</form:select>	
    				</td>
    				</tr>
    				<!-- ---------------------------------이미지---------------------------------------- -->
    		
    			<!-- <script></script> -->
    		<form:form commandName="searchVO" id="detailForm" name="detailForm" method="post"  accept-charset="utf-8" onSubmit="return false">
    		<tr>
    		<c:forEach var="resultList" items="${resultList}">
    			<td align="center" class="listtd"><img src="imgAddress" width="100" height="100"/></td>
    			</c:forEach>
    			
    			
    		</tr>
    		</form:form>
    		</c:if> --%>
    		
    		
							  						<%-- <c:forEach var="brdList" items="${brdList}">
							   									 <form:option value="${brdList.brdCode}" label="${brdList.brdName}"/>
							  						</c:forEach>
  								</form:select> --%>
    		
    		<!-- --------------------수정------------------- -->
    		<%-- <c:if test="${registerFlag == 'modify'}">
    	
    		
    		<!-- ---------------------------------상품번호---------------------------------------- -->
    		
    		<tr>
    			<td class="tbtd_caption"><label for="prdNum"><spring:message code="title.sell.prdNum" /></label></td>
    			<td class="tbtd_content">
    				<form:input style = "text-align:center;" path="prdNum" size="10" maxlength="100" cssClass="essentiality" readonly="true" />
    				&nbsp;<form:errors path="prdNum" />
    				
    			</td>
    		</tr>
    		<!-- ---------------------------------상품명---------------------------------------- -->
    		<tr>
    			<td class="tbtd_caption"><label for="prdName"><spring:message code="title.sell.prdName" /></label></td>
    			<td class="tbtd_content">
    				<form:input style = "text-align:center;" path="prdName" size="70" maxlength="100" cssClass="essentiality" readonly="true"/>
    				&nbsp;<form:errors path="prdName" />
    			</td>
    		</tr>
    		
    	
    		<!-- ---------------------------------브랜드---------------------------------------- -->
    			<tr>
    			<td class="tbtd_caption"><label for="brdName"><spring:message code="title.sell.brdCode" /></label></td>
    				<td class="tbtd_content">
    				<form:input style = "text-align:center;" path="brdName" size="10" maxlength="100" cssClass="essentiality" readonly="true"/>
    				&nbsp;<form:errors path="brdName" />
  							</td>
    			</tr>
    			
    			<!-- ---------------------------------판매처---------------------------------------- -->
    			
    			<tr>
    			<td class="tbtd_caption"><label for="shopCode"><spring:message code="title.sell.shopCode" /></label></td>
    			<td class="tbtd_content">
    				<form:input style = "text-align:center;" path="shopName" size="30" maxlength="100" cssClass="essentiality" readonly="true"/>
    				&nbsp;<form:errors path="shopName" />
    				<form:hidden path="shopCode" id="shopCode"/>
    			</td>
    		</tr>
    		
    		<!-- ---------------------------------배송업체---------------------------------------- -->
    		
   			<tr>
    			<td class="tbtd_caption"><label for="delCode"><spring:message code="title.sell.delCode" /></label></td>
    			<td class="tbtd_content">
    				  <form:select path="delCode" cssClass="use">
    				 
							  						<c:forEach var="delList" items="${delList}">
							   									 <form:option value="${delList.delCode}" label="${delList.delName}"/>
							  						</c:forEach>
  								</form:select>
    				</td>
  				</tr>
  				
  				

   
					<!-- ---------------------------------판매가격---------------------------------------- -->
    		
    		<tr>
    			<td class="tbtd_caption"><label for="prdPrice"><spring:message code="title.sell.prdPrice" /></label></td>
    			<td class="tbtd_content">
    				<form:input  path="prdPrice" maxlength="10" cssClass="txt" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
    				&nbsp;<form:errors path="prdPrice" />
    				
    			</td>
    		</tr>
    
    		
 	    <!-- ---------------------------------배송비---------------------------------------- -->
    		
    		<tr>
		    			<td class="tbtd_caption"><label for="delPrice"><spring:message code="title.sell.delPrice" /></label></td>
		    			<td class="tbtd_content">
		    				<form:input path="delPrice" maxlength="10" cssClass="txt" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		    				&nbsp;<form:errors path="delPrice" />	
		    			</td>
    		</tr>
    		
    	
    		<!-- ---------------------------------이미지번호---------------------------------------- -->
    		
    			<tr>
		    			<td class="tbtd_caption"><label for="imgNum"><spring:message code="title.sell.imgNum" /></label></td>
		    			<td class="tbtd_content">
		    				<form:input  path="imgNum" maxlength="10" cssClass="txt"/>
		    				&nbsp;<form:errors path="imgNum" />	
		    			</td>
    		</tr>
    	            
    

      </td>      
    	
    		         <!-- ---------------------------------이미지주소---------------------------------------- -->
    		 <tr>
    			<td class="tbtd_caption"><label for="imgAddress"><spring:message code="title.sell.imgAddress" /></label></td>
    			<td class="tbtd_content">
    				<form:input  path="imgAddress" maxlength="100" cssClass="txt"/>
    				&nbsp;<form:errors path="imgAddress" />
    			</td>
    		</tr>
    		
    		
							  <!-- ---------------------------------해외배송여부---------------------------------------- -->
    	 	<tr>
    			<td class="tbtd_caption"><label for="overseasDel"><spring:message code="title.sell.overseasDel" /></label></td>
    			<td class="tbtd_content">
    	<form:select path="overseasDel" cssClass="use">
    					<form:option value="Y" label="Yes" />
    					<form:option value="N" label="No" />
				</form:select>	
    				</td>
    				</tr>
    				<!-- ---------------------------------이미지---------------------------------------- -->
    		
    			<!-- <script></script> -->
    		<form:form commandName="searchVO" id="detailForm" name="detailForm" method="post"  accept-charset="utf-8" onSubmit="return false">
    		
    		</form:form>
    		
    		
    		<!-- ---------------------------------할인명---------------------------------------- -->
    			
    			 <tr>
    			<td class="tbtd_caption"><label for="saleNum"><spring:message code="title.sell.saleName" /></label></td>
    			<!-- <td class="tbtd_content" id="saleList"> -->
    				  <input type="hidden" value="${sellVO.prdNum}"/>
    			</td>
    			 
    		</tr> 
    		</c:if> --%>
    			
    	</table>
      </div>
    	<%-- <div id="sysbtn">
    		<ul>
    			<li>
                    <span class="btn_blue_l">
                        <c:if test="${registerFlag == 'create'}"><a href="javascript:fn_init_selectList();"><spring:message code="button.list" /></a></c:if>
                        <c:if test="${registerFlag == 'modify'}"><a href="javascript:fn_init_selectList();"><spring:message code="button.list" /></a></c:if>
                        <img src="<c:url value='/images/egovframework/shop/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<li>
    			
                    <span class="btn_blue_l">
                        <a href="javascript:fn_init_save();">
                            <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                            <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
                        </a>
                        <img src="<c:url value='/images/egovframework/shop/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<c:if test="${registerFlag == 'modify'}">
                    <li>
                        <span class="btn_blue_l">
                            <a href="javascript:fn_init_delete();"><spring:message code="button.delete" /></a>
                            <img src="<c:url value='/images/egovframework/shop/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                        </span>
                    </li>
    			</c:if>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:document.detailForm.reset();"><spring:message code="button.reset" /></a>
                        <img src="<c:url value='/images/egovframework/shop/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
            </ul>
    	</div> --%>
    	
    </div>    
    <!-- 검색조건 유지 -->

    	<input type="hidden" id = "selectedId" name="selectedId" value="<c:out value='${searchVO.prdNum}'/>"/>
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
    <c:if test="${registerFlag == 'modify'}">
    <div id="content_pop">
    <%-- <div id="title">
    		<ul>
    			<li><img src="<c:url value='/images/egovframework/shop/title_dot.gif'/>" alt=""/>
                  <spring:message code="button.sale" />
       </li>
    		</ul>
    	</div> --%>
    	<%-- <form:form commandName="searchVO" id="saleForm" name="saleForm" method="post"  accept-charset="utf-8" >
    <div id="table">
           <div style="overflow:scroll; height:300px; padding:10px; ">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
                 <caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
                 <colgroup>
                    <col width="100"/>
                    <col width="400"/>
                    <col width="200"/>
                    <col width="200"/>
                    <col width="100"/>
                 </colgroup>
                 <tr>
                    <th align="center"><spring:message code="title.sell.salePer" /></th>
                    <th align="center"><spring:message code="title.sell.saleName" /></th>
                    <th align="center"><spring:message code="title.sell.saleSdate" /></th>
                    <th align="center"><spring:message code="title.sell.saleFdate" /></th>
                    <th align="center"><spring:message code="title.sell.modify" /></th>
                 </tr>
                  <input id="shopCode" name="shopCode" type="hidden" value="${sellVO.shopCode}"/>
                  <input id="selectedShop" name="selectedShop" type="hidden" value="${sellVO.shopCode}"/>
                  
                 <c:forEach var="saleList" items="${saleList}" varStatus="status">
                     <tr style = "cursor:pointer;" onClick = " javascript:fn_init_sellList('<c:out value="${saleList.saleName}"/>');" >
                        <td align="center" class="listtd" id="salePer"><c:out value="${saleList.salePer}"/>%&nbsp;</td>
                        <td align="center" class="listtd" id="saleName"><c:out value="${saleList.saleName}"/>&nbsp;</td>
                        <td align="center" class="listtd" id="saleSdate"><c:out value="${saleList.saleSdate}"/>&nbsp;</td>
                        <td align="center" class="listtd" id="saleFdate"><c:out value="${saleList.saleFdate}"/></a>&nbsp;</td>
                     			<td align="center" class="listtd" onclick ="event.cancelBubble=true;">    
                     			<input type="image" onclick="javascript:fn_deleteSale('<c:out value="${saleList.saleNum}"/>');" return false; src="${pageContext.request.contextPath}/images/remove.png">
                        <div id="sysbtn">
														             <ul>
														                 <li>
														                     <span class="btn_blue_l">
														                         <a href="javascript:showPopupSaleReg('<c:out value="${saleList.saleNum}"/>');"><spring:message code="button.modify" /></a>
														                          <img src="<c:url value='/images/egovframework/shop/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
														                      </span>
														                  </li>
														              </ul>
														              
														           </div>
														           <input type="hidden" id="start_date" value="${saleList.saleSdate.replace('-','')}"/>
																									<input type="hidden" id="end_date" value="${saleList.saleFdate.replace('-','')}"/>
																									<input type="hidden" id="saleNum" value="${saleList.saleNum}"/>
																									<form>
																									<input type="hidden" id="prdNum" name="prdNum" value="<c:out value='${sellVO.prdNum}'/>"/>
																									<input type="hidden" id="selectedId" name="selectedId" value="<c:out value='${sellVO.prdNum}'/>"/>
																									<input type="hidden" id="selectedSale" name= "selectedSale" value="${saleList.saleNum}"/>
																									<input type="hidden" id="shopCode" name= "shopCode" value="${sellVO.shopCode}"/>
																									</form>
       												  </td>
           
    																	</tr>
              </c:forEach>
          
              </table>
              </div>
              <div id="sysbtn">
             <ul>
                 <li>
                     <span class="btn_blue_l">
                      <form:hidden path="pageIndex" />
                    
                    --%>
                    <input type="hidden" id="p_prdNum" value="${sellVO.prdNum}"/>
                    <input type="hidden" id="p_shopCode" value="${sellVO.shopCode}"/>
                    <input type="hidden" id="p_shopName" value="${sellVO.shopName}"/>
                    
                         
                      
                      <div class="col-sm-10"  style="float:right; width:25%;">
                       <span class="btn btn-default cal-btn">
                           <a href="javascript:showPopupSale();">할인 등록</a>
                       </span>
                       <br/><br/>
                  <%--</li>
              </ul>
           </div>
           </div>
           </form:form> --%>
           
           </div> 
           </c:if>
    
    
    
    
    
    
 </div>   
</form:form>
<footer>
 <jsp:include page="footer.jsp"></jsp:include>
 </footer>
 </div>
 



</body>
</html>