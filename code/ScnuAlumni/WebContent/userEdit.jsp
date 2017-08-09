<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.lang.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>

<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<title>修改个人信息</title>

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
 
 .m-weui-select {
/*   -webkit-appearance: none; */
  border: 0;
  outline: 0;
  background-color: transparent;
  width: 100%;
  font-size: inherit;
  height: 44px;
  position: relative;
  z-index: 1;
  /* padding-left: 15px; */
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
 		
		if (name.length <= 0) {
 			$.alert("姓名不正确!");
		}else if (college.length <= 0) {
			$.alert("学院不能为空!");
		}else if (userClss.length <= 0) {
			$.alert("班级不能为空!");
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
		}else{
			//保存用户修改的信息
			$.toast("修改成功");
			document.formSub.submit();
		}
 	}
 	
 </script>

</head>

<body>
<%

String userOpenId=request.getParameter("userOpenId");
String userHeadImgUrl=request.getParameter("editHeadImgUrl");
String userName=request.getParameter("editName");
String userCollege=request.getParameter("editCollege");
String userClss=request.getParameter("editClass");
String userSex=request.getParameter("editSex");
String userPhone=request.getParameter("editPhone");
String userQQ=request.getParameter("editQQ");
String userEmail=request.getParameter("editEmail");
String userCity=request.getParameter("editCity");
String userIndustry=request.getParameter("editIndustry");
String userHobby=request.getParameter("editHobby");
String userProfession=request.getParameter("editProfession");

%>

<form action="userSignInfo.jsp" method="post" name="formSub">
<div class="page__bd">
 <div class="weui_cells weui_cells_access"  style="margin-top: 0px">
 	<div class="weui_cell">
 		<div class="weui_cell_bd weui_cell_primary" style="height: 48px">
 			<p class="p">头像</p>
 			<input type="hidden" name="myType" value="1">
 		</div>
 		<div class="weui-cell_ft" style="height: 48px">
 			<img src="<%=userHeadImgUrl %>" style="height: 45px;width: 45px">
 			<input type="hidden" name="userHeadImgUrl" value=<%=userHeadImgUrl%>>
 			<input type="hidden" name="userOpenId" value=<%=userOpenId%>>
 		</div>
 	</div>
 </div>	

<div class="weui_cells weui_cells_form" style="margin-top: 0px">	
<div class="inline weui_cells_title"><p class="p">性别<span style='color: red;position: relative;top: 2px'>*</span></p></div>
<div class="inline weui_cells weui_cells_radio" style="position:relative;line-height:48px;margin-left: 40px;">
    <label class="inline weui_cell weui_check_label" for="sexm">
        <div class="weui_cell_bd weui_cell_primary">
            <p>男</p>
        </div>
        <div class="weui_cell_ft">
            <input type="radio" class="weui_check" name="radioSex" id="sexm" value="男" <%if("男".equals(userSex)){%> checked="checked" <% }%> >
            <span class="weui_icon_checked"></span>
        </div>
    </label>
    <label class="inline weui_cell weui_check_label" for="sexf" style="margin-left: 50px;">
        <div class="weui_cell_bd weui_cell_primary">
            <p>女</p>
        </div>
        <div class="weui_cell_ft">
            <input type="radio" class="weui_check" name="radioSex" id="sexf" value="女" <%if("女".equals(userSex)){%> checked="checked" <% }%>>
            <span class="weui_icon_checked"></span>
        </div>
    </label>
</div>
</div>		
			    
<div class="weui_cells weui_cells_form" style="margin-top: 0px">

	<div class="weui_cell">
		<div class="weui_cell_hd"><label class="weui-label">国家<span style='color: red;position: relative;top: 2px'>*</span></label></div>
		<div class="weui_cell_bd weui_cell_primary">
			<select class="m-weui-select" name="select2">
			<option value="1" selected="selected">中国</option>
			<option value="2">美国</option>
			<option value="3">英国</option>
			</select>
		</div>
	</div>
	
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">学院<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" name="userCollege" placeholder="请输入学院" value="<%=userCollege %>">
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">班级<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" name="userClass" placeholder="请输入班级" value="<%=userClss %>">
        </div>
    </div>
	
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">姓名<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" name="userName" placeholder="请输入姓名" value="<%=userName %>">
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">QQ<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="number" name="userQQ" placeholder="请输入QQ号" value="<%=userQQ %>">
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">邮箱<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" name="userEmail" placeholder="请输入邮箱地址" value="<%=userEmail %>">
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label">手机号<span style='color: red;position: relative;top: 2px'>*</span></label></div>
        <div class="weui_cell_bd weui_cell_primary"">
            <input class="weui_input" type="number" name="userPhone" placeholder="请输入手机号" value="<%=userPhone %>">
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
	        <input class="weui_input" type="text" name="userIndustry" placeholder="请输入行业" value="<%=userIndustry %>">
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label">爱好</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <input class="weui_input" type="text" name="userHobby" placeholder="请输入爱好" value="<%=userHobby %>">
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label">职业</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <input class="weui_input" type="text" name="userProfession" placeholder="请输入职业" value="<%=userProfession %>">
	    </div>
	</div>
	
</div>

<div class='demos-content-padded'>
    <a href="javascript:;" id='show-confirm' class="weui-btn weui-btn_primary">保存</a>
</div>

</div>
</form>


<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script>

 <script>
 	$("#home-city").cityPicker({
 		showDistrict: true,
 		title:"请选择您的地址",
		onChange: function (picker, values, displayValues) {
	          console.log(values, displayValues);
	        }
 	});
 	
 	 $(document).on("click", "#show-confirm", function() {
         $.confirm("您确定要保存修改信息吗?", "保存修改", function() {
           //确认操作
           checkInput();
         }, function() {
           //取消操作
           $.toast("取消保存", "cancel");
         });
       });
 	
</script>


</body>

</html>