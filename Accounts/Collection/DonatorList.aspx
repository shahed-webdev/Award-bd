<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="DonatorList.aspx.cs" Inherits="Award__bd.Accounts.DonatorList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Volunteer List</h3>
   <asp:GridView ID="olunteerGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="VolunteerID" DataSourceID="VolunteerSQL">
      <Columns>
         <asp:HyperLinkField DataNavigateUrlFields="VolunteerID,Name" HeaderText="Name" DataTextField="Name"
            DataNavigateUrlFormatString="Donation.aspx?VolunteerID={0}&N={1}"/>
         <asp:BoundField DataField="FatherName" HeaderText="Father's Name" SortExpression="FatherName" />
         <asp:BoundField DataField="MotherName" HeaderText="Mother's Name" SortExpression="MotherName" />
         <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
         <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
         <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
         <asp:HyperLinkField DataNavigateUrlFields="VolunteerID,Name" Text="Report" DataNavigateUrlFormatString="DonationReport.aspx?VID={0}&N={1}"/>
      </Columns>
      <EmptyDataTemplate>
         No Records
      </EmptyDataTemplate>
   </asp:GridView>
   <asp:SqlDataSource ID="VolunteerSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer.VolunteerID, Registration.Name, Registration.FatherName, Registration.MotherName, Registration.Present_Address, Registration.Permanent_Address, Registration.Phone, Registration.Gender, Registration.Email FROM Volunteer INNER JOIN Registration ON Volunteer.Volunteer_RegistrationID = Registration.RegistrationID WHERE (Registration.Category = N'Volunteer')"></asp:SqlDataSource>
</asp:Content>
