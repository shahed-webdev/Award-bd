<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Category_Report.aspx.cs" Inherits="Award__bd.Accounts.Expense.Category_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Grandtotal {
            background-color: #ddd;
            color: #000;
            font-weight: bold;
        }

        .sub_Head {
            margin: 5px 0;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Benifit Category Report.
        <label class="Date"></label>
    </h3>

    <asp:CheckBoxList ID="CategoryCheckBoxList" CssClass="NoPrint" runat="server" DataSourceID="CategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" RepeatDirection="Horizontal">
    </asp:CheckBoxList>
    <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Benefit_Category]"></asp:SqlDataSource>

    <div class="form-inline NoPrint">
        <div class="form-group">
            <asp:TextBox ID="FromDateTextBox" placeholder="From Date" runat="server" CssClass="form-control datepicker"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="ToDateTextBox" placeholder="To Date" runat="server" CssClass="form-control datepicker"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" OnClick="FindButton_Click" />
        </div>
        <div class="form-group pull-right">
            <button type="button" class="btn btn-default btn-sm" onclick="window.print();">
                <span class="glyphicon glyphicon-print"></span>
                Print
            </button>
        </div>
    </div>

    <div class="sub_Head">
        <label id="B_Category"></label>
    </div>

    <asp:GridView ID="Previous_C_WiseGridView" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="Previous_C_WiseSQL" PageSize="500" AllowSorting="True" ShowFooter="True">
        <Columns>
            <asp:TemplateField HeaderText="SN">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
                <FooterTemplate>
                    <strong>Total:</strong>
                </FooterTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:BoundField DataField="CategoryName" HeaderText="Expense Category" SortExpression="CategoryName">
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Previous Amount" SortExpression="PreviousAmount">
                <ItemTemplate>
                    <asp:Label ID="PreviousAmountLabel" runat="server" Text='<%# Bind("PreviousAmount", "{0:n2}") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="TotalPrevAmount" runat="server" Font-Bold="True"></asp:Label>
                </FooterTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                <FooterStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                <ItemTemplate>
                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Bind("Amount", "{0:n2}") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="TotalAmount" runat="server" Font-Bold="True"></asp:Label>
                </FooterTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                <FooterStyle HorizontalAlign="Right" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            No Record
        </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCCCC" />
    </asp:GridView>
    <asp:SqlDataSource ID="Previous_C_WiseSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT ISNULL(Main_T.Amount, 0) AS Amount, ISNULL(Prev_T.PreviousAmount, 0) AS PreviousAmount, ISNULL(Main_T.CategoryName, Prev_T.CategoryName) AS CategoryName FROM (SELECT SUM(Expense_1.Amount) AS Amount, Expense_Category_1.CategoryName FROM Expense AS Expense_1 INNER JOIN Expense_Category AS Expense_Category_1 ON Expense_1.ExpenseCategoryID = Expense_Category_1.ExpenseCategoryID WHERE (Expense_1.Is_Approved = 1) AND (Expense_1.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Expense_1.BenefitCategoryID IN (SELECT id FROM dbo.In_Function_Parameter(@BenefitCategoryID) AS In_Function_Parameter_1)) GROUP BY Expense_Category_1.CategoryName) AS Main_T FULL OUTER JOIN (SELECT SUM(Expense_1.Amount) AS PreviousAmount, Expense_Category_1.CategoryName FROM Expense AS Expense_1 INNER JOIN Expense_Category AS Expense_Category_1 ON Expense_1.ExpenseCategoryID = Expense_Category_1.ExpenseCategoryID WHERE (Expense_1.Is_Approved = 1) AND (Expense_1.ExpenseDate BETWEEN @PrevFrom_Date AND @PrevTo_Date) AND (Expense_1.BenefitCategoryID IN (SELECT id FROM dbo.In_Function_Parameter(@BenefitCategoryID) AS In_Function_Parameter_1)) GROUP BY Expense_Category_1.CategoryName) AS Prev_T ON Main_T.CategoryName = Prev_T.CategoryName">
        <SelectParameters>
            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
            <asp:Parameter Name="BenefitCategoryID" />
            <asp:Parameter Name="PrevFrom_Date" />
            <asp:Parameter Name="PrevTo_Date" />
        </SelectParameters>
    </asp:SqlDataSource>


    <%if (V_GridView.Rows.Count > 0)
        {%>
    <div class="sub_Head">Volunteer Expense Category</div>
    <asp:GridView ID="V_GridView" runat="server" CssClass="mGrid" OnRowDataBound="V_GridView_RowDataBound"></asp:GridView>
    <%} %>

    <asp:SqlDataSource ID="V_SQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT        Volunteer.VolunteerID, Registration.UserName, Registration.Name, SUM(Expense.Amount) AS Amount
FROM            Expense INNER JOIN
                         Volunteer ON Expense.VolunteerID = Volunteer.VolunteerID INNER JOIN
                         Registration ON Volunteer.Volunteer_RegistrationID = Registration.RegistrationID
WHERE        (Expense.Is_Approved = 1) AND (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Expense.BenefitCategoryID IN
                             (SELECT        id
                               FROM            dbo.In_Function_Parameter(@BenefitCategoryID) AS In_Function_Parameter_1))
GROUP BY Registration.UserName, Volunteer.VolunteerID, Registration.Name">
        <SelectParameters>
            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
            <asp:Parameter Name="BenefitCategoryID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="V_C_SQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT        Expense.ExpenseCategoryID, Expense_Category.CategoryName, SUM(Expense.Amount) AS Amount
FROM            Expense INNER JOIN
                         Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN
                         Volunteer ON Expense.VolunteerID = Volunteer.VolunteerID
WHERE        (Expense.Is_Approved = 1) AND (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Expense.BenefitCategoryID IN
                             (SELECT        id
                               FROM            dbo.In_Function_Parameter(@BenefitCategoryID) AS In_Function_Parameter_1))
GROUP BY Expense_Category.CategoryName, Expense.ExpenseCategoryID"
        CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
            <asp:Parameter Name="BenefitCategoryID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="V_wiseC_SQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT        Volunteer.VolunteerID, Registration.UserName, Registration.Name, SUM(Expense.Amount) AS Amount
FROM            Expense INNER JOIN
                         Volunteer ON Expense.VolunteerID = Volunteer.VolunteerID INNER JOIN
                         Registration ON Volunteer.Volunteer_RegistrationID = Registration.RegistrationID
WHERE        (Expense.Is_Approved = 1) AND (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Expense.BenefitCategoryID IN
                             (SELECT        id
                               FROM            dbo.In_Function_Parameter(@BenefitCategoryID) AS In_Function_Parameter_1)) AND (Expense.ExpenseCategoryID = @ExpenseCategoryID)
GROUP BY Registration.UserName, Registration.Name, Volunteer.VolunteerID"
        CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
            <asp:Parameter Name="BenefitCategoryID" />
            <asp:Parameter Name="ExpenseCategoryID" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <div class="text-right"><asp:Label ID="V_Category_Label" runat="server" Font-Bold="True"></asp:Label></div>
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

            $(".Date").text(Brases1 + B + A + from + tt + TODate + Brases2);

            //Get text of selected items
            var selected_Text = [];
            $("[id*=CategoryCheckBoxList] input:checked").each(function () {
                selected_Text.push($(this).next().html());
            });

            $('#B_Category').text(selected_Text);
        });
    </script>
</asp:Content>
