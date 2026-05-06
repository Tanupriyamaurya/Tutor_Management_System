<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Dashboard.Master" AutoEventWireup="true" CodeBehind="View_Contact.aspx.cs" Inherits="TMS_Project.admin.View_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<div class="row">
<div class="col-md-12">
<h1 class="jumbotron bg-dark text-white text-center">VIEW CONTACT DETAILS</h1>
</div>
</div>
   <asp:GridView ID="GridView1" 
    CssClass="table table-bordered table-hover table-striped table-dark" 
    runat="server" 
    AutoGenerateColumns="False"
    DataKeyNames="Id"
    OnRowDeleting="GridView1_RowDeleting">

    <Columns>

        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <asp:Label ID="LabelID" runat="server" 
                    Text='<%# Bind("Id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="NAME">
            <ItemTemplate>
                <asp:Label ID="LabelName" runat="server" 
                    Text='<%# Bind("Name") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="EMAIL">
            <ItemTemplate>
                <asp:Label ID="LabelEmail" runat="server" 
                    Text='<%# Bind("Email") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="SUBJECT">
            <ItemTemplate>
                <asp:Label ID="LabelSubject" runat="server" 
                    Text='<%# Bind("Subject") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="MESSAGE">
            <ItemTemplate>
                <asp:Label ID="LabelMessage" runat="server" 
                    Text='<%# Bind("Message") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are You Sure to Delete Data??')" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
            </ItemTemplate>
            <ControlStyle CssClass="btn btn-danger text-white" />
        </asp:TemplateField>

    </Columns>
</asp:GridView>
</asp:Content>
