<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    <link rel="stylesheet" href="../navbar/cssnav.css">
<nav class="navbar navbar-expand-lg   navbar-light " style="background-color: #7f8c8d;">
  <a class="navbar-brand" style="font-size: 24px; color: #ffffff;" href="/"> โฮปประกันภัย </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="nav navbar-nav mr-auto">
      <li class="nav-item dropdown">
        <a class="nav-link hoverborder btn btn-outline-dark mx-sm-2" href="#" id="navbarDropdown" style="color: #ffffff;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> เพิ่มเติม <i class="fas fa-chevron-down"></i></a>
        
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/contact">ติดต่อสอบถาม</a>
          <a class="dropdown-item" href="/howtouploadfile">วิธีการอัพโหลดหลักฐานการโอนเงิน</a>
     	  <a class="dropdown-item" href="/howtopayment">วิธีการชำระเงิน</a>
     	  <a class="dropdown-item" target="_blank" href="https://www.google.co.th/maps/place/%E0%B9%82%E0%B8%AE%E0%B8%9B+%E0%B8%A8%E0%B8%B9%E0%B8%99%E0%B8%A2%E0%B9%8C%E0%B8%A3%E0%B8%A7%E0%B8%A1%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B1%E0%B8%99%E0%B8%A0%E0%B8%B1%E0%B8%A2/@13.9253319,101.5550289,13.75z/data=!4m12!1m6!3m5!1s0x311cf728bb3ba121:0x859629326c44c469!2z4LmC4Liu4LibIOC4qOC4ueC4meC4ouC5jOC4o-C4p-C4oeC4m-C4o-C4sOC4geC4seC4meC4oOC4seC4og!8m2!3d13.9267889!4d101.5653775!3m4!1s0x311cf728bb3ba121:0x859629326c44c469!8m2!3d13.9267889!4d101.5653775?hl=th"> ตำแหน่งที่ตั้งสำนักงาน </a>
        </div>
      </li>
    </ul>
    <button class="btn btn-primary mr-sm-2" data-toggle="modal" data-target="#login"><i class="fas fa-sign-in-alt"></i> Log In </button>
    <button class="btn btn-warning mr-sm-2" data-toggle="modal" data-target="#register"><i class="fas fa-registered"></i> Register </button>

    <!-- modal login -->   	
    	<form action="/login"  method="post">
    	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  			<div class="modal-dialog modal-dialog-centered" role="document">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" >Login</h5>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        				</button>
      				</div>
      				<div class="modal-body">	
        				<div class="form-group">
        					<div class="form-inline ">
        						<label class="text-primary col-sm-4" style="font-size: 20px;"> Username : </label>
        						<input type="text" name="member_username" class="form-control" placeholder="ชื่อผู้ใช้" autofocus>
        					</div>
        				</div>
        				<div class="form-group">
        					<div class="form-inline">
        						<label class="text-primary col-sm-4" style="font-size: 20px;"> Password : </label>
        						<input type="password" name="member_password" class="form-control" placeholder="รหัสผ่าน">
        					</div>
        				</div>
        			</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="far fa-times-circle"></i> Close</button>
        				<button type="submit" class="btn btn-primary"><i class="fas fa-location-arrow"></i> Login </button>
      				</div>   			
    			</div>
  			</div>
		</div>
	   	</form>
	   	
	   	 

	<!-- modal register -->
	<form action="/Register" method="post">
		<div class="modal fade " id="register" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title">Register</h5>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        				</button>
      				</div>
      				<div class="modal-body">
        				<div class="form-row">
        					<div class="form-group col-md-6">
        						<label class="text-primary" style="font-size: 20px;"> Username : </label>
        						<input class="form-control" type="text" name="member_username"  placeholder="ชื่อผู้ใช้" required="required">
        					</div>
        					<div class="form-group col-md-6">
        						<label class="text-primary" style="font-size: 20px;"> Password : </label>
        						<input class="form-control" type="password" name="member_password" placeholder="รหัสผ่าน" required="required">
        					</div>
        				</div>
        				<div class="form-row">
        					<div class="form-group col-md-12">
        						<label class="text-primary" style="font-size: 20px;"> Name : </label>
        						<input class="form-control" type="text" name="member_name" placeholder="ชื่อ - นามสกุล" required="required">
        					</div>
        				</div>
        				<div class="form-row">
        					<div class="form-group col-md-6">
        						<label class="text-primary" style="font-size: 20px;"> Email : </label>
        						<input class="form-control" type="email" name="member_email" placeholder="อีเมลล์" required="required">
        					</div>
        					<div class="form-group col-md-6">
        						<label class="text-primary" style="font-size: 20px;"> Phone Number : </label>
        						<input class="form-control" type="text" name="member_phone" placeholder="เบอร์โทรศัพท์ xxx-xxxxxxx" required="required" pattern="0\d{2}-\d{7}">
        					</div>
        				</div>
        			
        				<div class="form-row">
        					<div class="form-group col-md-12">
        						<label class="text-primary" style="font-size: 20px;"> Address : </label>
        						<textarea class="form-control" name="member_address" placeholder="ที่อยู่"  required="required"></textarea>
        					</div>      					
        				</div>
        				<div class="row">
        					<div class="form-group col-md-5">
        						<label class="text-primary" style="font-size: 20px;"> City : </label>
        						<input class="form-control" type="text" name="member_city" placeholder="อำเภอ / เมือง" required="required">
        					</div>
        					<div class="form-group col-md-4">
        						<label class="text-primary" style="font-size: 20px;"> Country : </label>
        						<input class="form-control" type="text" name="member_country" placeholder="จังหวัด" required="required">
        					</div>
        					<div class="form-group col-md-3">
        						<label class="text-primary" style="font-size: 20px;"> Zip-code : </label>
        						<input class="form-control" type="text" name="member_zipcode" placeholder="รหัสไปรษณีย์" required="required">
        					</div>
        				</div>
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="far fa-times-circle"></i> Close</button>
        				<button type="submit" class="btn btn-primary"><i class="fas fa-location-arrow"></i> Register</button>
      				</div>   			
    			</div>
  			</div>
		</div>
	</form>
	
  </div>
</nav>
