<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tiezi.aspx.cs" Inherits="Tiezi" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css"/>
    <title>帖子</title>
    <style>
        .*{
            margin:0;
            padding:0;
            text-decoration:none;
            list-style:none;
            
        }
    ul {
        line-height: 1.5; /* 设置行间距 */
        text-align: right; /* 设置右对齐 */
        margin: 0 auto; /* 设置居中对齐 */
        width: 300px; /* 设置容器宽度，根据需要进行调整 */
    }

    li {
       
    }
         .header {
        width: 98%;
        height: 50px;
        background-color: rgb(170, 241, 234);
        padding-top: 5px;
        text-align: right;
        line-height: 36px;
    }
         .form1{
             background:url(./image/Z30_1150.jpg);
             background-size:cover;
         }
         body {
             background:url(/image/Z30_1150.jpg) no-repeat;
             background-size:cover;
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
        <div style="width:1500px;text-align:center;">
            <div style="height:150px; width: 867px;">
                <img src="image/5acdb6ee61ce0718710573cad8b9d5c.png" style="width:1480px; margin-left: 0px;  display: block; /* 将图片设置为块级元素 */
  margin: 0 auto 0 0px; height: 148px;text-align:center;" />
</div>
            <div class="right_table" style="width:300px; height:900px; float:left;background-color:rgb(167, 234, 234)">
               
                
          <div class="fatie" ><a href="NEPUBBS.aspx"><el-button round>返回首页</el-button></a></div>

      
                 
                 <div class="about" style="width:stretch"><template>
    <div class="container">
        <el-header>
            <i class="el-icon-s-unfold" @click="visible = true"></i>
            <h2 style="display: inline-block;margin-left: 20px" id="h2Username" runat="server">未登录</h2>
        </el-header>
        <el-main>
            <el-drawer
                    title="我是标题"
                    :visible.sync="visible"
                    :with-header=false
                    style="position: absolute"
                    direction="ltr"
                  
            > <div>
                    <div style="width:100%; height:40px"> <span>主页</span>
                       </div>
                     <div style="width:100%; height:60px"> 
                        <span>欢迎使用NEPUBBS</span></div>
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
          <div style="width:auto; height:260px;">
              
             <a href="grzy.aspx"><el-button round>帖子管理</el-button></a></div> 
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
<style>
    .el-header {
        color: #333;
        padding: 0 !important;
        height: 50px!important;
        background: antiquewhite;
    }
 
    .el-main {
        height: 100%;
        padding: 0!important;
        overflow: hidden;
        position: relative;
    }
</style></div>
            </div>
            </div>

            <div style="width:90%;height:900px;background-color:white">
                <div id="postlist">
        <div class="header">
            <div class="not-login">
                <asp:Button ID="btnLog" runat="server" CssClass="el-button" OnClick="Unnamed_ServerClick" />  
                
            </div>
            </div> 
                    <div style="width:1000px; height:900px; float:left;background-color:white">
                        <div style="width:100px; border:1px solid #000000; border-radius:4px;"><td style="text-align: center;" id="title" runat="server"></td></div>
                           <div style="width:100px; border:1px solid #000000; border-radius:4px;"><td style="text-align: center;" id="text" runat="server"></td></div>
                        <div></div>
                             <div><asp:TextBox style="width:800px; height:300px;" ID="TextBox3" runat="server" TextMode="MultiLine" ></asp:TextBox></div>
                    <div>
                        <asp:Button ID="Button1" runat="server" Text="评论" /></div>

            </div>
            </div>
     </div>
                   
       
        <div style="height:120px;"></div>

        </center>
       
    </form>
       
</body>
    <!-- import Vue before Element -->
<script src="https://unpkg.com/vue@2/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    new Vue({
        el: '#form1',
        data: function () {
            return { visible: false }
        }
    })
</script>
</html>
