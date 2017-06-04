<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>" >

    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="loginstyles.css">
	
  <script type="text/javascript">
    function validate() {
    if (document.forms[0].username.value == "") {
            alert("姓名不能为空");
            return false;
        }
        
        if (document.forms[0].password.value == "") {
            alert("密码不能为空");
            return false;
        }
    }
    </script>
  </head>
  
  
  <body>
    <header>
      <h1>欢迎来到We<i class="iconfont">&#xe64f;</i>Cat</h1>
      <h2>简洁页面 全新体验</h2>
    </header>

    <form action=LoginServlet method="post" onsubmit="validate();">
      <table width ="298" border ="0" align ="center" cellpadding ="4" cellspacing ="1">
        <tr>
          <td align ="right">用户名：</td>
          <td align ="left"> <input type="text"  name=username size="15" ></td>
        </tr>
        <tr>
          <td align ="right">密&nbsp;&nbsp;&nbsp;码：</td>
          <td align = "left"> <input type ="password" name= password size ="15"> </td>
        </tr>
        <tr>
          <td colspan ="2" align ="center">
          <input type = "submit" value ="登录">&nbsp; &nbsp;&nbsp;
          <input type ="reset" value ="取消" > 
          </td>
        </tr>
      </table>
      <a href="register.jsp">还没有账号？点击这里注册。</a>
    </form>
    
  </body>
</html>
