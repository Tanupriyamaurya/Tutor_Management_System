using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace TMS_Project
{
    public partial class Tutor_Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Tutor_LoginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Tutor_Signup where username=@username and password=@password";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", UserNameTxt.Text);
            cmd.Parameters.AddWithValue("@password", PasswordTxt.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["tutor_username"] = dr["username"].ToString();
                Response.Redirect("Tutor/Tutor_Index.aspx");
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