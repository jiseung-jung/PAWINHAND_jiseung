<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>

<style type="text/css">
.volHeader{
		width: 1000px;
		height: 70px;
		border-bottom: 1px solid #DCDCDC;
		font-size: 30px;
		margin-bottom: 50px;
	}

#btnDiv {
	width: 825px;
	height: 30px;
	text-align: right;
	margin-bottom: 10px;
}

#btn {
	width: 80px;
	background-color: #FFE4B5;
	border: 2px solid #FFE4B5;
	font-size: 13px;
	border-radius: 5px;
	padding: 5px;
	font-weight: bold; 
}

.volUl img {
	width: 120px;
	height: 120px;
}

.volUl {
	width: 1000px;
	padding: 0px;
}

.volUl li {
	width: 825px;
	height: 150px;
	border: 2px solid #a6a6a6;
	margin-bottom: 15px;
	border-radius: 5px;
	font-size: 8px;
}

.volUl li #volDiv1 {
	float: left;
	width: 120px;
	height: 120px;
	margin-left: 20px;
	text-align: center;
	margin-top: 15px;
	color: #D3D3D3;
}

.volUl li #volDiv2 {
	float: left;
	width: 450px;
	height: 120px;
	margin-left: 20px;
	text-align: left;
	margin-top: 15px;
}

#volDiv2 a {
	font-weight: bold;
	font-size: 20px;
	color: #FFA500;
}

.volUl li #volDiv3 {
	float: left;
	width: 100px;
	height: 120px;
	margin-left: 90px;
	margin-top: 15px;
}

#volDiv2 #a{
	width: 300px;
	height: 40px;
	overflow: hidden;
	word-wrap: break-word;
	text-overflow: ellipsis;
	margin-top : 20px;
	
}
#volDiv2 #a > pre{
	font-family: "Noto Sans KR", sans-serif;
  	letter-spacing: -0.01em;
	font-size: 13px;
	color: gray;
	   white-space: pre-wrap;
	
}
.pageDiv {
	text-align: center;
}
   #wrbtn{
      border: 1.5px solid #FDC033;
      color: #FDC033;
      font-size: 0.8em;
      font-weight: 500;
   }
   
</style>
</head>
<body>

<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-3 myPage">
				<h1>이동 봉사</h1>
				<hr>
			</div>

			<div class="col-12 col-md-9">
				<div class="Volcontainer">
					<div id="btnDiv">
						<c:if test="${member != null}">
							<input type="button" value="글쓰기" id="wrbtn">
						</c:if>
					</div>
					<ul class="volUl">
						<c:forEach items="${dto}" var="dto" varStatus="vs">
							<li>
								<div id="volDiv1">
									<c:choose>
										<c:when test="${not empty dto.voluntaryFileDTO.fileName}">
											<img
												src="../resources/upload/voluntary/${dto.voluntaryFileDTO.fileName}">
										</c:when>
										<c:otherwise>사진없음</c:otherwise>
									</c:choose>
								</div>

								<div id="volDiv2">
									<a href="./voluntarySelect?num=${dto.num}">${dto.title}</a>
									<div id="a">
										<pre>${dto.contents}</pre>
									</div>
								</div>
								<div id="volDiv3">
									${dto.regDate} · 조회수 ${dto.hit}<br> ${dto.writer}
								</div>
							</li>
						</c:forEach>
					</ul>


					<div class="pageDiv">
						<c:if test="${pager.beforeCheck}">
							<a
								href="./voluntaryList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${search}">[이전]</a>
						</c:if>

						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
							var="i">
							<a
								href="./voluntaryList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
						</c:forEach>

						<c:if test="${pager.nextCheck}">
							<a
								href="./voluntaryList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
<c:import url="../template/footer.jsp"></c:import>	
	<script type="text/javascript">
			$("#wrbtn").click(function() {
				location.href="./voluntaryWrite";
			});
		</script>

	
</body>
</html>