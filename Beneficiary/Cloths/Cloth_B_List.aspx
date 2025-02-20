<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Cloth_B_List.aspx.cs" Inherits="Award__bd.Beneficiary.Cloths.Cloth_B_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/JS/jq_Profile/css/Profile_jquery-ui-1.8.23.custom.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Cloth Beneficiary List</h3>

    <div class="form-inline">
        <div class="form-group">
            <asp:TextBox ID="FindTextBox" runat="server" CssClass="form-control" placeholder="Name,Contact No,Case No"></asp:TextBox>
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
    <div id="main">
        <ul>
            <li><a href="#Assign">Assign</a></li>
            <li><a href="#AssignRecord">Assigned Record</a></li>
        </ul>
        <div id="Assign">
            <asp:GridView ID="BeneficiaryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryID,BenefitCategoryID" DataSourceID="BeneficiarySQL" AllowSorting="True" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <HeaderTemplate>
                            <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" " />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCheckBox" runat="server" Text=" " />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
                    <asp:BoundField DataField="FatherName" HeaderText="Father's Name" SortExpression="FatherName" />
                    <asp:BoundField DataField="MotherName" HeaderText="Mother's Name" SortExpression="MotherName" />
                    <asp:BoundField DataField="PresentAddress" HeaderText="Present Address" SortExpression="PresentAddress" />
                    <asp:BoundField DataField="ContactNo" HeaderText="Contact No" SortExpression="ContactNo" />
                    <asp:BoundField DataField="Categoty" HeaderText="Categoty" SortExpression="Categoty" />
                    <asp:BoundField DataField="Reference" HeaderText="Reference" SortExpression="Reference" />
                    <asp:BoundField DataField="EntryDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Entry Date" SortExpression="EntryDate" />
                </Columns>
                <EmptyDataTemplate>
                    No Records
                </EmptyDataTemplate>
                <PagerStyle CssClass="pgr" />
            </asp:GridView>
            <asp:SqlDataSource ID="BeneficiarySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.Beneficiary_DOB, Beneficiary_Info.Beneficiary_NID, Beneficiary_Info.FatherName, Beneficiary_Info.Father_DOB, Beneficiary_Info.Father_NID, Beneficiary_Info.MotherName, Beneficiary_Info.Mother_DOB, Beneficiary_Info.Mother_NID, Beneficiary_Info.GuardianName, Beneficiary_Info.Guardian_DOB, Beneficiary_Info.Guardian_NID, Beneficiary_Info.PresentAddress, Beneficiary_Info.ContactNo, Beneficiary_Info.PermanentAddress, Beneficiary_Info.EntryDate, Beneficiary_Info.Categoty, Beneficiary_Info.Reference, CAST(Beneficiary_Info.CaseNo AS nvarchar(50)) AS CaseNo, Beneficiary_Info.WorkingPerson_in_Family, Beneficiary_Info.Monthly_Income_in_Family, Beneficiary_Info.Total_Stu_in_Family, Beneficiary_Info.FastingMember, Beneficiary_Info.Other_Benefit, Beneficiary_Info.Is_Approved, Beneficiary_Info.ApprovedBy_ID, Beneficiary_Info.VolunteerID, Beneficiary_Info.Observation, Beneficiary_Info.InsertDate, Beneficiary_Info.CaseNo AS Case_No_Sort, Beneficiary_BenefitCategory.BenefitCategoryID FROM Benefit_Category INNER JOIN Beneficiary_BenefitCategory ON Benefit_Category.BenefitCategoryID = Beneficiary_BenefitCategory.BenefitCategoryID RIGHT OUTER JOIN Beneficiary_Info ON Beneficiary_BenefitCategory.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Benefit_Category.CategoryName = N'Cloth') ORDER BY Case_No_Sort"
                FilterExpression="BeneficiaryName LIKE '{0}%' or ContactNo LIKE '{0}%' or CaseNo LIKE '{0}%'" CancelSelectOnNullParameter="False" InsertCommand="IF NOT EXISTS(SELECT Cloth_AssignID FROM Beneficiary_ClothAssign WHERE (BeneficiaryID = @BeneficiaryID) AND (IsUsed = 0))
