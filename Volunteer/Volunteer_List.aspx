<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Volunteer_List.aspx.cs" Inherits="Award__bd.Volunteer.Volunteer_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Volunteer List</h3>
   <asp:GridView ID="VolunteerGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="VolunteerID,UserName" DataSourceID="VolunteerSQL">
      <Columns>
           <asp:BoundField DataField="Volunteer_SN" HeaderText="SN" SortExpression="Volunteer_SN" />
           <asp:HyperLinkField DataNavigateUrlFields="VolunteerID,Name" HeaderText="Name" DataTextField="Name"
            DataNavigateUrlFormatString="Volunteer_Details.aspx?VolunteerID={0}&N={1}"/>
         <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="Validation" HeaderText="Validation" SortExpression="Validation" />
            <asp:TemplateField HeaderText="Approved?">
                <ItemTemplate>
                    <asp:CheckBox ID="ApprovedCheckBox" runat="server" Checked='<%# Bind("IsApproved") %>' Text=" " OnCheckedChanged="ApprovedCheckBox_CheckedChanged" AutoPostBack="true" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Locked Out?">
                <ItemTemplate>
                    <asp:CheckBox ID="LockedOutCheckBox" runat="server" Checked='<%# Bind("IsLockedOut") %>' Text=" " OnCheckedChanged="LockedOutCheckBox_CheckedChanged" AutoPostBack="true" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreateDate" HeaderText="Signup Date" SortExpression="CreateDate" DataFormatString="{0:d MMM yyyy}" />
         <asp:HyperLinkField DataNavigateUrlFields="VolunteerID" HeaderText="CV" Text="CV"
            DataNavigateUrlFormatString="CV.aspx?VolunteerID={0}"/>
        </Columns>
        <EmptyDataTemplate>
            No Record(s) Found!
        </EmptyDataTemplate>

        <PagerStyle CssClass="pgr"></PagerStyle>
   </asp:GridView>
   <asp:SqlDataSource ID="VolunteerSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT aspnet_Membership.Email, Registration.UserName, Registration.Validation, aspnet_Membership.IsApproved, aspnet_Membership.IsLockedOut, aspnet_Membership.CreateDate, aspnet_Membership.LastLoginDate, aspnet_Membership.LastPasswordChangedDate, Registration.Name, Volunteer.VolunteerID, Volunteer.Volunteer_SN, Registration.Phone, User_Info.Password FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId INNER JOIN Registration ON aspnet_Users.UserName = Registration.UserName INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID INNER JOIN User_Info ON Registration.RegistrationID = User_Info.RegistrationID WHERE (Registration.Category = N'Volunteer')"></asp:SqlDataSource>
</asp:Content>
