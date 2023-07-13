using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
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
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                SqlDataSource1.SelectCommand += " AND provider = '" + username + "' ";
            }
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

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        // 将GridView设置为编辑模式
        GridView1.EditIndex = e.NewEditIndex;
        // 重新绑定GridView数据
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        // 取消编辑模式
        GridView1.EditIndex = -1;
        // 重新绑定GridView数据
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // 更新数据操作
        // 例如，你可以从GridView中获取编辑后的值，并将其更新到数据库或数据源中
        GridViewRow row = GridView1.Rows[e.RowIndex];
        string updatedValue = ((TextBox)row.FindControl("TextBox1")).Text;
        // 执行更新逻辑，例如更新数据库中的数据

        // 取消编辑模式
        GridView1.EditIndex = -1;
        // 重新绑定GridView数据
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // 删除数据操作
        // 例如，你可以从GridView中获取要删除的行，并将其从数据库或数据源中删除
        GridViewRow row = GridView1.Rows[e.RowIndex];
        string deletedValue = row.Cells[0].Text;
        // 执行删除逻辑，例如从数据库中删除数据
        string connectionString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=bbs;Data Source=Rain";
        using (OleDbConnection connection = new OleDbConnection(connectionString))
        {
            // 打开连接
            connection.Open();

            // 构造 SQL 删除语句
            string sql = "DELETE FROM threadinfo WHERE title = ?"; // 假设 ID 是要删除的数据的关键字段
            using (OleDbCommand command = new OleDbCommand(sql, connection))
            {
                command.Parameters.AddWithValue("?", deletedValue); // 将关键值绑定到参数

                // 执行删除操作
                command.ExecuteNonQuery();
            }

            // 关闭连接
            connection.Close();
        }

        // 重新绑定GridView数据
        GridView1.DataBind();
        Response.Redirect("~/grzy.aspx");
    }

}