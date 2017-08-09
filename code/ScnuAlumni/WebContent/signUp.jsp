<%@page import="javax.swing.text.Document"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.*" %>
<%@page import="com.newttl.scnualumni.bean.pojo.SNSUserInfo"%>
<%@page import="com.newttl.scnualumni.util.DataBaseUtil" %>
<%@page import="com.newttl.scnualumni.bean.database.SignedUser" %>
<%@ page language="java" pageEncoding="UTF-8"%>

<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>

<html>
<head>
 <base href="<%=basePath%>">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
 
 <!-- <title>注册</title> -->
 
<link rel="stylesheet" href="resources/css/weui.css">
<link rel="stylesheet" href="resources/css/weui.min.css">
<link rel="stylesheet" href="resources/css/jquery-weui.css">
<link rel="stylesheet" href="resources/css/demos.css">
 
 
<style type="text/css">
 .p{
 	line-height:48px;
 	color: green;
 	font-size: large;
 }
 .inline{
 	float: left;
 }
.my-label{
	color: gray;
 }

 </style>
 
 
<script src="resources/js/jquery-2.1.4.js"></script>
<script src="resources/js/fastclick.js"></script>
<script src="resources/js/jquery-weui.js"></script>
<script src="resources/js/city-picker.js"></script>	
 
 <script type="text/javascript">
 
	 function ischinese(s){
	     var ret=true;
	     for(var i=0;i<s.length;i++)           //遍历每一个文本字符
	         ret=ret && (s.charCodeAt(i)>=10000);//判断文本字符的unicode值
	     return ret;
	 } 
 
 	function checkInput(){
 		var sex=document.formSub.radioSex.value;
 		var name=document.formSub.userName.value;
 		var college=document.formSub.userCollege.value;
 		var userClss=document.formSub.userClass.value;
 		var phone=document.formSub.userPhone.value;
 		var qQ=document.formSub.userQQ.value;
 		var email=document.formSub.userEmail.value;
 		var code=document.formSub.userCode.value;
 		var city=document.formSub.userCity.value;
 		var industry=document.formSub.userIndustry.value;
 		var hobby=document.formSub.userHobby.value;
 		var profession=document.formSub.userProfession.value;
 		var regEmail=/\w+([-+.']\w+)*@\w+([-.]\w+)*.\w+([-.]\w+)*/;
 		
		if (college.length <= 0) {
			$.alert("学院不能为空!");
		}else if (userClss.length <= 0) {
			$.alert("班级不能为空!");
		}else if (name.length <= 0) {
 			$.alert("姓名不正确!");
		}else if (phone.length != 11) {
			$.alert("手机号码长度不正确!");
		}else if (qQ.length <= 0) {
			$.alert("QQ长度不正确!");
		}else if (!regEmail.test(email)) {
			$.alert("邮箱格式不正确!");
		}else if (code.length != 4) {
			$.alert("验证码不正确!");
		}else if (city.length <= 0) {
			$.alert("城市不能为空!");
		}else if (industry.length <= 0) {
			$.alert("行业不能为空!");
		}else if (hobby.length <= 0) {
			$.alert("爱好不能为空!");
		}else if (profession.length <= 0) {
			$.alert("职业不能为空!");
		}else {
			//提交用户注册的信息
			$.toast("提交成功");
			document.formSub.submit(); 
		}
 	}
 	
 </script>
 
</head>

<body ontouchstart>

<%
	//获取 OAuthServlet 传入的参数
	SNSUserInfo snsUserInfo=(SNSUserInfo)request.getAttribute("snsUserInfo");
	String openId="";
	String headImgUrl="";
	if(null != snsUserInfo){
		headImgUrl=snsUserInfo.getHeadImgUrl();
		openId=snsUserInfo.getOpenId();
		DataBaseUtil baseUtil=new DataBaseUtil();
		SignedUser signedUser=baseUtil.getSigned(snsUserInfo.getOpenId());
		/* out.print("signedUser::"+signedUser.getUserName()); */
		//用户已经注册了，显示用户的信息 
		if(null != signedUser){

%>

<script type="text/javascript">
	document.title='个人信息';
</script>

<form action="userEdit.jsp" method="post" name="formInfo">
<div class="page__bd">
 <div class="weui_cells weui_cells_access"  style="margin-top: 0px">
 	<div class="weui_cell">
 		<div class="weui_cell_bd weui_cell_primary" style="height: 48px">
 			<p class="p">头像</p>
 		</div>
 		<div class="weui-cell_ft" style="height: 48px">
 			<img src="<%=signedUser.getHeadImgUrl() %>" style="height: 45px;width: 45px">
 			<input type="hidden" name="editHeadImgUrl" value=<%=signedUser.getHeadImgUrl() %>>
 			<input type="hidden" name="userOpenId" value=<%=signedUser.getOpenId() %>>
 		</div>
 	</div>
 </div>	
			    
<div class="weui_cells weui_cells_form" style="margin-top: 0px">
	
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">学院</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getCollege() %></p>
            <input type="hidden" name="editCollege" value=<%=signedUser.getCollege() %>>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">班级</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getUserClass() %></p>
            <input type="hidden" name="editClass" value=<%=signedUser.getUserClass() %>>
        </div>
    </div>
	
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">姓名</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getUserName() %></p>
            <input type="hidden" name="editName" value=<%=signedUser.getUserName() %>>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">性别</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getSex() %></p>
            <input type="hidden" name="editSex" value=<%=signedUser.getSex() %>>
        </div>
    </div>

	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">手机号</label></div>
        <div class="weui_cell_bd weui_cell_primary"">
            <p ><%=signedUser.getPhone() %></p>
            <input type="hidden" name="editPhone" value=<%=signedUser.getPhone() %>>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">QQ</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getQQ() %></p>
            <input type="hidden" name="editQQ" value=<%=signedUser.getQQ() %>>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">邮箱</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.geteMail() %></p>
            <input type="hidden" name="editEmail" value=<%=signedUser.geteMail() %>>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">城市</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p ><%=signedUser.getCity()%></p>
            <input type="hidden" name="editCity" value=<%=signedUser.getCity()%>>
        </div>
    </div>

</div>

<div class="weui_cells weui_cells_form" style="margin-top: 0px">

	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label my-label">行业</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <p ><%=signedUser.getIndustry() %></p>
	        <input type="hidden" name="editIndustry" value=<%=signedUser.getIndustry() %>>
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label my-label">爱好</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <p ><%=signedUser.getHobby() %></p>
	        <input type="hidden" name="editHobby" value=<%=signedUser.getHobby() %>>
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label my-label">职业</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <p ><%=signedUser.getProfession() %></p>
	        <input type="hidden" name="editProfession" value=<%=signedUser.getProfession() %>>
	    </div>
	</div>
	
</div>

<div class="weui_btn_area">
     <!-- <a class="weui_btn weui_btn_primary" href="http://newtkwx.ngrok.cc/WeChat/userSignInfo.jsp?tell='5566'" id="showTooltips">确定</a> -->
     <input class="weui_btn weui_btn_primary" type="submit" name="edit" value="修改">
</div>
<br>
</div>

</form>


<%
	//用户未注册，则注册信息
		}
		else{
%>

<script type="text/javascript">
	document.title='注册';
</script>

<form action="userSignInfo.jsp" method="post" name="formSub">
<div class="page__bd">
 <div class="weui_cells weui_cells_access" style="margin-top: 0px">
 	<div class="weui_cell">
 		<div class="weui_cell_bd weui_cell_primary" style="height: 48px">
 			<p class="p">头像</p>
 			<input type="hidden" name="myType" value="0">
 		</div>
 		<div class="weui-cell_ft" style="height: 48px">
 			<img src="<%=headImgUrl %>" style="height: 45px;width: 45px">
 			<input type="hidden" name="userHeadImgUrl" value=<%=headImgUrl%>>
 			<input type="hidden" name="userOpenId" value=<%=openId%>>
 		</div>
 	</div>
 </div>	

<div class="weui_cells weui_cells_form" style="margin-top: 0px">	
<div class="inline weui_cells_title"><p class="p">性别<span style='color: red;position: relative;top: 2px'>*</span></p></div>
<div class="inline weui_cells weui_cells_radio" style="position:relative; line-height:48px;margin-left: 40px;">
    <label class="inline weui_cell weui_check_label" for="sexm">
        <div class="weui_cell_bd weui_cell_primary">
            <p>男</p>
        </div>
        <div class="weui_cell_ft">
            <input type="radio" class="weui_check" name="radioSex" id="sexm" value="男">
            <span class="weui_icon_checked"></span>
        </div>
    </label>
    <label class="inline weui_cell weui_check_label" for="sexf" style="position:relative;margin-left: 50px;">
        <div class="weui_cell_bd weui_cell_primary">
            <p>女</p>
        </div>
        <div class="weui_cell_ft">
            <input type="radio" class="weui_check" name="radioSex" id="sexf" value="女" checked="checked">
            <span class="weui_icon_checked"></span>
        </div>
    </label>
</div>
</div>		
			    
<div class="weui_cells weui_cells_form" style="margin-top: 0px">
	
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">学院<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" name="userCollege" placeholder="请输入学院">
        </div>
    </div>
    
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">班级<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" name="userClass" placeholder="请输入班级">
        </div>
    </div>
	
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">姓名<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" name="userName" placeholder="请输入姓名">
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">QQ<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="number" name="userQQ" placeholder="请输入QQ号">
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">邮箱<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" name="userEmail" placeholder="请输入邮箱地址">
        </div>
    </div>
    
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">手机号<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary"">
            <input class="weui_input" type="number" name="userPhone" placeholder="请输入手机号">
        </div>
    </div>
    
    <div class="weui_cell weui_vcode">
    	<div class="weui_cell_hd"><label class="weui-label">验证码<span style='color: red;position: relative;top: 2px'>*</span></label></div>
    	<div class="weui_cell_bd weui_cell_primary">
        	<input class="weui_input" type="text" name="userCode" placeholder="请输入验证码">
    	</div>
    	<div class="weui_cell_ft weui_vimg_wrp">
        	<img src="./images/vcode.jpg" />
    	</div>
    </div>
    
    
    <div class="weui_cell">
        <div class="weui_cell__hd"><label for="home-city" class="weui-label">城市<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell__ft">
          <input class="weui_input" id="home-city" type="text" name="userCity">
        </div>
     </div>
      
</div>

<div class="weui_cells weui_cells_form" style="margin-top: 0px">

	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label">行业</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <input class="weui_input" type="text" name="userIndustry" placeholder="请输入行业">
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label">爱好</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <input class="weui_input" type="text" name="userHobby" placeholder="请输入爱好">
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label">职业</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <input class="weui_input" type="text" name="userProfession" placeholder="请输入职业">
	    </div>
	</div>
	
</div>

<br>
<div class='demos-content-padded'>
    <a href="javascript:;" id='show-confirm' class="weui-btn weui-btn_primary">提交</a>
</div>
<br>

</div>
</form>


<!-- <script src="resources/js/jquery-2.1.4.js"></script>
<script src="resources/js/fastclick.js"></script>	 -->

<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script>
<!-- <script src="resources/js/jquery-weui.js"></script>
<script src="resources/js/city-picker.js"></script> -->
 <script>
 	$("#home-city").cityPicker({
 		showDistrict: true,
 		title:"请选择您的地址",
		onChange: function (picker, values, displayValues) {
	          console.log(values, displayValues);
	        }
 	});
 	
 	 $(document).on("click", "#show-confirm", function() {
         $.confirm("您确定要提交信息吗?", "提交信息", function() {
           //确认操作
           checkInput();
         }, function() {
           //取消操作
        	 $.toast("取消提交", "cancel");
         });
       });
 	
</script>
 

<%
		}
	}else{
		out.print("用户未同意授权,未获取到用户信息！");
	}
%>


</body>
</html>