<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="Award__bd.Accounts.Expense.Volunteer.Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Add Expense For <small>
        <asp:Label ID="NameLabel" runat="server"></asp:Label></small></h3>
    <a href="List.aspx">Back To List</a>

    <div class="row">
        <div class="col-md-3">
            <div class="form-group">
                <label>
                    Benefit Category
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="BenefitCategory_DropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S"></asp:RequiredFieldValidator>
                </label>
                <asp:DropDownList ID="BenefitCategory_DropDownList" runat="server" CssClass="form-control" DataSourceID="BenefitCategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="BenefitCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Benefit_Category]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label>
                    Expense Category:
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="ExpenseCategoryDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S"></asp:RequiredFieldValidator>
                </label>
                <asp:DropDownList ID="ExpenseCategoryDropDownList" runat="server" CssClass="form-control" DataSourceID="Expense_CategorySQL" DataTextField="Expense Category" DataValueField="ExpenseCategoryID"></asp:DropDownList>
                <asp:SqlDataSource ID="Expense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT CategoryName AS [Expense Category], ExpenseCategoryID FROM Expense_Category"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-md-2">
            <div class="form-group">
                <label>
                    Amount
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="AmountTextBox" CssClass="EroorStar" ValidationGroup="S"></asp:RequiredFieldValidator>
                </label>
                <asp:TextBox ID="AmountTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-2">
            <div class="form-group">
                <label>Document</label>
                <input name="photo" type="file" required="" />
                <asp:HiddenField ID="Imge_HF" runat="server" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <label>Expense Details</label>
                <asp:TextBox ID="ExpenseDetailsTextBox" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>


    <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" ValidationGroup="S" />
    <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Expense] WHERE [ExpenseID] = @ExpenseID" InsertCommand="INSERT INTO Expense(RegistrationID, VolunteerID, ExpenseCategoryID, Amount, ExpenseDate, ExpenseDetails, BenefitCategoryID, Expense_Document) VALUES (@RegistrationID, @VolunteerID, @ExpenseCategoryID, @Amount, dateadd(hour,6,getutcdate()), @ExpenseDetails, @BenefitCategoryID, CAST(N'' AS xml).value('xs:base64Binary(sql:variable(&quot;@Expense_Document&quot;))', 'varbinary(max)'))" SelectCommand="SELECT * FROM [Expense] WHERE  (BeneficiaryID = @BeneficiaryID)" UpdateCommand="UPDATE Expense SET Amount = @Amount, ExpenseDate = @ExpenseDate, ExpenseDetails = @ExpenseDetails WHERE (ExpenseID = @ExpenseID)">
        <DeleteParameters>
            <asp:Parameter Name="ExpenseID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
            <asp:ControlParameter ControlID="ExpenseCategoryDropDownList" Name="ExpenseCategoryID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="AmountTextBox" Name="Amount" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="ExpenseDetailsTextBox" Name="ExpenseDetails" PropertyName="Text" Type="String" />
            <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VolunteerID" />
            <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
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


    <script type="text/javascript">

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        function BeginRequestHandler(sender, args) { var oControl = args.get_postBackElement(); oControl.disabled = true; }

        $(function () {
            $('.datepicker').datepicker({
                format: 'dd M yyyy',
                todayHighlight: true,
                autoclose: true
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
