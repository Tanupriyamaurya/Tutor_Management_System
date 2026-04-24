<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Signup.aspx.cs" Inherits="TMS_Project.Tutor_Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container mt-5 pt-4 ">

    <!-- INNER BOX -->
    <div style="max-width:1300px; width:100%; margin:auto; padding:30px; background:#fff; border-radius:12px; box-shadow:0px 5px 20px rgba(0,0,0,0.3);">

        <!-- Heading -->
        <div class="row mx-0 px-3 ">
            <div class="col-md-12">
                <h1 class="bg-primary text-white text-center p-3 rounded">Tutor SignUp</h1>
            </div>
        </div>

        <!-- Form Fields -->
        <div class="row mx-0 px-3">

            <!-- Column 1 -->
            <div class="col-md-4">
                <asp:TextBox ID="NameTextBox" CssClass="form-control mb-3" placeholder="Enter Name" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="NameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
              

                <asp:TextBox ID="SurNameTextBox" CssClass="form-control mb-3" placeholder="Enter SurName" runat="server" />
                 <asp:RequiredFieldValidator ControlToValidate="SurNameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="SurName is Required"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="GenderDropDownList" CssClass="form-control mb-3" runat="server">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator  InitialValue="Select Gender" ControlToValidate="GenderDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Gender  is Required"></asp:RequiredFieldValidator>
<asp:TextBox ID="AgeTextBox" 
    CssClass="form-control mb-3" 
    placeholder="Enter Age" 
    runat="server"
    TextMode="Number" />
                <asp:RequiredFieldValidator ControlToValidate="AgeTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Age is Required"></asp:RequiredFieldValidator>
              <asp:RangeValidator 
    ID="RangeValidator1" 
    runat="server" 
    ErrorMessage="Age should be between 20 to 80"
    ControlToValidate="AgeTextBox"
    MinimumValue="20" 
    MaximumValue="80"
    Type="Integer"
    Display="Dynamic" 
    ForeColor="Red"
    SetFocusOnError="True">
</asp:RangeValidator>
<br />
 <asp:TextBox ID="EmailTextBox" CssClass="form-control mb-3" placeholder="Enter Email" runat="server" />
    <asp:RequiredFieldValidator ControlToValidate="EmailTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
 <br />
 
                <asp:DropDownList ID="MaritalStatusDropDownList" CssClass="form-control mb-3" runat="server">
                    <asp:ListItem>Select Status</asp:ListItem>
                    <asp:ListItem>Single</asp:ListItem>
                    <asp:ListItem>Married</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator  InitialValue="Select Status" ControlToValidate="MaritalStatusDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator35" runat="server" ErrorMessage="MaritalStatus  is Required"></asp:RequiredFieldValidator>
                <asp:DropDownList 
    ID="CountryDropDownList"
    CssClass="form-control mb-3"
    runat="server"
    AutoPostBack="true"
    OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
</asp:DropDownList>

<asp:RequiredFieldValidator 
    ControlToValidate="CountryDropDownList"
    InitialValue="0"
    ForeColor="Red"
    SetFocusOnError="true"
    Display="Dynamic"
    ID="RequiredFieldValidator6"
    runat="server"
    ErrorMessage="Country is Required">
</asp:RequiredFieldValidator>
            </div>

            <!-- Column 2 -->
            <div class="col-md-4">
               <asp:DropDownList 
    ID="CityDropDownList"
    CssClass="form-control mb-3"
    runat="server">
</asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="CityDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator7" runat="server" ErrorMessage="City is Required"></asp:RequiredFieldValidator>

                <asp:TextBox ID="AddressTextBox" TextMode="MultiLine" Rows="4"
                    CssClass="form-control mb-3" placeholder="Enter Address" runat="server" />
                 <asp:RequiredFieldValidator ControlToValidate="AddressTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>

               <asp:DropDownList ID="QualificationDropDownList" CssClass="form-control mb-3" runat="server">
      <asp:ListItem>Select Qualification</asp:ListItem>
      <asp:ListItem>Graduation</asp:ListItem>
      <asp:ListItem>Masters</asp:ListItem>
      <asp:ListItem>MPHIL</asp:ListItem>
       <asp:ListItem>PHD</asp:ListItem>
      <asp:ListItem>Other</asp:ListItem>
  </asp:DropDownList>
     <asp:RequiredFieldValidator  InitialValue="Select Qualification" ControlToValidate="GoingToDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Qualification is Required"></asp:RequiredFieldValidator>

   

                <asp:TextBox ID="DegreeTextBox" CssClass="form-control mb-3" placeholder="Enter Degree" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="DegreeTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Degree is Required"></asp:RequiredFieldValidator>

            </div>
            
               <asp:DropDownList ID="ExperienceDropDownList" CssClass="form-control mb-3" runat="server">
      <asp:ListItem>Select Experience</asp:ListItem>
      <asp:ListItem>1</asp:ListItem>
      <asp:ListItem>2</asp:ListItem>
      <asp:ListItem>3</asp:ListItem>
       <asp:ListItem>4</asp:ListItem>
      <asp:ListItem>5</asp:ListItem>
      <asp:ListItem>8+</asp:ListItem>
      <asp:ListItem>10+</asp:ListItem>
  </asp:DropDownList>
     <asp:RequiredFieldValidator  InitialValue="Select Experience" ControlToValidate="ExperienceDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Experience is Required"></asp:RequiredFieldValidator>
     <br />

            <!-- Column 3 -->
            <div class="col-md-4">
                <asp:TextBox ID="ContactTextBox" CssClass="form-control mb-3" placeholder="Enter Contact" runat="server" />
                                <asp:RequiredFieldValidator ControlToValidate="ContactTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator14" runat="server" ErrorMessage="Contact is Required"></asp:RequiredFieldValidator>


               t="server" ErrorMessage="TutionPreffered is Required"></asp:RequiredFieldValidator>

                <asp:TextBox ID="UserNameTextBox" CssClass="form-control mb-3" placeholder="Enter UserName" runat="server" />
               <asp:RequiredFieldValidator ControlToValidate="UserNameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator15" runat="server" ErrorMessage="UserName is Required"></asp:RequiredFieldValidator>

                <asp:TextBox ID="PasswordTextBox" CssClass="form-control mb-3" TextMode="Password" placeholder="Enter Password" runat="server" />
                 <asp:RequiredFieldValidator  ControlToValidate="PasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator16" runat="server" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator 
    ID="RegularExpressionValidator1"
    ControlToValidate="PasswordTextBox"
    Display="Dynamic"
    ForeColor="Red"
    SetFocusOnError="true"
    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
    runat="server"
    ErrorMessage="Password must be 8+ chars with uppercase, lowercase, number & special char">
</asp:RegularExpressionValidator>
                <asp:TextBox ID="ConfirmPasswordTextBox" CssClass="form-control mb-3" TextMode="Password" placeholder="Enter Confirm Password" runat="server" />
                  <asp:RequiredFieldValidator ControlToValidate="ConfirmPasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator17" runat="server" ErrorMessage="ConfirmPassword is Required"></asp:RequiredFieldValidator>
                <asp:CompareValidator ControlToValidate="ConfirmPasswordTextBox" ControlToCompare="PasswordTextBox" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ID="CompareValidator1" runat="server" ErrorMessage="Both Password Must be Identical"></asp:CompareValidator>
         </div>

        </div>

        <!-- Button -->
        <div class="row mx-0 px-3 mt-3">
            <div class="col-md-6 mx-auto">
                <asp:Button ID="StudentSignUpButton"  onClick="StudentSignUpButton_Click" CssClass="btn btn-primary w-100" runat="server" Text="SignUp" />
            </div>
        </div>

    </div>

</div>
<div class="container mt-5 pt-4 ">

    <!-- INNER BOX -->
    <div style="max-width:1300px; width:100%; margin:auto; padding:30px; background:#fff; border-radius:12px; box-shadow:0px 5px 20px rgba(0,0,0,0.3);">

        <!-- Heading -->
        <div class="row mx-0 px-3 ">
            <div class="col-md-12">
                <h1 class="bg-primary text-white text-center p-3 rounded">Student SignUp</h1>
            </div>
        </div>

        <!-- Form Fields -->
        <div class="row mx-0 px-3">

            <!-- Column 1 -->
            <div class="col-md-4">
                <asp:TextBox ID="TextBox1" CssClass="form-control mb-3" placeholder="Enter Name" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="NameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator18" runat="server" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox2" CssClass="form-control mb-3" placeholder="Enter Father Name" runat="server" />
                                <asp:RequiredFieldValidator ControlToValidate="FatherNameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator19" runat="server" ErrorMessage="Father Name is Required"></asp:RequiredFieldValidator>

                <asp:TextBox ID="TextBox3" CssClass="form-control mb-3" placeholder="Enter SurName" runat="server" />
                 <asp:RequiredFieldValidator ControlToValidate="SurNameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator20" runat="server" ErrorMessage="SurName is Required"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="DropDownList1" CssClass="form-control mb-3" runat="server">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator  InitialValue="Select Gender" ControlToValidate="GenderDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator21" runat="server" ErrorMessage="Gender  is Required"></asp:RequiredFieldValidator>
<asp:TextBox ID="TextBox4" 
    CssClass="form-control mb-3" 
    placeholder="Enter Age" 
    runat="server"
    TextMode="Number" />
                <asp:RequiredFieldValidator ControlToValidate="AgeTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator22" runat="server" ErrorMessage="Age is Required"></asp:RequiredFieldValidator>
              <asp:RangeValidator 
    ID="RangeValidator2" 
    runat="server" 
    ErrorMessage="Age should be between 5 to 60"
    ControlToValidate="AgeTextBox"
    MinimumValue="5" 
    MaximumValue="60"
    Type="Integer"
    Display="Dynamic" 
    ForeColor="Red"
    SetFocusOnError="True">
