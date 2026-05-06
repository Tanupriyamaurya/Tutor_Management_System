using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace TMS_Project
{
    public static class LocationHelper
    {
        private static string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        // Load Countries
        public static void LoadCountries(DropDownList ddl)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM country", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddl.DataSource = dt;
                ddl.DataTextField = "country_name";
                ddl.DataValueField = "country_id";
                ddl.DataBind();

                ddl.Items.Insert(0, new ListItem("--Select Country--", "0"));
            }
        }

        // Load Cities
        public static void LoadCities(DropDownList ddlCity, int countryId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM city WHERE c_id=@cid", con);
                cmd.Parameters.AddWithValue("@cid", countryId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlCity.DataSource = dt;
                ddlCity.DataTextField = "city_name";
                ddlCity.DataValueField = "city_id";
                ddlCity.DataBind();

                ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
        }
    }
}