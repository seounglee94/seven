<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop | My page</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />'>
<!-- Lightbox-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/lightbox2/css/lightbox.min.css" />'>
<!-- Range slider-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/nouislider/nouislider.min.css" />'>
<!-- Bootstrap select-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css" />'>
<!-- Owl Carousel-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/owl.carousel2/assets/owl.carousel.min.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/owl.carousel2/assets/owl.theme.default.css" />'>
<!-- Google fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
<!-- theme stylesheet-->
<link rel="stylesheet" href='<c:url value="/resources/css/style.default.css" />' id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href='<c:url value="/resources/css/custom.css" />'>
<!-- Favicon-->
<link rel="shortcut icon"
	href='<c:url value="/resources/img/favicon.png" />'>
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// heart ?????? 
		 $('.heart').click(function() {
			 
			 $.ajax('<c:url value="/wish/ajax" />',{
					data : {product_num : $(this).val()},
					success : function(returnData){

						if(returnData == "-1"){
							
							if (confirm("???????????? ????????? ????????? ????????? ????????? ???????????????????") == true){//??????
		 						// ???????????? ?????? ????????? ?????? ?????? ???????????? ??????, ???????????? ????????? ?????? ???????????? 
		 						location.href='<c:url value="/member/login" />';
		 					}else{//??????
		 						return false;
		 					}
							
						}else if(returnData == "0") { // ????????????
// 							alert("???????????? ??? ");
							
						}else {  // ?????? ??????
// 							alert("?????? ?????? ??? ");
						}
						
					}
					
				});
				
				var src = $(this).attr( 'src' );
// 				alert(src);
				if (src == "/seven/resources/img/heart.png"){
					$(this).attr('src','<c:url value="/resources/img/heart_empty.png" />');// ???????????? ?????? (????????? default)
				} else {
					$(this).attr('src','<c:url value="/resources/img/heart.png" />'); // ?????? ?????? 
				}
				

		 }); // $('.heart').click(function(){}); 
		 
		 
	}); // $(document).ready(function(){})

</script>


</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.id }">
	<script> 
		alert("You must be logged in to access this page")
		location.href='<c:url value="/member/login"/>'
	</script>
	</c:when>
</c:choose>
	<!-- Header start-->
	<c:import url="/resources/inc/header.jsp" />
	<!-- Header end -->


	<div class="container py-5">
		<h2 class="page-header"> HELLO! ${mb.member_name } </h2>

<!-- ????????? ???????????? ??? ????????? ?????? ?????? ??????  -->
		<div class="row">
			<div class="col-lg-2">
				<!-- ????????? ????????? -->
				<c:import url="/resources/inc/mypageSideNav.jsp" />
			</div>

			<div class="col-lg-10">
				<!--?????? ?????? -->
				<div class="card-header"> MY WISH </div>
				<div class="card-body">
					
					<!-- wish List ?????? ????????? ?????????.  -->
										 
					<table class="table table-hover">
						<tbody>
					
						<!-- ?????? -->
							<c:choose>
								<c:when test="${empty proList }"> <!-- if -->
									<tr>
										<td colspan="3"> <h3> Add to wishList </h3> </td> <!-- wishList??? ???????????? ?????? -->
									</tr>
								</c:when>
								<c:otherwise> <!-- else list??? ????????? ?????? ?????? ??????  -->
									<c:forEach var="proList" items="${proList }">
										<tr>
											<td width="160" onclick="location.href='<c:url value="/product/detail?product_num=${proList.product_num}" />'">
												<img alt="?????? ??????" src='<c:url value="/resources/upload/${proList.product_image}" />' width="150" height="150" >  
											</td>
											<td onclick="location. href='<c:url value="/product/detail?product_num=${proList.product_num}" />'">  <h4><small>  ${proList.product_title } </small> </h4> </td>
											<td align="right">
												<input type="image" src='<c:url value="/resources/img/heart.png" />'  class="heart" value="${proList.product_num }" width="30" height="30">
											 </td>
										</tr>
									</c:forEach>		
								</c:otherwise>
							</c:choose>
						<!-- ?????? -->
						</tbody>
					</table>
					
					

				</div>
			</div>
		</div>
	</div>


	<!-- Footer start -->
	<c:import url="/resources/inc/footer.jsp" />
	<!-- Footer end -->
</body>
</html>