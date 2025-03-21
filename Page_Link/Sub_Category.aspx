﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Out_Side.Master" AutoEventWireup="true" CodeBehind="Sub_Category.aspx.cs" Inherits="Award__bd.Page_Link.Sub_Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Insert/Edit/Delete Link Sub-category</h3>
   <table>
      <tr>
         <td>Ascending</td>
         <td>Category</td>
      </tr>
      <tr>
         <td>
            <asp:TextBox ID="AscendingTextBox" runat="server" CssClass="Textbox"></asp:TextBox>
         </td>
         <td>
            <asp:TextBox ID="SubCategoryTextBox" runat="server" CssClass="Textbox"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td>&nbsp;</td>
         <td style="text-align: right">
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" CssClass="Submit-Button" />
            <br />
            <a href="Category.aspx">Back to Category</a>
         </td>
      </tr>
   </table>
   <asp:GridView ID="SubCategoryGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="LinkCategoryID,SubCategoryID" DataSourceID="SubCategorySQL" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
      <Columns>
         <asp:BoundField DataField="Ascending" HeaderText="Ascending" SortExpression="Ascending" />
         <asp:BoundField DataField="SubCategory" HeaderText="SubCategory" SortExpression="SubCategory" />
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
         <asp:HyperLinkField DataNavigateUrlFields="LinkCategoryID,SubCategoryID"
            DataNavigateUrlFormatString="Sub_Category_Links.aspx?Category={0}&Sub_Category={1}" DataTextField="SubCategory" HeaderText="Select Sub-Category to Set URL" />
      </Columns>
      <EmptyDataTemplate>
         No Sub-Category
      </EmptyDataTemplate>
      <FooterStyle BackColor="White" ForeColor="#000066" />
      <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
      <RowStyle ForeColor="#000066" />
      <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#F1F1F1" />
      <SortedAscendingHeaderStyle BackColor="#007DBB" />
      <SortedDescendingCellStyle BackColor="#CAC9C9" />
      <SortedDescendingHeaderStyle BackColor="#00547E" />
   </asp:GridView>
   <asp:SqlDataSource ID="SubCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Link_SubCategory] WHERE [SubCategoryID] = @SubCategoryID" InsertCommand="INSERT INTO [Link_SubCategory] ([LinkCategoryID], [Ascending], [SubCategory]) VALUES (@LinkCategoryID, @Ascending, @SubCategory)" SelectCommand="SELECT SubCategoryID, LinkCategoryID, Ascending, SubCategory FROM Link_SubCategory WHERE (LinkCategoryID = @LinkCategoryID) ORDER BY Ascending" UpdateCommand="UPDATE [Link_SubCategory] SET [LinkCategoryID] = @LinkCategoryID, [Ascending] = @Ascending, [SubCategory] = @SubCategory WHERE [SubCategoryID] = @SubCategoryID">
      <DeleteParameters>
         <asp:Parameter Name="SubCategoryID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:QueryStringParameter Name="LinkCategoryID" QueryStringField="Category" Type="Int32" />
         <asp:ControlParameter ControlID="AscendingTextBox" Name="Ascending" PropertyName="Text" Type="Int32" />
         <asp:ControlParameter ControlID="SubCategoryTextBox" Name="SubCategory" PropertyName="Text" Type="String" />
      </InsertParameters>
      <SelectParameters>
         <asp:QueryStringParameter Name="LinkCategoryID" QueryStringField="Category" />
      </SelectParameters>
      <UpdateParameters>
         <asp:Parameter Name="LinkCategoryID" Type="Int32" />
         <asp:Parameter Name="Ascending" Type="Int32" />
         <asp:Parameter Name="SubCategory" Type="String" />
         <asp:Parameter Name="SubCategoryID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>


   <br />
   <br />


   <br />

   <h3>Insert URL Under Category:</h3>
   <table>
      <tr>
         <td>Ascending</td>
         <td>PageTitle<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PageTitleTextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
         </td>
         <td>PageURL<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PageURLTextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
         </td>
         <td>&nbsp;</td>
      </tr>
      <tr>
         <td>
            <asp:TextBox ID="LinkAsecendingTextBox" runat="server" CssClass="Textbox" Width="50px"></asp:TextBox>
         </td>
         <td>
            <asp:TextBox ID="PageTitleTextBox" runat="server" CssClass="Textbox"></asp:TextBox>
         </td>
         <td>
            <asp:TextBox ID="PageURLTextBox" runat="server" CssClass="Textbox"></asp:TextBox>
         </td>
         <td>
            <asp:DropDownList ID="RoleDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="RoleSQL" DataTextField="RoleName" DataValueField="RoleId">
               <asp:ListItem>[ SELECT ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="RoleSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [RoleId], [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
         </td>
      </tr>
      <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td style="text-align: right">
            <asp:Button ID="UrlButton" runat="server" OnClick="UrlButton_Click" Text="Submit" ValidationGroup="1" CssClass="Submit-Button" Height="22px" />
         </td>
      </tr>
      <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
      </tr>
   </table>
   <asp:GridView ID="InsertedLinkGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="LinkID" DataSourceID="Link_PagesSQL" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" OnRowUpdating="InsertedLinkGridView_RowUpdating">
      <Columns>
         <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
         <asp:BoundField DataField="Ascending" HeaderText="Ascending" SortExpression="Ascending" />
         <asp:BoundField DataField="PageURL" HeaderText="PageURL" SortExpression="PageURL" />
         <asp:BoundField DataField="PageTitle" HeaderText="PageTitle" SortExpression="PageTitle" />
         <asp:TemplateField HeaderText="Category" SortExpression="Category">
            <EditItemTemplate>
               <asp:DropDownList ID="CategotyDropDownList" runat="server" AutoPostBack="True" DataSourceID="CategorySQL" DataTextField="Category"
                  SelectedValue='<%#Bind("LinkCategoryID") %>' DataValueField="LinkCategoryID">
               </asp:DropDownList>
               <asp:DropDownList ID="SubCategoryDropDownList" runat="server" DataSourceID="SubCategorySQL" DataTextField="SubCategory"
                  DataValueField="SubCategoryID" OnDataBound="SubCategoryDropDownList_DataBound">
               </asp:DropDownList>
               <asp:SqlDataSource ID="SubCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Link_SubCategory] WHERE ([LinkCategoryID] = @LinkCategoryID)" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="CategotyDropDownList" Name="LinkCategoryID" PropertyName="SelectedValue" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Link_Category]" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>"></asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Role" SortExpression="RoleName">
            <EditItemTemplate>
               <asp:DropDownList ID="RoleDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="RoleSQL" DataTextField="RoleName" DataValueField="RoleId" SelectedValue='<%# Bind("RoleId") %>'>
                  <asp:ListItem Value="00000000-0000-0000-0000-000000000000">[ SELECT ]</asp:ListItem>
               </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
      </Columns>
      <FooterStyle BackColor="White" ForeColor="#000066" />
      <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
      <RowStyle ForeColor="#000066" />
      <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#F1F1F1" />
      <SortedAscendingHeaderStyle BackColor="#007DBB" />
      <SortedDescendingCellStyle BackColor="#CAC9C9" />
      <SortedDescendingHeaderStyle BackColor="#00547E" />
   </asp:GridView>
   <asp:SqlDataSource ID="Link_PagesSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>"
      DeleteCommand="DELETE FROM [Link_Pages] WHERE [LinkID] = @LinkID
