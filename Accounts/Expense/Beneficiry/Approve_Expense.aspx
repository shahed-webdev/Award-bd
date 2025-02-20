<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Approve_Expense.aspx.cs" Inherits="Award__bd.Accounts.Expense.Beneficiry.Approve_Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/Approved_Expense.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>ApApprove Beneficiary Expense</h3>

    <div class="form-group">
        <asp:Button ID="ApproveButton" CssClass="btn btn-primary" runat="server" Text="Approve" OnClick="ApproveButton_Click" />
        <asp:Button ID="DeleteButton" CssClass="btn btn-primary" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
    </div>

    <asp:FormView ID="EAFormView" runat="server" DataSourceID="ExpenseSQL" Width="100%">
        <ItemTemplate>
            <div id="Details">
                <img alt="No Image" src="/Handler/Beneficiry_Img.ashx?Img=<%#Eval("BeneficiaryID") %>" class="img-circle img-responsive img" />

                <ul>
                    <li>Inserted By:
         <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' /></li>
                    <li>Case No:
         <asp:Label ID="CaseNoLabel" runat="server" Text='<%# Bind("CaseNo") %>' /></li>
                    <li>Beneficiary Name:
         <asp:Label ID="BeneficiaryNameLabel" runat="server" Text='<%# Bind("BeneficiaryName") %>' /></li>
                    <li>Expense Category Name:
         <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Bind("CategoryName") %>' /></li>
                    <li>Benifit Category:
         <asp:Label ID="Benifit_CategoryLabel" runat="server" Text='<%# Bind("Benifit_Category") %>' /></li>
                    <li>Expense Details:
                   <asp:TextBox ID="DetailsTextBox" runat="server" CssClass="form-control" Text='<%# Bind("ExpenseDetails") %>'></asp:TextBox>
                    </li>
                    <li>Expense Date:
         <asp:TextBox ID="ExpenseDateTextBox" runat="server" CssClass="form-control datepicker" Text='<%# Bind("ExpenseDate","{0:d MMM yyyy}") %>'></asp:TextBox></li>
                    <li>Main Amount:
                   <asp:TextBox ID="MainAmountTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Amount_Without_Per") %>'></asp:TextBox>
                    </li>
                    <li>Percentage:
         <asp:Label ID="PercentageLabel" runat="server" Text='<%# Bind("Persentage") %>' />
                        %</li>
                    <li>Amount:
         <asp:Label ID="AmountLabel" runat="server" Text='<%# Bind("Amount") %>' /></li>
                </ul>
            </div>

            <br />
            <img alt="" src="/Handler/Beneficiry_Doc.ashx?Img=<%#Eval("ExpenseID") %>" class="img-responsive" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.UserName, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Expense_Category.CategoryName, Expense.ExpenseDetails, Expense.ExpenseDate, Expense.Amount, Expense.ExpenseID, Beneficiary_Info.BeneficiaryID, Benefit_Category.CategoryName AS Benifit_Category, Expense.Persentage, Expense.Amount_Without_Per FROM Expense INNER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Registration ON Expense.RegistrationID = Registration.RegistrationID INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID INNER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Expense.Is_Approved = 0) AND (Expense.ExpenseID = @ExpenseID)" DeleteCommand="DELETE FROM Expense WHERE (ExpenseID = @ExpenseID)" UpdateCommand="UPDATE Expense SET Approved_By_RegistrationID = @RegistrationID, Approved_Date = dateadd(hour,6,getutcdate()), Is_Approved = 1, Amount = Persentage * @Amount / 100, ExpenseDetails = @ExpenseDetails, Amount_Without_Per = @Amount,    ExpenseDate =@ExpenseDate   WHERE (ExpenseID = @ExpenseID)">
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

    <asp:SqlDataSource ID="LoanSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Loan(RegistrationID, Amount, ExpenseID, BeneficiaryID, LoanDate) SELECT @RegistrationID, Expense.Amount, Expense.ExpenseID, Expense.BeneficiaryID, Expense.ExpenseDate FROM Expense INNER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Benefit_Category.CategoryName = N'Loan') AND (Expense.ExpenseID = @ExpenseID)" SelectCommand="SELECT * FROM [Loan]">
        <InsertParameters>
            <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
            <asp:QueryStringParameter Name="ExpenseID" QueryStringField="ExpenseID" />
        </InsertParameters>
    </asp:SqlDataSource>

    <br />
    <asp:GridView ID="GridView3" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="BE_ExDSQL" DataKeyNames="ExpenseID">
        <Columns>
            <asp:BoundField DataField="ExpenseDate" HeaderText="Expense Date" SortExpression="ExpenseDate" DataFormatString="{0:d MMM yyyy}" />
            <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
            <asp:BoundField DataField="BeneficiaryName" HeaderText="Beneficiary Name" SortExpression="BeneficiaryName" />
            <asp:BoundField DataField="Expense_Category" HeaderText="Expense Category" SortExpression="Expense_Category" />
            <asp:BoundField DataField="ExpenseDetails" HeaderText="Expense Details" SortExpression="ExpenseDetails" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="Benefit_Category" HeaderText="Benefit Category" SortExpression="Benefit_Category" />
        </Columns>
        <EmptyDataTemplate>
            No Record
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="BE_ExDSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Expense.ExpenseID, Expense.ExpenseDate, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Expense_Category.CategoryName AS Expense_Category, Expense.ExpenseDetails, Expense.Amount, Benefit_Category.CategoryName AS Benefit_Category, Beneficiary_Info.BeneficiaryID FROM Expense INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID LEFT OUTER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID LEFT OUTER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Expense.Is_Approved = 1) AND (Beneficiary_Info.BeneficiaryID = @BeneficiaryID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
        </SelectParameters>
    </asp:SqlDataSource>


    <a href="../Approved_Expense.aspx">Back To List</a>
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
