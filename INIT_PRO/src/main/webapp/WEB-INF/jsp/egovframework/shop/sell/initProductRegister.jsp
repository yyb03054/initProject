<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>





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
    <c:set var="registerFlag" value="${empty sellVO.prdNum ? 'create' : 'modify'}"/>
    
    

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logoicon.png" style="height:20%;">
<title>INIT 스토어 - 상품수정</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/css/main.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

    
    
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--For Commons Validator Client Side-->
    <%-- <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="sellVO" staticJavascript="true" xhtml="true" cdata="false"/> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">    
    <script type="text/javaScript" language="javascript" defer="defer">

        /* 글 목록 화면 function */
        function fn_init_selectList() {
              document.detailForm.action = "<c:url value='/initProductList.do'/>";
              document.detailForm.submit();
        }
        
        
        
        /* 이미지 삭제 function */
        function fn_init_deleteImg(imgAddress) {
           document.detailForm.selectedImg.value = imgAddress;
              document.detailForm.action = "<c:url value='/deleteImage.do'/>";
              document.detailForm.submit();
        }
        /* 글 삭제 function */
        
        function fn_init_delete() {
           
              document.detailForm.action = "<c:url value='/deleteProduct.do'/>";
              document.detailForm.submit();
        }

        /* 글 등록 function */
       
        function fn_init_save() {
           frm = document.detailForm;
        
                     frm.action = "<c:url value="${registerFlag == 'create' ? '/addProductPost.do' : '/updateProductPost.do'}"/>";
               frm.submit();
          
        }
        
      /*   function file_upload(){
           
           document.uploadForm.action= "<c:url value='/fileUpload.do'/>";
           document.uploadForm.submit();
        } */
   

            $(document).on('click', '#btn_register', function(e) {
                    
                    //데이터를 담아내는 부분
                    
                  const prdName = $("#prdName").val().trim();
                    
                    
               if(prdName==""){
                     alert("상품이름을 입력하세요");
                     $("prdName").focus();
               return;
                     }

             $.ajax({            // HTTP method type(GET, POST) 형식이다.
                data:$("#detailForm").serialize(),
                url : 'addProductPost.do',    // 컨트롤러에서 대기중인 URL 주소이다.
                type:'POST',

                 success : function (data) { // controllor에서 list를 return 받았음
                 alert("ㅎㅇ")
           /*       $("#detailForm").val(""); */
                 location.href = "./addProduct.do";
                 },
                 error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                     alert("통신 실패.")
                 }
             });
         });
            
           
                
  
            
