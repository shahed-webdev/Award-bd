<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Add_District.aspx.cs" Inherits="Award__bd.Beneficiary.Add_District" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Add District</h3>

   <div class="form-inline">
      <div class="form-group">
         <asp:TextBox ID="DistrictTextBox" runat="server" CssClass="form-control" placeholder="Enter Category Name"></asp:TextBox>
      </div>
      <div class="form-group">
         <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
      </div>
   </div>
   <br />
   <asp:GridView ID="DistrictGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="DistrictID" DataSourceID="DistrictSQL" AllowSorting="True">
      <Columns>
         <asp:TemplateField HeaderText="District Name" SortExpression="District">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("District") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("District") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="DistrictSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Beneficiary_District] WHERE  [DistrictID] = @DistrictID"
      InsertCommand="INSERT INTO [Beneficiary_District] ([RegistrationID], [District]) VALUES (@RegistrationID, @District)" SelectCommand="SELECT * FROM [Beneficiary_District]" UpdateCommand="UPDATE [Beneficiary_District] SET  [District] = @District  WHERE [DistrictID] = @DistrictID" OnDeleted="DistrictSQL_Deleted" OnInserted="DistrictSQL_Inserted" OnUpdated="DistrictSQL_Updated">
      <DeleteParameters>
         <asp:Parameter Name="DistrictID" />
      </DeleteParameters>
      <InsertParameters>
          <asp:Parameter Name="RegistrationID" Type="Int32" />
          <asp:ControlParameter ControlID="DistrictTextBox" Name="District" PropertyName="Text" Type="String" />
      </InsertParameters>
      <UpdateParameters>
         <asp:Parameter Name="District" Type="String" />
         <asp:Parameter Name="DistrictID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>
</asp:Content>
