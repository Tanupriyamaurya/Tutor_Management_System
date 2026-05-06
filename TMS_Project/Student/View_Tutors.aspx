<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_Dashboard.Master" AutoEventWireup="true" CodeBehind="View_Tutors.aspx.cs" Inherits="TMS_Project.Student.View_Tutors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<BR />
<div class="row">
<div class="col-md-12">
<h1 class="jumbotron bg-dark text-white text-center">TUTOR DATA</h1>
</div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="input-group">
           
            <asp:TextBox ID="SearchText"   class="form-control" placeholder="Search Tutor" runat="server"></asp:TextBox>
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
                 <small style="font-size:15px;color:steelblue;">Email </small>
                    <h5>
                        <%# Eval("Email") %>
                    </h5>
                     <small style="font-size:15px;color:steelblue;">CountryName</small>
                    <h5>
                        <%# Eval("CountryName") %>   <!-- ✅ FIXED -->
                    </h5>
                     <small style="font-size:15px;color:steelblue;">CityName </small>
                    <h5>
                        <%# Eval("CityName") %>      <!-- ✅ FIXED -->
                    </h5>
                     <small style="font-size:15px;color:steelblue;">Experience </small>
                    <h5>
                        <%# Eval("Experience") %>
                    </h5>
                     <small style="font-size:15px;color:steelblue;">Contact_No</small>
                    <h5>
                        <%# Eval("Contact_No") %>
                    </h5>
                </div>

                <div class="card-footer">
                 <small style="font-size:15px;color:steelblue;">Qualification</small>
                    <h4>
                        <%# Eval("Degree") %>
                    </h4>
                </div>

            </div>
            <br />
        </div>
    </ItemTemplate>
</asp:Repeater>
    </div>
</asp:Content>
