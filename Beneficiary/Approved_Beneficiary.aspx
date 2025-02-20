<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Approved_Beneficiary.aspx.cs" Inherits="Award__bd.Beneficiary.Approved_Beneficiary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Approve Beneficiary</h3>
    <div class="form-inline">
        <div class="form-group">
            <asp:TextBox ID="FindTextBox" runat="server" CssClass="form-control" placeholder="Name,Contact No"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" />
        </div>
    </div>
    <br />
    <div class="table-responsive">
        <asp:GridView ID="BeneficiaryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryID" DataSourceID="BeneficiarySQL">
            <Columns>
                <asp:TemplateField HeaderText="SN.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="BeneficiaryID" HeaderText="Name" DataTextField="BeneficiaryName"
                    DataNavigateUrlFormatString="Beneficiary_Details_Approved.aspx?BeneficiaryID={0}" />
                <asp:BoundField DataField="FatherName" HeaderText="Father's Name" SortExpression="FatherName" />
                <asp:BoundField DataField="MotherName" HeaderText="Mother's Name" SortExpression="MotherName" />
                <asp:BoundField DataField="PresentAddress" HeaderText="Present Address" SortExpression="PresentAddress" />
                <asp:BoundField DataField="PermanentAddress" HeaderText="Permanent Address" SortExpression="PermanentAddress" />
                <asp:BoundField DataField="ContactNo" HeaderText="Contact No" SortExpression="ContactNo" />
                <asp:BoundField DataField="Categoty" HeaderText="Categoty" SortExpression="Categoty" />
                <asp:BoundField DataField="Reference" HeaderText="Reference" SortExpression="Reference" />
                <asp:BoundField DataField="EntryDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Entry Date" SortExpression="EntryDate" />
                <asp:BoundField DataField="UserName" HeaderText="Inserted By" SortExpression="UserName" />
            </Columns>
            <EmptyDataTemplate>
                No Records
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="BeneficiarySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.Beneficiary_DOB, Beneficiary_Info.Beneficiary_NID, Beneficiary_Info.FatherName, Beneficiary_Info.Father_DOB, Beneficiary_Info.Father_NID, Beneficiary_Info.MotherName, Beneficiary_Info.Mother_DOB, Beneficiary_Info.Mother_NID, Beneficiary_Info.GuardianName, Beneficiary_Info.Guardian_DOB, Beneficiary_Info.Guardian_NID, Beneficiary_Info.PresentAddress, Beneficiary_Info.ContactNo, Beneficiary_Info.PermanentAddress, Beneficiary_Info.EntryDate, Beneficiary_Info.Categoty, Beneficiary_Info.Reference, Beneficiary_Info.WorkingPerson_in_Family, Beneficiary_Info.Monthly_Income_in_Family, Beneficiary_Info.Total_Stu_in_Family, Beneficiary_Info.FastingMember, Beneficiary_Info.Other_Benefit, Beneficiary_Info.Is_Approved, Beneficiary_Info.ApprovedBy_ID, Beneficiary_Info.VolunteerID, Beneficiary_Info.Observation, Beneficiary_Info.Beneficiary_Image, Beneficiary_Info.InsertDate, Registration.UserName FROM Beneficiary_Info INNER JOIN Registration ON Beneficiary_Info.RegistrationID = Registration.RegistrationID WHERE (Beneficiary_Info.Is_Approved = 0)"
            FilterExpression="BeneficiaryName LIKE '{0}%' or ContactNo LIKE '{0}%' ">
            <FilterParameters>
                <asp:ControlParameter ControlID="FindTextBox" Name="find" PropertyName="Text" />
            </FilterParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
