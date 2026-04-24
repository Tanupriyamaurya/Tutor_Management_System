using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TMS_Project.admin
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(cs);
            string query = "select * from admin_login where username=@username and password=@password";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", UserNameTxt.Text);
            cmd.Parameters.AddWithValue("@password", PasswordTxt.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                Session["admin_username"] = UserNameTxt.Text;
                ClientScript.RegisterStartupScript(this.GetType(), "success",
        "Swal.fire({title: 'Success!', text: 'Login Successful', icon: 'success'}).then(function(){ window.location='Admin_index.aspx'; });",
        true);
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