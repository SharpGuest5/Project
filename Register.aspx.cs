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
        Session.Clear();
    }

    public void Btn_reg_click(object sender, EventArgs e)
    {
        string username = txtBox1.Text;
        string password = txtBox2.Text;
        bool issexCheckbox1Checked = sexCheckbox1.Checked;
        bool issexCheckbox2Checked = sexCheckbox2.Checked;
        string age = txtBox4.Text;
        string emain = txtBox5.Text;

        if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password)||string.IsNullOrEmpty(age))
        {
            Response.Write("请填写必填项！");
        }
        else if (!issexCheckbox1Checked && !issexCheckbox2Checked)
        {
            Response.Write("请填写必填项！");
        }
        else
        {
            sql(sender, e);
        }
    }
    public void sql(object sender, EventArgs e)
    {
        string username = txtBox1.Text;
        string password = txtBox2.Text;
        bool issexCheckbox1Checked = sexCheckbox1.Checked;
        bool issexCheckbox2Checked = sexCheckbox2.Checked;
        string sex = "";
        if (issexCheckbox1Checked) sex = "0";
        else if (issexCheckbox2Checked) sex = "1";
        string age = txtBox4.Text;
        string emain = txtBox5.Text;
        string conStr = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=bbs;Data Source=Rain";
        OleDbConnection con = new OleDbConnection(conStr);
        con.Open();
        string exist = "SELECT COUNT(*) FROM userinfo WHERE username = ?";
        OleDbCommand cmd = new OleDbCommand(exist, con);
        cmd.Parameters.AddWithValue("?", username);
        int count = (int)cmd.ExecuteScalar();
        if (count > 0)
        { Response.Write("用户已存在，注册失败"); }
        else
        {
            Session["Username"] = username;
            string sql = string.Format("INSERT INTO userinfo (username, password, sex, age, email,root) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')",
                            txtBox1.Text, txtBox2.Text, sex, txtBox4.Text, txtBox5.Text,"0");
            OleDbCommand reg = new OleDbCommand(sql, con);
            reg.ExecuteNonQuery();
            Response.Redirect("~/NEPUBBS.aspx");
        }
        con.Close();
    }
}