<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Food_Schedule.aspx.cs" Inherits="Award__bd.Beneficiary.FoodToken.Food_Schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Time_Error, #Time_Error2 { color: red; font-size: 14px; font-weight: normal; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Food Schedule</h3>

    <div class="panel panel-info">
        <div class="panel-heading Head">
            <div class="pull-left">
                <h4>Schedule</h4>
            </div>
            <div class="pull-right">
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Create Schedule</button>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="panel-body">
            <div class="table-responsive">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="ScheduleGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Food_ScheduleID" DataSourceID="Shc_SQL" AllowSorting="True">
                            <Columns>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="SelectCheckBox" runat="server" Text=" " />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="UpdateLinkButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Schedule" SortExpression="ScheduleName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("ScheduleName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ScheduleName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" CssClass="form-control" onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="SH_Amount_Label" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Start Time" SortExpression="StartTime">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Ed_Start_TextBox" CssClass="form-control Ed_Ch" runat="server" Text='<%# Bind("StartTime") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("StartTime") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="End Time" SortExpression="EndTime">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Ed_End_TextBox" CssClass="form-control Ed_Ch" runat="server" Text='<%# Bind("EndTime") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("EndTime") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Details" SortExpression="Schedule_Details">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("Schedule_Details") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Schedule_Details") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="Shc_SQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" DeleteCommand="IF NOT EXISTS (SELECT * FROM Food_Schedule_Assign WHERE (Food_ScheduleID = @Food_ScheduleID))
BEGIN
DELETE FROM [Food_Schedule] WHERE [Food_ScheduleID] = @Food_ScheduleID
END"
                            SelectCommand="SELECT Food_ScheduleID, ScheduleName, RegistrationID, Insert_Date, CONVERT (varchar(15), StartTime, 100) AS StartTime, CONVERT (varchar(15), EndTime, 100) AS EndTime, Schedule_Details, Amount FROM Food_Schedule" UpdateCommand="IF NOT EXISTS (SELECT * FROM Food_Schedule WHERE (ScheduleName = @ScheduleName) AND (Food_ScheduleID &lt;&gt; @Food_ScheduleID))
