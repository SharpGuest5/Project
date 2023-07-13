<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NEPUBBS.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title>NEPUBBS</title>
 <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <style>
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
    margin-bottom:20px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
  <div id="app">
    <div class="parent">
<div class="div1"><img  style="width: 100%;
            height: 100%;
            object-fit: cover;" src="image/trianglify-lowres.png"/> 
    
</div>
        <div class="body"><div class="div2">
        <%--    发帖按钮--%>
    <div class="fati"><a href="fatie.aspx"><el-button type="primary" icon="el-icon-s-promotion">发帖</el-button></a></div>
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
          <div style="width:auto; height:260px;display: flex;
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */">
              
             <a href="grzy.aspx"><el-button round>帖子管理</el-button></div></a> 
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
          
   <div class="not-log" style="float: right;" runat="server"> 
   <asp:Button runat="server" ID="btn" OnClick="Unnamed_ServerClick" CssClass="el-button" />
   </div><%--登录--%>
   <div class="div4"> 
    <div class="tab" runat="server">
    <div><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
     <%--主体--%><ContentTemplate>
        <div id="failurePopup" class="popup">
        <p id="errormessage" runat="server">登录成功！<br /> <span id="countdown">5</span> 秒后自动跳转</p>
       <div style=" display: flex;
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */"> <button id="closeButton" runat="server" onserverclick="closeButton_ServerClick">确认</button></div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Height="667px" Width="1026px" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:TemplateField Visible="False">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
    <ItemTemplate>
        <asp:LinkButton ID="lnkDetails" runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("id") %>' Text="帖子详细" OnClick="lnkDetails_Click" />
    </ItemTemplate>
     </asp:TemplateField>
        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
        <asp:BoundField DataField="provider" HeaderText="provider" SortExpression="provider" />
        <asp:BoundField DataField="uploadtime" HeaderText="uploadtime" SortExpression="uploadtime" /> 
    </Columns>
    <FooterStyle BackColor="White" ForeColor="#333333" />
    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="PageIndexChanging" />
    </Triggers>
</asp:UpdatePanel>
                </div> 
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=Rain;Initial Catalog=bbs;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [title], 
                    CASE [type]
                    WHEN 1 THEN '交友娱乐'
                    WHEN 2 THEN '社团活动'
                    WHEN 3 THEN '二手交易'
                    WHEN 4 THEN '学习交流'
                    END AS [type], 
                    [provider], [uploadtime] ,[id] FROM [threadinfo]"></asp:SqlDataSource>
            </div>
    </div>
    </div>
    </div>
     
    </div>
        
        </form>
        <script>
                < script >
                document.getElementById('closeButton').addEventListener('click', function () {
                    document.getElementById('failurePopup').style.display = 'none';
                });
        </script>   
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
       .div1 img {
            
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
  .b1 .div4 .tab{ display: flex;
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */

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
        .b1 .not-log {
            float: right;
        }
       
        

</style>
</html>
