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
<title>INIT 스토어 - 판매처 리스트</title>
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
        function fn_init_select(shopCode) {
           document.listForm.selectedShopReg.value = shopCode;
              document.listForm.action = "<c:url value='/updateShopView.do'/>";
              document.listForm.submit();
        }
       
        /* 글 등록 화면 function */
        function fn_init_addView() {
                document.listForm.action = "<c:url value='/addShopView.do'/>";
              document.listForm.submit();
        }
 
        /* 글 목록 화면 function */
        function fn_init_shopList() {
        	document.listForm.pageIndex.value = 1;
           document.listForm.action = "<c:url value='/initShopList.do'/>";
              document.listForm.submit();
        }
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
           document.listForm.action = "<c:url value='/initShopList.do'/>";
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
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post"  accept-charset="utf-8" >
        <input type="hidden" name="selectedShopReg" />
           
           <div id="search">
              <ul>
              <div class="form-group" style="float:left;">
              <span class="btn btn-default cal-btn">
                        <a href="javascript:fn_init_productList();">상품 목록으로</a>
                    </span>
                    </div>
              <div class="form-group" style="float: right;">
                 <div class="col-sm-10" style="width:75%;">
																				<input class="form-control" id="searchKeyword" placeholder="검색어를 입력해주세요" name="searchKeyword" style="width:300px;"value="${searchVO.searchKeyword}">
																	</div>
																		<div class="col-sm-10"  style="width:25%;">
                 <span class="btn btn-default cal-btn">
                     <a href="javascript:fn_init_shopList();">검색</a>
                 </span>
                 </div>
                 </div>
                </ul>
           </div>
           <br/><br/><br/>
           <div class="form-group" style="float:left;">
            <a href="main.do" style="color:black;">메인</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="initProductList.do"style="color:black;">상품리스트</a> &nbsp;&nbsp;>&nbsp;&nbsp;<a>판매처 리스트</a>
            </div>
           <br/>
    						 <div class="row qnas" style="text-align: center;">
											<h1 class="page-header">판매처 리스트</h1>
           </div>
           
           <!-- List -->
           <div id="table1">
           <span style="float:left;">총 ${totCnt}개의 판매처가 있습니다.</span>
              <table class="table table-striped table-bordered table-hover" width="100%" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
                 <caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
                 <colgroup>
                    <col width="100"/>
                    <col width="150"/>
                    <col width="150"/>
                    <col width="400"/>
                    <col width="80"/>
                 </colgroup>
                 <tr >
                    <th align="center" style="text-align:center;">판매처코드</th>
                    <th align="center" style="text-align:center;">판매처명</th>
                    <th align="center" style="text-align:center;">대표자</th>
                    <th align="center" style="text-align:center;">주소</th>
                    <th align="center" style="text-align:center;">수정</th>

                 </tr>
                 
                 <c:forEach var="shopList" items="${shopList}" varStatus="status">
                     <%-- <tr style = "cursor:pointer;" onClick = " javascript:fn_init_sellList('<c:out value="${product.prdNum}"/>'); "> --%>
                     <%-- <c:set var="num" value="${paginationInfo.totalRecordCount+1-((searchVO.pageIndex-1)*searchVO.recordCountPerPage+status.count)}"/>
                     <c:choose>
                     <c:when test="${num ge 0}"> --%>
                       <%--  <td align="center" class="listtd"><img src="${pageContext.request.contextPath}/upload/${product.imgAddress}" width = "100" height = "100"/></td> --%>
																								<td align="center" class="listtd"><c:out value="${shopList.shopCode}"/>&nbsp;</td>
                        <td align="center" class="listtd"><c:out value="${shopList.shopName}"/>&nbsp;</td>
                        <%-- <input type="hidden" value="${product.prdNum}" id="prdNum" name="prdNum"/> --%>
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
              </c:forEach>
         
              </table>
           </div>
            <div id="sysbtn" style="float:right;">
            <span class="btn btn-default cal-btn">
              <a href="javascript:fn_init_addView();">등록</a>
           </span>
           </div>
           <!-- /List -->
            <div id="paging">
              <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_init_link_page" />
              <form:hidden path="pageIndex" />
           </div> 
          
    </form:form>
    <footer>
 <jsp:include page="footer.jsp"></jsp:include>
 </footer>
      </div>
</body>
</html>