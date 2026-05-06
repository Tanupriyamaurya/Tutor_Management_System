<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/Tutor_Dashboard.Master" AutoEventWireup="true" CodeBehind="View_Students.aspx.cs" Inherits="TMS_Project.Tutor.View_Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<BR />
<div class="row">
<div class="col-md-12">
<h1 class="jumbotron bg-dark text-white text-center">STUDENT DATA</h1>
</div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="input-group">
           
            <asp:TextBox ID="SearchText"   class="form-control" placeholder="Search Student" runat="server"></asp:TextBox>
            <div class="input-group-append">
                <button id="SearchBtn" runat="server"  onserverclick="SearchBtn_ServerClick" class="btn btn-secondary" type="button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </div>
</div>
<br />
    <div class="row">
       <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <div class="col-md-4">
            <div class="card bg-dark text-white text-center">
                
                <div class="card-header">
                <small style="font-size:15px;color:steelblue;">Name </small>
                    <h3>
                        <%# Eval("Name") %>
                    </h3>
                </div>

                <div class="card-body">
                 <small style="font-size:15px;color:steelblue;">Gender </small>
                    <h5>
                       <%# Eval("Gender") %> 
                    </h5>
                     <small style="font-size:15px;color:steelblue;">CountryName</small>
                    <h5>
                        <%# Eval("CountryName") %> 
                    </h5>
                     <small style="font-size:15px;color:steelblue;">CityName </small>
                    <h5>
                        <%# Eval("CityName") %>      <!-- ✅ FIXED -->
                    </h5>
                     <small style="font-size:15px;color:steelblue;">Class </small>
                    <h5>
                        <%# Eval("Standard") %>
                    </h5>
                     <small style="font-size:15px;color:steelblue;">Subject</small>
                    <h5>
                        <%# Eval("Subject") %>
                    </h5>
                     <small style="font-size:15px;color:steelblue;">Contact_no</small>
<h5>
    <%# Eval("Contact_no") %>
</h5>
 <small style="font-size:15px;color:steelblue;">Tution Type</small>
<h5>
    <%# Eval("Tuition_Type") %>
</h5>
                </div>

                <div class="card-footer">
                
                   <small style="font-size:15px;color:steelblue;">Class </small>
<h5>
    <%# Eval("Standard") %>
</h5>
                </div>

            </div>
            <br />
        </div>
    </ItemTemplate>
</asp:Repeater>
    </div>
</asp:Content>
