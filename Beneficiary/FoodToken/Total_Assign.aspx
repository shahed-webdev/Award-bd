<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Total_Assign.aspx.cs" Inherits="Award__bd.Beneficiary.FoodToken.Total_Assign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Assigned List<asp:Label ID="CountLabel" runat="server"></asp:Label>
    </h3>

    <div class="form-inline">
        <div class="form-group">
            <asp:TextBox onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;" onpaste="return false" ID="DateTextBox" placeholder="From Date" runat="server" CssClass="form-control Datetime"></asp:TextBox>
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

    <div class="table-responsive">
        <asp:GridView ID="Food_AssignGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryID" DataSourceID="Food_AssignSQL" AllowPaging="True">
            <Columns>
                <asp:TemplateField HeaderText="SN.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
                <asp:BoundField DataField="BeneficiaryName" HeaderText="Beneficiary Name" SortExpression="BeneficiaryName" />
                <asp:BoundField DataField="ContactNo" HeaderText="Phone" SortExpression="ContactNo" />
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>
        <asp:SqlDataSource ID="Food_AssignSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT DISTINCT Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.ContactNo FROM Food_Schedule_Assign INNER JOIN Beneficiary_Info ON Food_Schedule_Assign.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Food_Schedule_Assign.ActiveDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000'))" CancelSelectOnNullParameter="False" OnSelected="Food_AssignSQL_Selected">
            <SelectParameters>
                <asp:ControlParameter ControlID="DateTextBox" Name="From_Date" PropertyName="Text" />
                <asp:ControlParameter ControlID="DateTextBox" Name="To_Date" PropertyName="Text" />
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
        });

        function isNumberKey(a) { a = a.which ? a.which : event.keyCode; return 46 != a && 31 < a && (48 > a || 57 < a) ? !1 : !0 };
    </script>
</asp:Content>
