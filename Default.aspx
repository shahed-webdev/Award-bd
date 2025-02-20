<%@ Page Title="" Language="C#" MasterPageFile="~/Out_Side.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Award__bd.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link href="CSS/Login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <div class="container">
      <asp:Login ID="UserLogin" runat="server" OnLoginError="CustomerLogin_LoginError" OnLoggedIn="CustomerLogin_LoggedIn" DestinationPageUrl="~/Profile_Redirect.aspx" Width="100%">
         <LayoutTemplate>
            <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
               <div class="panel panel-info">
                  <div class="panel-heading">
                     <div class="panel-title">Sign In</div>
                  </div>

                  <div class="panel-body">
                     <div class="form-horizontal">
                        <div class="form-group">
                           <div class="col-sm-12">
                              <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="required." ForeColor="Red" ToolTip="User Name is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>
                              <div class="input-group input-group-lg">
                                 <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                 <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="username"></asp:TextBox>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <div class="col-sm-12">
                              <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="required." ForeColor="Red" ToolTip="Password is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>
                              <div class="input-group input-group-lg">
                                 <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                 <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" placeholder="password"></asp:TextBox>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <div class="col-sm-12">
                              <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-success" Text="Log In" ValidationGroup="Login1" />
                              <div class="alert-danger">
                                 <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </LayoutTemplate>
      </asp:Login>
   </div>
</asp:Content>
