<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Change_Password.aspx.cs" Inherits="Award__bd.Profile.Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Change Password</h3>
   <asp:ChangePassword ID="ChangePassword" runat="server" ChangePasswordFailureText="Password incorrect or New Password invalid." OnChangedPassword="ChangePassword1_ChangedPassword" Width="100%">
      <ChangePasswordTemplate>
         <div class="col-md-4 col-sm-12 well">
            <div class="form-group">
               <label>
                  Old Password
                 <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" CssClass="EroorStar" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
               </label>
               <asp:TextBox ID="CurrentPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

            <div class="form-group">
               <label>
                  New Password
                                       <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" CssClass="EroorStar" ErrorMessage="New Password is required." ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="NewPassword" CssClass="EroorSummer" Display="Dynamic" ErrorMessage="Minimum 8 and Maximum 30 characters required." ValidationExpression="^[\s\S]{8,30}$" ValidationGroup="ChangePassword1"></asp:RegularExpressionValidator>
               </label>

               <asp:TextBox ID="NewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

            <div class="form-group">
               <label>
                  New Password Again
                                     <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" CssClass="EroorStar" ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
               </label>
               <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

            <div class="form-group">
               <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" CssClass="btn btn-primary" Text="Change" ValidationGroup="ChangePassword1" />
               <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" CssClass="EroorSummer" Display="Dynamic" ErrorMessage="New password does not match" ValidationGroup="ChangePassword1" ForeColor="#FF3300"></asp:CompareValidator>
               <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
            </div>
         </div>
      </ChangePasswordTemplate>
      <SuccessTemplate>
         <div class="alert alert-success">Password Changed successfully!</div>
         <div class="form-group">
            <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" CommandName="Continue" CssClass="btn btn-default" PostBackUrl="~/Profile_Redirect.aspx" Text="Continue" />
         </div>
      </SuccessTemplate>
   </asp:ChangePassword>
   <asp:SqlDataSource ID="UserInfoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM User_Info" UpdateCommand="UPDATE User_Info SET Password = @Password WHERE (RegistrationID = @RegistrationID)">
      <UpdateParameters>
         <asp:Parameter Name="Password" Type="String" />
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>
</asp:Content>
