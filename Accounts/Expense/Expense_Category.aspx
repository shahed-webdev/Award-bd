<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Expense_Category.aspx.cs" Inherits="Award__bd.Accounts.Expense.Expense_Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Add Expense Category</h3>

   <div class="form-inline">
      <div class="form-group">
         <asp:TextBox ID="CategoryNameTextBox" runat="server" CssClass="form-control" placeholder="Category Name"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="CategoryNameTextBox" CssClass="EroorStar" ValidationGroup="1"></asp:RequiredFieldValidator>
      </div>
      <div class="form-group">
         <asp:Button ID="AddButton" runat="server" Text="Add Category" CssClass="btn btn-primary" OnClick="AddButton_Click" ValidationGroup="1" />
      </div>
   </div>
   <br />
   <asp:GridView ID="CategoryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="CategorySQL" DataKeyNames="ExpenseCategoryID">
      <Columns>
         <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" />
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
      <EmptyDataTemplate>
         Empty
      </EmptyDataTemplate>
   </asp:GridView>
   <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="IF NOT EXISTS (SELECT TOP(1) ExpenseCategoryID FROM  Expense WHERE ExpenseCategoryID = @ExpenseCategoryID)
BEGIN
DELETE FROM [Expense_Category] WHERE [ExpenseCategoryID] = @ExpenseCategoryID
END" InsertCommand="IF NOT EXISTS (SELECT CategoryName FROM  Expense_Category WHERE CategoryName = @CategoryName)
BEGIN
INSERT INTO [Expense_Category] ([RegistrationID], [CategoryName]) VALUES (@RegistrationID, @CategoryName)
END" SelectCommand="SELECT * FROM [Expense_Category]" UpdateCommand="IF NOT EXISTS (SELECT CategoryName FROM  Expense_Category WHERE CategoryName = @CategoryName)
BEGIN
UPDATE Expense_Category SET CategoryName = @CategoryName WHERE (ExpenseCategoryID = @ExpenseCategoryID)
END">
      <DeleteParameters>
         <asp:Parameter Name="ExpenseCategoryID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:ControlParameter ControlID="CategoryNameTextBox" Name="CategoryName" PropertyName="Text" Type="String" />
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
      </InsertParameters>
      <UpdateParameters>
         <asp:Parameter Name="CategoryName" Type="String" />
         <asp:Parameter Name="ExpenseCategoryID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>
</asp:Content>
