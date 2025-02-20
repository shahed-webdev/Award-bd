<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Benefit_Expense_Category.aspx.cs" Inherits="Award__bd.Beneficiary.Benefit_Expense_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Benefit Expense Category</h3>
   <div class="row">
      <div class="col-sm-3">
         <div class="form-group">
            <label>Benefit Category <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Benefit_CategoryDropDownList" CssClass="EroorStar" ErrorMessage="*" InitialValue="0" ValidationGroup="A"></asp:RequiredFieldValidator></label>
            <asp:DropDownList ID="Benefit_CategoryDropDownList" runat="server" CssClass="form-control" DataSourceID="Benefit_CategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" AppendDataBoundItems="True" AutoPostBack="True">
               <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="Benefit_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Benefit_Category]"></asp:SqlDataSource>
         </div>
      </div>
      <div class="col-sm-3">
         <div class="form-group">
            <label>Expense Category <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Expense_CategoryDropDownList" CssClass="EroorStar" ErrorMessage="*" InitialValue="0" ValidationGroup="A"></asp:RequiredFieldValidator></label>
            <asp:DropDownList ID="Expense_CategoryDropDownList" runat="server" CssClass="form-control" DataSourceID="Expense_CategorySQL" DataTextField="CategoryName" DataValueField="ExpenseCategoryID" AppendDataBoundItems="True">
                  <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="Expense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Expense_Category]"></asp:SqlDataSource>
         </div>
      </div>

   </div>
   <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" CssClass="btn btn-success" Text="Add" ValidationGroup="A" />
   <br /><br />
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="Benefit_Expense_CategorySQL" DataKeyNames="Benefit_Exp_CategoryID">
      <Columns>
         <asp:BoundField DataField="Benefit Category" HeaderText="Benefit Category" SortExpression="Benefit Category" />
         <asp:BoundField DataField="Expense Category" HeaderText="Expense Category" SortExpression="Expense Category" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="Benefit_Expense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Benefit_Expense_Category] WHERE [Benefit_Exp_CategoryID] = @Benefit_Exp_CategoryID" InsertCommand="IF NOT EXISTS (SELECT *  FROM Benefit_Expense_Category WHERE [BenefitCategoryID] =  @BenefitCategoryID AND  [ExpenseCategoryID] = @ExpenseCategoryID)
INSERT INTO [Benefit_Expense_Category] ([RegistrationID], [BenefitCategoryID], [ExpenseCategoryID]) VALUES (@RegistrationID, @BenefitCategoryID, @ExpenseCategoryID)" SelectCommand="SELECT Expense_Category.CategoryName AS [Expense Category], Benefit_Category.CategoryName AS [Benefit Category], Benefit_Expense_Category.Benefit_Exp_CategoryID FROM Benefit_Expense_Category INNER JOIN Benefit_Category ON Benefit_Expense_Category.BenefitCategoryID = Benefit_Category.BenefitCategoryID INNER JOIN Expense_Category ON Benefit_Expense_Category.ExpenseCategoryID = Expense_Category.ExpenseCategoryID WHERE (Benefit_Expense_Category.BenefitCategoryID = @BenefitCategoryID)">
      <DeleteParameters>
         <asp:Parameter Name="Benefit_Exp_CategoryID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:ControlParameter ControlID="Benefit_CategoryDropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" Type="Int32" />
         <asp:ControlParameter ControlID="Expense_CategoryDropDownList" Name="ExpenseCategoryID" PropertyName="SelectedValue" Type="Int32" />
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
      </InsertParameters>
      <SelectParameters>
         <asp:ControlParameter ControlID="Benefit_CategoryDropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
      </SelectParameters>
   </asp:SqlDataSource>
</asp:Content>