BEGIN
UPDATE Food_Schedule SET ScheduleName = @ScheduleName, StartTime = @StartTime, EndTime = @EndTime,Schedule_Details =@Schedule_Details, Amount = @Amount WHERE (Food_ScheduleID = @Food_ScheduleID)
END">
                            <DeleteParameters>
                                <asp:Parameter Name="Food_ScheduleID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ScheduleName" Type="String" />
                                <asp:Parameter Name="Food_ScheduleID" Type="Int32" />
                                <asp:Parameter Name="StartTime" />
                                <asp:Parameter Name="EndTime" />
                                <asp:Parameter Name="Schedule_Details" />
                                <asp:Parameter Name="Amount" Type="Double" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <label id="Time_Error2"></label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <div class="panel panel-success">
        <div class="panel-heading Head">
            <h4>Autistic List</h4>
        </div>

        <div class="panel-body">
            <div class="form-inline">
                <div class="form-group">
                    <asp:TextBox ID="Find_TextBox" placeholder="Case No." runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="Find_Button" runat="server" CssClass="btn btn-primary" Text="Find" />
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

            <div class="table-responsive">
                <asp:GridView ID="BeneficiaryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryID" DataSourceID="BeneficiarySQL" AllowSorting="True" AllowPaging="True">
                    <Columns>
                        <asp:TemplateField HeaderText="Select">
                            <HeaderTemplate>
                                <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" " />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="SelectCheckBox" runat="server" Text=" " />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CaseNo" HeaderText="Case No." ReadOnly="True" SortExpression="CaseNo" />
                        <asp:BoundField DataField="BeneficiaryName" HeaderText="Name" SortExpression="BeneficiaryName" />
                        <asp:BoundField DataField="FatherName" HeaderText="Father Name" SortExpression="FatherName" />
                        <asp:BoundField DataField="ContactNo" HeaderText="Contact" SortExpression="ContactNo" />
                    </Columns>
                    <EmptyDataTemplate>
                        No Records
                    </EmptyDataTemplate>
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>
                <asp:SqlDataSource ID="BeneficiarySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.FatherName, Beneficiary_Info.ContactNo, Beneficiary_Info.CaseNo AS C_SN, CAST(Beneficiary_Info.CaseNo AS nvarchar(50)) AS CaseNo FROM Beneficiary_Info LEFT OUTER JOIN Benefit_Category INNER JOIN Beneficiary_BenefitCategory ON Benefit_Category.BenefitCategoryID = Beneficiary_BenefitCategory.BenefitCategoryID ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID WHERE (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Benefit_Category.CategoryName = N'Neuro') ORDER BY C_SN"
                    FilterExpression="BeneficiaryName LIKE '{0}%' or ContactNo LIKE '{0}%' or CaseNo LIKE '{0}%'" CancelSelectOnNullParameter="False">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="Find_TextBox" Name="Find" PropertyName="Text" />
                    </FilterParameters>
                </asp:SqlDataSource>
                <asp:CustomValidator ID="CV" runat="server" ClientValidationFunction="Validate" ErrorMessage="You do not select any Autistic" ForeColor="Red" ValidationGroup="Sub"></asp:CustomValidator>
            </div>

            <div class="form-inline">
                <div class="form-group">
                    <asp:TextBox onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" ID="FromDateTextBox" placeholder="From Date" runat="server" CssClass="form-control Datetime"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="FromDateTextBox" CssClass="EroorStar" ValidationGroup="Sub"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:TextBox onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" ID="ToDateTextBox" placeholder="To Date" runat="server" CssClass="form-control Datetime"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="ToDateTextBox" CssClass="EroorStar" ValidationGroup="Sub"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:SqlDataSource ID="In_De_SQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" DeleteCommand="DELETE FROM Food_Schedule_Assign WHERE (Food_ScheduleID = @Food_ScheduleID) AND (BeneficiaryID = @BeneficiaryID) AND (ActiveDate = @ActiveDate) AND (Is_Used = 0)" InsertCommand="IF NOT EXISTS (SELECT  * FROM   Food_Schedule_Assign WHERE (Food_ScheduleID = @Food_ScheduleID) AND (BeneficiaryID = @BeneficiaryID) AND (ActiveDate = @ActiveDate))
BEGIN
INSERT INTO Food_Schedule_Assign
                         (Food_ScheduleID, RegistrationID, BeneficiaryID, ActiveDate,Amount)
