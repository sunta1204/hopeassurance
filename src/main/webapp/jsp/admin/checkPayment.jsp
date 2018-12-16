<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title> index </title>
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
	<jsp:include page="../../navbar/navbarAdmin.jsp"></jsp:include> <!-- NavBar  -->
	<div style="display: flex;">
		<div style="height: 775px; width: 300px; background-color: #b2bec3;">
			<div style="margin: 30px; margin-top: 50px;">
				<div class="form-row">
					<a href="/admin/index_admin" class="btn btn-info col-md-12"><i class="fas fa-sign-out-alt fa-spin" style="font-size: 25px;"></i>  กลับสู่หน้าหลัก </a>
				</div><br>			
				<div class="form-row">
					<a href="/logout" class="btn btn-danger col-md-12"><i class="fas fa-sign-out-alt fa-spin" style="font-size: 25px;"></i> ออกจากระบบ </a>
				</div><br>
			</div>			
		</div>
		<div style="height: 775px; width: 100%; background-color: #dfe6e9;">
			<div style="margin: 50px;">
				<label class="text-primary" style="font-size: 40px;">ยอดแจ้งชำระ</label>
				<div id="table-wrapper">
  					<div id="table-scroll">
				<table class="table table-hover">
					<thead class="text-primary" style="font-size: 18px;">
						<tr>
							<th>ชื่อ</th>
							<th>อีเมลล์</th>
							<th>เบอร์โทรศัพท์</th>
							<th>ที่อยู่</th>
							<th>เมือง</th>
							<th>จังหวัด</th>
							<th>เลขไปรษณีย์</th>
							<th>ประเภทรถ</th>							
							<th>สำเนารถ</th>
							<th>หลักฐานการโอน</th>
						</tr>
					</thead>
					<c:forEach items="${paymentList }" var="payment">
					<tbody style="font-size: 16px; color: #353b48;">
						<tr>			
							<td>${payment.payment_name }</td>
							<td>${payment.payment_email }</td>
							<td>${payment.payment_phone }</td>
							<td>${payment.payment_address }</td>
							<td>${payment.payment_city }</td>
							<td>${payment.payment_country }</td>
							<td>${payment.payment_zipcode }</td>		
																					
							<c:if test="${payment.payment_cartype == 'mortorbike' }"><td>รถจักรยานยนต์</td></c:if>
							<c:if test="${payment.payment_cartype == 'car' }"><td>รถยนต์</td></c:if>
							<c:if test="${payment.payment_cartype == 'truck' }"><td>รถบรรทุก</td></c:if> 
							
							<td><a  data-toggle="modal" data-target="#zoomCar${payment.payment_id }"> <img src="payment/${payment.payment_picName }_${payment.payment_cartype}_${payment.payment_plate}.jpg" style="width: 150px;" ></a> </td>
							<td><a  data-toggle="modal" data-target="#zoomProof${payment.payment_id }"> <img src="proof/${payment.payment_picName }_${payment.payment_cartype}_${payment.payment_plate}.jpg" style="width: 150px;" ></a></td>
							<td> 
								<button class="btn btn-warning col-12" data-toggle="modal" data-target="#editTransport${payment.payment_id }"><i class="fas fa-user-edit"></i> EDIT  </button> <br><br>
								<button class="btn btn-danger col-12" data-toggle="modal" data-target="#deleteTransport${payment.payment_id }"><i class="fas fa-trash"></i> DELETE  </button> 
							</td>
						</tr>
					</tbody>		
					
					<!-- Modal Zoom Car-->
					<div class="modal fade bd-example-modal-lg" id="zoomCar${payment.payment_id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  						<div class="modal-dialog modal-lg modal-dialog-centered" role="document"  style="margin-right: auto;margin-left: auto;max-width: 1000px;">
    						<div class="modal-content " style="width: 1500px;text-align: center;">
      							<div class="modal-header">
        							<h5 class="modal-title" id="exampleModalLongTitle" style="font-size: 30px;">สำเนาการจดทะเบียนรถ</h5>
        							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          								<span aria-hidden="true">&times;</span>
       								 </button>
      							</div>
      							<div class="modal-body">
									<img src="payment/${payment.payment_picName }_${payment.payment_cartype}_${payment.payment_plate}.jpg" style="max-width: 1200px;" >
      							</div>     							
   							 </div>
  						</div>
					</div>	
					
					<!-- Modal Zoom Proof-->
					<div class="modal fade bd-example-modal-lg" id="zoomProof${payment.payment_id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  						<div class="modal-dialog modal-lg modal-dialog-centered" role="document"  style="margin-right: auto;margin-left: auto;max-width: 1000px;">
    						<div class="modal-content " style="width: 1500px;text-align: center;">
      							<div class="modal-header">
        							<h5 class="modal-title" id="exampleModalLongTitle" style="font-size: 30px;">หลักฐานการโอนเงิน</h5>
        							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          								<span aria-hidden="true">&times;</span>
       								 </button>
      							</div>
      							<div class="modal-body">
									<img src="proof/${payment.payment_picName }_${payment.payment_cartype}_${payment.payment_plate}.jpg" style="max-width: 1200px;" >
      							</div>     							
   							 </div>
  						</div>
					</div>			
				
									
					<!-- modal edit -->
					<form action="/editTransprot" method="post">
						<div class="modal fade " id="editTransport${payment.payment_id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  							<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    							<div class="modal-content">
      								<div class="modal-header">
        								<h5 class="modal-title" style="font-size: 30px;">แก้ไขข้อมูล</h5>
        								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          									<span aria-hidden="true">&times;</span>
        								</button>
      								</div>
      								<div class="modal-body">
      									<input type="hidden" name="payment_id" value="${payment.payment_id }">
      									<div class="form-row">
      										<div class="form-group col-md-6">
      											<label class="text-primary" style="font-size: 20px;" > ชำระยอด</label>
      											<c:if test="${payment.payment_status == 'U' }">
      											 	<select class="form-control" name="payment_status">
      													<option value="U">ยังไม่ชำระ</option>
      													<option value="P">ชำระแล้ว</option>     												
    												</select>
      											</c:if>
												<c:if test="${payment.payment_status == 'P' }">
      												 <select class="form-control" name="payment_status">
      													<option value="P">ชำระแล้ว</option>  
      													<option value="U">ยังไม่ชำระ</option>     												   												
    												</select>
      											</c:if>   					
      										</div> 
      											<div class="form-group col-md-6">
      											<label class="text-primary" style="font-size: 20px;"> การจัดส่งเอกสาร </label>
      											<c:if test="${payment.transport_status == 'N' }">
      											 	<select class="form-control" name="transport_status">
      													<option value="N">ยังไม่จัดส่ง</option>
      													<option value="D">จัดส่งแล้ว</option>     												
    												</select>
      											</c:if>
												<c:if test="${payment.transport_status == 'D' }">
      												 <select class="form-control" name="transport_status">
      													<option value="D">จัดส่งแล้ว</option>  
      													<option value="N">ยังไม่จัดส่ง</option>     												   												
    												</select>
      											</c:if>   					
      										</div>   												  										
      									</div>
      									<div class="form-row">
      										<div class="form-group col-md-12">
      											<label class="text-primary" style="font-size: 20px;"> เลขที่พัสดุ </label>
      											<input type="text" name="payment_track" placeholder="เลขที่พัสดุ" class="form-control">
      										</div>
      									</div>
        							</div>
      							<div class="modal-footer">
        							<button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="far fa-times-circle"></i> Close</button>
        							<button type="submit" class="btn btn-primary"><i class="fas fa-location-arrow"></i> Save</button>
      							</div>   			
    						</div>
  						</div>
					</div>
				</form>	
				
				<!-- modal Delete-->
				<form action="/deletePayment/${payment.payment_id }" method="get">
    			<div class="modal fade" id="deleteTransport${payment.payment_id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  					<div class="modal-dialog modal-dialog-centered" role="document">
    					<div class="modal-content">
      						<div class="modal-header">
        						<h5 class="modal-title" >Confirm Delete</h5>
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          							<span aria-hidden="true">&times;</span>
        						</button>
      						</div>
      						<div class="modal-body">	
      							<label style="font-size: 24px;"> คุณแน่ใจหรือไม่ที่จะลบ การแจ้งชำระ ของคุณ : ${payment.payment_name } </label> 
      						

        					</div>
      						<div class="modal-footer">
        						<button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="far fa-times-circle"></i> Close</button>
        						<button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i> Delete </button>
      						</div>   			
    					</div>
  					</div>
				</div>
			</form>			
				</c:forEach>
				</table>
			</div>
		</div>			
			</div>			
		</div>
	</div>
	
					
	
	<jsp:include page="../../footer/footer.jsp"></jsp:include> <!-- Footer  -->
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>