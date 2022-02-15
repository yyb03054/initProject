<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%
  /**
  * @Class Name : initSellList.jsp
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
<title>INIT 스토어 - 상품별 판매처리스트</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
        
        /* 글 수정 화면 function */
        function fn_init_select_admin(shopCode) {
       		  document.listForm.selectedShop.value = shopCode;
              document.listForm.action = "<c:url value='/updateSellView.do'/>";
              document.listForm.submit();
        }
        function fn_init_select(shopCode) {
     		  document.listForm.selectedShop.value = shopCode;
            document.listForm.action = "<c:url value='/updateSellViewAdmin.do'/>";
            document.listForm.submit();
      }
       
        /* 글 등록 화면 function */
        function fn_init_addView1() {
            document.listForm.action = "<c:url value='/addSell.do'/>";
              document.listForm.submit();
        }
 
        /* 글 목록 화면 function */
        function fn_init_selectList() {
        	/* document.listForm.selectedId.value = prdNum; */
        	document.listForm.pageIndex.value = 1;
           document.listForm.action = "<c:url value='/initProductList.do'/>";
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
           document.listForm.action = "<c:url value='/initSellList.do'/>";
              document.listForm.submit();
        }
        function fn_init_productList() {
        	document.listForm.pageIndex.value = 1;
           document.listForm.action = "<c:url value='/initProductList.do'/>";
              document.listForm.submit();
        }
         
        $(document).ready (function(){
			 var form = new FormData(document.getElementById('listForm'));
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
				prdNum : $("#prdNumSale").val();
				shopCode : $("#shopCode").val();
				prdPrice : $("#prdPrice").val();
				var maxPer = 0;
				var maxSaleNum;
				
				prdPrice : $("#prdPrice").val();
	  $.ajax({
        url : "saleListSell.do"
/*            , enctype: 'multipart/form-data' */
      , type : 'POST'
      , processData : false
      , contentType : false 
      , data : form
      , datatype : "text"
      /* , cache : false */
      , success:function(data) {
 	for(var j=0; j < data.sellList.length; j++)
 		{
 		shopCode : $("#shopCodeSale").val();
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
				$('#saleList').append('<a>  할 인 율  : </a>');
				$('#saleList').append('<input type="text" style = "text-align:center;" size="5" id="maxPer" name="maxPer" readonly="true" cssClass="essentiality" value='+	maxPer +' >%<br/>');
				$('#saleList').append('<a>할인가격 : </a>');
				$('#saleList').append('<input type="text" style = "text-align:center;" size="10" id="maxPer" name="maxPer" readonly="true" cssClass="essentiality"  integerOnly="true" value='+	(1-(maxPer/100)) *prdPrice.value +' >원<br/>');
 		}
}
	  });
});
        
        
    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
   <div class="container">
  <br/>
    <br/>
        <div class="container logo" style="float:center;">
								<a href="/INIT_PRO/"><img src="${pageContext.request.contextPath}/images/logo.png" width="400" height="80" /><img src="${pageContext.request.contextPath}/images/admin.png" width="200" height="40" /></a>
							</div>
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post"  accept-charset="utf-8" onSubmit="return false">
        <input type="hidden" name="selectedShop" />
        <input type="hidden" name="selectedId" value="${searchVO.prdNum}" />
        
        
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
                     <a href="javascript:fn_init_selectList();">상품 검색</a>
                 </span>
                 </div>
                 </div>
                </ul>
           </div>
            <br/><br/><br/>
           <div class="form-group" style="float:left;">
            <a href="main.do" style="color:black;">메인</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="initProductList.do" style="color:black;">상품리스트</a> &nbsp;&nbsp;>&nbsp;&nbsp;<a>
            <c:if test="${resultList[0].prdName!=null }">${resultList[0].prdName} (${totCnt})</c:if>
            <c:if test="${resultList[0].prdName==null }">${searchVO.prdNum} (0)</c:if>
            </a>
            </div>
           <br/>
           
           <div class="row qnas" style="text-align: center;">
											<h1 class="page-header">상품별 판매처 리스트</h1>
           </div>
           <!-- List -->
           <div id="table">
           <span style="float:left;">총 ${totCnt}개의 판매처가 검색되었습니다.</span>
              <table class="table table-striped table-bordered table-hover" width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
                 <caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
                 <colgroup>
                    <col width="100"/>
                    <col width="150"/>
                    <col width="150"/>
                    <col width="150"/>
                    <col width="400"/>
                    <col width="150"/>
                    <col width="100"/>
                     <col width="100"/>
                 </colgroup>
                 <tr>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.imgAddress" /></th>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.prdNum" /></th>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.shopName" /></th>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.brdName" /></th>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.prdName" /></th>
                    <th align="center" style="text-align:center;">상품가격</th>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.delPrice" /></th>
                    <th align="center" style="text-align:center;"><spring:message code="title.sell.modify" /></th>
                 </tr>
                 
                 <c:forEach var="result" items="${resultList}" varStatus="status">
                 
                     <tr style = "cursor:pointer;" onClick = " javascript:fn_init_select('<c:out value="${result.shopCode}"/>') " >
                    
                        <%-- <td align="center" class="listtd"><img src="${pageContext.request.contextPath}/upload/${result.imgAddress}" width = "100" height = "100"/></td> --%>
                        <c:if test="${result.imgAddress!=null }">
				                    <td align="center" class="listtd"><img src="${pageContext.request.contextPath}/upload/${result.imgAddress}" width="100" height="100" />
				                    </td>
				                    </c:if>
				                    <c:if test="${result.imgAddress==null }">
				                    <td align="center" class="listtd"><img src="${pageContext.request.contextPath}/images/noimg.jpg" width="100" height="100" />
																		  				</td></c:if>
                        <td align="center" class="listtd"style="vertical-align:middle;"><c:out value="${result.prdNum}"/>&nbsp;</td>
                        <td align="center" class="listtd"style="vertical-align:middle;"><c:out value="${result.shopName}"/>&nbsp;</td>
                        <td align="center" class="listtd"style="vertical-align:middle;"><c:out value="${result.brdName}"/>&nbsp;</td>
                        
                        <td align="center" class="listtd" style="vertical-align:middle;"><c:out value="${result.prdName}"/>&nbsp;</td>
                        <input id="shopCodeSale" name="shopCodeSale" size="70" maxlength="100" type="hidden" value="${result.shopCode}"/>
                        <input id="prdPrice" name="prdPrice" size="70" maxlength="100" type="hidden" value="${result.prdPrice}"/>
                        <input id="prdNumSale" name="prdNumSale" size="70" maxlength="100" type="hidden" value="${result.prdNum}"/>
                        <c:if test="${result.salePrice==null }">
                        <td align="center" class="listtd"style="vertical-align:middle;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.prdPrice}"/> 원&nbsp;</td>
                        </c:if>
                        <c:if test="${result.salePrice!=null }">
                        <td align="center" class="listtd"style="vertical-align:middle;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.salePrice}"/> 원&nbsp;</td>
                        </c:if>
                        <td align="center" class="listtd"style="vertical-align:middle;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.delPrice}"/> 원&nbsp;</td>
																								<td align="center" class="listtd" onclick ="event.cancelBubble=true;"style="vertical-align:middle;">
																			     <div id="sysbtn">
																			     <span class="btn btn-default cal-btn">
																			     <a href="javascript:fn_init_select_admin('<c:out value="${result.shopCode}"/>');">수정</a></span></div>
																						  </td>
    																	</tr>
              </c:forEach>
                           

                 
              </table>
              
           </div>
           <!-- /List -->
           <div id="paging">
              <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_init_link_page" />
              <form:hidden path="pageIndex" />
              <form:hidden path="prdNum" />
           </div>
           

           
           <div id="sysbtn" style="float:right">
                     
                      <span class="btn btn-default cal-btn">
                         <a href="javascript:fn_init_addView1();">등록</a>
                      </span> 
           </div>
           <footer>
 <jsp:include page="footer.jsp"></jsp:include>
 </footer>
        </div>
        <br/>
        <br/>
        <%-- <input type="hidden" name="prdNum" value="<c:out value='${searchVO.prdNum}'/>"/> --%>
    </form:form>
    <c:forEach var="saleList" items="${saleList}" varStatus="status">
    <input id="salePer" name="salePer" size="70" maxlength="100" type="hidden" value="${saleList.salePer}"/>
    <input id="saleNum" name="saleNum" size="70" maxlength="100" type="hidden" value="${saleList.saleNum}"/>
    <input id="saleSdate" name="saleSdate" size="70" maxlength="100" type="hidden" value="${saleList.saleSdate}"/>
    <input id="saleFdate" name="saleFdate" size="70" maxlength="100" type="hidden" value="${saleList.saleFdate}"/>
    </c:forEach>
    
</body>
</html>