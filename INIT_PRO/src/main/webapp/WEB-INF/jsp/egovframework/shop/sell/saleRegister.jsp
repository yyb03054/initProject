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
 <c:set var="registerFlag" value="${empty sellVO.saleNum ? 'create' : 'modify'}"/>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logoicon.png" style="height:20%;">
<title>INIT 스토어 - 할인 등록</title>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
    <script type="text/javaScript" language="javascript" defer="defer">

        function fn_init_save() {
        
        	
        	frm = document.saleForm;
            			frm.action = "<c:url value="${registerFlag == 'create' ? '/addSalePost.do' : '/updateSale.do'}"/>";
               frm.submit();
               opener.parent.location.reload();
        }
       
        
        $(document).ready(function(){
        	/* if(!c_prdNum){ */
         document.getElementById("c_prdNum").value = opener.document.getElementById("p_prdNum").value;
        document.getElementById("c_shopCode").value = opener.document.getElementById("p_shopCode").value;
        document.getElementById("c_shopName").value = opener.document.getElementById("p_shopName").value;
        
       
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
        
        
        
        
        
			 $(document).on('click', '#btn_update', function(e) {
				 var saleName = $("#saleName").val();
				 var salePer = $("#salePer").val();
				 var saleSdate = $("#saleSdate").val();
				 var saleFdate = $("#saleFdate").val();
				 
											 if(saleName==""){
		        		alert ("할인명을 입력해주세요");
		        		$("#saleName").focus();
		        		return;
		        	}
			 							if(salePer==""){
		        		alert ("할인율을 입력해주세요");
		        		$("#salePer").focus();
		        		return;
		        	}
		        	if(saleSdate==""){
		        		alert ("시작 기간을 입력해주세요");
		        		$("#saleSdate").focus();
		        		return;
		        	}
		        	if(saleFdate==""){
		        		alert ("종료 기간을 입력해주세요");
		        		$("#saleFdate").focus();
		        		return;
		        	}
		        	 var yn = confirm("할인을 등록하시겠습니까?");
		      if(yn){
				 
        	$.ajax({            // HTTP method type(GET, POST) 형식이다.
       		 data:$("#saleForm").serialize(),
       		 url : 'selectSale.do',    // 컨트롤러에서 대기중인 URL 주소이다.
       		 type:'POST',
       		 dataType : "json",
       		 success : function (data) { // controllor에서 list를 return 받았음
       			var saleSdate = $("#saleSdate").val();
       		 var saleSdateV = ($("#saleSdate").val().replace('-','')).replace('-','');
 	        var saleFdate = $("#saleFdate").val();
    	     var saleFdateV = ($("#saleFdate").val().replace('-','')).replace('-','');
    	     var resValue = 0;
       	  for(i=0; i<data.saleList.length; i++)
       		  {
       		      if(data.saleList[i].saleFdateC  >= saleSdateV && data.saleList[i].saleSdateC <=saleFdateV)
       		    	  {
       		    	      alert("기존 할인기간과 중복됩니다.");
       		    	      return;
       		    	  }
       		  }
       		fn_init_save();
       		 },
       		 error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
       		     alert("통신 실패.")
       		 }
       		});
		      }
      });
        
        
       		/*  for(i=0; i<data.saleList[i].length; i++){
       		 	if(data.saleList.saleSdate >= sysdate and sysdate <= saleFdate){
        				alert("기간이 중복됩니다.");
       		 	}
       		 } */
    		
    		 
        		
        
        	/* } */
        	/* else{
        		 document.getElementById("selectedSale").value = opener.document.getElementById("selectedSale").value; 
        	} */
        });
     </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<form:form commandName="sellVO" id="saleForm" name="saleForm">