function fn_deleteImg(imgNum){
   
    var params = {
             selectedImg :imgNum ,
             selectedId : $("#prdNum").val()
        }

      $.ajax({            // HTTP method type(GET, POST) 형식이다.
         data:params,
         dataType : "json",
         url : 'deleteImage.do',    // 컨트롤러에서 대기중인 URL 주소이다.
         type:'POST',
          success : function (data) { // controllor에서 list를 return 받았음
          alert("삭제되었습니다.");
          $('#imgContent').empty();
          /* $('#divContent').empty(); */
          
          /* $('#imgContent').append($('<div/>', {style : "overflow:scroll; height:150px; padding:10px;"})) */
           /* $('#imgContent').wrap('<div id = "divContent" style="overflow:scroll; height:200px; padding:10px; "></div'); */
           for (var i = 0; i < data.imgList.length; i++) {
              var img = document.createElement('img');
             var resultimg = data.imgList[i];
                img.src='${pageContext.request.contextPath}/upload/'+resultimg.imgAddress;
             
              img.width="100";
              img.height="100";
              
              $("#imgContent").append(img);
              $('#imgContent').append('<input type="image" onclick="javascript:fn_deleteImg('+resultimg.imgNum+'); return false;" src="${pageContext.request.contextPath}/images/remove.png">'); 
              if(resultimg.mainImg == 'Y'){
	               $('#imgContent').append('<input type="radio" id="mainImg" name="imgNum" value='+resultimg.imgNum+' checked>&nbsp대표이미지 설정<br/>');
	               }
	               else{
	                   $('#imgContent').append('<input type="radio" id="mainImg" name="imgNum" value='+resultimg.imgNum+'>&nbsp대표이미지 설정<br/>');
	               }
          
        

          }
          },
          error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
              alert("통신 실패.")
          }
      });
  }
            
    
    
    var sel_file;
   
     $(document).ready(function() {
        $("#uploadfile").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    } 
     $(document).ready(function(){
	  var form = new FormData(document.getElementById('uploadForm'));
	  
	  $.ajax({
          url : "imgList.do"
/*            , enctype: 'multipart/form-data' */
        , type : 'POST'
        , processData : false
        , contentType : false 
        , data : form
        , datatype : "text"
        /* , cache : false */
        , success:function(data) {
             $('#imgContent').empty();
             
              $('#imgContent').wrap('<div class="col-sm-10" id="divContent" style="overflow:scroll; width:400px; margin-left:15px; height:300px; padding:10px; float:left; overflow-x: hidden; border:1px solid #ccc;"></div>'); 
             for (var i = 0; i < data.imgList.length; i++) {
                var img = document.createElement('img');
                var resultimg = data.imgList[i];
                img.src='${pageContext.request.contextPath}/upload/'+resultimg.imgAddress;
                img.width="100";
                img.height="100";
                $("#imgContent").append(img);
                $('#imgContent').append('<input type="image" onclick="javascript:fn_deleteImg('+resultimg.imgNum+'); return false;" src="${pageContext.request.contextPath}/images/remove.png">'); 
                if(resultimg.mainImg == 'Y'){
  	               $('#imgContent').append('<input type="radio" id="mainImg" name="imgNum" value='+resultimg.imgNum+' checked>&nbsp대표이미지 설정<br/>');
  	               }
  	               else{
  	                   $('#imgContent').append('<input type="radio" id="mainImg" name="imgNum" value='+resultimg.imgNum+'>&nbsp대표이미지 설정<br/>');
  	               } 
            } 
        }
        ,error: function (XMLHttpRequest, textStatus, errorThrown) 
        { 
           
           
        }
       });
  }); 
function fn_upload(){
       /*  var form = new FormData();
        form.append( "imgAddress", $("#imgAddress")[0].files[0] ); */
        /* var selectedId = $("#selectedId").val(); */
        var form = new FormData(document.getElementById('uploadForm'));
        /* var formData = new FormData(form); */
      /*   var inputFile = $("input[name='uploadfile']");
        var inputData = inputFile[0].files;  */
      var yn = confirm("이미지를 등록하시겠습니까?");

 
   if(yn){
         $.ajax({
             url : "fileUpload.do"
/*            , enctype: 'multipart/form-data' */
           , type : 'POST'
           , processData : false
           , contentType : false 
           , data : form
           , datatype : "text"
           /* , cache : false */
           , success:function(data) {
              
               alert("등록되었습니다.");
               
               $('#imgContent').empty();
               /* $('#divContent').empty(); */
               /* $('#imgContent').append($('<div/>', {style : "overflow:scroll; height:150px; padding:10px;"})) */
                /* $('#imgContent').wrap('<div id="divContent" style="overflow:scroll; height:200px; padding:10px; "></div>'); */
                for (var i = 0; i < data.imgList.length; i++) {
                   var img = document.createElement('img');
                  var resultimg = data.imgList[i];
                     img.src='${pageContext.request.contextPath}/upload/'+resultimg.imgAddress;
                    
                   img.width="100";
                   img.height="100";
                   $("#imgContent").append(img);
                   $('#imgContent').append('<input type="image" onclick="javascript:fn_deleteImg('+resultimg.imgNum+'); return false;" src="${pageContext.request.contextPath}/images/remove.png">'); 
                   if(resultimg.mainImg == 'Y'){
     	               $('#imgContent').append('<input type="radio" id="mainImg" name="imgNum" value='+resultimg.imgNum+' checked>&nbsp대표이미지 설정<br/>');
     	               }
     	               else{
     	                   $('#imgContent').append('<input type="radio" id="mainImg" name="imgNum" value='+resultimg.imgNum+'>&nbsp대표이미지 설정<br/>');
     	               } 
                   
               
             

               } 
                
           }
           ,error: function (XMLHttpRequest, textStatus, errorThrown) 
           { 
              alert("실패하였습니다.");
              
           }
          });
     }
}
    
function fn_update(){
	 /* var radioVal = $(':radio[name="imgNum"]:checked').val(); */
	 var radioVal = $('input[name=imgNum]').is(":checked");
	if(radioVal==false){
        alert("대표이미지를 선택해주세요");
  return;
        }

    	var yn = confirm("이미지를 수정하시겠습니까?");
      
   if(yn){
	   
		$.ajax({            // HTTP method type(GET, POST) 형식이다.
		 data:$("#detailForm").serialize(),
		 url : 'updateProduct.do',    // 컨트롤러에서 대기중인 URL 주소이다.
		 type:'POST',
		 dataType : "text",
		 success : function (data) { // controllor에서 list를 return 받았음
		 alert("ㅎㅇ")
		 },
		 error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		     alert("통신 실패.")
		 }
		});
	   
   }
}
    </script>