VALUES        (@Food_ScheduleID,@RegistrationID,@BeneficiaryID,@ActiveDate,@Amount)
END"
                        SelectCommand="SELECT Food_ScheduleID FROM Food_Schedule">
                        <DeleteParameters>
                            <asp:Parameter Name="Food_ScheduleID" />
                            <asp:Parameter Name="BeneficiaryID" />
                            <asp:Parameter Name="ActiveDate" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Food_ScheduleID" />
                            <asp:Parameter Name="BeneficiaryID" />
                            <asp:Parameter Name="ActiveDate" />
                            <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
                            <asp:Parameter Name="Amount" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="SUbmit_Button" runat="server" CssClass="btn btn-primary" Text="Assign" OnClick="SUbmit_Button_Click" ValidationGroup="Sub" />
                    <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-primary" Text="Delete" OnClick="DeleteButton_Click" ValidationGroup="Sub" />
                </div>

                <asp:CustomValidator ID="ScheduleCV" runat="server" ClientValidationFunction="Validate2" ErrorMessage="You do not select any Schedule" ForeColor="Red" ValidationGroup="Sub"></asp:CustomValidator>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Food Schedule</h4>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>
                                    Schedule Name
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" CssClass="EroorStar" ControlToValidate="Schedule_NameTextBox" ValidationGroup="Ad"></asp:RequiredFieldValidator>
                                </label>
                                <asp:TextBox ID="Schedule_NameTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>
                                    Amount
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" CssClass="EroorStar" ControlToValidate="AmountTextBox" ValidationGroup="Ad"></asp:RequiredFieldValidator>
                                </label>
                                <asp:TextBox ID="AmountTextBox" onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Schedule Details</label>
                                <asp:TextBox ID="DetailsTextBox" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>
                                    Start Time<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Start_TextBox" CssClass="EroorStar" ErrorMessage="Required" ValidationGroup="Ad"></asp:RequiredFieldValidator>
                                </label>
                                &nbsp;<asp:TextBox ID="Start_TextBox" CssClass="form-control timepicker" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>
                                    End Time<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="End_TextBox" CssClass="EroorStar" ErrorMessage="Required" ValidationGroup="Ad"></asp:RequiredFieldValidator>
                                </label>
                                &nbsp;<asp:TextBox ID="End_TextBox" CssClass="form-control timepicker" runat="server"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <asp:Button ID="Add_Schedule_Button" runat="server" CssClass="btn btn-success" Text="Add" OnClick="Add_Schedule_Button_Click" ValidationGroup="Ad" />
                                <asp:SqlDataSource ID="Add_SQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>"
                                    InsertCommand="IF NOT EXISTS (SELECT * FROM Food_Schedule WHERE (ScheduleName = @ScheduleName))
