<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Award__bd.Accounts.Expense.Beneficiry.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Beneficiary List</h3>
   <div class="form-inline">
      <div class="form-group">
         <asp:DropDownList ID="BenefitCategory_DropDownList" runat="server" CssClass="form-control" DataSourceID="BenefitCategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" AppendDataBoundItems="True" AutoPostBack="True">
            <asp:ListItem Value="0">[ Benefit Category ]</asp:ListItem>
         </asp:DropDownList>
         <asp:SqlDataSource ID="BenefitCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Benefit_Category.BenefitCategoryID, Benefit_Category.CategoryName FROM Benefit_Category INNER JOIN Volunteer_BenefitCategory ON Benefit_Category.BenefitCategoryID = Volunteer_BenefitCategory.BenefitCategoryID INNER JOIN Volunteer ON Volunteer_BenefitCategory.VolunteerID = Volunteer.VolunteerID WHERE (Volunteer.Volunteer_RegistrationID = @RegistrationID)">
            <SelectParameters>
               <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
            </SelectParameters>
         </asp:SqlDataSource>
      </div>
      <div class="form-group">
         <asp:TextBox ID="FindTextBox" runat="server" CssClass="form-control" placeholder="Name,Contact No,Case No"></asp:TextBox>
      </div>
      <div class="form-group">
         <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" />
      </div>
   </div>
   <br />
   <div class="table-responsive">
      <asp:GridView ID="BeneficiaryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryID,BenefitCategoryID" DataSourceID="BeneficiarySQL" AllowSorting="True">
         <Columns>
            <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="SN" />
            <asp:HyperLinkField DataNavigateUrlFields="BeneficiaryID,BeneficiaryName,BenefitCategoryID" HeaderText="Name" DataTextField="BeneficiaryName" SortExpression="BeneficiaryName"
               DataNavigateUrlFormatString="Expense.aspx?BeneficiaryID={0}&N={1}&Category={2}" />
            <asp:BoundField DataField="FatherName" HeaderText="Father's Name" SortExpression="FatherName" />
            <asp:BoundField DataField="MotherName" HeaderText="Mother's Name" SortExpression="MotherName" />
            <asp:BoundField DataField="PresentAddress" HeaderText="Present Address" SortExpression="PresentAddress" />
            <asp:BoundField DataField="ContactNo" HeaderText="Contact No" SortExpression="ContactNo" />
            <asp:BoundField DataField="Categoty" HeaderText="Categoty" SortExpression="Categoty" />
            <asp:BoundField DataField="Reference" HeaderText="Reference" SortExpression="Reference" />
            <asp:BoundField DataField="EntryDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Entry Date" SortExpression="EntryDate" />
         </Columns>
         <EmptyDataTemplate>
            No Records
         </EmptyDataTemplate>
      </asp:GridView>
      <asp:SqlDataSource ID="BeneficiarySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.CaseNo AS SN,Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.Beneficiary_DOB, Beneficiary_Info.Beneficiary_NID, Beneficiary_Info.FatherName, Beneficiary_Info.Father_DOB, Beneficiary_Info.Father_NID, Beneficiary_Info.MotherName, Beneficiary_Info.Mother_DOB, Beneficiary_Info.Mother_NID, Beneficiary_Info.GuardianName, Beneficiary_Info.Guardian_DOB, Beneficiary_Info.Guardian_NID, Beneficiary_Info.PresentAddress, Beneficiary_Info.ContactNo, Beneficiary_Info.PermanentAddress, Beneficiary_Info.EntryDate, Beneficiary_Info.Categoty, Beneficiary_Info.Reference, CAST( Beneficiary_Info.CaseNo as nvarchar(50)) CaseNo, Beneficiary_Info.WorkingPerson_in_Family, Beneficiary_Info.Monthly_Income_in_Family, Beneficiary_Info.Total_Stu_in_Family, Beneficiary_Info.FastingMember, Beneficiary_Info.Other_Benefit, Beneficiary_Info.Is_Approved, Beneficiary_Info.ApprovedBy_ID, Beneficiary_Info.VolunteerID, Beneficiary_Info.Observation, Beneficiary_Info.InsertDate, Beneficiary_BenefitCategory.BenefitCategoryID FROM Beneficiary_Info LEFT OUTER JOIN Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID
WHERE (Beneficiary_BenefitCategory.BenefitCategoryID = @BenefitCategoryID)AND (Beneficiary_Info.Is_Approved = 1)  AND (Beneficiary_Info.Is_Service_On = 1) ORDER BY Beneficiary_Info.CaseNo"
         FilterExpression="BeneficiaryName LIKE '{0}%' or ContactNo LIKE '{0}%' or CaseNo LIKE '{0}%'">
         <FilterParameters>
            <asp:ControlParameter ControlID="FindTextBox" Name="find" PropertyName="Text" />
         </FilterParameters>
         <SelectParameters>
            <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
         </SelectParameters>
      </asp:SqlDataSource>
   </div>


</asp:Content>
