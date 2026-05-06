<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Login.aspx.cs" Inherits="TMS_Project.Tutor_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
   <div class="container mt-5 " >
       <div class="row justify-content-center">
           <div class="col-md-4">

              <div class="card p-4 shadow" 
style="box-shadow: 0 15px 40px rgba(0,0,0,0.4); border-radius:12px;">
                   <h2 class="text-center mb-4">Tutor Login</h2>

                   <asp:TextBox ID="UserNameTxt" 
                       placeholder="Enter Username" 
                       CssClass="form-control mb-3" 
                       runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="UserNameTxt"  ForeColor="Red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="UserName is required"></asp:RequiredFieldValidator>
                   <asp:TextBox ID="PasswordTxt" 
                       placeholder="Enter Password" 
                       TextMode="Password"
                       CssClass="form-control mb-3" 
                       runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="PasswordTxt"  ForeColor="Red" SetFocusOnError="true" Display="Dynamic"  runat="server" ErrorMessage="Password is required"></asp:RequiredFieldValidator>

                   <asp:Button ID="Tutor_LoginBtn" onclick="Tutor_LoginBtn_Click"
                       Text="Login" 
                       CssClass="btn btn-primary w-100" 
                       runat="server" />
                       <div class="text-center">                    
                       <a href="Student_Login.aspx" >Login AS Student </a>
                       </div>
                       <br />
               </div>

           </div>
       </div>
       <br />
</asp:Content>
