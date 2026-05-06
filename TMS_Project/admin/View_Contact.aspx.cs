using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace TMS_Project.admin
{
    public partial class View_Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }

            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Contact";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)   {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            Label ItemID = (Label)row.FindControl("LabelID");
            string Id = ItemID.Text;
            SqlConnection con = new SqlConnection(cs);
            string query = "DELETE FROM Contact WHERE Id=@id"; ;
            SqlCommand cmd = new SqlCommand(query,con);
            cmd.Parameters.AddWithValue("@id", Id);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {

                Response.Write("<script>alert('Data has been successfully Deleted');</script>");
                BindGridView();
            }
            con.Close();
           
           
        }
    }
}