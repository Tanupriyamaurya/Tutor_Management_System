using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_Project
{
    public partial class Tutor_Signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        // 🔹 Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LocationHelper.LoadCountries(CountryDropDownList);

                CityDropDownList.Items.Clear();
                CityDropDownList.Items.Insert(0, new ListItem("--Select City--", "0"));
            }

            // 🔐 retain password on postback
            PasswordTextBox.Attributes["value"] = PasswordTextBox.Text;
            ConfirmPasswordTextBox.Attributes["value"] = ConfirmPasswordTextBox.Text;
        }

        // 🔹 Reset Controls
        void ResetControls()
        {
            NameTextBox.Text = "";
            SurNameTextBox.Text = "";
            GenderDropDownList.SelectedIndex = 0;
            AgeTextBox.Text = "";
            EmailTextBox.Text = "";
            StatusDropDownList.SelectedIndex = 0;

            CountryDropDownList.SelectedIndex = 0;

            CityDropDownList.Items.Clear();
            CityDropDownList.Items.Insert(0, new ListItem("--Select City--", "0"));

            AddressTextBox.Text = "";
            QualificationDropDownList.SelectedIndex = 0;
            DegreeTextBox.Text = "";
            ExperienceDropDownList.SelectedIndex = 0;

            ContactTextBox.Text = "";
            UserNameTextBox.Text = "";

            // 🔐 clear passwords
            PasswordTextBox.Attributes["value"] = "";
            ConfirmPasswordTextBox.Attributes["value"] = "";
        }

        // 🔹 SIGNUP BUTTON CLICK
        protected void TutorSignUpButton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                ShowAlert("Error", "Please fill all required fields correctly", "error");
                return;
            }

            int age;
            if (!int.TryParse(AgeTextBox.Text.Trim(), out age))
            {
                ShowAlert("Error", "Invalid Age", "error");
                return;
            }

            if (CountryDropDownList.SelectedValue == "0" ||
                CityDropDownList.SelectedValue == "0" ||
                StatusDropDownList.SelectedValue == "0" ||
                ExperienceDropDownList.SelectedValue == "0")
            {
                ShowAlert("Error", "Please select all dropdown values", "error");
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    con.Open();

                    // 🔴 STEP 1: CHECK DUPLICATE USER
                    string checkQuery = @"SELECT COUNT(*) FROM Tutor_Signup 
                                  WHERE Email = @Email OR UserName = @UserName";

                    SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                    checkCmd.Parameters.AddWithValue("@Email", EmailTextBox.Text.Trim());
                    checkCmd.Parameters.AddWithValue("@UserName", UserNameTextBox.Text.Trim());

                    int exists = (int)checkCmd.ExecuteScalar();

                    if (exists > 0)
                    {
                        ShowAlert("Error", "Email or Username already exists", "error");
                        return;
                    }

                    // 🔵 STEP 2: INSERT NEW USER
                    string query = @"INSERT INTO Tutor_Signup
            (Name, SurName, Gender, Age, Email, Status, Country, City, Address, Qualification, Degree, Experience, Contact_No, UserName, Password)
            VALUES
            (@Name, @SurName, @Gender, @Age, @Email, @Status, @Country, @City, @Address, @Qualification, @Degree, @Experience, @Contact_No, @UserName, @Password)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@Name", NameTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@SurName", SurNameTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", GenderDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@Status", StatusDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@Country", CountryDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@City", CityDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", AddressTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", QualificationDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@Degree", DegreeTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", ExperienceDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@Contact_No", ContactTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@UserName", UserNameTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text.Trim());

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        ShowAlert("Success", "Tutor registered successfully", "success");
                        ResetControls();
                    }
                    else
                    {
                        ShowAlert("Error", "Registration Failed", "error");
                    }
                }
                catch (SqlException ex)
                {
                    ShowAlert("Error", ex.Message, "error");
                }
            }
        }
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

        // 🔹 SweetAlert Helper (SAFE VERSION)
        void ShowAlert(string title, string message, string type)
        {
            // escape single quotes to prevent JS error
            message = message.Replace("'", "\\'");

            string script = $@"
            Swal.fire({{
                title: '{title}',
                text: '{message}',
                icon: '{type}'
            }});";

            ClientScript.RegisterStartupScript(this.GetType(), "popup", script, true);
        }
    }
}