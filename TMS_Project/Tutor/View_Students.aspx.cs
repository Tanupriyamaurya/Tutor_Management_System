using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace TMS_Project.Tutor
{
    public partial class View_Students : System.Web.UI.Page
    {
        // Connection String
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        // Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tutor_username"] == null)
            {
                Response.Redirect("~/Tutor_Login.aspx");
            }
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }

        // Bind Data to Repeater
        void BindRepeater()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT 
                                    t.Name,
                                    t.Gender,
                                    c.country_name AS CountryName,
                                    ci.city_name AS CityName,
                                    t.Standard,
                                    t.Subject,
                                    t.Contact_no AS Contact_No,
                                    t.Tution_Type AS Tuition_Type
                                 FROM student_Signup t
                                 INNER JOIN Country c ON t.Country = c.country_id
                                 INNER JOIN City ci ON t.City = ci.city_id";

                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }

        protected void SearchBtn_ServerClick(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                string search = SearchText.Text.Trim();
                if (string.IsNullOrEmpty(search))
                {
                    BindRepeater();   // show all tutors
                    return;
                }
                string query = @"SELECT 
                                    t.Name,
                                    t.Surname,
                                  
                                    t.Gender,
                                    t.Age,
                                    c.country_name AS CountryName,
                                    ci.city_name AS CityName,
                                    t.Address,
                                   
                                    t.Contact_No
                                 FROM Student_Signup t
                                 INNER JOIN Country c ON t.Country = c.country_id
                                 INNER JOIN City ci ON t.City = ci.city_id
                                 WHERE 
                                    t.Name LIKE @search OR
                                    t.Gender LIKE @search OR
                                 
                                    c.country_name LIKE @search OR
                                    ci.city_name LIKE @search OR
                                    t.Standard LIKE @search OR 
t.Subject LIKE @search OR
t.Tution_type LIKE @search";

                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                sda.SelectCommand.Parameters.AddWithValue("@search", "%" + search + "%");

                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();

                    //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup",
                    //    "Swal.fire('Success','Records found','success');", true);
                }
                else
                {
                    Repeater1.DataSource = null;
                    Repeater1.DataBind();

                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup",
                        "Swal.fire('Oops','No records found','warning');", true);
                }
            }
        }
    }
}