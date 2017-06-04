<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'error.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="registerstyles.css">
	
  <script type="text/javascript">

    function validate() {
    if (document.forms[0].newusername.value == "") {
            alert("姓名不能为空");
            return false;
        }
        
        if (document.forms[0].newpassword.value == "") {
            alert("密码不能为空");
            return false;
        }
    }
    </script>
  </head>
  
  <body>
    <h1><i class="iconfont">&#xe633;</i>We Cat 注册</h1>

    <form action=RegisterServlet method="post" onsubmit="validate();">
      <p>注册账户：</p>
      <hr>
      <table width ="298" border ="0" align ="center" cellpadding ="13" cellspacing ="1">
        <tr>
          <td align ="right">用户名：</td>
          <td align ="left"> <input type="text"  name=newusername size="15" ></td>
        </tr>
        <tr>
          <td align ="right">密&nbsp; &nbsp;码：</td>
          <td align = "left"> <input type ="password" name= newpassword size ="15"> </td>
        </tr>
        <tr>
          <td colspan ="2" align ="center">
          <input type = "submit" value ="确定">&nbsp; &nbsp; &nbsp; &nbsp; 
          <input type ="reset" value ="取消" onclick="window.location='login.jsp'">
          </td>
        </tr>
      </table>
    </form>
    
  </body>
</html>