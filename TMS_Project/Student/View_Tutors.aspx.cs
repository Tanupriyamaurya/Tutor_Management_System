using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace TMS_Project.Student
{
    public partial class View_Tutors : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        void BindRepeater()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT 
                                    t.Name,
                                    t.Surname,
                                    t.Email,
                                    t.Gender,
                                    t.Age,
                                    c.country_name AS CountryName,
                                    ci.city_name AS CityName,
                                    t.Address,
                                    t.Qualification,
                                    t.Degree,
                                    t.Experience,
                                    t.Contact_No
                                 FROM Tutor_Signup t
                                 INNER JOIN Country c ON t.Country = c.country_id
                                 INNER JOIN City ci ON t.City = ci.city_id";

                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student_username"] == null)
            {
                Response.Redirect("~/Student_Login.aspx");
            }

            if (!IsPostBack)
            {
                BindRepeater();
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
                                    t.Email,
                                    t.Gender,
                                    t.Age,
                                    c.country_name AS CountryName,
                                    ci.city_name AS CityName,
                                    t.Address,
                                    t.Qualification,
                                    t.Degree,
                                    t.Experience,
                                    t.Contact_No
                                 FROM Tutor_Signup t
                                 INNER JOIN Country c ON t.Country = c.country_id
                                 INNER JOIN City ci ON t.City = ci.city_id
                                 WHERE 
                                    t.Name LIKE @search OR
                                    t.Surname LIKE @search OR
                                    t.Email LIKE @search OR
                                    c.country_name LIKE @search OR
                                    ci.city_name LIKE @search OR
                                    t.Qualification LIKE @search";

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