<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="icon" href="image/icon.ico" />
</head>
<body>
    <form runat="server" id="main">
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
            <div class="btn-box"> 
                    <button id="lg_btn" type="button" class="button" runat="server" onserverclick="btn_lg_click">登录</button>
                    <button id="reg_btn" type="button" class="button" runat="server" onserverclick="btn_reg_click">注册</button>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
