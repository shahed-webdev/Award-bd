<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="Award__bd.Accounts.Expense.Beneficiry.Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Add Expense FOR <small><asp:Label ID="NameLabel" runat="server"></asp:Label></small></h3>
    <a href="List.aspx">Back To List</a>

    <div class="row">
        <div class="col-md-3">
            <div class="form-group">
                <label>Expense Category</label>
                <asp:DropDownList ID="ExpenseCategoryDropDownList" runat="server" CssClass="form-control" DataSourceID="Expense_CategorySQL" DataTextField="Expense Category" DataValueField="ExpenseCategoryID"></asp:DropDownList>
                <asp:SqlDataSource ID="Expense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Expense_Category.CategoryName AS [Expense Category], Expense_Category.ExpenseCategoryID FROM Benefit_Expense_Category INNER JOIN Expense_Category ON Benefit_Expense_Category.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Beneficiary_Expense_Category ON Expense_Category.ExpenseCategoryID = Beneficiary_Expense_Category.ExpenseCategoryID WHERE (Benefit_Expense_Category.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Expense_Category.BeneficiaryID = @BeneficiaryID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="BenefitCategoryID" QueryStringField="Category" />
                        <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label>Amount<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="AmountTextBox" CssClass="EroorStar" ValidationGroup="S"></asp:RequiredFieldValidator></label>
                <asp:TextBox ID="AmountTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label>Expense Details</label>
                <asp:TextBox ID="ExpenseDetailsTextBox" Height="34px" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label>Document</label>
                <input name="photo" type="file" required="" />
                <asp:HiddenField ID="Imge_HF" runat="server" />
            </div>
        </div>
    </div>

    <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" ValidationGroup="S" />
    <br /><br />
    <div class="table-responsive">
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
        <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Expense] WHERE [ExpenseID] = @ExpenseID" InsertCommand="INSERT INTO Expense(RegistrationID, ExpenseCategoryID, BenefitCategoryID, BeneficiaryID, Amount, ExpenseDate, ExpenseDetails, Persentage, Amount_Without_Per, Expense_Document) VALUES (@RegistrationID, @ExpenseCategoryID, @BenefitCategoryID, @BeneficiaryID, @Amount, dateadd(hour,6,getutcdate()), @ExpenseDetails, @Persentage, @Amount_Without_Per, CAST(N'' AS xml).value('xs:base64Binary(sql:variable(&quot;@Expense_Document&quot;))', 'varbinary(max)'))" SelectCommand="SELECT * FROM [Expense] WHERE  (BeneficiaryID = @BeneficiaryID)" UpdateCommand="UPDATE Expense SET Amount = @Amount, ExpenseDate = @ExpenseDate, ExpenseDetails = @ExpenseDetails WHERE (ExpenseID = @ExpenseID)">
            <DeleteParameters>
                <asp:Parameter Name="ExpenseID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
                <asp:ControlParameter ControlID="ExpenseCategoryDropDownList" Name="ExpenseCategoryID" PropertyName="SelectedValue" Type="Int32" />
                <asp:QueryStringParameter Name="BenefitCategoryID" QueryStringField="Category" Type="Int32" />
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" Type="Int32" />
                <asp:ControlParameter ControlID="ExpenseDetailsTextBox" Name="ExpenseDetails" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="AmountTextBox" Name="Amount_Without_Per" PropertyName="Text" />
                <asp:Parameter Name="Amount" Type="Double" />
                <asp:Parameter Name="Persentage" />
                <asp:ControlParameter ControlID="Imge_HF" Name="Expense_Document" PropertyName="Value" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Amount" Type="Double" />
                <asp:Parameter DbType="Date" Name="ExpenseDate" />
                <asp:Parameter Name="ExpenseDetails" Type="String" />
                <asp:Parameter Name="ExpenseID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>


    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        function BeginRequestHandler(sender, args) { var oControl = args.get_postBackElement(); oControl.disabled = true; }

        $(function () {
            $('.datepicker').datepicker({
                todayHighlight: true,
                autoclose: true,
                format: 'dd M yyyy'
            });
        });

        $('input[name=photo]').change(function (e) {
            var file = e.target.files[0];
            canvasResize(file, {
                width: 900,
                height: 0,
                crop: false,
                quality: 8,
                callback: function (data) {
                    data.split(",")[1]
                    $("[id*=Imge_HF]").val(data.split(",")[1]);
                }
            });
        });
    </script>
</asp:Content>
