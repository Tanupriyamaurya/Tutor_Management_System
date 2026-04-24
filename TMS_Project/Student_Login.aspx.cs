using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace TMS_Project
{
    public partial class Student_Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Student_LoginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Student_signup where username=@username and password=@password";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", UserNameTxt.Text);
            cmd.Parameters.AddWithValue("@password", PasswordTxt.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["student_username"] = dr["username"].ToString();
                Response.Redirect("Student/Student_Index.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error",
                       "Swal.fire({title: 'Error!', text: 'Username or Password is invalid', icon: 'error'});",
                       true);

            }
            con.Close();
        
    }
    }
}