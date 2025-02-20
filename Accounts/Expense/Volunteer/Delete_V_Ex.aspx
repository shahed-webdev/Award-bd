<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Delete_V_Ex.aspx.cs" Inherits="Award__bd.Accounts.Expense.Volunteer.Delete_V_Ex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link href="../CSS/Approved_Expense.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Approve Volunteer Expense</h3>

   <asp:FormView ID="EAFormView" runat="server" DataSourceID="ExpenseSQL" Width="100%">
      <ItemTemplate>
         <div id="Details">
            <img alt="No Image" src="/Handler/Admin.ashx?Img=<%#Eval("RegistrationID") %>" class="img-circle img-responsive img" />

            <ul>
               <li>Inserted By:
         <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' /></li>

               <li>Volunteer Name:
         <asp:Label ID="BeneficiaryNameLabel" runat="server" Text='<%# Bind("Name") %>' /></li>
               <li>Expense Category Name:
         <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Bind("CategoryName") %>' /></li>
               <li>Benifit Category:
         <asp:Label ID="Benifit_CategoryLabel" runat="server" Text='<%# Bind("Benifit_Category") %>' /></li>
               <li>Expense Details:
         <asp:Label ID="ExpenseDetailsLabel" runat="server" Text='<%# Bind("ExpenseDetails") %>' /></li>
               <li>Expense Date:
         <asp:Label ID="ExpenseDateLabel" runat="server" Text='<%# Bind("ExpenseDate","{0:d MMM yyyy}") %>' /></li>
               <li>Amount:
         <asp:Label ID="AmountLabel" runat="server" Text='<%# Bind("Amount") %>' /></li>
            </ul>
         </div>

         <br />
         <img alt="" src="/Handler/Beneficiry_Doc.ashx?Img=<%#Eval("ExpenseID") %>" class="img-responsive" />
      </ItemTemplate>
   </asp:FormView>
   <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.UserName, Expense_Category.CategoryName, Expense.ExpenseDetails, Expense.ExpenseDate, Expense.Amount, Expense.ExpenseID, Benefit_Category.CategoryName AS Benifit_Category, Registration.RegistrationID, Registration.Name FROM Expense INNER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Registration ON Expense.RegistrationID = Registration.RegistrationID INNER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Expense.Is_Approved = 1) AND (Expense.ExpenseID = @ExpenseID)" DeleteCommand="DELETE FROM Expense WHERE (ExpenseID = @ExpenseID)" UpdateCommand="UPDATE Expense SET Approved_By_RegistrationID = @RegistrationID, Approved_Date = dateadd(hour,6,getutcdate()), Is_Approved = 1 WHERE (ExpenseID = @ExpenseID)">
      <DeleteParameters>
         <asp:QueryStringParameter Name="ExpenseID" QueryStringField="ExpenseID" />
      </DeleteParameters>
      <SelectParameters>
         <asp:QueryStringParameter Name="ExpenseID" QueryStringField="ExpenseID" />
      </SelectParameters>
      <UpdateParameters>
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
         <asp:QueryStringParameter Name="ExpenseID" QueryStringField="ExpenseID" />
      </UpdateParameters>
   </asp:SqlDataSource>

   <br />
   <div class="form-group">
      <asp:Button ID="DeleteButton" CssClass="btn btn-primary" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
   </div>
   <a href="../Delete_A_Expense.aspx">Back To List</a>
</asp:Content>

