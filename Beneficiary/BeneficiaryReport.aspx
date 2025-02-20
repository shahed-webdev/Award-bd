<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="BeneficiaryReport.aspx.cs" Inherits="Award__bd.Beneficiary.BeneficiaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav-tabs { border-bottom: none; }
            .nav-tabs > li > a { color: #333; }
            .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus { color: #000; font-weight: bold; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="form-inline">
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
                <li class="active"><a href="#Category" data-toggle="tab">Category wise</a></li>
                <li><a href="#Benefit" data-toggle="tab">Benefit wise</a></li>
                <li><a href="#Donor" data-toggle="tab">Donor wise</a></li>
                <li><a href="#Benefit" data-toggle="tab">Benefit wise</a></li>
                <li><a href="#District" data-toggle="tab">District wise</a></li>
                <li><a href="#Area" data-toggle="tab">Area wise</a></li>
            </ul>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane active" id="Category">
                    <h5>Category wise Report</h5>
                    <asp:GridView ID="CategoryGridView" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="CategorySQL" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Categoty" HeaderText="Categoty" SortExpression="Categoty" />
                            <asp:BoundField DataField="Total_Beneficiary" HeaderText="Beneficiary" ReadOnly="True" SortExpression="Total_Beneficiary" />
                        </Columns>
                        <EmptyDataTemplate>
                            No Record
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="CategorySQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT        Categoty, COUNT(BeneficiaryID) AS Total_Beneficiary
FROM            Beneficiary_Info
WHERE        (Is_Service_On = 1) AND (Is_Approved = 1)
GROUP BY Categoty
ORDER BY Total_Beneficiary DESC"></asp:SqlDataSource>
                </div>

                <div class="tab-pane" id="Benefit">
                    <h5>Benefit wise Category</h5>
                    <asp:GridView ID="BenefitGridView" AllowPaging="True" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="BenefitSQL">
                        <Columns>
                            <asp:BoundField DataField="CategoryName" HeaderText="Benefit Category" SortExpression="CategoryName" />
                            <asp:BoundField DataField="Total_Beneficiary" HeaderText="Beneficiary" ReadOnly="True" SortExpression="Total_Beneficiary" />
                        </Columns>
                        <EmptyDataTemplate>
                            No Record
                        </EmptyDataTemplate>
                         <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="BenefitSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT        Benefit_Category.CategoryName, COUNT(Beneficiary_Info.BeneficiaryID) AS Total_Beneficiary
FROM            Beneficiary_Info INNER JOIN
                         Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID INNER JOIN
                         Benefit_Category ON Beneficiary_BenefitCategory.BenefitCategoryID = Benefit_Category.BenefitCategoryID
WHERE        (Beneficiary_Info.Is_Service_On = 1) AND (Beneficiary_Info.Is_Approved = 1)
GROUP BY Benefit_Category.CategoryName
ORDER BY Total_Beneficiary DESC"></asp:SqlDataSource>
                </div>

                <div class="tab-pane" id="Donor">
                    <h5>Donor wise Report</h5>
                    <asp:GridView ID="DonorGridView" AllowPaging="True" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="DonorSQL">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="Donor" SortExpression="UserName" />
                            <asp:BoundField DataField="Total_Beneficiary" HeaderText="Beneficiary" ReadOnly="True" SortExpression="Total_Beneficiary" />
                        </Columns>
                        <EmptyDataTemplate>
                            No Record
                        </EmptyDataTemplate>
                         <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="DonorSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT        Registration.UserName, COUNT(Beneficiary_Info.BeneficiaryID) AS Total_Beneficiary
FROM            Registration INNER JOIN
                         Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID INNER JOIN
                         Beneficiary_Info ON Volunteer.VolunteerID = Beneficiary_Info.Donator_VolunteerID
WHERE        (Beneficiary_Info.Is_Service_On = 1) AND (Beneficiary_Info.Is_Approved = 1)
GROUP BY Registration.UserName"></asp:SqlDataSource>
                </div>

                <div class="tab-pane" id="District">
                    <h5>District wise Category</h5>
                    <asp:GridView ID="DistrictGridView" AllowPaging="True" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="DISTINCTSQL">
                        <Columns>
                            <asp:BoundField DataField="PresentDistrict" HeaderText="District" SortExpression="PresentDistrict" />
                            <asp:BoundField DataField="Total_Beneficiary" HeaderText="Beneficiary" SortExpression="Total_Beneficiary" ReadOnly="True" />
                        </Columns>
                        <EmptyDataTemplate>
                            No Record
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="DISTINCTSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT COUNT(BeneficiaryID) AS Total_Beneficiary, PresentDistrict FROM Beneficiary_Info WHERE (Is_Service_On = 1) AND (Is_Approved = 1) GROUP BY PresentDistrict ORDER BY Total_Beneficiary DESC"></asp:SqlDataSource>
                </div>

                <div class="tab-pane" id="Area">
                    <h5>Area wise Report</h5>
                    <asp:GridView ID="AreaGridView" AllowPaging="True" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="AreaSQL">
                        <Columns>
                            <asp:BoundField DataField="PresentArea" HeaderText="Area" SortExpression="PresentArea" />
                            <asp:BoundField DataField="Total_Beneficiary" HeaderText="Beneficiary" ReadOnly="True" SortExpression="Total_Beneficiary" />
                        </Columns>
                        <EmptyDataTemplate>
                            No Record
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="AreaSQL" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT        PresentArea, COUNT(BeneficiaryID) AS Total_Beneficiary
FROM            Beneficiary_Info
WHERE        (Is_Service_On = 1) AND (Is_Approved = 1)
GROUP BY PresentArea
ORDER BY Total_Beneficiary DESC"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
