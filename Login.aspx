﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <link rel="icon" href="image/icon.ico" />
    <style>
        * {
    margin:0;
    padding:0;
}

body {
    display: flex; 
    flex-direction: column; 
    justify-content: center; 
    align-items: center;
    height: 100vh;                 
    background:url(/image/background.jpg) no-repeat;      
    background-size:cover;          
}

.box {
    border-radius:40px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 700px;
    height: 700px;
    border-top: 2px solid rgba(255,255,255,0.5);
    border-bottom: 2px solid rgba(255,255,255,0.5);
    border-left: 2px solid rgba(255,255,255,0.2);
    border-right: 2px solid rgba(255,255,255,0.2);
    backdrop-filter:blur(20px);
    background:rgba(50,50,50,0.2);
}

.box .input-box {
    display: inline;
    flex-direction: column;
    justify-content: center;
    align-items: start;
    margin-bottom:20px;
    float:left;
 }

    .box .input-box .check-box {
        display: inline-flex;
        flex-direction: column;
        align-items: start;
        margin-bottom: 20px;
        display:inline;
        float:left;
    }

.box .input-box > label {
    margin-bottom:10px;
    color:rgba(255,255,255,0.9);
    font-size:26px;
}

.box > h1 {
    color:rgba(255,255,255,0.9);
    margin-bottom:40px;
}
.box .input-box > input {
    box-sizing:border-box;
    color: rgba(255,255,255,0.9);
    font-size: 28px;
    height:70px;
    width:500px;
    background:rgba(255,255,255,0.3);
    border:2px solid rgba(255,255,255,0.5);
    border-radius:10px;
    transition:0.2s;
    outline:none;
    padding: 0 20px;
    letter-spacing:2px;
}

.box .input-box > input:focus {
    border: 2px solid rgba(255,255,255,0.5);
}

.box .btn-box {
    width: 1000px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: start;
}

.box .btn-box > a {
    font-size:28px;
    text-decoration: none;
    color:rgba(255,255,255,0.9);
    transition:0.2s;
    width:760px;
    text-align:end;
}

.box .btn-box > a:hover{
    text-decoration: none;
    color: rgba(255,255,255,1);
}

.box .btn-box > div {
    display:flex;
    flex-direction:row;
    justify-content:center;
    align-items:start;
    margin-top: 40px;
}

.box .btn-box > div > button {
    width: 470px;
    height: 70px;
    border: 2px solid rgba(197,81,58,0.8);
    background: rgba(197,81,58,0.5);
    color: rgba(255,255,255,0.9);
    border-radius: 10px;
}

.box .btn-box > div > button {
    width: 470px;
    height: 70px;
    border: 2px solid rgba(197,81,58,0.8);
    background: rgba(197,81,58,0.5);
    color: rgba(255,255,255,0.9);
    border-radius: 10px;
    transition:0.2s;
}

.box .btn-box > div > button:nth-of-type(2){
    margin-left:20px;
}

.box .btn-box > div > button:hover {
    border: 2px solid rgba(248,108,76,0.8);
    background: rgba(248,108,76,0.5);
}

.button {
    font-size: 18px;
}

.box .check-box {
    display: inline-flex;
    flex-direction: column;
    justify-content: center;
    align-items: start;
    margin-bottom: 20px;
    float: left;
    width:100%;
}

.popup {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 9999;
    background:rgba(50,50,50,1);
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    display: none;
    color:aliceblue;
    height:140px;
    width:400px;
    font-size:30px;
    text-align:center;
    }

.popup button{
    width: 120px;
    height: 40px;
    border: 2px solid rgba(197,81,58,0.8);
    background: rgba(197,81,58,0.5);
    color: rgba(255,255,255,0.9);
    border-radius: 10px;
    transition:0.2s;
    margin-top:20px;
    float:right;
    font-size:20px;
}
    </style>
</head>
<body>
    <form runat="server" id="main">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <!-- 在这里放置您希望部分更新的内容 -->
        <div id="failurePopup" class="popup">
        <p id="errormessage" runat="server">登录成功！<br /> <span id="countdown">5</span> 秒后自动跳转</p>
        <button id="closeButton">确认</button>
        </div>
        <!-- 其他控件和内容 -->
            <div class="box">
        <h1 style="font-size:50px">Login</h1>
          <div class="input-box">
            <asp:Label runat="server" CssClass="input-box" Font-Size="X-Large">账号</asp:Label>
            <asp:TextBox runat="server" ID="txtBox1"></asp:TextBox>
          </div>
          <div class="input-box">
            <asp:Label runat="server" CssClass="input-box" Font-Size="X-Large">密码</asp:Label>
            <asp:TextBox runat="server" TextMode="Password" ID="txtBox2"></asp:TextBox>
          </div>
        <div class="btn-box">
                            <a href="Register.aspx">没有账号？点我注册</a>
            <div class="btn-box"> 
                    <button id="lg_btn" type="button" class="button" runat="server" onserverclick="Btn_lg_click">登录</button>
            </div>
        </div>
    </div>
    </ContentTemplate>
</asp:UpdatePanel>
    </form>
        <script>
            document.getElementById('closeButton').addEventListener('click', function () {
                document.getElementById('failurePopup').style.display = 'none';
            });
        </script>
</body>
</html>
