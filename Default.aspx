<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tiezi.aspx.cs" Inherits="tiezi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
        <center>
        <div style="width:1500px;text-align:center;">
            <div style="height:150px; width: 867px;">
                <img src="image/5acdb6ee61ce0718710573cad8b9d5c.png" style="width:1360px; margin-left: 0px;  display: block; /* 将图片设置为块级元素 */
  margin: 0 auto 0 0px; height: 148px;text-align:center;" />
</div>
            <div class="right_table" style="width:300px; height:900px; float:left;background-color:rgb(167, 234, 234)">
               
                <div> <i class="el-icon-s-custom"><h1>NEPUBBS管理页面</h1></i> </div>
                 
                
            </div>
            <div style="width:90%;height:900px;background-color:white">
                <div id="postlist">
        
<template>
  <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
    <el-tab-pane label="帖子列表" name="first">用户管理</el-tab-pane>
    <el-tab-pane label="评论列表" name="second">配置管理</el-tab-pane>
    <el-tab-pane label="用户列表" name="second">配置管理</el-tab-pane>
 
  </el-tabs>
</template>
<script>
    export default {
        data() {
            return {
                activeName: 'first'
            };
        },
        methods: {
            handleClick(tab, event) {
                console.log(tab, event);
            }
        }
    };
</script>

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
    <style>
        .*{
            margin:0;
            padding:0;
            text-decoration:none;
            list-style:none;
            
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
</html>
>
