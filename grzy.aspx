<%@ Page Language="C#" AutoEventWireup="true" CodeFile="grzy.aspx.cs" Inherits="_Default" %>




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
          <div style="width:auto; height:260px;display: flex;
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */">
              
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
          
   <div class="log" style="float: right;"><div class="not-log" style="float: right;" runat="server"> 
   <asp:Button runat="server" ID="btnLog" OnClick="Unnamed_ServerClick" CssClass="el-button" />
   </div></div><%--登录--%>
<div class="div4"> 
    <div></div>
    <div><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
          
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                          <ContentTemplate>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=Rain;Initial Catalog=bbs;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [title], [provider], [uploadtime] ,[id] FROM [threadinfo] WHERE [title] !='0'"></asp:SqlDataSource>            
        <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1381px" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="title" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="provider" HeaderText="provider" SortExpression="provider" />
                <asp:BoundField DataField="uploadtime" HeaderText="uploadtime" SortExpression="uploadtime" />
                <asp:CommandField AccessibleHeaderText="编辑" />
                <asp:CommandField HeaderText="编辑" ShowEditButton="True" ShowHeader="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" ShowHeader="True" />
            </Columns>
               <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
               </asp:GridView>
            </ContentTemplate>
            </asp:UpdatePanel>
        
    </div>
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
       
        

</style>
</html>
