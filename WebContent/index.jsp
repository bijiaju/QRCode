<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批量二维码处理</title>
<style type="text/css">
#loading {
width:170px;
height:25px;
border:3px solid #C3DAF9;
position:absolute;
top:300px;
left:600px; 
z-index:10000; 
background-color:#F7F9FC;
line-height:25px;
vertical-align:middle;
font-size:11pt;
display:none;
}
body {
background-color:blue;
background-image:url("${pageContext.request.contextPath}/style/img/back.jpg");
background-repeat:no-repeat;
 background-position:40% 40%;
}
#title{
text-align:center;
}

</style>
<script type="text/javascript"  src="/QR1/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//显示加载数据
	function ShowDiv() {
	$("#loading").show();
	}

	//隐藏加载数据
	function HiddenDiv() {
	$("#loading").hide();
	}
	
	$("#transpng").click(function(){
		
			//var username = $(":text").val();//哈哈
		//var password = $(":password").val();//123
		//${pageContext.request.contextPath }/food?method=findFoodType
		var url = "${pageContext.request.contextPath}/QRCodeServlet?method=transpng";
		/*手工写JSON文本
		var sendData = {
			"username" : username,
			"password" : password
		};
		*/
		var sendData = $("form").serialize();
		$.post(url,sendData,function(backDate){
			//alert(backDate);
			//backDate：
			//如果服务器返回html，即backDate就是string，不要解析
			//如果服务器返回json，即backDate就是object，要解析	
			//如果服务器返回xml，即backDate就是object，要解析	
			var $img = $("<h2  style='color:red;'>"+backDate+"</h2>");
			$("#tip2").text("");
		    $("#tip2").append($img);
		});
	});
	$("#getResult").click(function(){
		var url = "${pageContext.request.contextPath}/QRCodeServlet?method=batchProcessQR";
		/*手工写JSON文本
		var sendData = {
			"username" : username,
			"password" : password
		};
		*/
		var sendData = $("form").serialize();
		$.post(url,sendData,function(backDate){
			
			//alert(backDate);
			//backDate：
			//如果服务器返回html，即backDate就是string，不要解析
			//如果服务器返回json，即backDate就是object，要解析	
			//如果服务器返回xml，即backDate就是object，要解析	
			//var $img = $("<img src='"+backDate+"' width='14px' height='14px'>");<h1>This is a heading</h1>
		
			var backDatas = backDate.split('_');
			//$.each(backDatas,function(index,value){
			     //alert(index+"..."+value);
			     var $img = $("<h2  style='color:green;'>"+backDatas[1]+"</h2>");
					$("#tip1").text("");
				    $("#tip1").append($img);
				    var $img = $("<h2  style='color:red;'>"+backDatas[0]+"</h2>");
					$("#tip2").text("");
				    $("#tip2").append($img);
			//});
			
		});
	});
});
</script>
</head>
<body>
<span id="tip1"></span>
<span id="tip2"></span>

<h1 id="title">批量处理二维码</h1>
   <!-- 
		在异步提交的方式下，form标签的action和method属性没有意义
	-->
	<form action="" method="">
		<table border="2" align="center">
			<tr>
				<th>图片来源地址</th>
				<td><input type="text" name="srcAddress"  value="C:/Users/bee/Desktop"/></td>
				<td></td>
			</tr>
			<tr>
				<th>图片目标地址</th>
				<td><input type="text" name="desAddress" value="C:/Users/bee/Desktop"/></td>
				<td></td>
			</tr>
			<tr>
				<th>容错率</th>
				<td>
				       <select name="error" >
  							<option value="25%">25%</option>
  							<option value="7%">7%</option>
  							<option value="30%">30%</option>
  							<option value="15%">15%</option>
						</select>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>二维码宽</th>
				<td><input type="text" name="width" value="400"/></td>
				<td>像素</td>
			</tr>
			<tr>
				<th>二维码高</th>
				<td><input type="text" name="hight"  value="400"/></td>
				<td>像素</td>
			</tr>
			<tr>
				<th>二维码白边</th>
				<td><input type="text" name="whiteEdge"  value="10"/></td>
				<td>数越小，白边越小</td>
			</tr>
		</table>
		
	</form>
    <center><button id="transpng" style="width:200px; height:100px;">格式化图片</button>
     <button id="getResult" style="width:200px; height:100px;">生成二维码</button></center>
     <div id="loading"><img src="${pageContext.request.contextPath}/style/img/2012032811155512.gif" alt=""/>正在加载数据,请稍候...</div>
    </body>
</html>
