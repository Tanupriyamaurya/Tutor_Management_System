<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="TMS_Project.admin.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>

    <!-- FIXED CSS PATH -->
    <link href="<%= ResolveUrl("~/assets/vendor/bootstrap/css/bootstrap.min.css") %>" rel="stylesheet" />
    <%--<link href="~/dist/sweetalert2.min.css" rel=" stylesheet" />
    <script src="~dist/sweetalert2.min.js"></script>--%>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <form id="form1" runat="server">

        <div class="container mt-5 " >
            <div class="row justify-content-center">
                <div class="col-md-4">

                   <div class="card p-4 shadow" 
     style="box-shadow: 0 15px 40px rgba(0,0,0,0.4); border-radius:12px;">
                        <h2 class="text-center mb-4">Admin Login</h2>

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

                        <asp:Button ID="LoginBtn"  OnClick="LoginBtn_Click"
                            Text="Login" 
                            CssClass="btn btn-primary w-100" 
                            runat="server" />

                    </div>

                </div>
            </div>
        </div>

    </form>

    <!-- FIXED SCRIPT TAGS -->
    <script src="<%= ResolveUrl("~/assets/vendor/jquery/jquery.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/vendor/bootstrap/js/bootstrap.min.js") %>"></script>

</body>
</html>