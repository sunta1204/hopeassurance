<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Check Transport</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="../../navbar/cssnav.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<style type="text/css">
#table-wrapper {
  position:relative;
}
#table-scroll {
  height:500px;
  overflow:auto;  
  margin-top:30px;
}
	footer{
	text-align: center;
	background: #636e72;
}
.copyright{
	color: #dfe6e9;
	font-size: 20px;
}
.btnlink{
	display: inline-block;
	width: 70px;
	height: 70px;
	background: #f1f1f1;
	margin: 10px;
	border-radius: 30%;
	box-shadow: 0 5px 15px -5px #00000070;
	color: #3498db;
	overflow: hidden;
	position: relative;
}
.btnlink i{
	line-height: 70px;
	font-size: 26px;
	transition: 0.2s linear;
}
.btnlink:hover i{
	transform: scale(1.3);
	color: #f1f1f1;
}
.btnlink::before{
	content: "";
	position: absolute;
	width: 120%;
	height: 120%;
	background: #3498db;
	transform: rotate(45deg);
	left: -110%;
	top: 90%;
}
.btnlink:hover::before{
	animation: aaa 0.7s 1;
	top: -10%;
	left: -10%;
}
@keyframes aaa {
	0%{
		left: -110%;
		top: 90%;
	}
	50%{
		top: 10%;
		left: -30%;
	}
	100%{
		top: -10%;
		left: -10%;
	}
}
</style>	
</head>

<body>
	<jsp:include page="../../navbar/navbarUser.jsp"></jsp:include> <!-- NavBar  -->
	
	<div style="margin-left: auto; margin-right: auto; width: 1500px; margin-top: 50px; height: 725px;">
		<table class="table table-hover">
  			<thead class="text-primary" style="font-size: 24px;">
    			<tr>
      				<th>ชื่อผู้ใช้</th>
      				<th>ชื่อ</th>
     				 <th>ประเภทรถ</th>
      				<th>สำเนาการจดทะเบียนรถ</th>
      				<th>หลักฐานการโอนเงิน</th>
      				<th>แจ้งชำระ</th>
      				<th>การจัดส่ง</th>
    			</tr>
  			</thead>
  			<tbody style="font-size: 18px;">
    			<tr>
      				<td>${payment.payment_username }</td>
      				<td>${payment.payment_name }</td>
      				<c:if test="${payment.payment_cartype == 'mortorbike' }"><td>รถจักรยานยนต์</td></c:if>
					<c:if test="${payment.payment_cartype == 'car' }"><td>รถยนต์</td></c:if>
					<c:if test="${payment.payment_cartype == 'truck' }"><td>รถบรรทุก</td></c:if>
      				<td>	<img src="payment/${payment.payment_picName }_${payment.payment_cartype}_${payment.payment_plate }.jpg" style="max-width: 200px;" ></td>
      				<td><img src="proof/${payment.payment_picName }_${payment.payment_cartype}_${payment.payment_plate }.jpg" style="max-width: 200px;" ></td>
      				<c:if test="${payment.payment_status == 'U' }"><td>รอดำเนินการ</td></c:if>
      				<c:if test="${payment.payment_status == 'P' }"><td>ชำระเงินแล้ว</td></c:if>
      				<c:if test="${payment.transport_status == 'N' }"><td>ยังไม่จัดส่ง</td></c:if>
      				<c:if test="${payment.transport_status == 'D' }"><td>จัดส่งแล้ว</td></c:if>
    			</tr>
    		</tbody>
		</table><br>
		<a href="/User/index_user" class="btn btn-outline-primary btn-block btn-lg"> กลับสู่หน้าหลัก </a>
	</div>
	
	<jsp:include page="../../footer/footer.jsp"></jsp:include> <!-- Footer  -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>