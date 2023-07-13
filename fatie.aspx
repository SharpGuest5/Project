<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fatie.aspx.cs" Inherits="tiezi"%>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title></title>
 <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<body>
    <form runat="server">
  <div id="app">
    <div class="parent">
<div class="div1"><img src="image/trianglify-lowres.png"/> 
    
</div>
        <div class="body"><div class="div2">
        <%--    发帖按钮--%>
    <div class="fati"><a href="NEPUBBS.aspx"><el-button type="primary" icon="el-icon-s-promotion">返回首页</el-button></a></div>
    <div class="about">
        <el-header>
            <i class="el-icon-s-unfold" @click="visible = true"></i>
            <h2 style="display: inline-block;margin-left: 20px" id="h2Username" runat="server">未登录</h2><%--未登录显示--%>
        </el-header>
        <el-main>
            <el-drawer
                    title="我是标题"
                    :visible.sync="visible"
                    :with-header=false
                    style="position: absolute"
                    direction="ltr"
                  
            >  <div class="cht" style=" background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);">
                    <div style="width:100%; height:40px"> <span style="text-align: center;display:block;">主页</span>
                       </div>
                     <div style="width:100%; height:60px"> 
                        <span style="text-align: center;display:block;">欢迎使用NEPUBBS</span></div>
               <div style="width:100%; height:520px;">     <table style="width: 100%;text-align: center; border-collapse: separate;
        border-spacing: 0 16px;">
                         <tr>
                             <td>用户名：</td>
                             <td id="username" runat="server"></td>
                            
                         </tr>
                          <tr>
                             <td>性别;</td>
                             <td id="sex" runat="server"></td>
                         </tr>
                         <tr>
                             <td>年龄;</td>
                             <td id="age" runat="server"></td>
                            
                         </tr>
                         <tr>
                             <td>Emal</td>
                             <td id="email" runat="server"></td>
                            
                         </tr>
                     </table>
             </div>
          <div style="display: flex;
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */" class="auto-style3">
              
             <a href="fatie.aspx"><el-button round>发帖</el-button></div></a> 
                </div>
            </el-drawer>
           
        </el-main>
    </div>
</template>
 
<script>
    // @ is an alias to /src

    export default {
        name: 'main',
        data() {
            return {
                visible: false,
            };
        },
        methods: {
            handleClose(done) {
                done()
            }
        }
    }
</script>
    </div>

</div>
        <div class="b1">
          
   <div class="log" style="float: right; width: 262px; height: 45px;"><div class="not-log" style="float: right;" runat="server"> 
   <asp:Button runat="server" ID="btnLog" OnClick="Unnamed_ServerClick" CssClass="el-button" />
   </div></div><%--登录--%>
<div class="div4"> 
    <div>  <div id="postlist">
        <div class="header">
            
               
                
            </div>
            </div> 
                    
                        <div><p style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 标题</p><asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style2" Width="196px"></asp:TextBox></div>
                           <div><p style="text-align: center;">分区</p><asp:DropDownList ID="DropDownList1" runat="server" Height="42px" Width="208px" CssClass="auto-style4">
                               <asp:ListItem Value="1">交友娱乐</asp:ListItem>
                               <asp:ListItem Value="2">社团活动</asp:ListItem>
                               <asp:ListItem Value="3">二手交易</asp:ListItem>
                               <asp:ListItem Value="4">学习交流</asp:ListItem>
                           </asp:DropDownList></div>
                             <div><p style="text-align: center;">正文</p><asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" CssClass="auto-style5" Height="316px" Width="610px" ></asp:TextBox></div>
                        <asp:Button ID="Button2" runat="server" Text="发帖" OnClick="Button1_Click" CssClass="auto-style1" Height="46px" Width="172px"/>

            
            </div></div>
    
     <%--主体--%>
</div>

        </div>

        </div>
    </div>

    
   </div>
        </form>
</body>
  <!-- import Vue before Element -->
  <script src="https://unpkg.com/vue@2/dist/vue.js"></script>
  <!-- import JavaScript -->
  <script src="https://unpkg.com/element-ui/lib/index.js"></script>
  <script>
      new Vue({
          el: '#app',
          data: function () {
              return { visible: false }
          }
      })
  </script>
    <style>
        .parent {
display: grid;
grid-template-columns: repeat(9, 176px);
grid-template-rows: repeat(11, 82px);
grid-column-gap: 0px;
grid-row-gap: 0px;
}

.div1 { grid-area: 1 / 1 / 3 / 10; }
.div2 { grid-area: 3 / 1 / 12 / 3; }
.div3 { grid-area: 3 / 3 / 4 / 10; }
.div4 { grid-area: 4 / 3 / 12 / 10; }
        img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .div2{
            /* 背景渐变色 - 原理2 */
    background: linear-gradient(-45deg, #ee7752, #9cebed, #48cbe5, #4ef8d9);
    /* 背景尺寸 - 原理3 */
    background-size: 600% 600%;
    /* 循环动画 - 原理4 */
    animation: gradientBG 5s ease infinite;
  }

  /* 动画，控制背景 background-position */
  @keyframes gradientBG {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
           
        }
       .div2 .fati{
            display: flex;
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */
        }
       .div3 .log{
            margin-left: auto;
        }
       .div2{
           width:162px;
           height:765px;
       }
       .b1{
           height:765px;
           width:1408px;
         
  background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
    
  }

       }
        .b1 .log {
            float: right;
        }
       
        .TextBox1{
             display: flex;
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */
        }

        .auto-style1 {
            margin-left: 605px;
        }
        .auto-style2 {
            margin-left: 606px;
        }
        .auto-style3 {
            width: auto;
            height: 260px;
        }
        .auto-style4 {
            margin-left: 602px;
        }
        .auto-style5 {
            margin-left: 393px;
        }

    </style>
