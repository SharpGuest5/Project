using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public void Btn_lg_click(object sender, EventArgs e)
    {
        string username = txtBox1.Text;
        string password = txtBox2.Text;
        if(string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
        {
            var errorMessage = (HtmlGenericControl)FindControl("errorMessage");
            errorMessage.InnerHtml = "未填写用户名或密码<br />请检查";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showFailurePopup", "document.getElementById('failurePopup').style.display = 'block'; document.getElementById('mask').style.display = 'block';", true);
            return;
        }
        string conStr = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=bbs;Data Source=Rain";
        OleDbConnection con = new OleDbConnection(conStr);
        con.Open();
        string log = "SELECT COUNT(*) FROM userinfo WHERE username = ? AND password = ?";
        OleDbCommand cmd = new OleDbCommand(log,con);
        cmd.Parameters.AddWithValue("?", username);
        cmd.Parameters.AddWithValue("?", password);
        int count = (int)cmd.ExecuteScalar();
        if(count > 0)
        {
            string pass = "SELECT sex, age, email FROM userinfo WHERE username = ?";
            OleDbCommand find = new OleDbCommand(pass,con);
            find.Parameters.AddWithValue("?", username);
            OleDbDataReader reader = find.ExecuteReader();
            if(reader.Read())
            {
                string sexSession = reader["sex"].ToString();
                string ageSession = reader["age"].ToString();
                string emailSession = reader["email"].ToString();
                Session["sexSession"] = sexSession;
                Session["ageSession"] = ageSession;
                Session["emailSession"] = emailSession;
            }
            //string script = "setTimeout(function() { window.location.href = 'NEPUBBS.aspx'; }, 5000);";
            //var errorMessage = (HtmlGenericControl)FindControl("errorMessage");
            //errorMessage.InnerHtml = "登录成功！<br />5秒后自动跳转";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "showFailurePopup", "document.getElementById('failurePopup').style.display = 'block'; document.getElementById('mask').style.display = 'block';", true);
            Session["Username"] = username;
            //ClientScript.RegisterStartupScript(this.GetType(), "redirectScript", script, true);
            Response.Redirect("~/NEPUBBS.aspx");
        }
        else
        {
            var errorMessage = (HtmlGenericControl)FindControl("errorMessage");
            errorMessage.InnerHtml = "登录失败<br />请检查您的账号和密码";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showFailurePopup", "document.getElementById('failurePopup').style.display = 'block'; document.getElementById('mask').style.display = 'block';", true);
        }
        con.Close();
    }
    
}