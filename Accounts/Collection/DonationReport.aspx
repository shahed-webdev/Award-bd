<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="DonationReport.aspx.cs" Inherits="Award__bd.Accounts.Collection.DonationReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <asp:FormView ID="TotalFormView" runat="server" DataSourceID="TotalSQL" Width="100%">
      <ItemTemplate>
         <h3>Donation From <b><%#Eval("Name") %>.</b> Amount: <%#Eval("Total") %> TK.</h3>
      </ItemTemplate>
   </asp:FormView>
   <asp:SqlDataSource ID="TotalSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.Name, SUM(Donation.Amount) AS Total FROM Donation INNER JOIN Volunteer ON Donation.VolunteerID = Volunteer.VolunteerID INNER JOIN Registration ON Volunteer.Volunteer_RegistrationID = Registration.RegistrationID WHERE (Donation.VolunteerID = @VolunteerID) GROUP BY Registration.Name">
      <SelectParameters>
         <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VID" />
      </SelectParameters>
   </asp:SqlDataSource>

   <a class="NoPrint" href="DonatorList.aspx">Back To List</a>

   <asp:GridView ID="DonationGridView" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="DonationSQL">
      <Columns>
         <asp:BoundField DataField="CaseNo" HeaderText="CaseNo" SortExpression="CaseNo" />
         <asp:BoundField DataField="BeneficiaryName" HeaderText="Beneficiary" SortExpression="BeneficiaryName" />
         <asp:BoundField DataField="CategoryName" HeaderText="Beneficiary Category" SortExpression="CategoryName" />
         <asp:BoundField DataField="Categoty" HeaderText="Categoty" SortExpression="Categoty" />
         <asp:BoundField DataField="PresentDistrict" HeaderText="District" SortExpression="PresentDistrict" />
         <asp:BoundField DataField="Total" HeaderText="Amount" ReadOnly="True" SortExpression="Total" />
      </Columns>
      <EmptyDataTemplate>
         No Record
      </EmptyDataTemplate>
   </asp:GridView>
   <asp:SqlDataSource ID="DonationSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Benefit_Category.CategoryName, Beneficiary_Info.Categoty, Beneficiary_Info.PresentDistrict, SUM(Donation.Amount) AS Total FROM Donation INNER JOIN Benefit_Category ON Donation.BenefitCategoryID = Benefit_Category.BenefitCategoryID INNER JOIN Beneficiary_Info ON Donation.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Donation.VolunteerID = @VolunteerID) GROUP BY Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Benefit_Category.CategoryName, Beneficiary_Info.PresentDistrict, Beneficiary_Info.Categoty">
      <SelectParameters>
         <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VID" />
      </SelectParameters>
   </asp:SqlDataSource>
</asp:Content>
