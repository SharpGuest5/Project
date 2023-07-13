using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class tiezi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
        string title = TextBox1.Text;
        string text = TextBox3.Text;
        if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(text))
        {
            Response.Write("请填写必填项！");
        }
        else
        {
            upload(sender, e);
        }

    }

    protected void upload(object sender, EventArgs e)
    {
        string father = Session["tieziid"].ToString();
        string time = DateTime.Now.ToLocalTime().ToString();
        string provider = Session["Username"].ToString();
        string conStr = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=bbs;Data Source=Rain";
        OleDbConnection con = new OleDbConnection(conStr);
        con.Open();
        string upload = string.Format("INSERT INTO threadinfo (title, text, provider, uploadtime, type, father) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')", TextBox1.Text, TextBox3.Text, provider, time, "0", father);
        OleDbCommand cmd = new OleDbCommand(upload, con);
        cmd.ExecuteNonQuery();
        Response.Write("发帖成功！");
    }
}