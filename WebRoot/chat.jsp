<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
   
<!DOCTYPE HTML>  
<html>  
  <head>  
    <base href="<%=basePath%>">  
    <title>We Cat</title> 
    <link rel="stylesheet" type="text/css" href="chatstyles.css">

    <!--<script type="text/javascript" src="/jquery-3.2.1.js"></script>-->
    <script type="text/javascript">
      x=0;
      $(document).ready(function(){
        $("div").scroll(function() {
        });
      });
    </script>
  </head>  
     
  <body>
    <div id="background"></div> 
    <div id="container">
      <header>
        <a class="iconfont" href="login.jsp" style="position: absolute; text-decoration: none; top: -5px; left: 0; line-height: 60px;">&#xe64e;</a>
        <h1>WE&nbsp;&nbsp;CAT</h1>
        <button id="close" onclick="closeWebSocket()">Close</button>  
      </header>

      <div id="msg">
        <div id="message"> </div> 
        <div id="message_end" style="height:0px;"></div>
      </div>

      <div id="chatbox">
        <i class="iconfont">&#xe604;</i>
        <input id="text" type="text" maxlength="60"/>
        <button id="send" onclick="send()">Send</button>
      </div>
    </div>
  </body>  
     
  <script type="text/javascript">  
      var websocket = null;  
      var myusername = "<%=(String)session.getAttribute("username") %>"; 
      var username = myusername ;
      var flag = true;
         
      //判断当前浏览器是否支持WebSocket  
      if('WebSocket' in window){  
          websocket = new WebSocket("ws://127.0.0.1:8080/case/websocket");  
      }  
      else{  
          alert('Not support websocket')  
      }  
         
      //连接发生错误的回调方法  
      websocket.onerror = function(){  
          //setMessageInnerHTML("error");
          document.getElementById('message').innerHTML += '<div style="padding: 10px 35px; font-size: 20px; text-align: center;">' + "error" + '</div>'; 

      };  
         
      //连接成功建立的回调方法  
      websocket.onopen = function(event){  
          //setMessageInnerHTML("登入wecat");
          document.getElementById('message').innerHTML += '<div style="padding: 10px 35px; font-size: 20px; text-align: center;">' + "登入wecat" + '</div>';  
      }  
      
      //接收到消息的回调方法  
      websocket.onmessage = function(){  
          setMessageInnerHTML(event.data);  
      }
         
      //连接关闭的回调方法  
      websocket.onclose = function(){  
          //setMessageInnerHTML("登出wecat");  
          document.getElementById('message').innerHTML += '<div style="padding: 10px 35px; font-size: 20px; text-align: center;">' + "登出wecat" + '</div>';
      }  
         
      //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。  
      window.onbeforeunload = function(){  
          websocket.close();  
      }  

      //将消息显示在网页上  
      function setMessageInnerHTML(innerHTML){  
        if(flag==true){
          username = innerHTML;
          if(innerHTML==myusername){
            document.getElementById('message').innerHTML += '<div style="text-align:right; padding: 3px 5% 0 0; font-size: 15px">' + innerHTML + '</div>';
          }
          else{
            document.getElementById('message').innerHTML += '<div style="padding: 3px 0 0 5%; font-size: 15px">' + innerHTML + '</div>';         
          }
          flag = false;
        }
        else{
          if(username==myusername){
            document.getElementById('message').innerHTML += '<div style="text-align:right; margin: 0 5%  0 0; height: auto;"><span style="border-radius: 10px; padding: 5px 10px; background: linear-gradient(white,#B3EE3A); font-size: 20px; line-height: 36px;">' + innerHTML + '</span></div>';
          }
          else{
            document.getElementById('message').innerHTML += '<div class="dialog" style=" margin: 0 5%; padding: 5px 10px; border-radius: 10px; display: inline-block; background: linear-gradient(white,#EEEED1); font-size: 20px; ">' + innerHTML + '</div>';           
          }
          flag = true;
        }
        document.getElementById("message_end").scrollIntoView();  
      }
      //<i class="iconfont" style="color: green; font-size: 15px; padding:10px 0 10px 20px;">&#xe80a;</i>

      //关闭连接  
      function closeWebSocket(){  
          websocket.close();  
      }  

      //发送消息  
      function send(){  
          var message = document.getElementById('text').value; 
          document.getElementById('text').value = "";
          websocket.send(myusername);  
          websocket.send(message);  
      }  

      document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];          
            if(e && e.keyCode==13 && document.getElementById('text').value != ""){ // enter 键
              document.getElementById("send").click();
            }
        }; 
  </script>  
</html>  