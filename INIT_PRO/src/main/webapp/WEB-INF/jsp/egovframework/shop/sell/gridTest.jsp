<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.jqgrid.css'/>" />
 
<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.min.js'/>"></script>  
<script type="text/javascript" src="<c:url value='/js/jquery.jqGrid.min.js'/>"></script> --%>




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
<script>
$(document).ready(function() {
    var cnames = ['이미지','상품번호', '상품명', '브랜드'];
    var data = {};
	var params = $('#listForm').serialize();
    /* var selRowId = $Grid.jqGrid('getGridParam','sellList'); */
    $("#jqGrid").jqGrid({
        /* url: "Test.do", */
        datatype: 'local',
        colNames: cnames,
        type: 'post',
        colModel:[
        	{
                name: 'imgAddress', index:'imgAddress',
                width: 100,
                fixed: true,
                formatter: function (cellvalue, options, rowObject) {
                    if(cellvalue != null){
                    return "<img src='"+cellvalue+"' style='height:100px; width:100px;'/>"; 
                    }else{
                        return "<div style='text-align : center'>X</div>";
                    }
                }
            },
                  {name:'prdNum',index:'prdNum', width:100, align:"center", key:true},
                  {name:'prdName',index:'prdName', width:500, align:"center"},
                  {name:'brdName',index:'brdName', width:100, align:"center"},
                  ],
                  
        height: 480,
        rowNum: 3,
        rowList: [10,20,30],
        pager: '#jqGridPager',
        rownumbers  : true,   
        viewrecords : true,
        caption:"JQGRID TABLE"/* ,
          jsonReader:{
				       	root: "sellList",
				       	page: "page",
				       	total: "total",
				       	records: "records",
				       	repeatitems: false,
				       	cell: "cell",
				       	id: "id"
				       }  */
        });
    $("#request").on("click", function(){

        // json 형식으로 데이터 set
         // ajax 통신
        $.ajax({            // HTTP method type(GET, POST) 형식이다.
            url : 'ajaxTest.do',    // 컨트롤러에서 대기중인 URL 주소이다.
            data:JSON.stringify(data),
            dataType:'json',
            type:'POST',
              /* jsonReader:{
																			       	root: "sellList",
																			       	page: "page",
																			       	total: "total",
																			       	records: "records",
																			       	repeatitems: false,
																			       	cell: "cell",
																			       	id: "id"
																	       },  */ // Json 형식의 데이터이다.
            success : function(data) { // controllor에서 list를 return 받았음

            	$('#jqGrid').jqGrid('clearGridData', true);
            	$('#jqGrid').jqGrid('setGridParam', {data : data.sellList}).trigger('reloadGrid');
            
            },
            
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }


    
    
    
        });
    
    });
});
    
    
    $(function(){
    	
    });
    
 
    
</script>

</head>
<body>
<form:form commandName="sellVO" id="listForm" name="listForm" >
<div class="row">
   <div>
      <table id="jqGrid"></table>
      <div id="jqGridPager"></div>
   </div> 
</div>
<span class="btn_blue_l">
                         <input type="button" value="버튼" id="request"/>
                         
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                          
                      </span>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="prdNum" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>