<style type="text/css">
a:hover {
    font-size: 14px;
    font-family: none;
    color: #339999;
    text-decoration: none;
}
a:link {
    font-size: 14px;
    font-family: none;
    color: #3A5870;
    text-decoration: none;
    line-height: 100%;
}

</style>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<div class="container">
	<div class="container logo" style="float:center;">
		<a href="/INIT_PRO/"><img src="${pageContext.request.contextPath}/images/logo.png" width="400" height="80" /><img src="${pageContext.request.contextPath}/images/admin.png" width="200" height="40" /></a>
	</div>
	<br/><br/>
<form:form commandName="sellVO" id="detailForm" name="detailForm"  enctype="multipart/form-data">
    <div class="form-group" style="float:left;">
            <a href="main.do" style="color:black;">메인</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="initProductList.do" style="color:black;">상품리스트${totCnt}</a>&nbsp;&nbsp;>&nbsp;&nbsp;<span style="color:#337ab7;">${sellVO.prdName}</span>
            <c:if test="${registerFlag == 'create'}"><span style="color:#337ab7;">상품 등록</span></c:if>
            </div>
           <br/>
           
           <br/>
       <!-- 타이틀 -->
       <form action="/order/orderResult" method="post">
		<div class="row qnas" style="text-align: center;">
		<c:if test="${registerFlag == 'modify'}">
			<h1 class="page-header">상품 수정</h1>
			</c:if>
			<c:if test="${registerFlag == 'create'}">
			<h1 class="page-header">상품 등록</h1>
			</c:if>
       <!-- // 타이틀 -->
<table>
	<tbody>
		<div class="row">
			<div class="form-horizontal">
			 <c:if test="${registerFlag == 'modify'}">
				<div class="form-group">
					<label for="prdNum" class="col-sm-2 control-label">상품번호</label>
					<div class="col-sm-10">
						<input class="form-control" id="prdNum" placeholder="ID" name="prdNum" value="${sellVO.prdNum}" readonly/>
					</div>
				</div>
				</c:if>
				<div class="form-group">
					<label for="prdName" class="col-sm-2 control-label">상품명</label>
					<div class="col-sm-10">
						<input class="form-control" id="shopName" placeholder="상품명을 입력해주세요" name="prdName" value="${sellVO.prdName}">
					</div>
				</div>
				<div class="form-group">
					<label for="ceo" class="col-sm-2 control-label">브랜드</label>
					<div class="col-sm-10">
						<form:select class="form-control" path="brdCode" cssClass="use" style="width:200px;">
                    <c:forEach var="brdList" items="${brdList}">
                               <form:option value="${brdList.brdCode}" label="${brdList.brdName}"/>
                    </c:forEach>
     </form:select>
					</div>
				</div>	
				<c:if test="${registerFlag == 'modify'}">
				<div class="form-group" >
				<label class="col-sm-2 control-label">이미지</label>
				<div class="col-sm-10" id="imgContent">
				<div class="form-group" id="divContent" style="overflow:scroll; height:150px; padding:10px; ">
				
          <c:forEach var="imgList" items="${imgList}">  
                  
                           <div class="form-group" style='width:80px;'>
                           <ol class = "test" role="list">
                             <input type="radio" id="mainImg" name="imgNum" value="${imgList.imgNum}"/>
                              <input type="image" onclick="javascript:fn_deleteImg('<c:out value="${imgList.imgNum}"/>'); return false;" src="${pageContext.request.contextPath}/images/remove.png" style= 'float: right;'/>
                            <span class="_2Qkli0c3an">
                            <img src="${pageContext.request.contextPath}/upload/${imgList.imgAddress}" width="100" height="100" label="${imgList.imgNum}"/>
                            
                            </span>
                            
                            <button type="button" class="_3vayK4HZfi N=a:wrtrv.athdltthm"><span class="_1O9E-Zhlrb"><span class="blind">삭제하기</span></span></button>
                            
                            </ol>
                          </div> 
                          </c:forEach> 
             
             </div>
             </div>
             </div>
				</c:if>
			</div>
		</div>
		
							

	</tbody>
