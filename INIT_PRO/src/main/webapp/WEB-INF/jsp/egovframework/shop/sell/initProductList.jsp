<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%
  /**
  * @Class Name : initProductList.jsp
  * @Description : Sell List 화면
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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logoicon.png" style="height:20%;">
<title>INIT 스토어 - 상품리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery-ui-custom.css'/>"  />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.jqgrid.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.multiselect.css'/>" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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




    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    

    
    <script type="text/javaScript" language="javascript" defer="defer">
        
        /* 글 수정 화면 function */
        function fn_init_select(prdNum) {
           document.listForm.selectedId.value = prdNum;
              document.listForm.action = "<c:url value='/updateProductView.do'/>";
              document.listForm.submit();
        }
       
        /* 글 등록 화면 function */
        function fn_init_addView() {
                document.listForm.action = "<c:url value='/addProduct.do'/>";
              document.listForm.submit();
        }
        
        function fn_init_shopList() {
            document.listForm.action = "<c:url value='/initShopList.do'/>";
          document.listForm.submit();
    }
 
        /* 글 목록 화면 function */
        function fn_init_productList() {
        	document.listForm.pageIndex.value = 1;
           document.listForm.action = "<c:url value='/initProductList.do'/>";
              document.listForm.submit();
        }
        function fn_init_sellList(prdNum) {
        	document.listForm.selectedId.value = prdNum;
        	document.listForm.pageIndex.value = 1;
           document.listForm.action = "<c:url value='/initSellList.do'/>";
              document.listForm.submit();
        }
        function enterkey(){
        	if(window.event.keyCode == 13)
        	{
        		fn_init_selectList()
        	}
        }
         /* pagination 페이지 링크 function */
        function fn_init_link_page(pageNo){
           document.listForm.pageIndex.value = pageNo;
           document.listForm.action = "<c:url value='/initProductList.do'/>";
              document.listForm.submit();
        }
         
   
   
        
        
    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<div class="container">
