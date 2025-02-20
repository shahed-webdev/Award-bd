<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="PaymemtRecord.aspx.cs" Inherits="Award__bd.Beneficiary.FoodToken.PaymemtRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /*Panel tabs*/
        .nav-tabs { border-bottom: none; }
        .nav-tabs > li > a { color: #333; }
        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus { color: #000; font-weight: bold; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Payment Recoard</h3>

    <div class="form-inline">
        <div class="form-group">
            <asp:TextBox onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" ID="FromDateTextBox" placeholder="From Date" runat="server" CssClass="form-control Datetime"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" ID="ToDateTextBox" placeholder="To Date" runat="server" CssClass="form-control Datetime"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" ValidationGroup="S" />
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

    <div class="panel panel-default">
        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#Paid" data-toggle="tab">Paid Details</a></li>
                <li><a href="#Due" data-toggle="tab">Due Details</a></li>
            </ul>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane active" id="Paid">
                    <div class="table-responsive">
                        <asp:FormView ID="PaidFormView" runat="server" DataSourceID="TotalPaidSQL" Width="100%">
                            <ItemTemplate>
                                <div class="alert alert-success">
                                    <h4>Total Paid: <%#Eval("Total_Paid") %> Tk</h4>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="TotalPaidSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT SUM(Food_Schedule_Assign.Amount) AS Total_Paid FROM Registration INNER JOIN Food_Schedule_Assign ON Registration.RegistrationID = Food_Schedule_Assign.UseBy_RegistrationID INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Food_Schedule_Assign.Is_Paid = 1) AND (Food_Schedule_Assign.Is_Used = 1) AND (Volunteer.VolunteerID = @VolunteerID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                                <asp:SessionParameter Name="VolunteerID" SessionField="VolunteerID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="PaidGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Food_Schedule_AssignID,BeneficiaryID,UseBy_RegistrationID" DataSourceID="PaidSQL" AllowPaging="True">
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
                        <asp:SqlDataSource ID="PaidSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT Food_Schedule.ScheduleName, Food_Schedule.Schedule_Details, CONVERT (varchar(15), Food_Schedule.StartTime, 100) AS StartTime, CONVERT (varchar(15), Food_Schedule.EndTime, 100) AS EndTime, Food_Schedule_Assign.ActiveDate, Beneficiary_Info.CaseNo, Food_Schedule_Assign.Food_Schedule_AssignID, Food_Schedule.Food_ScheduleID, Beneficiary_Info.BeneficiaryID, Beneficiary_Info.BeneficiaryName, Food_Schedule_Assign.Amount, CONVERT (varchar(15), Food_Schedule_Assign.UseTime, 100) AS UseTime, Volunteer.VolunteerID, Registration.UserName, Food_Schedule_Assign.UseBy_RegistrationID FROM Registration INNER JOIN Food_Schedule_Assign INNER JOIN Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID INNER JOIN Beneficiary_Info ON Food_Schedule_Assign.BeneficiaryID = Beneficiary_Info.BeneficiaryID ON Registration.RegistrationID = Food_Schedule_Assign.UseBy_RegistrationID INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Food_Schedule_Assign.Is_Paid = 1) AND (Food_Schedule_Assign.Is_Used = 1) AND (Volunteer.VolunteerID = @VolunteerID)" CancelSelectOnNullParameter="False" UpdateCommand="UPDATE Food_Schedule_Assign SET Is_Paid = 1 WHERE (Food_Schedule_AssignID = @Food_Schedule_AssignID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                                <asp:SessionParameter Name="VolunteerID" SessionField="VolunteerID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Food_Schedule_AssignID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="tab-pane" id="Due">
                    <div class="table-responsive">
                        <asp:FormView ID="DueFormView" runat="server" DataSourceID="TotalDueSQL" Width="100%">
                            <ItemTemplate>
                                <div class="alert alert-danger">
                                    <h4>Total Due: <%#Eval("Total_Due") %> Tk</h4>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="TotalDueSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT SUM(Food_Schedule_Assign.Amount) AS Total_Due FROM Registration INNER JOIN Food_Schedule_Assign ON Registration.RegistrationID = Food_Schedule_Assign.UseBy_RegistrationID INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Food_Schedule_Assign.Is_Paid = 0) AND (Food_Schedule_Assign.Is_Used = 1) AND (Volunteer.VolunteerID = @VolunteerID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                                <asp:SessionParameter Name="VolunteerID" SessionField="VolunteerID" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:GridView ID="DueGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Food_Schedule_AssignID,BeneficiaryID,UseBy_RegistrationID" DataSourceID="DueSQL" AllowPaging="True">
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
                                        <label id="total"></label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Amount_Label" runat="server" CssClass="total_price" Text='<%# Bind("Amount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Schedule_Details" HeaderText="Details" SortExpression="Schedule_Details" />
                                <asp:BoundField DataField="UseTime" HeaderText="Given Time" SortExpression="UseTime" />
                                <asp:BoundField DataField="ActiveDate" HeaderText="Date" SortExpression="ActiveDate" DataFormatString="{0:d MMM yyyy}" />
                            </Columns>
                            <EmptyDataTemplate>
                                No Due Record
                            </EmptyDataTemplate>
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="DueSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT Food_Schedule.ScheduleName, Food_Schedule.Schedule_Details, CONVERT (varchar(15), Food_Schedule.StartTime, 100) AS StartTime, CONVERT (varchar(15), Food_Schedule.EndTime, 100) AS EndTime, Food_Schedule_Assign.ActiveDate, Beneficiary_Info.CaseNo, Food_Schedule_Assign.Food_Schedule_AssignID, Food_Schedule.Food_ScheduleID, Beneficiary_Info.BeneficiaryID, Beneficiary_Info.BeneficiaryName, Food_Schedule_Assign.Amount, CONVERT (varchar(15), Food_Schedule_Assign.UseTime, 100) AS UseTime, Volunteer.VolunteerID, Registration.UserName, Food_Schedule_Assign.UseBy_RegistrationID FROM Registration INNER JOIN Food_Schedule_Assign INNER JOIN Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID INNER JOIN Beneficiary_Info ON Food_Schedule_Assign.BeneficiaryID = Beneficiary_Info.BeneficiaryID ON Registration.RegistrationID = Food_Schedule_Assign.UseBy_RegistrationID INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000')) AND (Food_Schedule_Assign.Is_Paid = 0) AND (Food_Schedule_Assign.Is_Used = 1) AND (Volunteer.VolunteerID = @VolunteerID)" CancelSelectOnNullParameter="False" UpdateCommand="UPDATE Food_Schedule_Assign SET Is_Paid = 1 WHERE (Food_Schedule_AssignID = @Food_Schedule_AssignID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                                <asp:SessionParameter Name="VolunteerID" SessionField="VolunteerID" />
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
        $(function () {
            $(".Datetime").datepicker({
                format: 'dd M yyyy',
                todayBtn: "linked",
                todayHighlight: true,
                autoclose: true
            });
        });
    </script>
</asp:Content>
