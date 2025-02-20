<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Food_Payment.aspx.cs" Inherits="Award__bd.Beneficiary.FoodToken.Food_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Food Payment</h3>

    <div class="form-inline">
        <div class="form-group">
            <asp:TextBox onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" ID="FromDateTextBox" placeholder="From Date" runat="server" CssClass="form-control Datetime"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" ID="ToDateTextBox" placeholder="To Date" runat="server" CssClass="form-control Datetime"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="VolunteerDropDownList" runat="server" CssClass="form-control" DataSourceID="VolunteerSQL" DataTextField="Name" DataValueField="VolunteerID" AppendDataBoundItems="True">
                <asp:ListItem Value="0">[ FOOD PROVIDER ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="VolunteerSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Volunteer.VolunteerID, Registration.RegistrationID, Registration.Name FROM Registration INNER JOIN Food_Schedule_Assign ON Registration.RegistrationID = Food_Schedule_Assign.UseBy_RegistrationID INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE  (Food_Schedule_Assign.Is_Paid = 0) AND (Food_Schedule_Assign.Is_Used = 1)" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="VolunteerDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S" />
        </div>
        <div class="form-group">
            <asp:DropDownList ID="ScheduleDropDownList" runat="server" CssClass="form-control" DataSourceID="ScheduleSQL" DataTextField="ScheduleName" DataValueField="ScheduleName" AppendDataBoundItems="True">
                <asp:ListItem Value="%">[ All Schedule ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="ScheduleSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Food_Schedule_Assign.Food_ScheduleID, Food_Schedule.ScheduleName FROM Food_Schedule_Assign INNER JOIN Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID WHERE (Food_Schedule_Assign.Is_Paid = 0) AND (Food_Schedule_Assign.Is_Used = 1)" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" ValidationGroup="S" />
        </div>
    </div>


    <div class="panel with-nav-tabs panel-info">
        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#Due" data-toggle="tab">Due Details</a></li>
                <li><a href="#Paid" data-toggle="tab">Paid Details</a></li>
            </ul>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane active" id="Due">
                    <asp:FormView ID="DueFormView" runat="server" DataSourceID="TotalDueSQL" Width="100%">
                        <ItemTemplate>
                            <div class="alert alert-danger">
                                <h4>Total Due: <%#Eval("Total_Due") %> Tk</h4>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="TotalDueSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT SUM(Food_Schedule_Assign.Amount) AS Total_Due FROM Registration INNER JOIN Food_Schedule_Assign ON Registration.RegistrationID = Food_Schedule_Assign.UseBy_RegistrationID INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID INNER JOIN Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, N'1-1-1000') AND ISNULL(@To_Date, N'1-1-3000')) AND (Food_Schedule_Assign.Is_Paid = 0) AND (Food_Schedule_Assign.Is_Used = 1) AND (Volunteer.VolunteerID = @VolunteerID) AND (Food_Schedule.ScheduleName LIKE @ScheduleName)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                            <asp:ControlParameter ControlID="VolunteerDropDownList" Name="VolunteerID" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ScheduleDropDownList" Name="ScheduleName" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <div class="table-responsive">
                        <%if (Food_AssignGridView.Rows.Count > 0)
                            {%>
                        <div class="form-inline">
                            <div class="form-group">
                                Selected Amount
                                <label id="total"></label>
                                Tk.
                            </div>
                            <div class="form-group">
                                <asp:Button ID="PayButton" runat="server" Text="Pay" CssClass="btn btn-primary" OnClick="PayButton_Click" ValidationGroup="S" />
                            </div>
                        </div>
                        <%} %>

                        <asp:GridView ID="Food_AssignGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Food_Schedule_AssignID,BeneficiaryID,UseBy_RegistrationID" DataSourceID="Food_AssignSQL">
                            <Columns>
                                <asp:TemplateField HeaderText="Select">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" " />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="SelectCheckBox" runat="server" Text=" " />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CaseNo" HeaderText="CaseNo" SortExpression="CaseNo" />
                                <asp:BoundField DataField="BeneficiaryName" HeaderText="Name" SortExpression="BeneficiaryName" />
                                <asp:BoundField DataField="ScheduleName" HeaderText="Schedule" SortExpression="ScheduleName" />
                                <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="Amount_Label" runat="server" CssClass="total_price" Text='<%# Bind("Amount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Schedule_Details" HeaderText="Details" SortExpression="Schedule_Details" />
                                <asp:BoundField DataField="UseTime" HeaderText="Given Time" SortExpression="UseTime" />
                                <asp:BoundField DataField="ActiveDate" HeaderText="Date" SortExpression="ActiveDate" DataFormatString="{0:d MMM yyyy}" />
                                <asp:BoundField DataField="UserName" HeaderText="Given By" SortExpression="UserName" />
                            </Columns>
                            <EmptyDataTemplate>
                                No Record
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="Food_AssignSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT Food_Schedule.ScheduleName, Food_Schedule.Schedule_Details, CONVERT (varchar(15), Food_Schedule.StartTime, 100) AS StartTime, CONVERT (varchar(15), Food_Schedule.EndTime, 100) AS EndTime, Food_Schedule_Assign.ActiveDate, Beneficiary_Info.CaseNo, Food_Schedule_Assign.Food_Schedule_AssignID, Food_Schedule.Food_ScheduleID, Beneficiary_Info.BeneficiaryID, Beneficiary_Info.BeneficiaryName, Food_Schedule_Assign.Amount, CONVERT (varchar(15), Food_Schedule_Assign.UseTime, 100) AS UseTime, Volunteer.VolunteerID, Registration.UserName, Food_Schedule_Assign.UseBy_RegistrationID FROM Registration INNER JOIN Food_Schedule_Assign INNER JOIN Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID INNER JOIN Beneficiary_Info ON Food_Schedule_Assign.BeneficiaryID = Beneficiary_Info.BeneficiaryID ON Registration.RegistrationID = Food_Schedule_Assign.UseBy_RegistrationID INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Food_Schedule_Assign.Is_Paid = 0) AND (Food_Schedule_Assign.Is_Used = 1) AND (Volunteer.VolunteerID = @VolunteerID)" CancelSelectOnNullParameter="False" UpdateCommand="UPDATE Food_Schedule_Assign SET Is_Paid = 1 WHERE (Food_Schedule_AssignID = @Food_Schedule_AssignID)"
                            FilterExpression="ScheduleName like '{0}'">
                            <FilterParameters>
                                <asp:ControlParameter Name="ScheduleName" ControlID="ScheduleDropDownList" PropertyName="SelectedValue" />
                            </FilterParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="VolunteerDropDownList" Name="VolunteerID" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Food_Schedule_AssignID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>

                    <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Expense(RegistrationID, VolunteerID, ExpenseCategoryID, Amount, ExpenseDate, BenefitCategoryID, Is_Approved, Approved_By_RegistrationID, Approved_Date) VALUES (@RegistrationID, @VolunteerID, @ExpenseCategoryID, @Amount, dateadd(hour,6,getutcdate()), @BenefitCategoryID, 1, @RegistrationID, dateadd(hour,6,getutcdate()))" SelectCommand="SELECT * FROM [Expense] ">
                        <InsertParameters>
                            <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
                            <asp:ControlParameter ControlID="VolunteerDropDownList" Name="VolunteerID" PropertyName="SelectedValue" />
                            <asp:Parameter Name="ExpenseCategoryID" Type="Int32" />
                            <asp:Parameter Name="Amount" Type="Double" />
                            <asp:Parameter Name="BenefitCategoryID" />
                        </InsertParameters>
                    </asp:SqlDataSource>

                </div>
                <div class="tab-pane" id="Paid">
                    <div class="form-inline NoPrint">
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

                    <div class="table-responsive">
                        <asp:FormView ID="PaidFormView" runat="server" DataSourceID="TotalPaidSQL" Width="100%">
                            <ItemTemplate>
                                <div class="alert alert-success">
                                    <h4>Total Paid: <%#Eval("Total_Paid") %> Tk</h4>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="TotalPaidSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT SUM(Food_Schedule_Assign.Amount) AS Total_Paid FROM Registration INNER JOIN Food_Schedule_Assign ON Registration.RegistrationID = Food_Schedule_Assign.UseBy_RegistrationID INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID INNER JOIN Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, N'1-1-1000') AND ISNULL(@To_Date, N'1-1-3000')) AND (Food_Schedule_Assign.Is_Paid = 1) AND (Food_Schedule_Assign.Is_Used = 1) AND (Volunteer.VolunteerID = @VolunteerID) AND (Food_Schedule.ScheduleName LIKE @ScheduleName)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="VolunteerDropDownList" Name="VolunteerID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ScheduleDropDownList" Name="ScheduleName" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:GridView ID="PaidGridView" runat="server" AutoGenerateColumns="False" AllowPaging="true" CssClass="mGrid" DataKeyNames="Food_Schedule_AssignID,BeneficiaryID,UseBy_RegistrationID" DataSourceID="PaidSQL">
                            <Columns>
                                <asp:TemplateField HeaderText="SN.">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CaseNo" HeaderText="CaseNo" SortExpression="CaseNo" />
                                <asp:BoundField DataField="BeneficiaryName" HeaderText="Name" SortExpression="BeneficiaryName" />
                                <asp:BoundField DataField="ScheduleName" HeaderText="Schedule" SortExpression="ScheduleName" />
                                <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                    <FooterTemplate>
                                        <label id="total0"></label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Amount_Label0" runat="server" CssClass="total_price" Text='<%# Bind("Amount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Schedule_Details" HeaderText="Details" SortExpression="Schedule_Details" />
                                <asp:BoundField DataField="UseTime" HeaderText="Given Time" SortExpression="UseTime" />
                                <asp:BoundField DataField="ActiveDate" HeaderText="Date" SortExpression="ActiveDate" DataFormatString="{0:d MMM yyyy}" />
                            </Columns>
                            <EmptyDataTemplate>
                                No Paid Record
                            </EmptyDataTemplate>
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="PaidSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT Food_Schedule.ScheduleName, Food_Schedule.Schedule_Details, CONVERT (varchar(15), Food_Schedule.StartTime, 100) AS StartTime, CONVERT (varchar(15), Food_Schedule.EndTime, 100) AS EndTime, Food_Schedule_Assign.ActiveDate, Beneficiary_Info.CaseNo, Food_Schedule_Assign.Food_Schedule_AssignID, Food_Schedule.Food_ScheduleID, Beneficiary_Info.BeneficiaryID, Beneficiary_Info.BeneficiaryName, Food_Schedule_Assign.Amount, CONVERT (varchar(15), Food_Schedule_Assign.UseTime, 100) AS UseTime, Volunteer.VolunteerID, Registration.UserName, Food_Schedule_Assign.UseBy_RegistrationID FROM Registration INNER JOIN Food_Schedule_Assign INNER JOIN Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID INNER JOIN Beneficiary_Info ON Food_Schedule_Assign.BeneficiaryID = Beneficiary_Info.BeneficiaryID ON Registration.RegistrationID = Food_Schedule_Assign.UseBy_RegistrationID INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Food_Schedule_Assign.Is_Paid = 1) AND (Food_Schedule_Assign.Is_Used = 1) AND (Volunteer.VolunteerID = @VolunteerID)" CancelSelectOnNullParameter="False" UpdateCommand="UPDATE Food_Schedule_Assign SET Is_Paid = 1 WHERE (Food_Schedule_AssignID = @Food_Schedule_AssignID)"
                            FilterExpression="ScheduleName like '{0}'">
                            <FilterParameters>
                                <asp:ControlParameter Name="ScheduleName" ControlID="ScheduleDropDownList" PropertyName="SelectedValue" />
                            </FilterParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="VolunteerDropDownList" Name="VolunteerID" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Food_Schedule_AssignID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        //Check Time
        $(function () {
            $(".Datetime").datepicker({
                format: 'dd M yyyy',
                todayBtn: "linked",
                todayHighlight: true,
                autoclose: true
            });

            $("[id*=SelectAllCheckBox]").on("click", function () {
                var a = $(this), b = $(this).closest("table");
                $("input[type=checkbox]", b).each(function () {
                    a.is(":checked") ? ($(this).attr("checked", "checked"), $("td", $(this).closest("tr")).addClass("selected")) : ($(this).removeAttr("checked"), $("td", $(this).closest("tr")).removeClass("selected"));
                });
                getTotalPrice();
            });

            $("[id*=SelectCheckBox]").on("click", function () {
                var a = $(this).closest("table"), b = $("[id*=chkHeader]", a);
                $(this).is(":checked") ? ($("td", $(this).closest("tr")).addClass("selected"), $("[id*=chkRow]", a).length == $("[id*=chkRow]:checked", a).length && b.attr("checked", "checked")) : ($("td", $(this).closest("tr")).removeClass("selected"), b.removeAttr("checked"));
                getTotalPrice();
            });
        });

        function getTotalPrice() {
            var total = 0;
            $(".total_price").each(function () {
                var val = $(this).text();
                if ($("[id*=SelectCheckBox]", $(this).closest("tr")).is(":checked")) {
                    total += isNaN(val) || $.trim(val) == "" ? 0 : parseFloat(val);
                }
            });
            $("#total").text(total.toFixed(2));
        }


        function isNumberKey(a) { a = a.which ? a.which : event.keyCode; return 46 != a && 31 < a && (48 > a || 57 < a) ? !1 : !0 };
    </script>
</asp:Content>
