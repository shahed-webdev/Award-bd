<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Stu_PayOrder.aspx.cs" Inherits="Award__bd.Beneficiary.Card.Stu_PayOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .Img_Warp .img-responsive { margin: 0 auto; }
        .img { height:150px; width:150px; border:1px solid #ddd; margin-bottom: 13px;}
        .well { background-color: #fff; }
        #Info h4 { color:#23cb02; font-size:24px;}
        #Info ul { margin:0; padding:0;}
        #Info ul li { border-bottom: 1px solid #a2a2a2; color: #5d5d5d; font-size: 20px; list-style: outside none none; padding: 6px 0; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Pay Order</h3>
    <a href="Beneficiary_List.aspx">Back To List</a>

    <div class="row">
        <div class="col-sm-6">
            <asp:FormView ID="InfoFormView" runat="server" DataSourceID="StudnetSQL" Width="100%">
                <ItemTemplate>
                    <div class="well" id="Info">
                        <div class="Img_Warp">
                            <img alt="No Image" src="/Handler/Beneficiry_Img.ashx?Img=<%#Eval("BeneficiaryID") %>" class="img-responsive img-circle img" />
                        </div>

                        <div class="text-center">
                            <h2 style="text-align: center;">CASE NO.-<%# Eval("CaseNo") %></h2>
                        </div>
                        <ul>
                            <li>Name: <%# Eval("BeneficiaryName") %></li>
                            <li>Father's Name: <%# Eval("FatherName") %></li>
                            <li>Address: <%# Eval("PresentAddress") %></li>
                            <li>Care Of: <%# Eval("Reference") %></li>
                            <li>Contact: <%# Eval("ContactNo") %></li>
                        </ul>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="StudnetSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.FatherName, Beneficiary_Info.Reference, Beneficiary_Info.ContactNo, Beneficiary_Info.PresentAddress, Beneficiary_Info.BeneficiaryID FROM Benefit_Category INNER JOIN Beneficiary_BenefitCategory ON Benefit_Category.BenefitCategoryID = Beneficiary_BenefitCategory.BenefitCategoryID RIGHT OUTER JOIN Beneficiary_Info ON Beneficiary_BenefitCategory.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Benefit_Category.CategoryName = N'Student') AND (Beneficiary_Info.BeneficiaryID = @BeneficiaryID)" UpdateCommand="UPDATE Food_Schedule_Assign SET UseBy_RegistrationID = @UseBy_RegistrationID, Is_Used = 1, UseTime = dateadd(hour,6,getutcdate()) WHERE (Food_Schedule_AssignID = @Food_Schedule_AssignID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="UseBy_RegistrationID" SessionField="RegistrationID" />
                    <asp:Parameter Name="Food_Schedule_AssignID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

        <div class="col-sm-6">
            <div class="well">
                <h4>Previous Paid Record</h4>
                <div class="table-responsive">
                    <asp:GridView ID="GridView3" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="BE_ExDSQL" DataKeyNames="ExpenseID" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="Expense_Category" HeaderText="Expense Category" SortExpression="Expense_Category" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                            <asp:BoundField DataField="ExpenseDetails" HeaderText="Expense Details" SortExpression="ExpenseDetails" />
                            <asp:BoundField DataField="ExpenseDate" HeaderText="Expense Date" SortExpression="ExpenseDate" DataFormatString="{0:d MMM yyyy}" />
                        </Columns>
                        <EmptyDataTemplate>
                            No Record
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="BE_ExDSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Expense.ExpenseID, Expense.ExpenseDate, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Expense_Category.CategoryName AS Expense_Category, Expense.ExpenseDetails, Expense.Amount, Benefit_Category.CategoryName AS Benefit_Category, Beneficiary_Info.BeneficiaryID FROM Expense INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID LEFT OUTER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID LEFT OUTER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Expense.Is_Approved = 1) AND (Beneficiary_Info.BeneficiaryID = @BeneficiaryID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="form-group">
                <label>Category</label>
                <asp:DropDownList ID="ExpenseCategoryDropDownList" runat="server" CssClass="form-control" DataSourceID="Expense_CategorySQL" DataTextField="Expense Category" DataValueField="ExpenseCategoryID"></asp:DropDownList>
                <asp:SqlDataSource ID="Expense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Expense_Category.CategoryName AS [Expense Category], Expense_Category.ExpenseCategoryID FROM Benefit_Expense_Category INNER JOIN Expense_Category ON Benefit_Expense_Category.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Beneficiary_Expense_Category ON Expense_Category.ExpenseCategoryID = Beneficiary_Expense_Category.ExpenseCategoryID INNER JOIN Benefit_Category ON Benefit_Expense_Category.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Beneficiary_Expense_Category.BeneficiaryID = @BeneficiaryID) AND (Benefit_Category.CategoryName = N'Student')">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="form-group">
                 <label>Details</label>
                <asp:TextBox ID="ExpenseDetailsTextBox" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Button ID="GenerateButton" runat="server" Text="Generate Pay Order" CssClass="btn btn-primary" OnClick="GenerateButton_Click" ValidationGroup="S" />
            </div>
        </div>
    </div>

    

    <div class="table-responsive">
        <h4>Generated Record</h4>
        <asp:GridView ID="GenerateGridView" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="GenerateSQL" DataKeyNames="Stu_PayOrderID">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="CaseNo" HeaderText="CaseNo" SortExpression="CaseNo" />
                <asp:BoundField DataField="BeneficiaryName" HeaderText="Name" SortExpression="BeneficiaryName" />
                <asp:BoundField DataField="Benefit Category" HeaderText="Benefit Category" SortExpression="Benefit Category" />
                <asp:BoundField DataField="Expense Category" HeaderText="Expense Category" SortExpression="Expense Category" />
                <asp:BoundField DataField="ExpenseDetails" HeaderText="Details" SortExpression="ExpenseDetails" />
                <asp:BoundField DataField="Insert_Date" HeaderText="Insert Date" SortExpression="Insert_Date" />
            </Columns>
            <EmptyDataTemplate>
                No Record
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="GenerateSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" DeleteCommand="DELETE FROM [Beneficiary_Stu_PayOrder] WHERE [Stu_PayOrderID] = @Stu_PayOrderID" InsertCommand="INSERT INTO Beneficiary_Stu_PayOrder(RegistrationID, ExpenseCategoryID, BenefitCategoryID, BeneficiaryID, ExpenseDetails) VALUES (@RegistrationID, @ExpenseCategoryID, (SELECT  BenefitCategoryID FROM Benefit_Category WHERE (CategoryName = N'Student')), @BeneficiaryID, @ExpenseDetails)" SelectCommand="SELECT Beneficiary_Stu_PayOrder.Stu_PayOrderID, Beneficiary_Stu_PayOrder.RegistrationID, Beneficiary_Stu_PayOrder.ExpenseCategoryID, Beneficiary_Stu_PayOrder.BenefitCategoryID, Beneficiary_Stu_PayOrder.BeneficiaryID, Beneficiary_Stu_PayOrder.ExpenseDetails, Beneficiary_Stu_PayOrder.Insert_Date, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Benefit_Category.CategoryName AS [Benefit Category], Expense_Category.CategoryName AS [Expense Category] FROM Beneficiary_Stu_PayOrder INNER JOIN Beneficiary_Info ON Beneficiary_Stu_PayOrder.BeneficiaryID = Beneficiary_Info.BeneficiaryID INNER JOIN Expense_Category ON Beneficiary_Stu_PayOrder.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Benefit_Category ON Beneficiary_Stu_PayOrder.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Beneficiary_Stu_PayOrder.BeneficiaryID = @BeneficiaryID)">
            <DeleteParameters>
                <asp:Parameter Name="Stu_PayOrderID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
                <asp:ControlParameter ControlID="ExpenseCategoryDropDownList" Name="ExpenseCategoryID" PropertyName="SelectedValue" Type="Int32" />
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" Type="Int32" />
                <asp:ControlParameter ControlID="ExpenseDetailsTextBox" Name="ExpenseDetails" PropertyName="Text" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


    <script type="text/javascript">
        $(function () {
            $('.datepicker').datepicker({
                todayHighlight: true,
                autoclose: true,
                format: 'dd M yyyy'
            });
        });
    </script>
</asp:Content>
