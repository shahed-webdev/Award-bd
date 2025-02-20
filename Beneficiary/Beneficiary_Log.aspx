<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Beneficiary_Log.aspx.cs" Inherits="Award__bd.Beneficiary.Beneficiary_Log" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Beneficiary Log</h3>

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
    </div>
    <asp:GridView ID="Benefit_LogGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="LogSQL" AllowPaging="True" AllowSorting="True" PageSize="100">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d MMMM yyyy (hh:mm tt)}" />
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <asp:SqlDataSource ID="LogSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.UserName, Registration.Name, Beneficiary_Log.Details, Beneficiary_Log.Date FROM Beneficiary_Log INNER JOIN Registration ON Beneficiary_Log.RegistrationID = Registration.RegistrationID
 WHERE (CONVERT(date,Beneficiary_Log.Date) BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000'))
 ORDER BY Beneficiary_Log.Date DESC" CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

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