</table>
       <div id="table">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
          <colgroup>
             <col width="150"/>
             <col width="?"/>
          </colgroup>
       
          <c:if test="${registerFlag == 'create'}"> 
       
          
          
          
         <%--  <!-- ---------------------------------상품명---------------------------------------- -->
          <tr>
             <td class="tbtd_caption"><label for="prdName"><spring:message code="title.sell.prdName" /></label></td>
                <td class="tbtd_content">
                <form:input path="prdName" size="70" maxlength="100" cssClass="txt"/>
                &nbsp;<form:errors path="prdName" />
             </td>
          </tr>
          
       
          <!-- ---------------------------------브랜드---------------------------------------- -->
             <tr>
                <td class="tbtd_caption"><label for="brdCode"><spring:message code="title.sell.brdName" /></label></td>
                <td class="tbtd_content">
                <form:select path="brdCode" cssClass="use">
                                         <c:forEach var="brdList" items="${brdList}">
                                                    <form:option value="${brdList.brdCode}" label="${brdList.brdName}"/>
                                         </c:forEach>
                          </form:select>
                        </td>
             </tr> --%>
             


                <!-- ---------------------------------이미지---------------------------------------- -->
          
             <!-- <script></script> -->
          <%--  <form:form commandName="searchVO" id="detailForm" name="detailForm" method="post"  accept-charset="utf-8" onSubmit="return false">
          <tr>
          <td class="tbtd_caption"><label for="imgAddress"><spring:message code="title.sell.imgAddress" /></label></td>
             <td class="listtd"><input type="file"  id="imgAddress" name="imgAddress"  accept="image/png, image/jpeg"/></td>
          </tr>
          </form:form> --%>
          </c:if>  
       <%--    <tr>
          <td class="tbtd_caption"><label for="imgAddress"><spring:message code="title.sell.imgAddress" /></label></td>
                   <td class="tbtd_content"> 
                   
                   <form method="post" encType = "multipart/form-data">
                                    <div class="inputArea">
                                     <label for="imgAddress">이미지</label>
                                     <input type="file" path="imgAddress" name="file" />
                                     <div class="select_img"><img src="" /></div>
                                     <%=request.getRealPath("/") %>
                                    </div>
                                    </form>
                 </td>
       </tr> --%>
          
          
          
         <%--   <c:if test="${registerFlag == 'modify'}"> 
       
          
          <!-- ---------------------------------상품번호---------------------------------------- -->
          
          <tr>
             <td class="tbtd_caption"><label for="prdNum"><spring:message code="title.sell.prdNum" /></label></td>
             <td class="tbtd_content">
                <form:input path="prdNum" size="70" maxlength="100" cssClass="essentiality" readonly="true"/>
                &nbsp;<form:errors path="prdNum" />
                
             </td>
          </tr>
          <!-- ---------------------------------상품명---------------------------------------- -->
          <tr>
             <td class="tbtd_caption"><label for="prdName"><spring:message code="title.sell.prdName" /></label></td>
                <td class="tbtd_content">
                <form:input path="prdName" size="70" maxlength="100" cssClass="txt"/>
                &nbsp;<form:errors path="prdName" />
             </td>
          </tr>
          
       
          <!-- ---------------------------------브랜드---------------------------------------- -->
             <tr>
                <td class="tbtd_caption"><label for="brdCode"><spring:message code="title.sell.brdName" /></label></td>
                <td class="tbtd_content">
                <form:select path="brdCode" cssClass="use">
                                         <c:forEach var="brdList" items="${brdList}">
                                                    <form:option value="${brdList.brdCode}" label="${brdList.brdName}"/>
                                         </c:forEach>
                          </form:select>
                        </td>
             </tr> --%>
 
 
          
          <!-- ---------------------------------이미지번호---------------------------------------- -->
          
       <%--       <tr>
                   <td class="tbtd_caption"><label for="imgNum"><spring:message code="title.sell.imgNum" /></label></td>
                   <td class="tbtd_content">
                      <form:input  path="imgNum" maxlength="10" cssClass="txt"/>
                      &nbsp;<form:errors path="imgNum" />   
                   </td>
          </tr>
                   
    

         
       
                   <!-- ---------------------------------이미지주소---------------------------------------- -->
          <tr>
             <td class="tbtd_caption"><label for="imgAddress"><spring:message code="title.sell.imgAddress" /></label></td>
             <td class="tbtd_content">
                <form:input  path="imgAddress" maxlength="100" cssClass="txt"/>
                &nbsp;<form:errors path="imgAddress" />
             </td>
          </tr> --%>
             
 
                <!-- ---------------------------------이미지---------------------------------------- -->
          
             <!-- <script></script> -->
                 <%--    <form action="fileUpload.do" method="post" enctype="multipart/form-data" >
           <input type="hidden" name="selectedId" value="<c:out value='${sellVO.prdNum}'/>"/>
                               <input type="file" name="uploadfile" placeholder="파일 선택" /><br/>
                              <button id="btn_submit" onclick="javascript:file_upload()">112전송</button> 
                  </form> --%>
