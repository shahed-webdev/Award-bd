<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Change_Area_Dis_Ref.aspx.cs" Inherits="Award__bd.Beneficiary.Change_Area_Dis_Ref" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Change Area</h3>
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <label>
                    Old Area
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select" ControlToValidate="OldAreaDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="A" /></label>&nbsp;
                <asp:DropDownList ID="OldAreaDropDownList" runat="server" CssClass="form-control" DataSourceID="OldAreaSQL" DataTextField="Area" DataValueField="Area" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="OldAreaSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT [Area] FROM [Beneficiary_Area]" UpdateCommand="UPDATE Beneficiary_Info SET PresentArea = @NewArea WHERE (PresentArea = @OldArea)">
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="NewAreaDropDownList" Name="NewArea" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="OldAreaDropDownList" Name="OldArea" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label>
                    New Area
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select" ControlToValidate="NewAreaDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="A" /></label>&nbsp;
                <asp:DropDownList ID="NewAreaDropDownList" runat="server" CssClass="form-control" DataSourceID="NewAreaSQL" DataTextField="Area" DataValueField="Area" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="NewAreaSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT [Area] FROM [Beneficiary_Area]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="form-group">
                <asp:Button ID="ChangeAreaButton" runat="server" Text="Change Area" CssClass="btn btn-primary" OnClick="ChangeAreaButton_Click" ValidationGroup="A" />
            </div>
        </div>
    </div>
    <h3>Change District</h3>
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <label>
                    Old District
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select" ControlToValidate="OldDistrictDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="D" /></label>&nbsp;
                <asp:DropDownList ID="OldDistrictDropDownList" runat="server" CssClass="form-control" DataSourceID="OldDistrictSQL" DataTextField="District" DataValueField="District" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="OldDistrictSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [District] FROM [Beneficiary_District]" UpdateCommand="UPDATE Beneficiary_Info SET PresentDistrict = @NewDistrict WHERE (PresentDistrict = @OldDistrict)">
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="NewDistrictDropDownList" Name="NewDistrict" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="OldDistrictDropDownList" Name="OldDistrict" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label>
                    New District
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Select" ControlToValidate="NewDistrictDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="D" /></label>&nbsp;
                <asp:DropDownList ID="NewDistrictDropDownList" runat="server" CssClass="form-control" DataSourceID="NewDistrictSQL" DataTextField="District" DataValueField="District" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="NewDistrictSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [District] FROM [Beneficiary_District]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="form-group">
                <asp:Button ID="ChangeDistrictButton" runat="server" Text="Change District" CssClass="btn btn-primary" OnClick="ChangeDistrictButton_Click" ValidationGroup="D" />
            </div>
        </div>
    </div>
    <h3>Change Reference</h3>
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <label>
                    Old Reference
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select" ControlToValidate="OldReferenceDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="R" /></label>&nbsp;
                <asp:DropDownList ID="OldReferenceDropDownList" runat="server" CssClass="form-control" DataSourceID="OldReferenceSQL" DataTextField="Reference" DataValueField="Reference" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="OldReferenceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [Reference] FROM [Beneficiary_Reference]" UpdateCommand="UPDATE Beneficiary_Info SET Reference = @NewReference WHERE (Reference = @OldReference)">
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="NewReferenceDropDownList" Name="NewReference" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="OldReferenceDropDownList" Name="OldReference" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label>
                    New Reference
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select" ControlToValidate="NewReferenceDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="R" /></label>&nbsp;
                <asp:DropDownList ID="NewReferenceDropDownList" runat="server" CssClass="form-control" DataSourceID="NewReferenceSQL" DataTextField="Reference" DataValueField="Reference" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="NewReferenceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [Reference] FROM [Beneficiary_Reference]"></asp:SqlDataSource>

            </div>

        </div>
        <div class="col-sm-12">
            <div class="form-group">
                <asp:Button ID="ChangeReferenceButton" runat="server" Text="Change Reference" CssClass="btn btn-primary" OnClick="ChangeReferenceButton_Click" ValidationGroup="R" />
            </div>
        </div>
    </div>
</asp:Content>
