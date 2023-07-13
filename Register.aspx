<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css" />
    <link rel="icon" href="image/icon.ico" />
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
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
    height: 1200px;
    border-top: 2px solid rgba(255,255,255,0.5);
    border-bottom: 2px solid rgba(255,255,255,0.5);
    border-left: 2px solid rgba(255,255,255,0.2);
    border-right: 2px solid rgba(255,255,255,0.2);
    backdrop-filter:blur(20px);
    background:rgba(50,50,50,0.2);
}

.box .input-box {
    display: flex;
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
    width:500px;
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
    width: 720px;
    height: 70px;
    border: 2px solid rgba(197,81,58,0.8);
    background: rgba(197,81,58,0.5);
    color: rgba(255,255,255,0.9);
    border-radius: 10px;
}

.box .btn-box > div > button {
    width: 500px;
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

.check-box-container {
    display: flex;
  align-items: center;
  font-size: 16px;
  margin-bottom: 10px;
}

.box .check-box-container .check-box input[type=checkbox] {
        display:none;
}

.check-box-container label {
    margin-right:10px;
}

.check-box-container input[type="checkbox"] + label {
  position: relative;
  padding-left: 25px;
  cursor: pointer;
}

.check-box-container input[type="checkbox"] + label:before {
  content: "";
  position: absolute;
  left: 0;
  top: 2px;
  width: 18px;
  height: 18px;
  border: 1px solid #ccc;
  background-color: #fff;
}

.check-box-container input[type="checkbox"]:checked + label:before {
  background-color: rgba(255,255,255,0.3);
  border-color: #000000;
}
    </style>
</head>
<body>
    <form runat="server" id="main">
    <div class="box">
        <h1 style="font-size:50px">注册</h1>
          <div class="input-box">
            <asp:Label runat="server" CssClass="input-box" Font-Size="X-Large">用户名*</asp:Label>
            <asp:TextBox runat="server" ID="txtBox1"></asp:TextBox>
          </div>
          <div class="input-box">
            <asp:Label runat="server" CssClass="input-box" Font-Size="X-Large">密码*</asp:Label>
            <asp:TextBox runat="server" TextMode="Password" ID="txtBox2"></asp:TextBox>
          </div>
        <div class="check-box-container">
            <div class="check-box">
            <h2>&nbsp;&nbsp;性别*</h2>
            <input type="checkbox" runat="server" id="sexCheckbox1" name="sexCheckbox1"/>
                <label for="sexCheckbox1">男</label>
            <input type="checkbox" runat="server" id="sexCheckbox2" name="sexCheckbox2"/>
                <label for="sexCheckbox2">女</label>
            </div>
          </div>
        <div class="input-box">
            <asp:Label runat="server" CssClass="input-box" Font-Size="X-Large">年龄*</asp:Label>
            <asp:TextBox runat="server" ID="txtBox4"></asp:TextBox>
          </div>
        <div class="input-box">
            <asp:Label runat="server" CssClass="input-box" Font-Size="X-Large">邮箱</asp:Label>
            <asp:TextBox runat="server" ID="txtBox5"></asp:TextBox>
          </div>
        <div class="btn-box">
            <div class="btn-box"> 
                    <button id="reg_btn" type="button" class="button" runat="server" onserverclick="Btn_reg_click">注册</button>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
