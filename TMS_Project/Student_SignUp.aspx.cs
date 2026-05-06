using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using TMS_Project;
using TMS_Project;


namespace TMS_Project
{
    public partial class Student_SignUp : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LocationHelper.LoadCountries(CountryDropDownList);

                CityDropDownList.Items.Clear();
                CityDropDownList.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
        }

        // 🔹 Reset form
        void ResetControls()
        {
            NameTextBox.Text = "";
            FatherNameTextBox.Text = "";
            SurNameTextBox.Text = "";

            GenderDropDownList.SelectedIndex = 0;
            AgeTextBox.Text = "";

            CountryDropDownList.SelectedIndex = 0;

            CityDropDownList.Items.Clear();
            CityDropDownList.Items.Insert(0, new ListItem("--Select City--", "0"));

            AddressTextBox.Text = "";
            StandardTextBox.Text = "";
            GoingToDropDownList.SelectedIndex = 0;
            SubjectTextBox.Text = "";
            ContactTextBox.Text = "";
            TutionTypeDropDownList.SelectedIndex = 0;
            TutorPreferredDropDownList.SelectedIndex = 0;

            UserNameTextBox.Text = "";
            PasswordTextBox.Text = "";
            ConfirmPasswordTextBox.Text = "";
        }

        // 🔹 Signup Button
        protected void StudentSignUpButton_Click(object sender, EventArgs e)
        {
            int age;

            // 🔥 Prevent crash if invalid age
            if (!int.TryParse(AgeTextBox.Text, out age))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "popup",
                    "Swal.fire('Error','Invalid Age','error');", true);
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    string query = @"INSERT INTO dbo.Student_Signup
                    (Name, FatherName, SurName, Gender, Age, Country, City, Address, Standard, Going_To, Subject, Contact_No, Tution_Type, Tutor_Preferred, UserName, Password)
                    VALUES
                    (@Name, @FatherName, @SurName, @Gender, @Age, @Country, @City, @Address, @Standard, @Going_To, @Subject, @Contact_No, @Tution_Type, @Tutor_Preferred, @UserName, @Password)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
                    cmd.Parameters.AddWithValue("@FatherName", FatherNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@SurName", SurNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@Gender", GenderDropDownList.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Age", age);

                    // ✅ Store IDs
                    cmd.Parameters.AddWithValue("@Country", CountryDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@City", CityDropDownList.SelectedValue);

                    cmd.Parameters.AddWithValue("@Address", AddressTextBox.Text);
                    cmd.Parameters.AddWithValue("@Standard", StandardTextBox.Text);
                    cmd.Parameters.AddWithValue("@Going_To", GoingToDropDownList.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Subject", SubjectTextBox.Text);
                    cmd.Parameters.AddWithValue("@Contact_No", ContactTextBox.Text);
                    cmd.Parameters.AddWithValue("@Tution_Type", TutionTypeDropDownList.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Tutor_Preferred", TutorPreferredDropDownList.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@UserName", UserNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "popup",
                            "Swal.fire('Success','You have registered successfully','success');", true);

                        ResetControls();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "popup",
                            "Swal.fire('Error','Registration Failed','error');", true);
                    }
                }
                catch (SqlException ex)
                {
                    if (ex.Message.Contains("UNIQUE"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "popup",
                            "Swal.fire('Error','Username already exists','error');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "popup",
                            "Swal.fire('Error','Something went wrong','error');", true);
                    }
                }
            }
        }

        // 🔹 Country change event
        protected void CountryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int countryId;

            if (int.TryParse(CountryDropDownList.SelectedValue, out countryId) && countryId > 0)
            {
                LocationHelper.LoadCities(CityDropDownList, countryId);
            }
            else
            {
                CityDropDownList.Items.Clear();
                CityDropDownList.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
        }
    }
}