<br/>
<br/>
<div class="container logo" style="float:center;">
		<a href="/INIT_PRO/"><img src="${pageContext.request.contextPath}/images/logo.png" width="400" height="80" /><img src="${pageContext.request.contextPath}/images/admin.png" width="200" height="40" /></a>
	</div>
	<br/>
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post"  accept-charset="utf-8" onSubmit="return false">
        <input type="hidden" name="selectedId" />
         <div class="form-group" style="float: left;">
           <span class="btn btn-default cal-btn">
                        <a href="javascript:fn_init_shopList();">판매처 리스트</a>
           </span>
           <span class="btn btn-default cal-btn">
                        <a href="initOrderList.do">구매내역 리스트</a>
           </span>
           <span class="btn btn-default cal-btn">
                        <a href="initReport.do">Reporting</a>
           </span>
         </div>
           
           <div id="search" class="form-group" style="float: right;">
                 <div class="col-sm-10" style="width:75%;">
																				<input class="form-control" id="searchKeyword" placeholder="검색어를 입력해주세요" name="searchKeyword" style="width:300px;"value="${searchVO.searchKeyword}">
																	</div>
                  <div class="col-sm-10"  style="width:25%;">
                       <span class="btn btn-default cal-btn">
                           <a href="javascript:fn_init_productList();">상품 검색</a>
                       </span>
                    </div>
           
                    
               
           </div>
           <br/><br/><br/>
           <div class="form-group" style="float:left;">
            <a href="main.do" style="color:black;">메인</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a>상품리스트 (${totCnt})</a>
            </div>
           <br/>
           <div class="row qnas" style="text-align: center;">
											<h1 class="page-header" >상품 리스트</h1>
           <!-- List -->
           <div id="table1">
           <span style="float:left;">총 ${totCnt}개의 상품이 검색되었습니다.</span>
              <table class="table table-striped table-bordered table-hover" width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
                 <caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
                 <colgroup>
                    <col width="100"/>
                    <col width="150"/>
                    <col width="150"/>
                    <col width="400"/>
                    <col width="110"/>
                    <col width="100"/>
                 </colgroup>
                 <tr>
			                 <th align="center" style="text-align:center;">이미지</th>
																				<th align="center" style="text-align:center;">상품번호 </th>
																				<th align="center" style="text-align:center;">브랜드</th>
																				<th align="center" style="text-align:center;">상품명</th>
																				<th align="center" style="text-align:center;">최저가</th>
																				<th align="center" style="text-align:center;">수정</th>
																	</tr>
                
                 <c:forEach var="product" items="${productList}" varStatus="status">
                    <tr  style = "cursor:pointer;" onClick = " javascript:fn_init_sellList('<c:out value="${product.prdNum}"/>'); ">
                    <c:if test="${product.imgAddress!=null }">
                    <td align="center" class="listtd"><img src="${pageContext.request.contextPath}/upload/${product.imgAddress}" width="100" height="100" />
                    </td>
                    </c:if>
                    <c:if test="${product.imgAddress==null }">
                    <td align="center" class="listtd"><img src="${pageContext.request.contextPath}/images/noimg.jpg" width="100" height="100" />
																		  </td></c:if>
																		  <td align="center" class="listtd"style="vertical-align:middle;">${product.prdNum}
																			 </td><td align="center" class="listtd" style="vertical-align:middle;">${product.brdName}
																		  </td><td align="center" class="listtd"style="vertical-align:middle;">${product.prdName}
																		  </td><td align="center" class="listtd"style="vertical-align:middle;">
																		  <c:if test="${product.minPrice==null }">
																		  등록된 판매처가 없습니다.
																		  </c:if>
																		  <c:if test="${product.minPrice!=null }">
																					  <c:if test="${product.saleMinPrice!=null && product.saleMinPrice<product.minPrice}">
																					  <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.saleMinPrice}"/>&nbsp;원
																					  </c:if>
																					  <c:if test="${product.saleMinPrice==null || product.saleMinPrice>product.minPrice}">
																					  <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.minPrice}"/> &nbsp;원
																					  </c:if>
																		  </c:if>
																		  </td><td align="center" class="listtd" onclick ="event.cancelBubble=true;" style="vertical-align:middle;">
															     <div id="sysbtn">
															     <span class="btn btn-default cal-btn">
															     <a href="javascript:fn_init_select('<c:out value="${product.prdNum}"/>');">수정</a></span></div>
																		  </td>
    																	</tr>
    																	<%-- <input type="hidden" value="${product.prdNum}" id="prdNum" name="prdNum"/>
                     <input type="hidden" value="${product.prdName}" id="prdName" name="prdName"/>
                     <input type="hidden" value="${product.brdName}" id="brdName" name="brdName"/>
                     <input type="hidden" value="${product.imgAddress}" id="imgAddress" name="imgAddress"/> --%>
             			 </c:forEach>
         					 		
              </table>
           </div>
            <table id = "prdCont" class="table table-striped table-bordered table-hover" width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
            
           </table>
           <!-- /List -->
            <div id="paging">
              <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_init_link_page" />
              <form:hidden path="pageIndex" />
           </div> 
           

           
           <div id="sysbtn" style="float:right">
    
                     <span class="btn btn-default cal-btn">
                         <a href="javascript:fn_init_addView();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/shop/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
           
                     <%-- <span class="btn btn-default cal-btn">
                         <a href="addGrid.do"><spring:message code="button.grid" /></a>
                          <img src="<c:url value='/images/egovframework/shop/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span> --%>
           </div>
            </div>
           	<div id="title">

    			

    	</div>
          
    </form:form>
      <%-- <div id="content_pop">
    <div id="table">
           
           <div style="overflow:scroll; height:600px; padding:10px; ">
              <table class="table table-striped table-bordered table-hover" width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
                 <caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
                 <colgroup>
                    <col width="150"/>
                    <col width="150"/>
                    <col width="400"/>
                    <col width="100"/>
                 </colgroup>
                 <tr>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.prdNum" /></th>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.brdName" /></th>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.prdName" /></th>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.modify" /></th>
                 </tr>
                 
                 <c:forEach var="productImg" items="${productListImg}" varStatus="status">
                     <tr style = "cursor:pointer;" onClick = " javascript:fn_init_sellList('<c:out value="${productImg.prdNum}"/>');">
                        <td align="center" class="listtd"><c:out value="${productImg.prdNum}"/>&nbsp;</td>
                        <td align="center" class="listtd"><c:out value="${productImg.brdName}"/>&nbsp;</td>
                        <td align="center" class="listtd" style="height:50%"><c:out value="${productImg.prdName}"/></a>&nbsp;</td>
                     <td align="center" class="listtd" onclick ="event.cancelBubble=true;">    
                        <div id="sysbtn">
														                     <span class="btn btn-default cal-btn">
														                         <a href="javascript:fn_init_select('<c:out value="${productImg.prdNum}"/>');"><spring:message code="button.modify" /></a>
														                          
														                      </span>
														              
														           </div>
       												  </td>
           
    																	</tr>
              </c:forEach>
          
              </table>
              </div>
           </div>
           </div>  --%>
           <footer>
 <jsp:include page="footer.jsp"></jsp:include>
 </footer>
</div>

</body>
</html>