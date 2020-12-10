<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>Insert title here</title>

<style type="text/css">

.admin-tbl table {
	text-align: center;
}

.admin-tbl h1 {
	font-size: 1.3em;
	font-weight: 700;
	margin-bottom: 10px;
	}


.admin-tbl td {
	color: #404040;
	font-weight: 400;
	font-size: 0.7em;
	}
	
#cname td {
	font-weight: 530;
}

#adpage-sel{
	height: 26px;
	border-radius: 0;
	border-color:#595959
}

#adpage-search-div{
	 margin: 0 10px 10px 0;
	 font-size: 0.9em;
	 float: right;
	 display: flex;
}

#adpage-search{
	margin: 0 2px;
	height: 26px;
	border-radius: 0;
	border-color: #595959;
}

#searchbtn{
	padding: 0px;
}

.admin-tbl a {
	text-decoration: none;
	letter-spacing: -0.03em;
	color: #404040;
}

.admin-tbl a:hover{
	color: #FDC033;
}

.admin-ml-tr td {
	height: 60px;
	text-align: center;
	vertical-align: middle;
}

.admin-ml-tr div {
	text-align: center;
	vertical-align: middle;
}

#ad-ql-contents{
	text-align: center;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 180px;
	height: 45px;
	margin: 0 auto;
}
	
</style>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container" id="mbPage-container">
	<div class="row mem_title">
		<div class="col-12 col-md-3">
<c:import url="./adminPageRow.jsp"></c:import>
		</div>
		
	<div class="col-12 col-md-9 admin-tbl">
		<h1>주문 목록</h1>
		<hr>
		
		
		<table class="table table-bordered">
			<tr id="cname">
				<td>no</td>
				<td>상품명</td>
				<td>주문자</td>
				<td style="width: 170px;">배송지</td>
				<td>수량</td>
				<td>주문금액</td>
				<td>주문일</td>
			</tr>
			
			<input type="hidden" value="${dto.order_num}" name="order_num">
			
			<c:forEach items="${list}" var="dto" varStatus="vs">
			<tr class="admin-ml-tr">
				<td>${dto.order_num}</td>
				<td><a href="./admin_orderSelect?order_num=${dto.order_num}">${dto.name_1} [${dto.color}]</a></td>
				<td>[ID : ${dto.orderId}]<br> ${dto.toName}</td>
				<td>[${dto.toZipcode}] ${dto.toAddress}</td>
				<td>${dto.amount_1}</td>
				<td>${dto.total}원</td>
				<td>${dto.regDate}</td>
			</tr>
			</c:forEach>
		</table>
		
		  	<c:if test="${pager.beforeCheck}">
  				<a href="./admin_qnaList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${search}">[이전]</a>
  			</c:if>
  
  			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  				<a href="./admin_qnaList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
  			</c:forEach>
  	
  			<c:if test="${pager.nextCheck}">
  				<a href="./admin_qnaList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
  			</c:if>
		
		
		
	</div>
		
	</div>
</div>


<script type="text/javascript">


</script>


</body>
</html>