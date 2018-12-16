<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="../navbar/cssnav.css">

    <nav class="navbar navbar-expand-lg   navbar-light " style="background-color: #7f8c8d;">
  <a class="navbar-brand" style="font-size: 24px; color: #ffffff;" href="/"> โฮปประกันภัย </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="nav navbar-nav mr-auto">
      <li class="nav-item">
        <button class=" nav-link  hoverborder btn btn-outline-dark mx-sm-2" style="color: #ffffff;" data-toggle="modal" data-target="#payonline"> <i class="fas fa-dollar-sign"></i>  ชำระ พรบ. ออนไลน์   </button>
      </li>
      <li class="nav-item">
        <button class="nav-link  hoverborder btn btn-outline-dark mx-sm-2" style="color: #ffffff;" data-toggle="modal" data-target="#uploadproof"><i class="fas fa-credit-card"></i> โอนเงิน และ ส่งหลักฐานการโอนเงิน </button>
      </li>
      <li class="nav-item">
        <button class="nav-link  hoverborder btn btn-outline-dark mx-sm-2" style="color: #ffffff;" data-toggle="modal" data-target="#checkTransport"><i class="fas fa-check-circle"></i> ตรวจสอบการจัดส่ง </button>
      </li>
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
    <ul class="nav navbar-nav mr-right"> 
     <li class="nav-item dropdown " >
    <button style="color: #ffffff; font-size: 20px;" class="nav-link hoverborder btn btn-outline-dark mx-sm-2  "  id="navbarDropdown" style="color: #ffffff;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-target="#dropdown-user" ><i class="far fa-user-circle" style="font-size: 26px;"></i>  <%=(String)session.getAttribute("member_name") %>  <i class="fas fa-chevron-down"></i></button>
	<div class="dropdown-menu" id="dropdown-user">
		<button class="dropdown-item" data-toggle="modal" data-target="#showProfile">ดูข้อมูลส่วนตัว</button>
          <button class="dropdown-item" data-toggle="modal" data-target="#editProfile">แก้ไขข้อมูลส่วนตัว</button>
          <a class="dropdown-item" href="/logout">ออกจากระบบ</a>
    </div>
      </li>
      </ul>
      				
      				<!-- modal showProfile -->
						<div class="modal fade " id="showProfile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  							<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    							<div class="modal-content">
      								<div class="modal-header">
        								<h5 class="modal-title" style="font-size: 30px;">ข้อมูลส่วนตัว</h5>
        								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          									<span aria-hidden="true">&times;</span>
        								</button>
      								</div>
      								<div class="modal-body">
        								<div class="form-row">
        									<div class="form-group col-md-6">
        										<label class="text-primary" style="font-size: 20px;"> Username : </label>
        										<input class="form-control" type="text" name="member_username" disabled="disabled" value="${memberProfile.member_username}">
        									</div>
        									<div class="form-group col-md-6">
        										<label class="text-primary" style="font-size: 20px;"> Password : </label>
        										<input class="form-control" type="text" name="member_password" disabled="disabled"  value="${memberProfile.member_password }">
        									</div>
        								</div>
        								<div class="form-row">
        									<div class="form-group col-md-12">
        										<label class="text-primary" style="font-size: 20px;"> Name : </label>
        										<input class="form-control" type="text" name="member_name" disabled="disabled" value="${memberProfile.member_name }">
        									</div>
        
        							</div>
        							<div class="form-row">
        								<div class="form-group col-md-6">
        									<label class="text-primary" style="font-size: 20px;"> Email : </label>
        									<input class="form-control" type="email" name="member_email" disabled="disabled" value="${memberProfile.member_email }">
        								</div>
        								<div class="form-group col-md-6">
        									<label class="text-primary" style="font-size: 20px;"> Phone Number : </label>
        									<input class="form-control" type="text" name="member_phone" disabled="disabled" value="${memberProfile.member_phone }">
        								</div>
        							</div>     			
        							<div class="form-row">
        								<div class="form-group col-md-8">
        									<label class="text-primary" style="font-size: 20px;"> Address : </label>
        									<textarea class="form-control" name="member_address"  disabled="disabled"> ${memberProfile.member_address } </textarea>
        								</div>
        								<div class="form-group col-md-4">
        									<label class="text-primary" style="font-size: 20px;"> Status : </label>
        										<% String userStatus = (String)session.getAttribute("member_status");  if (userStatus.equals("A")){ %>
        											<input class="form-control" type="text" name="member_status" disabled="disabled" value="ผู้ดูแลระบบ">
        										<% }else if (userStatus.equals("U")){ %>
        											<input class="form-control" type="text" name="member_status" disabled="disabled" value="สมาชิกทั่วไป">
        										<% } %>
        								</div>      					
        							</div>
        							<div class="form-row">
        								<div class="form-group col-md-5">
        									<label class="text-primary" style="font-size: 20px;"> City : </label>
        									<input class="form-control" type="text" name="member_city" disabled="disabled" value="${memberProfile.member_city }">
        								</div>
        								<div class="form-group col-md-4">
        									<label class="text-primary" style="font-size: 20px;"> Country : </label>
        									<input class="form-control" type="text" name="member_country" disabled="disabled" value="${memberProfile.member_country }">
        								</div>
        								<div class="form-group col-md-3">
        									<label class="text-primary" style="font-size: 20px;"> Zip-code : </label>
        									<input class="form-control" type="text" name="member_zipcode" disabled="disabled" value="${memberProfile.member_address }">
        								</div>
        							</div>
      							</div>
      							<div class="modal-footer">
        							<button type="button" class="btn btn-secondary btn-block" data-dismiss="modal"><i class="far fa-times-circle"></i> Close</button>
      							</div>   			
    						</div>
  						</div>
					</div>
 				     
      
      			<!-- modal editProfile -->
					<form action="/editProfileU" method="post">
						<div class="modal fade " id="editProfile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  							<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    							<div class="modal-content">
      								<div class="modal-header">
        								<h5 class="modal-title" style="font-size: 30px;">แก้ไขข้อมูล</h5>
        								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          									<span aria-hidden="true">&times;</span>
        								</button>
      								</div>
      								<div class="modal-body">
        								<div class="form-row">
        									<div class="form-group col-md-6">
        										<label class="text-primary" style="font-size: 20px;"> Username : </label>
        										<input class="form-control" type="text" name="member_username"  placeholder="ชื่อผู้ใช้" required="required" disabled="disabled" value="${memberProfile.member_username }">
        									</div>
        									<div class="form-group col-md-6">
        										<label class="text-primary" style="font-size: 20px;"> Password : </label>
        										<input class="form-control" type="text" name="member_password"  placeholder="ชื่อผู้ใช้" required="required" value="${memberProfile.member_password }">
        									</div>
        								</div>
        								<div class="form-row">
        									<div class="form-group col-md-12">
        										<label class="text-primary" style="font-size: 20px;"> Name : </label>
        										<input class="form-control" type="text" name="member_name" placeholder="ชื่อ - นามสกุล" required="required" value="${memberProfile.member_name }">
        									</div>
        		
        							</div>
        							<div class="form-row">
        								<div class="form-group col-md-6">
        									<label class="text-primary" style="font-size: 20px;"> Email : </label>
        									<input class="form-control" type="email" name="member_email" placeholder="อีเมลล์" required="required" value="${memberProfile.member_email }">
        								</div>
        								<div class="form-group col-md-6">
        									<label class="text-primary" style="font-size: 20px;"> Phone Number : </label>
        									<input class="form-control" type="text" name="member_phone" placeholder="เบอร์โทรศัพท์ xxx-xxxxxxx" required="required" pattern="0\d{2}-\d{7}" value="${memberProfile.member_phone }">
        								</div>
        							</div>     			
        							<div class="form-row">
        								<div class="form-group col-md-12">
        									<label class="text-primary" style="font-size: 20px;"> Address : </label>
        									<textarea class="form-control" name="member_address" placeholder="ที่อยู่"  required="required" > ${memberProfile.member_address } </textarea>
        								</div>      					
        							</div>
        							<div class="form-row">
        								<div class="form-group col-md-5">
        									<label class="text-primary" style="font-size: 20px;"> City : </label>
        									<input class="form-control" type="text" name="member_city" placeholder="อำเภอ / เมือง" required="required" value="${memberProfile.member_city }">
        								</div>
        								<div class="form-group col-md-4">
        									<label class="text-primary" style="font-size: 20px;"> Country : </label>
        									<input class="form-control" type="text" name="member_country" placeholder="จังหวัด" required="required" value="${memberProfile.member_country }">
        								</div>
        								<div class="form-group col-md-3">
        									<label class="text-primary" style="font-size: 20px;"> Zip-code : </label>
        									<input class="form-control" type="text" name="member_zipcode" placeholder="รหัสไปรษณีย์" required="required" value="${memberProfile.member_zipcode }">
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
      
	<!-- modal payonline -->
    <form action="/insertPaymentU" method="post"  enctype="multipart/form-data">
    	<div class="modal fade" id="payonline" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    			<div class="modal-content"  style="padding: 10px;">
      				<div class="modal-header">
        				<h3 class="modal-title" >ชำระ พรบ. ออนไลน์</h3>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        				</button>
      				</div>
      				<div class="modal-body">
      					<div class="form-row">
      						<label class="text-primary" style="font-size: 24px;"> ประเภทรถ </label> 
      					</div>	
      					
      					<div class="form-row" >    	     								
      						<div class="custom-control custom-radio custom-control-inline btn btn-outline-dark">
 						 		<input type="radio" id="radio1" name="payment_cartype" class="custom-control-input" value="mortorbike" checked="checked">			 	
  								<label  class="custom-control-label mx-sm-2" style="font-size: 24px;" for="radio1"><i class="fas fa-motorcycle" style="font-size: 40px;" ></i> <a data-toggle="collapse" href="#mortorbike" >รถจักรยานยนต์</a></label>
							</div>							
							<div class="custom-control custom-radio custom-control-inline btn btn-outline-dark">
  								<input type="radio" id="radio2" name="payment_cartype" class="custom-control-input" value="car">
  								<label class="custom-control-label mx-sm-2" style="font-size: 24px;" for="radio2"><i class="fas fa-car" style="font-size: 40px;" ></i> <a data-toggle="collapse" href="#car" >รถยนต์</a></label>
							</div>
							<div class="custom-control custom-radio custom-control-inline btn btn-outline-dark">
  								<input type="radio" id="radio3" name="payment_cartype" class="custom-control-input" value="truck">  							
  								<label class="custom-control-label mx-sm-2" style="font-size: 24px;" for="radio3"><i class="fas fa-truck" style="font-size: 40px;" ></i> <a data-toggle="collapse" href="#truck">รถบรรทุก</a></label>
							</div>
						</div><br>	
						<div class="collapse" id="mortorbike">
  									<div class="card card-body" style="text-align: center; font-size: 20px;" >ค่าบริการ รถจักรยานยนต์ 100 บาท จัดส่งเอกสาร พรบ. ฟรี  </div>
						</div>			
						<div class="collapse" id="car">
  									<div class="card card-body" style="text-align: center; font-size: 20px;" >ค่าบริการ รถยนต์ 300 บาท จัดส่งเอกสาร พรบ. ฟรี  </div>
						</div>	
						<div class="collapse" id="truck">
  									<div class="card card-body" style="text-align: center; font-size: 20px;" >ค่าบริการ รถบรรทุก 500 บาท จัดส่งเอกสาร พรบ. ฟรี  </div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label class="text-primary" style="font-size: 20px;"> ป้ายทะเบียนรถ </label>
								<input type="text" name="payment_plate" class="form-control" placeholder="กรุณากรอกตามแบบฟอร์ม เช่น 1กก-1111-กรุงเทพ" pattern="[0-9ก-๙]{2,3}-\d{3,4}-[ก-๙]{1,}" required >
							</div>
						</div>
						<div  style="border-bottom: 1px solid #dcdde1;"></div><br>   	
						
      					<div class="form-row">
      						<label class="text-primary" style="font-size: 24px;"> ข้อมูลที่อยู่จัดส่งเอกสาร </label>
      					</div>
        				<div class="form-row">
        					<div class="form-group col-md-12">
        						<label class="text-primary" style="font-size: 20px;"> Name : </label>
        						<input class="form-control" type="text" name="payment_name"  placeholder="ชื่อ - นามสกุล" required="required" value="<%=(String)session.getAttribute("member_name")%>">
        					</div>
        		
        				</div>
        				<div class="form-row">
        					<div class="form-group col-md-6">
        						<label class="text-primary" style="font-size: 20px;"> Email : </label>
        						<input class="form-control" type="email" name="payment_email" placeholder="อีเมลล์" required="required" value="<%=(String)session.getAttribute("member_email")%>">
        					</div>
        					<div class="form-group col-md-6">
        						<label class="text-primary" style="font-size: 20px">Phone Number : </label>
        						<input class="form-control" type="text" name="payment_phone" placeholder="เบอร์โทรศัพท์ " pattern="0\d{2}-\d{7}" required="required" value="<%=(String)session.getAttribute("member_phone")%>">
        					</div>
        				</div>
        				<div class="form-row">
        					<div class="form-group col-12">
        						<label class="text-primary" style="font-size: 20px;"> Address : </label>
        						<textarea rows="3" class="form-control" name="payment_address" placeholder="บ้านเลขที่ / หมู่ / ชื่อหมู่บ้าน / ตำบล"> <%=(String)session.getAttribute("member_address")%> </textarea>
        					</div>
        				</div>
        				<div class="form-row" >
        					<div class="form-group col-md-5">
        						<label class="text-primary" style="font-size: 20px;"> City : </label>
        						<input class="form-control" type="text" name="payment_city" placeholder="อำเภอ / เมือง" required="required" value="<%=(String)session.getAttribute("member_city")%>">
        					</div>
        					<div class="form-group col-md-4">
        						<label class="text-primary" style="font-size: 20px;"> Country : </label>
        						<input class="form-control" type="text" name="payment_country" placeholder="จังหวัด" required="required" value="<%=(String)session.getAttribute("member_country")%>">
        					</div>
        					<div class="form-group col-md-3">
        						<label class="text-primary" style="font-size: 20px;"> Zip-code : </label>
        						<input class="form-control" type="text" name="payment_zipcode" placeholder="รหัสไปรษณีย์" required="required" value="<%=(int)session.getAttribute("member_zipcode")%>">
        					</div>
        				</div><br>
        				<div  style="border-bottom: 1px solid #dcdde1;"></div><br>   
        				
        				<div class="form-row">
        					<div class="form-group col-7">
        						<label class="text-primary" style="font-size: 24px;"> หลักฐานการโอนเงิน (ไฟล์ภาพ .jpg / .png) </label>
        						<input type="file" class="form-control-file" name="payment_pic" required="required" accept="image/jpeg , image/png" >
        					</div>
        					<div class="form-group col-5">
        						<label class="text-primary" style="font-size: 24px;"> ชื่อ - นามสกุล </label>
        						<input type="text" name="payment_picName" required="required" class="form-control" placeholder="ชื่อ-นามสกุล" value="<%=(String)session.getAttribute("member_name")%>">
        					</div>
        				</div>		
        				<input type="hidden" name="payment_username" value="<%=(String)session.getAttribute("member_username")%>">
        					
        				</div>		
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="far fa-times-circle"></i> Close</button>
        				<button type="submit" class="btn btn-primary"><i class="fas fa-location-arrow"></i> Send</button>
      				</div>   			
    			</div>
  			</div>
		</div>
	</form>
	
	<!-- modal uploadProof -->
    <form action="/uploadProofU" method="post" enctype="multipart/form-data">
    	<div class="modal fade" id="uploadproof" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    			<div class="modal-content" style="padding: 10px;">
      				<div class="modal-header">
        				<h3 class="modal-title" >Upload Payment Proof</h3>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        				</button>
      				</div>
      				<div class="modal-body">

						<div class="form-row">
							<img src="../../IndexPic/qrcode.png" style="width: 400px; height: 490px; margin-right: auto;margin-left: auto;">
						</div>
												        			
        			<div  style="border-bottom: 1px solid #dcdde1;"></div><br>   
    			        		     	
        		     		<p class="text-primary" style="font-size: 20px; text-align: center;"> เลขที่บัญชี : 307-2-88822-6  </p> 		     
        					<p class="text-primary" style="font-size: 20px; text-align: center;"> ชื่อบัญชี : นายสุริยพงศ์ มอญขาม  </p>       			
        					<p class="text-primary" style="font-size: 20px; text-align: center;"> ธนาคารกสิกรไทย  </p>       				
        			
        			<div  style="border-bottom: 1px solid #dcdde1;"></div><br>   
        			
        			<div class="form-row" style="margin-left: auto; margin-right: auto; width: 600px;">
        				<div class="custom-control custom-radio custom-control-inline btn btn-outline-dark col-12">
  							<input type="radio" id="Radio1" name="payment_cartype" class="custom-control-input" value="mortorbike" checked="checked">
  							<label class="custom-control-label col-12" for="Radio1" style="font-size: 20px; "><i class="fas fa-motorcycle col-md-2" style="font-size: 40px; " ></i> ค่าบริการ รถจักรยานยนต์ 100 บาท จัดส่งเอกสาร พรบ. ฟรี</label>
						</div>
        		</div><br>
        			<div class="form-row" style="margin-left: auto; margin-right: auto; width: 600px; ">
        				<div class="custom-control custom-radio custom-control-inline btn btn-outline-dark col-12">
  							<input type="radio" id="Radio2" name="payment_cartype" class="custom-control-input" value="car">
  							<label class="custom-control-label col-12" for="Radio2" style="font-size: 20px; "><i class="fas fa-car col-md-2" style="font-size: 40px; " ></i> ค่าบริการ รถยนต์ 300 บาท จัดส่งเอกสาร พรบ. ฟรี</label>
						</div>
        			</div><br>
        			<div class="form-row" style="margin-left: auto; margin-right: auto; width: 600px; ">
        				<div class="custom-control custom-radio custom-control-inline btn btn-outline-dark col-12">
  							<input type="radio" id="Radio3" name="payment_cartype" class="custom-control-input" value="truck">
  							<label class="custom-control-label col-12" for="Radio3" style="font-size: 20px; "><i class="fas fa-truck col-md-2" style="font-size: 40px; " ></i> ค่าบริการ รถบรรทุก 500 บาท จัดส่งเอกสาร พรบ. ฟรี</label>
						</div>
        			</div><br>
        			<div class="form-row">
							<div class="form-group col-md-12">
								<label class="text-primary" style="font-size: 20px;"> ป้ายทะเบียนรถ </label>
								<input type="text" name="payment_plate" class="form-control" placeholder="กรุณากรอกตามแบบฟอร์ม เช่น 1กก-1111-กรุงเทพ" pattern="[0-9ก-๙]{2,3}-\d{3,4}-[ก-๙]{1,}" required >
							</div>
						</div>
        			<div class="form-row">
        					  <div class="form-group col-7">
        						<label class="text-primary" style="font-size: 24px;"> หลักฐานการโอนเงิน (ไฟล์ภาพ .jpg / .png) </label>
        						<input type="file" class="form-control-file" name="proof_file" required="required" accept="image/jpeg , image/png" >
        					</div> 
        					<div class="form-group col-5">
        						<label class="text-primary" style="font-size: 24px;"> ชื่อ - นามสกุล </label>
        						<input type="text" name="payment_picName" required="required" class="form-control" placeholder="ชื่อ-นามสกุล" value="<%=(String)session.getAttribute("member_name")%>">
        					</div>
        				</div>		
        				<input type="hidden" name="payment_username" value="<%=(String)session.getAttribute("member_username")%>">
        				<input type="hidden" name="payment_proof" value="${memberProfile.member_name }">
        			</div>      			
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="far fa-times-circle"></i> Close</button>
        				<button type="submit" class="btn btn-primary"><i class="fas fa-location-arrow"></i> Send</button>
      				</div>   			
    			</div>
  			</div>
		</div>
	</form>
	
		<!--  modal checkTransport  -->
    	<form action="/checkTransU"  method="post">
    	<div class="modal fade" id="checkTransport" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" style="font-size: 30px;">ตรวจสอบการจัดส่ง</h5>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        				</button>
      				</div>
      				<div class="modal-body">	
      					<div class="form-row" style="margin-left: auto; margin-right: auto; width: 600px;">
        				<div class="custom-control custom-radio custom-control-inline btn btn-outline-dark col-12">
  							<input type="radio" id="Radio1" name="payment_cartype" class="custom-control-input" value="mortorbike" checked="checked">
  							<label class="custom-control-label col-12" for="Radio1" style="font-size: 20px; "><i class="fas fa-motorcycle col-md-2" style="font-size: 40px; " ></i> รถจักรยานยนต์ </label>
						</div>
        		</div><br>
        			<div class="form-row" style="margin-left: auto; margin-right: auto; width: 600px; ">
        				<div class="custom-control custom-radio custom-control-inline btn btn-outline-dark col-12">
  							<input type="radio" id="Radio2" name="payment_cartype" class="custom-control-input" value="car">
  							<label class="custom-control-label col-12" for="Radio2" style="font-size: 20px; "><i class="fas fa-car col-md-2" style="font-size: 40px; " ></i> รถยนต์ </label>
						</div>
        			</div><br>
        			<div class="form-row" style="margin-left: auto; margin-right: auto; width: 600px; ">
        				<div class="custom-control custom-radio custom-control-inline btn btn-outline-dark col-12">
  							<input type="radio" id="Radio3" name="payment_cartype" class="custom-control-input" value="truck">
  							<label class="custom-control-label col-12" for="Radio3" style="font-size: 20px; "><i class="fas fa-truck col-md-2" style="font-size: 40px; " ></i> รถบรรทุก </label>
						</div>
        			</div><br>
        			<div class="form-row">
							<div class="form-group col-md-12">
								<label class="text-primary" style="font-size: 20px;"> ป้ายทะเบียนรถ </label>
								<input type="text" name="payment_plate" class="form-control" placeholder="กรุณากรอกตามแบบฟอร์ม เช่น 1กก-1111-กรุงเทพ" pattern="[0-9ก-๙]{2,3}-\d{3,4}-[ก-๙]{1,}" required  autofocus="autofocus">
							</div>
						</div>
        			<div class="form-row">
        					<label class="text-primary col-sm-4" style="font-size: 20px;"> Neme : </label>
        					<input type="text" name="payment_picName" class="form-control" placeholder="ชื่อ - นามสกุล " value="${memberProfile.member_name }" required="required">
        			</div><br>
        			<input type="hidden" name="payment_username" value="<%=(String)session.getAttribute("member_username")%>">
        			
        			</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="far fa-times-circle"></i> Close</button>
        				<button type="submit" class="btn btn-primary"><i class="fas fa-location-arrow"></i> Login </button>
      				</div>   			
    			</div>
  			</div>
		</div>
	   	</form> 
	
  </div>
</nav>