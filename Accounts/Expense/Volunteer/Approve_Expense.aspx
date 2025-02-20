<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Approve_Expense.aspx.cs" Inherits="Award__bd.Accounts.Expense.Volunteer.Approve_Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/Approved_Expense.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Approve Volunteer Expense</h3>
    <div class="form-group">
        <asp:Button ID="ApproveButton" CssClass="btn btn-primary" runat="server" Text="Approve" OnClick="ApproveButton_Click" />
        <asp:Button ID="DeleteButton" CssClass="btn btn-primary" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
    </div>
    <a href="../Approved_Expense.aspx">Back To List</a>
    <br />

    <asp:FormView ID="EAFormView" runat="server" DataSourceID="ExpenseSQL" Width="100%">
        <ItemTemplate>
            <div id="Details">
                <img alt="No Image" src="/Handler/Admin.ashx?Img=<%#Eval("RegistrationID") %>" class="img-circle img-responsive img" />

                <ul>
                    <li>Volunteer Name:
         <asp:Label ID="BeneficiaryNameLabel" runat="server" Text='<%# Bind("Name") %>' /></li>
                    <li>Expense Category Name:
         <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Bind("CategoryName") %>' /></li>
                    <li>Benifit Category:
         <asp:Label ID="Benifit_CategoryLabel" runat="server" Text='<%# Bind("Benifit_Category") %>' /></li>
                    <li>Expense Details:
                   <asp:TextBox ID="DetailsTextBox" runat="server" CssClass="form-control" Text='<%# Bind("ExpenseDetails") %>'></asp:TextBox>
                    </li>
                    <li>Expense Date:
         <asp:TextBox ID="ExpenseDateTextBox" runat="server" CssClass="form-control datepicker" Text='<%# Bind("ExpenseDate","{0:d MMM yyyy}") %>'></asp:TextBox></li>
                    <li>Amount:
                   <asp:TextBox ID="MainAmountTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Amount") %>'></asp:TextBox>
                    </li>
                    <li>Inserted By:
         <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' /></li>
                </ul>
            </div>

            <br />
            <img alt="" src="/Handler/Beneficiry_Doc.ashx?Img=<%#Eval("ExpenseID") %>" class="img-responsive" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Expense_Category.CategoryName, Expense.ExpenseDetails, Expense.ExpenseDate, Expense.Amount, Expense.ExpenseID, Benefit_Category.CategoryName AS Benifit_Category, Registration.Name, Expense.Persentage, Expense.Amount_Without_Per, Registration_1.UserName, Registration.RegistrationID FROM Expense INNER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID INNER JOIN Volunteer ON Expense.VolunteerID = Volunteer.VolunteerID INNER JOIN Registration ON Volunteer.Volunteer_RegistrationID = Registration.RegistrationID INNER JOIN Registration AS Registration_1 ON Expense.RegistrationID = Registration_1.RegistrationID WHERE (Expense.Is_Approved = 0) AND (Expense.ExpenseID = @ExpenseID)" DeleteCommand="DELETE FROM Expense WHERE (ExpenseID = @ExpenseID)" UpdateCommand="UPDATE Expense SET Approved_By_RegistrationID = @RegistrationID, Approved_Date = dateadd(hour,6,getutcdate()), Is_Approved = 1, Amount = @Amount, ExpenseDetails = @ExpenseDetails,ExpenseDate =@ExpenseDate   WHERE (ExpenseID = @ExpenseID)">
        <DeleteParameters>
            <asp:QueryStringParameter Name="ExpenseID" QueryStringField="ExpenseID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ExpenseID" QueryStringField="ExpenseID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
            <asp:QueryStringParameter Name="ExpenseID" QueryStringField="ExpenseID" />
            <asp:Parameter Name="Amount" />
            <asp:Parameter Name="ExpenseDetails" />
            <asp:Parameter Name="ExpenseDate" />
        </UpdateParameters>
    </asp:SqlDataSource>

      <script type="text/javascript">
        $(function () {
            $('.datepicker').datepicker({
                format: 'dd M yyyy',
                todayHighlight: true,
                autoclose: true
            });
        });
    </script>
</asp:Content>
