using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_lg_click(object sender, EventArgs e)
    {
        string username = txtBox1.Text;
        string password = txtBox2.Text;
        if(string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
        { 
            Response.Write("未填写用户名或密码！");
            return;
        }
        string conStr = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Shopping_System;Data Source=MOBA-6-PLUS";
        OleDbConnection con = new OleDbConnection(conStr);
        con.Open();
        string log = "SELECT COUNT(*) FROM [user] WHERE username = ? AND password = ?";
        OleDbCommand cmd = new OleDbCommand(log,con);
        cmd.Parameters.AddWithValue("?", username);
        cmd.Parameters.AddWithValue("?", password);
        int count = (int)cmd.ExecuteScalar();
        if(count > 0)
        { 
            Response.Write("登录成功！"); 
        }
        else
        { 
            Response.Write("账号或密码错误");
        }
        con.Close();
    }
    
    protected void btn_reg_click(object sender, EventArgs e)
    {
        string username = txtBox1.Text;
        string password = txtBox2.Text;
        if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
        {
            Response.Write("未填写用户名或密码！");
            return;
        }
        string conStr = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Shopping_System;Data Source=MOBA-6-PLUS";
        OleDbConnection con = new OleDbConnection(conStr);
        con.Open();
        string exist = "SELECT COUNT(*) FROM [user] WHERE username = ?";
        OleDbCommand cmd = new OleDbCommand(exist, con);
        cmd.Parameters.AddWithValue("?", username);
        int count = (int)cmd.ExecuteScalar();
        if (count > 0)
        { Response.Write("用户已存在，注册失败"); }
        else
        {
            string sql = "insert into [user](username,password) values ('" + txtBox1.Text + "','" + txtBox2.Text + "')";
            OleDbCommand reg = new OleDbCommand(sql, con);
            reg.ExecuteNonQuery();
            Response.Write("注册成功！");
        }
        con.Close();
    }
}