</asp:RangeValidator>
                <asp:DropDownList 
    ID="DropDownList2"
    CssClass="form-control mb-3"
    runat="server"
    AutoPostBack="true"
    OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
</asp:DropDownList>

<asp:RequiredFieldValidator 
    ControlToValidate="CountryDropDownList"
    InitialValue="0"
    ForeColor="Red"
    SetFocusOnError="true"
    Display="Dynamic"
    ID="RequiredFieldValidator23"
    runat="server"
    ErrorMessage="Country is Required">
</asp:RequiredFieldValidator>
            </div>

            <!-- Column 2 -->
            <div class="col-md-4">
               <asp:DropDownList 
    ID="DropDownList3"
    CssClass="form-control mb-3"
    runat="server">
</asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="CityDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator24" runat="server" ErrorMessage="City is Required"></asp:RequiredFieldValidator>

                <asp:TextBox ID="TextBox5" TextMode="MultiLine" Rows="4"
                    CssClass="form-control mb-3" placeholder="Enter Address" runat="server" />
                 <asp:RequiredFieldValidator ControlToValidate="AddressTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator25" runat="server" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>

                <asp:TextBox ID="TextBox6" CssClass="form-control mb-3" placeholder="Enter Standard" runat="server" />
                                <asp:RequiredFieldValidator ControlToValidate="StandardTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator26" runat="server" ErrorMessage="Standard is Required"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="DropDownList4" CssClass="form-control mb-3" runat="server">
                    <asp:ListItem>Select Going To</asp:ListItem>
                    <asp:ListItem>School</asp:ListItem>
                    <asp:ListItem>College</asp:ListItem>
                    <asp:ListItem>University</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                   <asp:RequiredFieldValidator  InitialValue="Select Going To" ControlToValidate="GoingToDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator27" runat="server" ErrorMessage="Select Going To is Required"></asp:RequiredFieldValidator>

                <asp:TextBox ID="TextBox7" CssClass="form-control mb-3" placeholder="Enter Subject" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="SubjectTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator28" runat="server" ErrorMessage="Subject is Required"></asp:RequiredFieldValidator>

            </div>

            <!-- Column 3 -->
            <div class="col-md-4">
                <asp:TextBox ID="TextBox8" CssClass="form-control mb-3" placeholder="Enter Contact" runat="server" />
                                <asp:RequiredFieldValidator ControlToValidate="ContactTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator29" runat="server" ErrorMessage="Contact is Required"></asp:RequiredFieldValidator>


                <asp:DropDownList ID="DropDownList5" CssClass="form-control mb-3" runat="server">
                    <asp:ListItem>Select Tution Type</asp:ListItem>
                    <asp:ListItem>Online</asp:ListItem>
                    <asp:ListItem>Offline</asp:ListItem>
                </asp:DropDownList>
                                <asp:RequiredFieldValidator  InitialValue="Select Tution Type" ControlToValidate="TutionTypeDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator30" runat="server" ErrorMessage="TutionType  is Required"></asp:RequiredFieldValidator>

                <asp:DropDownList ID="DropDownList6" CssClass="form-control mb-3" runat="server">
                    <asp:ListItem>Select Tutor Preferred</asp:ListItem>
                    <asp:ListItem>Graduation</asp:ListItem>
                    <asp:ListItem>MPHIL</asp:ListItem>
                    <asp:ListItem>Masters</asp:ListItem>
                    <asp:ListItem>PHD</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator   InitialValue="Select Tutor Preferred" ControlToValidate="TutorPreferredDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator31" runat="server" ErrorMessage="TutionPreffered is Required"></asp:RequiredFieldValidator>

                <asp:TextBox ID="TextBox9" CssClass="form-control mb-3" placeholder="Enter UserName" runat="server" />
               <asp:RequiredFieldValidator ControlToValidate="UserNameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator32" runat="server" ErrorMessage="UserName is Required"></asp:RequiredFieldValidator>

                <asp:TextBox ID="TextBox10" CssClass="form-control mb-3" TextMode="Password" placeholder="Enter Password" runat="server" />
                 <asp:RequiredFieldValidator  ControlToValidate="PasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator33" runat="server" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
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
                <asp:TextBox ID="TextBox11" CssClass="form-control mb-3" TextMode="Password" placeholder="Enter Confirm Password" runat="server" />
                  <asp:RequiredFieldValidator ControlToValidate="ConfirmPasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator34" runat="server" ErrorMessage="ConfirmPassword is Required"></asp:RequiredFieldValidator>
                <asp:CompareValidator ControlToValidate="ConfirmPasswordTextBox" ControlToCompare="PasswordTextBox" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ID="CompareValidator2" runat="server" ErrorMessage="Both Password Must be Identical"></asp:CompareValidator>
         </div>

        </div>

        <!-- Button -->
        <div class="row mx-0 px-3 mt-3">
            <div class="col-md-6 mx-auto">
                <asp:Button ID="TutorSignupButton"   CssClass="btn btn-primary w-100" runat="server" Text="SignUp" />
            </div>
        </div>

    </div>

</div>
</asp:Content>
