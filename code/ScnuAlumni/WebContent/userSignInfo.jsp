<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.newttl.scnualumni.bean.database.SignedUser" %>
<%@page import="com.newttl.scnualumni.util.DataBaseUtil" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">

<link rel="stylesheet" href="resources/css/weui.css">
<link rel="stylesheet" href="resources/css/weui.min.css">
<link rel="stylesheet" href="resources/css/jquery-weui.css">
<link rel="stylesheet" href="resources/css/demos.css">

<script src="resources/js/jquery-2.1.4.js"></script>
<script src="resources/js/fastclick.js"></script>
<script src="resources/js/jquery-weui.js"></script>
<script src="resources/js/city-picker.js"></script>

<title>个人信息</title>

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

</head>
<body ontouchstart>

<%

String select=request.getParameter("select2");
String myType=request.getParameter("myType");
String userOpenId=request.getParameter("userOpenId");
String userHeadImgUrl=request.getParameter("userHeadImgUrl");
String sex=request.getParameter("radioSex");
String userCollege=request.getParameter("userCollege");
String userClass=request.getParameter("userClass");
String userName=request.getParameter("userName");
String userPhone=request.getParameter("userPhone");
String userQQ=request.getParameter("userQQ");
String userEmail=request.getParameter("userEmail");
String userCity=request.getParameter("userCity");
String userIndustry=request.getParameter("userIndustry");
String userHobby=request.getParameter("userHobby");
String userProfession=request.getParameter("userProfession");
if(!"".equals(userOpenId)){
	SignedUser signedUser=new SignedUser();
	signedUser.setOpenId(userOpenId);
	signedUser.setHeadImgUrl(userHeadImgUrl);
	signedUser.setCollege(userCollege);
	signedUser.setUserClass(userClass);
	signedUser.setUserName(userName);
	signedUser.setSex(sex);
	signedUser.setPhone(userPhone);
	signedUser.setQQ(userQQ);
	signedUser.seteMail(userEmail);
	signedUser.setCity(userCity);
	signedUser.setIndustry(userIndustry);
	signedUser.setHobby(userHobby);
	signedUser.setProfession(userProfession);
	DataBaseUtil Util=new DataBaseUtil();
	boolean sigUped=Util.isSigned(userOpenId);
	
	//用户首次注册,保存用户注册的信息
	if("0".equals(myType)){
		//用户未注册
		if(!sigUped){
			DataBaseUtil dataBaseUtil=new DataBaseUtil();
			dataBaseUtil.saveSignedUser(signedUser);
		}
	}
	//用户修改信息,更新用户信息
	else if("1".equals(myType)){
		DataBaseUtil baseUtil=new DataBaseUtil();
		baseUtil.updateSignedUser(signedUser);
	}
	
}

%>

<form action="userEdit.jsp?openId=<%=userOpenId %>" method="post">
<div class="page__bd">
 <div class="weui_cells weui_cells_access" style="margin-top: 0px">
 	<div class="weui_cell">
 		<div class="weui_cell_bd weui_cell_primary" style="height: 48px">
 			<p class="p">头像</p>
 		</div>
 		<div class="weui-cell_ft" style="height: 48px">
 			<img src="<%=userHeadImgUrl %>" style="height: 45px;width: 45px">
 			<input type="hidden" name="editHeadImgUrl" value=<%=userHeadImgUrl %>>
 			<input type="hidden" name="userOpenId" value=<%=userOpenId %>>
 		</div>
 	</div>
 </div>	
			    
<div class="weui_cells weui_cells_form"  style="margin-top: 0px">
	
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">学院</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p><%=userCollege%></p>
            <input type="hidden" name="editCollege" value=<%=userCollege %>>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">班级</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p><%=userClass%></p>
            <input type="hidden" name="editClass" value=<%=userClass %>>
        </div>
    </div>
	
	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">姓名</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p><%=userName%></p>
            <input type="hidden" name="editName" value=<%=userName %>>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">性别</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p><%=sex %></p>
            <input type="hidden" name="editSex" value=<%=sex %>>
        </div>
    </div>

	<div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">手机号</label></div>
        <div class="weui_cell_bd weui_cell_primary"">
            <p><%=userPhone %></p>
            <input type="hidden" name="editPhone" value=<%=userPhone %>>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">QQ</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p><%=userQQ %></p>
            <input type="hidden" name="editQQ" value=<%=userQQ %>>
        </div>
    </div>
    
    <div class="weui_cell">
    	<div class="weui_cell_hd"><label class="weui-label my-label">邮箱</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <p><%=userEmail %></p>
            <input type="hidden" name="editEmail" value=<%=userEmail %>>
        </div>
    </div>
    
    <div class="weui_cell">
        <div class="weui_cell__hd"><label class="weui-label my-label">城市</label></div>
        <div class="weui_cell__ft">
          <p><%=userCity%></p>
          <input type="hidden" name="editCity" value="<%=userCity %>" >
        </div>
     </div>
      
</div>

<div class="weui_cells weui_cells_form" style="margin-top: 0px">

	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label my-label">行业</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <p><%=userIndustry %></p>
	        <input type="hidden" name="editIndustry" value=<%=userIndustry %>>
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label my-label">爱好</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <p><%=userHobby %></p>
	        <input type="hidden" name="editHobby" value=<%=userHobby %>>
	    </div>
	</div>
	
	<div class="weui_cell">
	   	<div class="weui_cell_hd"><label class="weui-label my-label">职业</label></div>
	    <div class="weui_cell_bd weui_cell_primary">
	        <p><%=userProfession %></p>
	        <input type="hidden" name="editProfession" value=<%=userProfession %>>
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


</body>
</html>