<div class="container">
<div class="row qnas" style="text-align: center;">
<h2 class="page-header">할인</h2>
<div id="table">
    	<table >
    		<tbody>
    		<div class="row">
    		<div class="form-horizontal">
    		<div class="form-group">
    		
			<label for="shopCode" class="col-sm-2 control-label">상품 번호</label>
    			<div class="col-sm-10">
    			<input class="form-control" id="c_prdNum" style="width:300px;"placeholder="ID" name="prdNum" value="${sellVO.prdNum}"readonly/>
    				<%-- <form:input path="prdNum" size="50" maxlength="100" id="c_prdNum" class="form-control" cssClass="essentiality" reonly="true"/>
    				&nbsp;<form:errors path="prdNum" /> --%>
    				</div>
    		</div>
    		<div class="form-group">
    		<label for="shopCode" class="col-sm-2 control-label">판매처</label>
    			<div class="col-sm-10">
    			    <input class="form-control" id="c_shopName" style="width:300px;"placeholder="ID" name="shopName" value="${sellVO.shopName}" readonly/>
    			    <form:hidden path="shopCode" id="c_shopCode"/>
    				</div>
    		</div>
    		
    		<div class="form-group">
    		<label for="saleName" class="col-sm-2 control-label">할인명</label>
    			<div class="col-sm-10">
    			    <input class="form-control" id="saleName" style="width:300px;"placeholder="할인명을 입력해주세요"value="${sellVO.saleName}" name="saleName"/>
    				</div>
    		</div>
    		
    		<div class="form-group">
    		<form:hidden path="saleNum" size="70" maxlength="100" />
    		<label for="salePer" class="col-sm-2 control-label">할인율</label>
    			<div class="col-sm-10" style="float:left;">
    			    <input class="form-control" id="salePer"maxlength="2"value="${sellVO.salePer}" style="display:inline-flex; width:60px; float:left;"name="salePer" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/><span style="float:left; font-size:20px;">%</span>
    				</div>
    		</div>
    		
    		<div class="form-group">
    		<label for="salePer" class="col-sm-2 control-label">할인시작기간</label>
    			<div class="col-sm-10" style="float:left;">
    			    <input type='date' class="form-control" style="width:200px;" id="saleSdate" name="saleSdate" value="${sellVO.saleSdate}"/>
    				</div>
    		</div>
    		
    		<div class="form-group">
    		<label for="saleFdate" class="col-sm-2 control-label">할인종료기간</label>
    			<div class="col-sm-10" style="float:left;">
    			    <input type='date' class="form-control" style="width:200px;" id="saleFdate" name="saleFdate" value="${sellVO.saleFdate}"/>
    				</div>
    		</div>
    		
    		<%-- <tr>
    			<td class="tbtd_caption"><label for="saleSdate"><spring:message code="title.sell.saleSdate" /></label></td>
    			<td class="tbtd_content" align = "left">
    				<form:input path="saleSdate" size="70" maxlength="100" cssClass="essentiality" readonly="true"/>
    				  <input type='date' name='saleSdate'  id= 'saleSdate' value="${sellVO.saleSdate}"/>
    			</td>
    		</tr>
    	
    			
    		<tr>
    			<td class="tbtd_caption"><label for="shopName"><spring:message code="title.sell.shopName" /></label></td>
    			<td class="tbtd_content" align = "left">
    				<form:input path="shopName" size="70" maxlength="100"  id="c_shopName" label="c_shopCode" cssClass="essentiality" reonly="true"/>
    				&nbsp;<form:errors path="shopName" />
    				<form:hidden path="shopCode" id="c_shopCode"/>
    				
    			</td>
    		</tr>

    		<!-- ---------------------------------할인명---------------------------------------- -->
    		<form:hidden path="saleNum" size="70" maxlength="100" />
    		<tr>
    			<td class="tbtd_caption"><label for="saleName"><spring:message code="title.sell.saleName" /></label></td>
    			<td class="tbtd_content" align = "left">
    				<form:input path="saleName" size="70" maxlength="100" />
    				&nbsp;<form:errors path="saleName" />
    				
    			</td>
    		</tr>
    		<!-- ---------------------------------할인율---------------------------------------- -->
    		<tr>
    			<td class="tbtd_caption"><label for="salePer"><spring:message code="title.sell.salePer" /></label></td>
    			<td class="tbtd_content" align = "left">
    				<form:input path="salePer" maxlength="2" cssClass="txt" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
    				&nbsp;
    			</td>
    		</tr>
    		<!-- ---------------------------------할인시작기간---------------------------------------- -->
    		<tr>
    			<td class="tbtd_caption"><label for="saleSdate"><spring:message code="title.sell.saleSdate" /></label></td>
    			<td class="tbtd_content" align = "left">
    				<form:input path="saleSdate" size="70" maxlength="100" cssClass="essentiality" readonly="true"/>
    				  <input type='date' name='saleSdate'  id= 'saleSdate' value="${sellVO.saleSdate}"/>
    			</td>
    		</tr>
    		
    		<!-- ---------------------------------할인종료기간---------------------------------------- -->
    		<tr>
    			<td class="tbtd_caption"><label for="saleFdate"><spring:message code="title.sell.saleFdate" /></label></td>
    			<td class="tbtd_content" align = "left">
    			<input type='date' name='saleFdate' id= 'saleFdate'  value="${sellVO.saleFdate}"/>
    			</td>
    		</tr> --%>
    		
    		
    		 </div></div>
<input type="hidden" id="c_shopCode" name="c_shopCode"/>
<input type="hidden" id="selectedShop" name="selectedShop" value="${sellVO.shopCode}"/>
</tbody>
    		</table>
    		<div id="sysbtn">
 
    												<c:if test="${registerFlag == 'create'}">
    												 <button id="btn_update" type="button" class="btn btn_register">등록</button>
    												</c:if>
    												<c:if test="${registerFlag == 'modify'}">
    												 <span class="btn btn-default cal-btn" style="float:left; margin-left:400px;">
                    									 <a href="javascript:fn_init_save();">수정</a>
                									 </span>
                									 </c:if>
    									
            
       </div>
       
    		</div>
    		</div>
    		</div>
    		
    		</form:form>
</body>
</html>