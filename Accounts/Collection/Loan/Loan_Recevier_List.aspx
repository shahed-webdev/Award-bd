<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Loan_Recevier_List.aspx.cs" Inherits="Award__bd.Accounts.Collection.Loan.Loan_Recevier_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Loan List</h3>
   <asp:GridView ID="LoanGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="LoanSQL">
      <Columns>
            <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
            <asp:HyperLinkField DataNavigateUrlFields="BeneficiaryID,BeneficiaryName,LoanID" HeaderText="Name" DataTextField="BeneficiaryName"
               DataNavigateUrlFormatString="Collected_Loan.aspx?BeneficiaryID={0}&N={1}&LoanID={2}" />
         <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
         <asp:BoundField DataField="ReturnAmount" HeaderText="ReturnAmount" SortExpression="ReturnAmount" />
         <asp:BoundField DataField="Due" HeaderText="Due" ReadOnly="True" SortExpression="Due" />
         <asp:BoundField DataField="LoanDate" HeaderText="LoanDate" SortExpression="LoanDate" />
      </Columns>
      <EmptyDataTemplate>
         No Records
      </EmptyDataTemplate>
   </asp:GridView>
   <asp:SqlDataSource ID="LoanSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Loan.Amount, Loan.ReturnAmount, Loan.Due, Loan.LoanDate, Loan.BeneficiaryID, Loan.LoanID FROM Loan INNER JOIN Beneficiary_Info ON Loan.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Loan.IsReturned = 0) ORDER BY Beneficiary_Info.CaseNo"></asp:SqlDataSource>
</asp:Content>