BEGIN
INSERT INTO Food_Schedule(ScheduleName,Schedule_Details, RegistrationID, StartTime, EndTime,Amount) VALUES (@ScheduleName,@Schedule_Details, @RegistrationID, @StartTime, @EndTime,@Amount)
END"
                                    SelectCommand="SELECT Food_ScheduleID, ScheduleName, RegistrationID, Insert_Date, CONVERT (varchar(15), StartTime, 100) AS StartTime, CONVERT (varchar(15), EndTime, 100) AS EndTime, Schedule_Details, Amount FROM Food_Schedule">
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="Schedule_NameTextBox" Name="ScheduleName" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="Start_TextBox" Name="StartTime" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="End_TextBox" Name="EndTime" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="DetailsTextBox" Name="Schedule_Details" PropertyName="Text" />
                                        <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
                                        <asp:ControlParameter ControlID="AmountTextBox" Name="Amount" PropertyName="Text" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                                <label class="Time_Error"></label>
                            </div>

                            <asp:GridView ID="PopupGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Food_ScheduleID" DataSourceID="Add_SQL" AllowSorting="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="Schedule" SortExpression="ScheduleName">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ScheduleName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Start Time" SortExpression="StartTime">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("StartTime") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="End Time" SortExpression="EndTime">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("EndTime") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Details" SortExpression="Schedule_Details">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Schedule_Details") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <asp:UpdateProgress ID="UpdateProgress" runat="server">
            <ProgressTemplate>
                <div id="progress_BG"></div>
                <div id="progress">
                    <img src="/CSS/Image/loading.gif" alt="Loading..." />
                    <br />
                    <b>Loading...</b>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="progress_BG"></div>
            <div id="progress">
                <img src="/CSS/Image/loading.gif" alt="Loading..." />
                <br />
                <b>Loading...</b>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <script src="/JS/Timepicker/bootstrap-timepicker.js"></script>
    <link href="/JS/Timepicker/Time_Picker.css" rel="stylesheet" />

    <script type="text/javascript">
        //Check Time
        $(function () {
            $(".Datetime").datepicker({
                format: 'dd M yyyy',
                todayBtn: "linked",
                todayHighlight: true,
                autoclose: true
            });

            $('.timepicker').timepicker({
                minuteStep: 1,
            });

            $('.timepicker').change(function () {
                var start_time = $("[id*=Start_TextBox]").val();
                var end_time = $("[id*=End_TextBox]").val();

                //convert both time into timestamp
                var stt = new Date("August 8, 2017 " + start_time);
                stt = stt.getTime();

                var endt = new Date("August 8, 2017 " + end_time);
                endt = endt.getTime();

                if (stt > endt) {
                    $(".Time_Error").text('The End Time must be later than the Start Time.');
                    $("[id*=Add_Schedule_Button]").attr('disabled', true);
                }
                else {
                    $(".Time_Error").text("");
                    $("[id*=Add_Schedule_Button]").attr('disabled', false);
                }
            });

            $("[id*=SelectAllCheckBox]").on("click", function () {
                var a = $(this), b = $(this).closest("table");
                $("input[type=checkbox]", b).each(function () {
                    a.is(":checked") ? ($(this).attr("checked", "checked"), $("td", $(this).closest("tr")).addClass("selected")) : ($(this).removeAttr("checked"), $("td", $(this).closest("tr")).removeClass("selected"));
                });
            });

            $("[id*=SelectCheckBox]").on("click", function () {
                var a = $(this).closest("table"), b = $("[id*=chkHeader]", a);
                $(this).is(":checked") ? ($("td", $(this).closest("tr")).addClass("selected"), $("[id*=chkRow]", a).length == $("[id*=chkRow]:checked", a).length && b.attr("checked", "checked")) : ($("td", $(this).closest("tr")).removeClass("selected"), b.removeAttr("checked"));
            });
        });

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (a, b) {
            $('.timepicker').timepicker({
                minuteStep: 1,
            });

            $('.timepicker').change(function () {
                var start_time = $("[id*=Start_TextBox]").val();
                var end_time = $("[id*=End_TextBox]").val();

                //convert both time into timestamp
                var stt = new Date("August 8, 2017 " + start_time);
                stt = stt.getTime();

                var endt = new Date("August 8, 2017 " + end_time);
                endt = endt.getTime();

                if (stt > endt) {
                    $(".Time_Error").text('The End Time must be later than the Start Time.');
                    $("[id*=Add_Schedule_Button]").attr('disabled', true);
                }
                else {
                    $(".Time_Error").text("");
                    $("[id*=Add_Schedule_Button]").attr('disabled', false);
                }
            });

            //Check Time
            $('.Ed_Ch').timepicker({
                minuteStep: 1,
            });

            $('.Ed_Ch').change(function () {
                var start_time = $("[id*=Ed_Start_TextBox]").val();
                var end_time = $("[id*=Ed_End_TextBox]").val();

                //convert both time into timestamp
                var stt = new Date("August 8, 2017 " + start_time);
                stt = stt.getTime();

                var endt = new Date("August 8, 2017 " + end_time);
                endt = endt.getTime();

                if (stt > endt) {
                    $("#Time_Error2").text('The End Time must be later than the Start Time.');
                    $("[id*=UpdateLinkButton]").hide();
                }
                else {
                    $("#Time_Error2").text("");
                    $("[id*=UpdateLinkButton]").show();
                }
            });
        })

        //Beneficiary GridView
        function Validate(d, c) {
            if ($('[id*=BeneficiaryGridView] tr').length) {
                for (var b = document.getElementById("<%=BeneficiaryGridView.ClientID %>").getElementsByTagName("input"), a = 0; a < b.length; a++) {
                    if ("checkbox" == b[a].type && b[a].checked) {
                        c.IsValid = !0;
                        return;
                    }
                }
                c.IsValid = !1;
            }
        }

        //Schedule GridView
        function Validate2(d, c) {
            if ($('[id*=ScheduleGridView] tr').length) {
                for (var b = document.getElementById("<%=ScheduleGridView.ClientID %>").getElementsByTagName("input"), a = 0; a < b.length; a++) {
                    if ("checkbox" == b[a].type && b[a].checked) {
                        c.IsValid = !0;
                        return;
                    }
                }
                c.IsValid = !1;
            }
        }
        function isNumberKey(a) { a = a.which ? a.which : event.keyCode; return 46 != a && 31 < a && (48 > a || 57 < a) ? !1 : !0 };
    </script>
</asp:Content>