DELETE FROM Link_Users WHERE (LinkID = @LinkID)"
      InsertCommand="INSERT INTO Link_Pages(LinkCategoryID, Ascending, PageURL, PageTitle, RoleId) VALUES (@LinkCategoryID, @Ascending, @PageURL, @PageTitle, @RoleId)"
      SelectCommand="SELECT Link_Pages.LinkID, Link_Pages.LinkCategoryID, Link_Pages.Ascending, Link_Pages.PageURL, Link_Pages.PageTitle, Link_Category.Category, Link_Pages.SubCategoryID, aspnet_Roles.RoleName,ISNULL(Link_Pages.RoleId,'00000000-0000-0000-0000-000000000000')AS RoleId FROM Link_Pages LEFT OUTER JOIN aspnet_Roles ON Link_Pages.RoleId = aspnet_Roles.RoleId LEFT OUTER JOIN Link_Category ON Link_Pages.LinkCategoryID = Link_Category.LinkCategoryID WHERE (Link_Pages.LinkCategoryID = @LinkCategoryID) AND (Link_Pages.SubCategoryID IS NULL) ORDER BY Link_Pages.Ascending"
      UpdateCommand="UPDATE Link_Pages SET Ascending = @Ascending, PageURL = @PageURL, PageTitle = @PageTitle, LinkCategoryID = @LinkCategoryID, SubCategoryID = @SubCategoryID, RoleId = @RoleId WHERE (LinkID = @LinkID)">
      <DeleteParameters>
         <asp:Parameter Name="LinkID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:QueryStringParameter Name="LinkCategoryID" QueryStringField="Category" Type="Int32" />
         <asp:ControlParameter ControlID="LinkAsecendingTextBox" Name="Ascending" PropertyName="Text" Type="Int32" />
         <asp:ControlParameter ControlID="PageURLTextBox" Name="PageURL" PropertyName="Text" Type="String" />
         <asp:ControlParameter ControlID="PageTitleTextBox" Name="PageTitle" PropertyName="Text" Type="String" />
         <asp:ControlParameter ControlID="RoleDropDownList" Name="RoleId" PropertyName="SelectedValue" />
      </InsertParameters>
      <SelectParameters>
         <asp:QueryStringParameter Name="LinkCategoryID" QueryStringField="Category" />
      </SelectParameters>
      <UpdateParameters>
         <asp:Parameter Name="Ascending" Type="Int32" />
         <asp:Parameter Name="PageURL" Type="String" />
         <asp:Parameter Name="PageTitle" Type="String" />
         <asp:Parameter Name="LinkCategoryID" />
         <asp:Parameter Name="SubCategoryID" />
         <asp:Parameter Name="RoleId" />
         <asp:Parameter Name="LinkID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>
</asp:Content>
