<%@ Page Title="" Language="C#" MasterPageFile="~/Out_Side.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Award__bd.Page_Link.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Insert/Edit/Delete Link category</h3>
<a href="Create_Delete_Role.aspx">Create Delete Role</a>
   <table>
      <tr>
         <td>Ascending</td>
         <td>Category</td>
      </tr>
      <tr>
         <td>
            <asp:TextBox ID="AscendingTextBox" runat="server"></asp:TextBox>
         </td>
         <td>
            <asp:TextBox ID="CategoryTextBox" runat="server"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td>
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" CssClass="Submit-Button" />
         </td>
         <td>&nbsp;</td>
      </tr>
   </table>
   <asp:GridView ID="CategoryGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="LinkCategoryID" DataSourceID="CategorySQL" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
      <Columns>
         <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
         <asp:BoundField DataField="Ascending" HeaderText="Ascending" SortExpression="Ascending" />
         <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
         <asp:HyperLinkField DataNavigateUrlFields="LinkCategoryID" DataNavigateUrlFormatString="Sub_Category.aspx?Category={0}" DataTextField="Category" HeaderText="Select Category to Set URL" />
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
   <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Link_Category] WHERE [LinkCategoryID] = @LinkCategoryID" InsertCommand="INSERT INTO [Link_Category] ([Ascending], [Category]) VALUES (@Ascending, @Category)" SelectCommand="SELECT LinkCategoryID, Category, Ascending FROM Link_Category ORDER BY Ascending" UpdateCommand="UPDATE [Link_Category] SET [Ascending] = @Ascending, [Category] = @Category WHERE [LinkCategoryID] = @LinkCategoryID">
      <DeleteParameters>
         <asp:Parameter Name="LinkCategoryID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:ControlParameter ControlID="AscendingTextBox" Name="Ascending" PropertyName="Text" Type="Int32" />
         <asp:ControlParameter ControlID="CategoryTextBox" Name="Category" PropertyName="Text" Type="String" />
      </InsertParameters>
      <UpdateParameters>
         <asp:Parameter Name="Ascending" Type="Int32" />
         <asp:Parameter Name="Category" Type="String" />
         <asp:Parameter Name="LinkCategoryID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>



</asp:Content>