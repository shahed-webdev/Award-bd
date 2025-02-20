<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Beneficiary_List.aspx.cs" Inherits="Award__bd.Beneficiary.Card.Beneficiary_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Beneficiary Student List</h3>
   <div class="form-inline">
      <div class="form-group">
         <asp:TextBox ID="FindTextBox" runat="server" CssClass="form-control" placeholder="Name,Contact No,Case No"></asp:TextBox>
      </div>
      <div class="form-group">
         <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" />
      </div>
   </div>

   <asp:GridView ID="BeneficiaryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryID" DataSourceID="BeneficiarySQL" AllowSorting="True" AllowPaging="True">
      <Columns>
         <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="Case_No_Sort" />
         <asp:HyperLinkField DataNavigateUrlFields="BeneficiaryID" HeaderText="Name" DataTextField="BeneficiaryName" SortExpression="BeneficiaryName"
            DataNavigateUrlFormatString="Student_Card.aspx?BeneficiaryID={0}" />
         <asp:BoundField DataField="FatherName" HeaderText="Father's Name" SortExpression="FatherName" />
         <asp:BoundField DataField="MotherName" HeaderText="Mother's Name" SortExpression="MotherName" />
         <asp:BoundField DataField="PresentAddress" HeaderText="Present Address" SortExpression="PresentAddress" />
         <asp:BoundField DataField="ContactNo" HeaderText="Contact No" SortExpression="ContactNo" />
         <asp:BoundField DataField="Categoty" HeaderText="Categoty" SortExpression="Categoty" />
         <asp:BoundField DataField="Reference" HeaderText="Reference" SortExpression="Reference" />
         <asp:BoundField DataField="EntryDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Entry Date" SortExpression="EntryDate" />
          <asp:TemplateField HeaderText="Pay Order" SortExpression="BeneficiaryName">
              <ItemTemplate>
                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("BeneficiaryID", "Stu_PayOrder.aspx?BeneficiaryID={0}") %>' Text="Pay Order"></asp:HyperLink>
              </ItemTemplate>
          </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
         No Records
      </EmptyDataTemplate>
       <PagerStyle CssClass="pgr" />
   </asp:GridView>
   <asp:SqlDataSource ID="BeneficiarySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.Beneficiary_DOB, Beneficiary_Info.Beneficiary_NID, Beneficiary_Info.FatherName, Beneficiary_Info.Father_DOB, Beneficiary_Info.Father_NID, Beneficiary_Info.MotherName, Beneficiary_Info.Mother_DOB, Beneficiary_Info.Mother_NID, Beneficiary_Info.GuardianName, Beneficiary_Info.Guardian_DOB, Beneficiary_Info.Guardian_NID, Beneficiary_Info.PresentAddress, Beneficiary_Info.ContactNo, Beneficiary_Info.PermanentAddress, Beneficiary_Info.EntryDate, Beneficiary_Info.Categoty, Beneficiary_Info.Reference, CAST(Beneficiary_Info.CaseNo AS nvarchar(50)) AS CaseNo, Beneficiary_Info.WorkingPerson_in_Family, Beneficiary_Info.Monthly_Income_in_Family, Beneficiary_Info.Total_Stu_in_Family, Beneficiary_Info.FastingMember, Beneficiary_Info.Other_Benefit, Beneficiary_Info.Is_Approved, Beneficiary_Info.ApprovedBy_ID, Beneficiary_Info.VolunteerID, Beneficiary_Info.Observation, Beneficiary_Info.InsertDate, Beneficiary_Info.CaseNo AS Case_No_Sort FROM Benefit_Category INNER JOIN Beneficiary_BenefitCategory ON Benefit_Category.BenefitCategoryID = Beneficiary_BenefitCategory.BenefitCategoryID RIGHT OUTER JOIN Beneficiary_Info ON Beneficiary_BenefitCategory.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Benefit_Category.CategoryName = N'Student') ORDER BY Case_No_Sort"
      FilterExpression="BeneficiaryName LIKE '{0}%' or ContactNo LIKE '{0}%' or CaseNo LIKE '{0}%'" CancelSelectOnNullParameter="False">
      <FilterParameters>
         <asp:ControlParameter ControlID="FindTextBox" Name="find" PropertyName="Text" />
      </FilterParameters>
   </asp:SqlDataSource>
</asp:Content>