<%-- <div style="<span style="color: #ff0000;">overflow: scroll;</span> " >  --%>


      <%--     <tr>
          <td class="tbtd_caption"><label for="imgAddress"><spring:message code="title.sell.imgAddress" /></label></td>
          <td class="tbtd_content" id = "imgContent">
           <div id="divContent" style="overflow:scroll; height:150px; padding:10px; ">
          <c:forEach var="imgList" items="${imgList}">  
                  
                           <div class="toggle3" style='width:80px;'>
                           <ol class = "test" role="list">
                             <input type="radio" id="mainImg" name="imgNum" value="${imgList.imgNum}"/>
                              <input type="image" onclick="javascript:fn_deleteImg('<c:out value="${imgList.imgNum}"/>'); return false;" src="${pageContext.request.contextPath}/images/remove.png" style= 'float: right;'/>
                            <span class="_2Qkli0c3an">
                            <img src="${pageContext.request.contextPath}/upload/${imgList.imgAddress}" width="100" height="100" label="${imgList.imgNum}"/>
                            
                            </span>
                            
                            <button type="button" class="_3vayK4HZfi N=a:wrtrv.athdltthm"><span class="_1O9E-Zhlrb"><span class="blind">삭제하기</span></span></button>
                            
                            </ol>
                          </div> 
                          </c:forEach> 
             
             </div>
             </td> --%>
           
             <form method="post">
                                <input type="hidden" name="selectedId" value="<c:out value='${sellVO.prdNum}'/>"/>
               </form>
          </tr> 
         
             
       </table>
      </div>
       

    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
    <%-- <input type="hidden" name="imgNum" value="<c:out value='${sellVO.imgNum}'/>"/> --%>
             
    
   </div>
   </form>
   
</form:form>
  <form:form commandName="sellVO" id="uploadForm" name="uploadForm"  enctype="multipart/form-data">
  <div class="row qnas" style="text-align: center;">
  <table>
  <tbody>
    <div class="row">
			<div class="form-horizontal">
			 <c:if test="${registerFlag == 'modify'}">
				
				<div class="form-group">
					<label for="prdNum" class="col-sm-2 control-label">이미지 업로드</label>
					<div class="col-sm-10">
						<form method="post" enctype="multipart/form-data" >
           <input type="hidden" name="selectedId" value="<c:out value='${sellVO.prdNum}'/>"/>
                               <input type="file" id="uploadfile"  name="uploadfile" placeholder="파일 선택"style="height:20pt;" /><br/>
        	     <div class="img_wrap" style="float:left;" >
                   <img id="img"  width="100" height="100"/>
              <br/><br/>
              <div class="form-gorup" style="height:20px;">
              <input type="button" value="업로드" onclick="javascript:fn_upload();" style="height:20pt;"/>
              </div>
              </div>
                  </form>
					</div>
				</div>
       

          
                  </td>
                  </tr>
                  </c:if>
                  </div>
                  </div>
                  </tbody>
    </table>
    </div>
    <div class="col-sm-10"  style="width:25%; float:right; ">
    <span class="btn btn-default cal-btn">
     <a href="javascript:fn_init_selectList();" style="font-size:14px; text-decoration: none; color: #656565;">목록</a>
  </span>
		<span class="btn btn-default cal-btn">
		 <c:if test="${registerFlag == 'create'}">
     <a href="javascript:fn_init_save();" style="font-size:14px; text-decoration: none; color: #656565;">등록</a>
     </c:if>
     <c:if test="${registerFlag == 'modify'}">
     <a href="javascript:fn_init_save();" style="font-size:14px; text-decoration: none; color: #656565;">수정</a>
     </c:if>
 	</span>
 	<c:if test="${registerFlag == 'modify'}">
 	<span class="btn btn-default cal-btn">
     <a href="javascript:fn_init_delete();" style="font-size:14px; text-decoration: none; color: #656565;">삭제</a>
 	</span>
 	</c:if>
 	
  </div>
  <br/><br/>
        </form:form>
<div id="sysbtn">
          <%-- <ul>
             <li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_init_selectList();"><spring:message code="button.list" /></a>
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
            </ul> --%>
              <!--   <button id="btn_register" type="button" class="btn btn_register">등록</button>
    <input type="button" value="수정" onclick="javascript:fn_update();"/> -->
       </div>

       <footer>
 <jsp:include page="footer.jsp"></jsp:include>
 </footer>
    </div>

         

</body>
</html>