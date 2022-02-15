<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${detailset.name}</title>
	<link rel="stylesheet" type="text/css" media="screen" href="/jquery-ui-1.12.1.custom/jquery-ui.min.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/jqGrid/css/ui.jqgrid.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/css/detailpage.css"/>
    
    <script src="/js/html2canvas.js"></script>
				<script src="/js/jspdf.min.js"></script>
	<script src="/js/jquery-3.6.0.min.js" type="text/javascript"></script>
	<script src="/js/main.js" type="text/javascript"></script>
    <script src="/js/detailpagepdf.js" type="text/javascript"></script>
    <script src="/js/setting.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <script src="/jqGrid/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="/jqGrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
    <script src="/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
</head>
<body>

<jsp:include page="../layout/navbar.jsp"></jsp:include>
<div id="pdfDiv">
<div>
    
    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active table-responsive" id="pills-info" role="tabpanel" aria-labelledby="pills-info-tab">
            <form id="UpdateForm" name="UpdateForm" method="POST" enctype="multipart/form-data">
                <input type="hidden" id="info_id"   name="info_id"  value="${detailset.id}">
                <table class="detailTable table" border="0">
                    <colgroup>
                        <col width="12%"/>
                        <col width="29%"/>
                        <col width="12%"/>
                        <col width="27%"/>
                        <col width="20%"/>
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" class="form-control"  id="name"       name="name"     value="${detailset.name}" placeholder="이름"></td>
                            <td>생년월일</td>
                            <td><input type="text" class="form-control"  id="birth"      name="birth"    value="${detailset.birth}" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="생년월일"></td>
                            <td rowspan="2" each="img : ${img}">
                                <%-- <input type="hidden" name="photo" value="${img.imgname}">
                                <img class="detail-info-img" src="@{img/${img.imgname}}"/> --%>
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td><input type="text" class="form-control"  id="phone"      name="phone"    value="${detailset.phone}" placeholder="휴대폰"></td>
                            <td>이메일</td>
                            <td><input type="text" class="form-control"  id="email"      name="email"    value="${detailset.email}" placeholder="이메일"></td>
                        </tr>   
                        <tr>
                            <td>주소</td>
                            <td><input type="text" class="form-control" name="address" id="user_address" onclick="AddressSearch()" value="${detailset.address}" placeholder="주소"></td>
                            <td>상세주소</td>
                            <td><input type="text" class="form-control" name="detailaddress" id="user_detail_address" value="${detailset.detailaddress}" placeholder="상세주소"></td>
                        </tr>
                        <tr>
                            <td>직종</td>
                            <td>
                                <select name="occupation" id="user_occupation" class="form-select" onchange='DetailoccupationSelected(this)'>
                                    <option value="0">직종을 선택해주세요.</option>
                                    <c:forEach var="occupation" items="${occupation}">
                                    <c:choose>
                                    	<c:when test="${detailset.occupation eq occupation.occupation_nm}">
                                    		<option value="${occupation.occupation_nm}" selected><c:out value="${occupation.name}"/></option>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<option value="${occupation.occupation_nm}"><c:out value="${occupation.name}"/></option>
                                    	</c:otherwise>                            
                                    </c:choose>
                                    </c:forEach>                                  
                                </select>
                            </td>
                            <td>직무 <c:out value="${detailset.task }"/></td>
                            <td>

                                <select name="task" id="user_task" class="form-select">
                                    <option class="detailoccupation0" value="0">직무를 선택해주세요</option>
                                    <c:forEach var="task" items="${task}">
                                    	<c:choose>
                                    		<c:when test="${detailset.task eq task.task_nm}">
                                        		<option class="detailoccupation${task.occupation} usertask" value="${task.task_nm}" selected><c:out value="${task.name}"/></option>                            
                                			</c:when>
                                			<c:otherwise>
                                				<option class="detailoccupation${task.occupation} usertask" value="${task.task_nm}"><c:out value="${task.name}"/></option>
                                			</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td>근무가능지역</td>
                            <td colspan="3" class="areaCheckBox">
                                	<c:forEach var="area" items="${area}" varStatus="status">
                                		<c:choose>
                                    		<c:when test="${detailArea[status.index] eq area.name}">
                                        		<input class="form-check-input" type="checkbox" id="areaCheckbox<c:out value="${area.id}"/>" name="area" value="${area.id}"  checked>
                                    			<label class="form-check-label" for="areaCheckbox<c:out value="${area.id}"/>"><c:out value="${area.name}"/></label>                         
                                			</c:when>
                                			<c:otherwise>
                                				<input class="form-check-input" type="checkbox" id="areaCheckbox<c:out value="${area.id}"/>" name="area" value="${area.id}" >
                                    			<label class="form-check-label" for="areaCheckbox<c:out value="${area.id}"/>"><c:out value="${area.name}"/></label>
                                    	    </c:otherwise>
                                		</c:choose>                             
                                	</c:forEach>                                  
                            </td>
                        </tr>
                        <tr>
                            <td>사진</td>
                            <td><input type="file" class="form-control" id="attachImg" name="attachImg"></td>
                            <td>첨부파일</td>
                            <td><input type="file" class="form-control" id="attachFile" name="attachFile"></td>
                        </tr>
                        <c:forEach var="file" items="${file}">
                        <tr>
                            <td class="td-file" colspan="3">
                                <a href="/fileDown/{${file.id}}"><c:out value="${file.fileoriginname}"/></a>
                                <button type="button" class="btn btn-danger m-2" id="file-delete-btn${file.id}" attr="onclick=fileDelete('${file.id}')">삭제</button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
    </div>  
    
</div>
    

</div>
<input type="hidden" id="id"value = "${detailset.id}"/>
<button type='button' class='btn btn-primary' id='pdf-btn' onclick='pdfSaveInfo()'>PDF 저장</button>
</body>
</html>
