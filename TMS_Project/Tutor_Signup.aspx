<%@ Page Language="C#" AutoEventWireup="true" 
   CodeBehind="Tutor_Signup.aspx.cs"
    Inherits="TMS_Project.Tutor_Signup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Tutor Signup</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f5f7fa;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<form id="form1" runat="server">

<div class="container-fluid mt-4">

    <!-- MAIN BOX -->
    <div style="max-width:1100px; width:100%; margin:auto; padding:25px 20px; background:#fff; border-radius:12px; box-shadow:0px 5px 20px rgba(0,0,0,0.2);">

        <!-- Heading -->
        <div class="row">
            <div class="col-md-12">
                <h1 class="bg-primary text-white text-center p-3 rounded">Tutor SignUp</h1>
            </div>
        </div>

        <!-- FORM -->
        <div class="row mt-3 g-3">

            <!-- Column 1 -->
            <div class="col-md-4">
                <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control mb-2 py-2" placeholder="Enter Name" />
                <asp:RequiredFieldValidator ControlToValidate="NameTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Name is Required" />

                <asp:TextBox ID="SurNameTextBox" runat="server" CssClass="form-control mb-2 py-2" placeholder="Enter SurName" />
                <asp:RequiredFieldValidator ControlToValidate="SurNameTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="SurName is Required" />

                <asp:DropDownList ID="GenderDropDownList" runat="server" CssClass="form-control mb-2 py-2">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select Gender" ControlToValidate="GenderDropDownList" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Gender is Required" />

                <asp:TextBox ID="AgeTextBox" runat="server" CssClass="form-control mb-2 py-2" TextMode="Number" placeholder="Enter Age" />
                <asp:RequiredFieldValidator ControlToValidate="AgeTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Age is Required" />

                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control mb-2 py-2" placeholder="Enter Email" />
                <asp:RequiredFieldValidator ControlToValidate="EmailTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Email is Required" />
                <asp:RegularExpressionValidator  ControlToValidate="EmailTextBox" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid"></asp:RegularExpressionValidator>
               <asp:DropDownList ID="StatusDropDownList" runat="server" CssClass="form-control mb-2 py-2">
    <asp:ListItem Text="--Select Status--" Value="0" />
    <asp:ListItem Text="Single" Value="Single" />
    <asp:ListItem Text="Married" Value="Married" />
</asp:DropDownList>

<asp:RequiredFieldValidator 
    InitialValue="0"
    ControlToValidate="StatusDropDownList"
    ForeColor="Red"
    Display="Dynamic"
    runat="server"
    ErrorMessage="Status is Required" />
            </div>

            <!-- Column 2 -->
            <div class="col-md-4">
                <asp:DropDownList 
                    ID="CountryDropDownList"
                    runat="server"
                    CssClass="form-control mb-2 py-2"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="0" ControlToValidate="CountryDropDownList" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Country is Required" />

                <asp:DropDownList ID="CityDropDownList" runat="server" CssClass="form-control mb-2 py-2"></asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="CityDropDownList" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="City is Required" />

                <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control mb-2 py-2" TextMode="MultiLine" Rows="3" placeholder="Enter Address" />
                <asp:RequiredFieldValidator ControlToValidate="AddressTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Address is Required" />

                <asp:DropDownList ID="QualificationDropDownList" runat="server" CssClass="form-control mb-2 py-2">
                    <asp:ListItem>Select Qualification</asp:ListItem>
                    <asp:ListItem>Graduation</asp:ListItem>
                    <asp:ListItem>Masters</asp:ListItem>
                    <asp:ListItem>PHD</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select Qualification" ControlToValidate="QualificationDropDownList" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Qualification is Required" />

                <asp:TextBox ID="DegreeTextBox" runat="server" CssClass="form-control mb-2 py-2" placeholder="Enter Degree" />
                <asp:RequiredFieldValidator ControlToValidate="DegreeTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Degree is Required" />
            </div>

            <!-- Column 3 -->
            <div class="col-md-4">
               <asp:DropDownList ID="ExperienceDropDownList" runat="server" CssClass="form-control mb-2 py-2">
    <asp:ListItem Text="--Select Experience--" Value="0" />
    <asp:ListItem Text="1 Year" Value="1" />
    <asp:ListItem Text="2 Years" Value="2" />
    <asp:ListItem Text="3 Years" Value="3" />
    <asp:ListItem Text="5+ Years" Value="5+" />
    <asp:ListItem Text="10+ Years" Value="10+" />
</asp:DropDownList>

<asp:RequiredFieldValidator 
    InitialValue="0"
    ControlToValidate="ExperienceDropDownList"
    ForeColor="Red"
    Display="Dynamic"
    runat="server"
    ErrorMessage="Experience is Required" />

                <asp:TextBox ID="ContactTextBox" runat="server" CssClass="form-control mb-2 py-2" placeholder="Enter Contact" />
                <asp:RequiredFieldValidator ControlToValidate="ContactTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Contact is Required" />

                <asp:TextBox ID="UserNameTextBox" runat="server" CssClass="form-control mb-2 py-2" placeholder="Enter Username" />
                <asp:RequiredFieldValidator ControlToValidate="UserNameTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Username is Required" />

                               <asp:TextBox ID="PasswordTextBox" CssClass="form-control mb-3" TextMode="Password" placeholder="Enter Password" runat="server" />
                 <asp:RequiredFieldValidator  ControlToValidate="PasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator16" runat="server" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator 
    ID="RegularExpressionValidator2"
    ControlToValidate="PasswordTextBox"
    Display="Dynamic"
    ForeColor="Red"
    SetFocusOnError="true"
    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
    runat="server"
    ErrorMessage="Password must be 8+ chars with uppercase, lowercase, number & special char">
</asp:RegularExpressionValidator>

                <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-control mb-2 py-2" TextMode="Password" placeholder="Confirm Password" />
                <asp:RequiredFieldValidator ControlToValidate="ConfirmPasswordTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Confirm Password is Required" />

                <asp:CompareValidator ControlToValidate="ConfirmPasswordTextBox" ControlToCompare="PasswordTextBox" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Passwords must be identical" />
            </div>

        </div>

        <!-- BUTTON -->
        <div class="row mt-4">
            <div class="col-md-5 mx-auto">
                <asp:Button 
                    ID="TutorSignUpButton"
                    runat="server"
                    Text="SignUp"
                    CssClass="btn btn-primary w-100 py-2"
                    OnClick="TutorSignUpButton_Click" />
        </div>

    </div>

</div>

</form>
</body>
</html>