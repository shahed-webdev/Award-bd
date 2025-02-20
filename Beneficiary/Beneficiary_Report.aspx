<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Beneficiary_Report.aspx.cs" Inherits="Award__bd.Beneficiary.Beneficiary_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media print {
            h3 { text-align: center; }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Beneficiary Report
        <br />
        <small>
            <label class="Date"></label>
            <label class="Category"></label>
        </small></h3>

    <div class="form-inline NoPrint">
        <div class="form-group">
            <asp:DropDownList ID="BenefitCategory_DropDownList" runat="server" CssClass="form-control" DataSourceID="BenefitCategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="%">[ All Category ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="BenefitCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT BenefitCategoryID, CategoryName FROM Benefit_Category"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:TextBox ID="FromDateTextBox" placeholder="From Date" runat="server" CssClass="form-control datepicker"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="ToDateTextBox" placeholder="To Date" runat="server" CssClass="form-control datepicker"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" />
        </div>
        <div class="form-group">
            <asp:DropDownList ID="PageDropDownList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PageDropDownList_SelectedIndexChanged">
                <asp:ListItem Value="10">View 10 Records</asp:ListItem>
                <asp:ListItem Value="50">View 50 Records</asp:ListItem>
                <asp:ListItem Value="100">View 100 Records</asp:ListItem>
                <asp:ListItem Value="150">View 150 Records</asp:ListItem>
                <asp:ListItem Value="10000">View All Records</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>


    <h5>Total Expense</h5>
    <asp:FormView ID="TotalFormView" runat="server" DataSourceID="TotalSQL" Width="100%">
        <ItemTemplate>
            <h3 class="alert alert-success">
                Amount:
            <asp:Label ID="AmountLabel" runat="server" Text='<%# Bind("Amount", "{0:0,0.00 TK}") %>' />
            </h3>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="TotalSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT ISNULL(SUM(Expense.Amount),0) AS Amount FROM Expense INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Expense.BenefitCategoryID like @BenefitCategoryID) AND (Expense.Is_Approved = 1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h5>Beneficiary Expense Details</h5>
    <asp:GridView ID="DetailsGridView" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="DetailsExpenseSQL" DataKeyNames="ExpenseID" AllowSorting="True" AllowPaging="True">
        <Columns>
            <asp:TemplateField HeaderText="SN">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ExpenseDate" HeaderText="Expense Date" SortExpression="ExpenseDate" DataFormatString="{0:d MMM yyyy}" />
            <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
            <asp:BoundField DataField="BeneficiaryName" HeaderText="Beneficiary Name" SortExpression="BeneficiaryName" />
            <asp:BoundField DataField="Expense_Category" HeaderText="Expense Category" SortExpression="Expense_Category" />
            <asp:BoundField DataField="ExpenseDetails" HeaderText="Expense Details" SortExpression="ExpenseDetails" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:0,0.00}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Benefit_Category" HeaderText="Benefit Category" SortExpression="Benefit_Category" />
            <asp:HyperLinkField DataNavigateUrlFields="ExpenseID" HeaderText="View" Text="View"
                DataNavigateUrlFormatString="Beneficiary_ExpenseDetails.aspx?ExpenseID={0}" />
        </Columns>
        <EmptyDataTemplate>
            No Record
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>

    <asp:SqlDataSource ID="DetailsExpenseSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Expense.ExpenseID,Expense.ExpenseDate, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Expense_Category.CategoryName AS Expense_Category, Expense.ExpenseDetails, Expense.Amount, Benefit_Category.CategoryName AS Benefit_Category FROM Expense INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID LEFT OUTER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID LEFT OUTER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Expense.BenefitCategoryID like @BenefitCategoryID) AND  (Expense.Is_Approved = 1) order by ExpenseDate">
        <SelectParameters>
            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h5>Beneficiary Wise</h5>
    <asp:GridView ID="Volunteer_WiseGridView" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="V_WiseSQL" AllowPaging="True" AllowSorting="True">
        <Columns>
             <asp:TemplateField HeaderText="SN">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
            <asp:BoundField DataField="BeneficiaryName" HeaderText="Beneficiary Name" SortExpression="BeneficiaryName" />
                       <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:0,0.00}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EmptyDataTemplate>
            No Record
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <asp:SqlDataSource ID="V_WiseSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT SUM(Expense.Amount) AS Amount, Expense.BeneficiaryID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.CaseNo FROM Expense INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000'))  AND (Expense.BenefitCategoryID like @BenefitCategoryID) AND  (Expense.Is_Approved = 1) GROUP BY Expense.BeneficiaryID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.CaseNo">
        <SelectParameters>
            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h5>Category Wise</h5>
    <asp:GridView ID="Category_WiseGridView" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="C_WiseSQL" AllowPaging="True" AllowSorting="True">
        <Columns>
             <asp:TemplateField HeaderText="SN">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
                      <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:0,0.00}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EmptyDataTemplate>
            No Record
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <asp:SqlDataSource ID="C_WiseSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT SUM(Expense.Amount) AS Amount, Expense_Category.CategoryName FROM Expense INNER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000'))  AND (Expense.BenefitCategoryID like @BenefitCategoryID) AND  (Expense.Is_Approved = 1) GROUP BY Expense_Category.CategoryName">
        <SelectParameters>
            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <script type="text/javascript">
        $(function () {
            $('.datepicker').datepicker({
                format: 'dd M yyyy',
                autoclose: true
            });

            //get date in label
            var from = $("[id*=FromDateTextBox]").val();
            var To = $("[id*=ToDateTextBox]").val();

            var tt;
            var Brases1 = "";
            var Brases2 = "";
            var A = "";
            var B = "";
            var TODate = "";

            if (To == "" || from == "" || To == "" && from == "") {
                tt = "";
                A = "";
                B = "";
            }
            else {
                tt = " To ";
                Brases1 = "(";
                Brases2 = ")";
            }

            if (To == "" && from == "") { Brases1 = ""; }

            if (To == from) {
                TODate = "";
                tt = "";
                var Brases1 = "";
                var Brases2 = "";
            }
            else { TODate = To; }

            if (from == "" && To != "") {
                B = " Before ";
            }

            if (To == "" && from != "") {
                A = " After ";
            }

            if (from != "" && To != "") {
                A = "";
                B = "";
            }


            var Category = "";
            if ($('[id*=BenefitCategory_DropDownList] :selected').index() > 0) {
                Category = " Category: " + $('[id*=BenefitCategory_DropDownList] :selected').text();
            }

            $(".Category").text(Category);
            $(".Date").text(Brases1 + B + A + from + tt + TODate + Brases2);
        });
    </script>
</asp:Content>