INSERT INTO Beneficiary_ClothAssign(RegistrationID, BenefitCategoryID, BeneficiaryID) VALUES (@RegistrationID, @BenefitCategoryID, @BeneficiaryID)">
                <FilterParameters>
                    <asp:ControlParameter ControlID="FindTextBox" Name="find" PropertyName="Text" />
                </FilterParameters>
                <InsertParameters>
                    <asp:Parameter Name="BeneficiaryID" />
                    <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
                    <asp:Parameter Name="BenefitCategoryID" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="AssignButton" runat="server" Text="Assign" CssClass="btn btn-primary" OnClick="AssignButton_Click" />
        </div>
        <div id="AssignRecord">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="AssignRecordGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="AssignRecordSQL" AllowSorting="True" AllowPaging="True" DataKeyNames="Cloth_AssignID">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
                            <asp:BoundField DataField="FatherName" HeaderText="Father's Name" SortExpression="FatherName" />
                            <asp:BoundField DataField="MotherName" HeaderText="Mother's Name" SortExpression="MotherName" />
                            <asp:BoundField DataField="PresentAddress" HeaderText="Present Address" SortExpression="PresentAddress" />
                            <asp:BoundField DataField="ContactNo" HeaderText="Contact No" SortExpression="ContactNo" />
                            <asp:BoundField DataField="Categoty" HeaderText="Categoty" SortExpression="Categoty" />
                            <asp:BoundField DataField="Reference" HeaderText="Reference" SortExpression="Reference" />
                            <asp:BoundField DataField="EntryDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Entry Date" SortExpression="EntryDate" />
                        </Columns>
                        <EmptyDataTemplate>
                            No Records
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="AssignRecordSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.Beneficiary_DOB, Beneficiary_Info.Beneficiary_NID, Beneficiary_Info.FatherName, Beneficiary_Info.Father_DOB, Beneficiary_Info.Father_NID, Beneficiary_Info.MotherName, Beneficiary_Info.Mother_DOB, Beneficiary_Info.Mother_NID, Beneficiary_Info.GuardianName, Beneficiary_Info.Guardian_DOB, Beneficiary_Info.Guardian_NID, Beneficiary_Info.PresentAddress, Beneficiary_Info.ContactNo, Beneficiary_Info.PermanentAddress, Beneficiary_Info.EntryDate, Beneficiary_Info.Categoty, Beneficiary_Info.Reference, CAST(Beneficiary_Info.CaseNo AS nvarchar(50)) AS CaseNo, Beneficiary_Info.WorkingPerson_in_Family, Beneficiary_Info.Monthly_Income_in_Family, Beneficiary_Info.Total_Stu_in_Family, Beneficiary_Info.FastingMember, Beneficiary_Info.Other_Benefit, Beneficiary_Info.Is_Approved, Beneficiary_Info.ApprovedBy_ID, Beneficiary_Info.VolunteerID, Beneficiary_Info.Observation, Beneficiary_Info.InsertDate, Beneficiary_ClothAssign.Cloth_AssignID FROM Beneficiary_Info INNER JOIN Beneficiary_ClothAssign ON Beneficiary_Info.BeneficiaryID = Beneficiary_ClothAssign.BeneficiaryID WHERE (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Beneficiary_ClothAssign.IsUsed = 0) ORDER BY CaseNo"
                        FilterExpression="BeneficiaryName LIKE '{0}%' or ContactNo LIKE '{0}%' or CaseNo LIKE '{0}%'" CancelSelectOnNullParameter="False" DeleteCommand="DELETE FROM Beneficiary_ClothAssign WHERE (Cloth_AssignID = @Cloth_AssignID)">
                        <DeleteParameters>
                            <asp:Parameter Name="Cloth_AssignID" />
                        </DeleteParameters>
                        <FilterParameters>
                            <asp:ControlParameter ControlID="FindTextBox" Name="find" PropertyName="Text" />
                        </FilterParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <asp:UpdateProgress ID="UpdateProgress" runat="server">
        <ProgressTemplate>
            <div id="progress_BG"></div>
            <div id="progress">
                <b>Loading...</b>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <script src="/JS/jq_Profile/jquery-ui-1.8.23.custom.min.js"></script>
    <script>
        $(function () {
            $('#main').tabs();

            $("[id*=SelectAllCheckBox]").on("click", function () {
                var a = $(this), b = $(this).closest("table");
                $("input[type=checkbox]", b).each(function () {
                    a.is(":checked") ? ($(this).attr("checked", "checked"), $("td", $(this).closest("tr")).addClass("selected")) : ($(this).removeAttr("checked"), $("td", $(this).closest("tr")).removeClass("selected"));
                });
            });

            $("[id*=SelectCheckBox]").on("click", function () {
                var a = $(this).closest("table"), b = $("[id*=SelectAllCheckBox]", a);
                $(this).is(":checked") ? ($("td", $(this).closest("tr")).addClass("selected"), $("[id*=SelectCheckBox]", a).length == $("[id*=SelectCheckBox]:checked", a).length && b.attr("checked", "checked")) : ($("td", $(this).closest("tr")).removeClass("selected"), b.removeAttr("checked"));
            });
        })
    </script>
</asp:Content>
