<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TMS_Project.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Contact</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Contact</li>
          </ol>
        </div>

      </div>
    </section><!-- End Contact Section -->

    <!-- ======= Contact Section ======= -->
    <section class="contact" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
      <div class="container">

        <div class="row">

          <div class="col-lg-6">

            <div class="row">
              <div class="col-md-12">
                <div class="info-box">
                  <i class="bx bx-map"></i>
                  <h3>Our Address</h3>
                  <p>A108 Adam Street, New York, NY 535022</p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="info-box">
                  <i class="bx bx-envelope"></i>
                  <h3>Email Us</h3>
                  <p>info@example.com<br>contact@example.com</p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="info-box">
                  <i class="bx bx-phone-call"></i>
                  <h3>Call Us</h3>
                  <p>+1 5589 55488 55<br>+1 6678 254445 41</p>
                </div>
              </div>
            </div>

          </div>

          <div class="col-lg-6">
              <div class="row">
                <div class="col-md-6 form-group">
<%--                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />--%>
                    <asp:TextBox ID="NameTextBox" class="form-control" runat="server" placeholder="Your Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="NameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator1"  runat="server" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
<%--                  <div class="validate"></div>--%>
                </div>
                <div class="col-md-6 form-group">
<%--                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />--%>
                                      <asp:TextBox ID="EmailTextBox" CssClass="form-control" runat="server" placeholder="Your Email"></asp:TextBox>
                                      <asp:RequiredFieldValidator ControlToValidate="EmailTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator2"  runat="server" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator  ControlToValidate="EmailTextBox" ForeColor="Red" ValidateEmptyText="false" SetFocusOnError="true" Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

<%--                  <div class="validate"></div>--%>
                </div>
              </div>
             <div class="row">
    <div class="col-12 form-group mt-3">
        <%--<asp:TextBox ID="SubjectTextBox" CssClass="form-control"
            runat="server" placeholder="Subject"></asp:TextBox>--%>
        <asp:DropDownList ID="SubjectDropDownList" runat="server" CssClass="form-control">
            <asp:ListItem>Select</asp:ListItem>
            <asp:ListItem>Suggestion</asp:ListItem>
            <asp:ListItem>Feedback</asp:ListItem>
            <asp:ListItem>Complain</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator  InitialValue="Select" ControlToValidate="SubjectDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator3"  runat="server" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>

    </div>
</div>

<div class="row">
    <div class="col-12 form-group mt-3">
        <asp:TextBox ID="MessageTextBox" TextMode="MultiLine" Rows="5"
            CssClass="form-control" runat="server"
            placeholder="Enter Message"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="MessageTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator4"  runat="server" ErrorMessage="Message is Required"></asp:RequiredFieldValidator>
    </div>
</div>
              <%--<div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>--%>
<%--              <div class="text-center"><button type="submit">Send Message</button>--%>
                  <div class="text-center mt-3">
    <asp:Button CssClass="btn btn-info" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click"/>

                  </div>
            
          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

    <!-- ======= Map Section ======= -->
    <section class="map mt-2">
      <div class="container-fluid p-0">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3024.2219901290355!2d-74.00369368400567!3d40.71312937933185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a23e28c1191%3A0x49f75d3281df052a!2s150%20Park%20Row%2C%20New%20York%2C%20NY%2010007%2C%20USA!5e0!3m2!1sen!2sbg!4v1579767901424!5m2!1sen!2sbg" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
      </div>
    </section><!-- End Map Section -->
</asp:Content>
