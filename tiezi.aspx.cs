using System;
using System.Activities.Statements;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Tiezi : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tieziid"] != null)
        {
            string tieziid = Session["tieziid"].ToString();
            SqlDataSource1.SelectCommand += " WHERE father = '" + tieziid + "' ";
        }
        HtmlTableCell titleControl = FindControl("title") as HtmlTableCell;
            HtmlTableCell textControl = FindControl("text") as HtmlTableCell;
            string title = Session["titleSession"].ToString();
            string text = Session["textSession"].ToString();
            titleControl.InnerText = title;
            textControl.InnerText = text;
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string time = DateTime.Now.ToLocalTime().ToString();
        string provider = Session["Username"].ToString();
        string tieziid = Session["tieziid"].ToString();
        string conStr = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=bbs;Data Source=Rain";
        OleDbConnection con = new OleDbConnection(conStr);
        con.Open();
        string upload = string.Format("INSERT INTO threadinfo (title, text, provider, uploadtime, type, father) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')", "0", TextBox3.Text, provider, time, "1", tieziid);
        OleDbCommand cmd = new OleDbCommand(upload, con);
        cmd.ExecuteNonQuery();
        con.Close();
        var errorMessage = (HtmlGenericControl)FindControl("errorMessage");
        errorMessage.InnerHtml = "评论成功！";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showFailurePopup", "document.getElementById('failurePopup').style.display = 'block'; document.getElementById('mask').style.display = 'block';", true);
    }
}
