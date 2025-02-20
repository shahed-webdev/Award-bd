<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Award__bd.Profile.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link href="CSS/Admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
   <asp:FormView ID="InfoFormView" runat="server" DataKeyNames="RegistrationID" DataSourceID="InfoSQL" Width="100%" OnItemUpdated="InfoFormView_ItemUpdated">
      <ItemTemplate>
         <div class="student-info well">
            <h3>
               <i class="glyphicon glyphicon-user rest-userico"></i>
               <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            </h3>

            <div class="Info col-md-2 col-sm-3">
               <img alt="No Image" src="/Handler/Admin.ashx?Img=<%#Eval("RegistrationID") %>" class="img-circle img-responsive P_Image" />
            </div>

            <div class="Info col-md-10 col-sm-9">
               <ul>
                  <li>
                     <i class="glyphicon glyphicon-user rest-userico"></i>
                     <b>Father's Name:</b>
                     <asp:Label ID="FatherNameLabel" runat="server" Text='<%# Bind("FatherName") %>' />
                  </li>
                  <li>
                     <span class="glyphicon glyphicon-earphone"></span>
                     <b>Mobile:</b>
                     <asp:Label ID="PhoneLabel1" runat="server" Text='<%# Bind("Phone") %>' />
                  </li>
                  <li>
                     <span class="glyphicon glyphicon-envelope"></span>
                     <b>Email: </b>
                     <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                  </li>
                  <li>
                     <span class="glyphicon glyphicon-map-marker"></span>
                     <b>Address: </b>
                     <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Present_Address") %>' />
                  </li>
               </ul>
            </div>

            <div>
               <asp:LinkButton ID="EditButton" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="Edit" Text="Update Info" />
               <a href="Change_Password.aspx">Change Password</a>
            </div>
         </div>
      </ItemTemplate>

      <EditItemTemplate>
         <div class="col-md-6 col-sm-12">
            <div class="form-group">
               <label>Name</label>
               <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>' />
            </div>
            <div class="form-group">
               <label>Father&#39;s Name:</label>
               <asp:TextBox ID="FatherNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FatherName") %>' />
            </div>
            <div class="form-group">
               <label>Mother's Name:</label>
               <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("MotherName") %>' />
            </div>
            <div class="form-group">
               <label>Date of Birth:</label>
               <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("DateofBirth") %>' />
            </div>
            <div class="form-group">
               <label>Blood Group:</label>
               <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("BloodGroup") %>' />
            </div>
            <div class="form-group">
               <label>Gender:</label>
               <asp:TextBox ID="GenderTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Gender") %>' />
            </div>
            <div class="form-group">
               <label>Mobile:</label>
               <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Phone") %>' />
            </div>
            <div class="form-group">
               <label>Email:</label>
               <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Email") %>' />
            </div>
            <div class="form-group">
               <label>Present Address:</label>
               <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Present_Address") %>' TextMode="MultiLine" />
            </div>
            <div class="form-group">
               <label>Permanent Address:</label>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Permanent_Address") %>' TextMode="MultiLine" />
            </div>
            <div class="form-group">
               <label>Image:</label>
               <asp:FileUpload ID="ImageFileUpload" runat="server" />
            </div>

            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-default" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />

         </div>
      </EditItemTemplate>
   </asp:FormView>
   <asp:SqlDataSource ID="InfoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Registration] WHERE  (RegistrationID = @RegistrationID)" UpdateCommand="UPDATE Registration SET Name = @Name, FatherName = @FatherName, MotherName = @MotherName, DateofBirth = @DateofBirth, BloodGroup = @BloodGroup, Gender = @Gender, NationalID = @NationalID, Present_Address = @Present_Address, Permanent_Address = @Permanent_Address, Phone = @Phone, Email = @Email WHERE (RegistrationID = @RegistrationID)">
      <SelectParameters>
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
      </SelectParameters>
      <UpdateParameters>
         <asp:Parameter Name="Name" Type="String" />
         <asp:Parameter Name="FatherName" Type="String" />
         <asp:Parameter Name="MotherName" Type="String" />
         <asp:Parameter Name="DateofBirth" Type="String" />
         <asp:Parameter Name="BloodGroup" Type="String" />
         <asp:Parameter Name="Gender" Type="String" />
         <asp:Parameter Name="NationalID" Type="String" />
         <asp:Parameter Name="Present_Address" Type="String" />
         <asp:Parameter Name="Permanent_Address" Type="String" />
         <asp:Parameter Name="Phone" Type="String" />
         <asp:Parameter Name="Email" Type="String" />
         <asp:Parameter Name="RegistrationID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>
</asp:Content>
