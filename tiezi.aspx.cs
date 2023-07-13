using System;
using System.Activities.Statements;
using System.Collections;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string conStr = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=bbs;Data Source=Rain";
        OleDbConnection con = new OleDbConnection(conStr);
        con.Open();
        string id = Request.QueryString["id"];
        string query = "SELECT title, text FROM threadinfo WHERE id = ?";
        OleDbCommand cmd = new OleDbCommand(query, con);
        cmd.Parameters.AddWithValue("?", id);
        OleDbDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string title = reader["title"].ToString();
            string text = reader["text"].ToString();
        }
            // 更新标题文本
            var titleControl = FindControl("title") as HtmlGenericControl;
        if (titleControl != null)
        {
            titleControl.InnerText = "新的标题";
        }

        // 更新正文文本
        var textControl = FindControl("text") as HtmlGenericControl;
        if (textControl != null)
        {
            textControl.InnerText = "新的正文";
        }
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
        if (btnLog.Text == "注销")
        {
            Session.Remove("Username");
            Response.Redirect("~/NEPUBBS.aspx");
        }
        if (btnLog.Text == "登录")
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}
