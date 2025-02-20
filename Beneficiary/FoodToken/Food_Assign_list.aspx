<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Food_Assign_list.aspx.cs" Inherits="Award__bd.Beneficiary.FoodToken.Food_Assign_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Assigned List</h3>

    <div class="form-inline">
        <div class="form-group">
            <asp:TextBox onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" ID="FromDateTextBox" placeholder="From Date" runat="server" CssClass="form-control Datetime"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" ID="ToDateTextBox" placeholder="To Date" runat="server" CssClass="form-control Datetime"></asp:TextBox>
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

    <div class="alert alert-success">
        <h4 id="count-user" style="margin-bottom: 0"></h4>
    </div>

    <div class="table-responsive">
        <asp:GridView ID="Food_AssignGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Food_Schedule_AssignID,Food_ScheduleID,BeneficiaryID" DataSourceID="Food_AssignSQL" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="CaseNo" HeaderText="CaseNo" SortExpression="CaseNo" />
                <asp:BoundField DataField="BeneficiaryName" HeaderText="Name" SortExpression="BeneficiaryName" />
                <asp:BoundField DataField="ScheduleName" HeaderText="Schedule" SortExpression="ScheduleName" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                <asp:BoundField DataField="Schedule_Details" HeaderText="Details" SortExpression="Schedule_Details" />
                <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" />
                <asp:BoundField DataField="EndTime" HeaderText="End Time" SortExpression="EndTime" />
                <asp:BoundField DataField="ActiveDate" HeaderText="Date" SortExpression="ActiveDate" DataFormatString="{0:d MMM yyyy}" />
                <asp:TemplateField HeaderText="Used" SortExpression="Is_Used">
                    <ItemTemplate>
                        <asp:CheckBox ID="UsedCheckBox" runat="server" Checked='<%# Bind("Is_Used") %>' Text=" " Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>
        <asp:SqlDataSource ID="Food_AssignSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT Food_Schedule.ScheduleName, Food_Schedule.Schedule_Details, CONVERT (varchar(15), Food_Schedule.StartTime, 100) AS StartTime, CONVERT (varchar(15), Food_Schedule.EndTime, 100) AS EndTime, Food_Schedule_Assign.ActiveDate, Beneficiary_Info.CaseNo, Food_Schedule_Assign.Is_Valid, Food_Schedule_Assign.Is_Used, Food_Schedule_Assign.Food_Schedule_AssignID, Food_Schedule.Food_ScheduleID, Beneficiary_Info.BeneficiaryID, Beneficiary_Info.BeneficiaryName, Food_Schedule_Assign.Amount FROM Food_Schedule_Assign INNER JOIN Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID INNER JOIN Beneficiary_Info ON Food_Schedule_Assign.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000'))" CancelSelectOnNullParameter="False">
            <SelectParameters>
                <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
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

            $("#count-user").text("Total: " + $("[id*=Food_AssignGridView] tr").length + " Record(s)");
        });

        function isNumberKey(a) { a = a.which ? a.which : event.keyCode; return 46 != a && 31 < a && (48 > a || 57 < a) ? !1 : !0 };
    </script>
</asp:Content>
