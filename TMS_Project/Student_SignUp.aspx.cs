using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace TMS_Project
{
    public partial class Student_SignUp : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountryDDL();
                CityDropDownList.Items.Clear();
                CityDropDownList.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
        }

        void ResetControls()
            {
                NameTextBox.Text = "";
                FatherNameTextBox.Text = "";
                SurNameTextBox.Text = "";
                GenderDropDownList.ClearSelection();
                AgeTextBox.Text = "";
                CountryDropDownList.Text = "";
                CityDropDownList.Text = "";
                AddressTextBox.Text = "";
                StandardTextBox.Text = "";
                GoingToDropDownList.ClearSelection();
                SubjectTextBox.Text = "";
                ContactTextBox.Text = "";
                TutionTypeDropDownList.ClearSelection();
                UserNameTextBox.Text = "";
                PasswordTextBox.Text = "";
                ConfirmPasswordTextBox.Text = "";

            }
        
           
        protected void StudentSignUpButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = null;
            try
            {

                con = new SqlConnection(cs);
                string query = @"INSERT INTO dbo.Student_Signup
(Name, FatherName, SurName, Gender, Age, Country, City, Address, Standard, Going_To, Subject, Contact_No, Tution_Type, Tutor_Preferred, UserName, Password)
VALUES
(@Name, @FatherName, @SurName, @Gender, @Age, @Country, @City, @Address, @Standard, @Going_To, @Subject, @Contact_No, @Tution_Type, @Tutor_Preferred, @UserName, @Password)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
                cmd.Parameters.AddWithValue("@FatherName", FatherNameTextBox.Text);
                cmd.Parameters.AddWithValue("@SurName", SurNameTextBox.Text);
                cmd.Parameters.AddWithValue("@Gender", GenderDropDownList.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(AgeTextBox.Text));
                cmd.Parameters.AddWithValue("@Country", CountryDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@City", CityDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Address", AddressTextBox.Text);
                cmd.Parameters.AddWithValue("@Standard", StandardTextBox.Text);
                cmd.Parameters.AddWithValue("@Going_To", GoingToDropDownList.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Subject", SubjectTextBox.Text);
                cmd.Parameters.AddWithValue("@Contact_No", ContactTextBox.Text);
                cmd.Parameters.AddWithValue("@Tution_Type", TutionTypeDropDownList.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Tutor_Preferred", TutorPreferredDropDownList.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@UserName", UserNameTextBox.Text);
                cmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text);

                con.Open();
                int a = cmd.ExecuteNonQuery();

                if (a > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "popup",
                        "Swal.fire('Success','You have registered successfully','success');", true);

                    ResetControls();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "popup",
                        "Swal.fire('Error','Registration Failed... Try another username','error');", true);
                }
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("UNIQUE KEY constraint"))
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "popup",
                        "Swal.fire('Error','Registration Failed..." + UserNameTextBox.Text + "ALready Exists','error');", true);
                }
                else
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "popup",
                        "Swal.fire('Error','Registration Failed...','error');", true);
                }
            }
            finally
            {
                con.Close();
            }
            
        }
        void BindCountryDDL()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {

                string query = "select * from country";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                CountryDropDownList.DataSource = data;
                CountryDropDownList.DataTextField = "country_name";
                CountryDropDownList.DataValueField = "country_id";

                CountryDropDownList.DataBind();
                CountryDropDownList.Items.Insert(0, new ListItem("--Select Country--", "0"));

            }
        }
        protected void CountryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM city WHERE c_id = @cid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@cid", CountryDropDownList.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                CityDropDownList.DataSource = dr;
                CityDropDownList.DataTextField = "city_name";
                CityDropDownList.DataValueField = "city_id";
                CityDropDownList.DataBind();

                // Default option
                CityDropDownList.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
        }
    }
}