using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataBind();
        HtmlTableCell usernameControl = FindControl("username") as HtmlTableCell;
        HtmlTableCell sexControl = FindControl("sex") as HtmlTableCell;
        HtmlTableCell ageControl = FindControl("age") as HtmlTableCell;
        HtmlTableCell emailControl = FindControl("email") as HtmlTableCell;
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                string sex = Session["sexSession"].ToString();
                string age = Session["ageSession"].ToString();
                string email = Session["emailSession"].ToString();
                if (sex == "1") sexControl.InnerText = "男";
                else sexControl.InnerText = "女";
                ageControl.InnerText = age;
                emailControl.InnerText = email;
                // 用户已登录，设置按钮文本为"注销"
                btnLog.Text = "注销";
                string username = Session["Username"].ToString();
                usernameControl.InnerText = username;
                h2Username.InnerText = username;
            }
            else
            {
                // 用户未登录，设置按钮文本为"登录"
                btnLog.Text = "登录";
            }
        }
    }
   
    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        if (btnLog.Text=="注销")
        {
            Session.Remove("Username");
            Response.Redirect("~/NEPUBBS.aspx");
        }
        if (btnLog.Text=="登录")
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblId = e.Row.FindControl("lblId") as Label;
            if (lblId != null)
            {
                string id = lblId.Text;
                // 在这里处理id值
            }
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow selectedRow = GridView1.SelectedRow;
        if (selectedRow != null)
        {
            Label lblId = selectedRow.FindControl("lblId") as Label;
            if (lblId != null)
            {
                string id = lblId.Text;
                // 在这里处理id值
            }
        }
    }



}