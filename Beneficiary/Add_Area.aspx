<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Add_Area.aspx.cs" Inherits="Award__bd.Beneficiary.Add_Area" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Add Area</h3>

   <div class="form-inline">
      <div class="form-group">
         <asp:TextBox ID="AreaTextBox" runat="server" CssClass="form-control" placeholder="Enter Category Name"></asp:TextBox>
      </div>
      <div class="form-group">
         <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
      </div>
   </div>
   <br />
   <asp:GridView ID="Benefit_CategoryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="AreaID" DataSourceID="AreaSQL" AllowSorting="True">
      <Columns>
          <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"   />
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="AreaSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM Beneficiary_Area WHERE (AreaID = @AreaID)"
      InsertCommand="INSERT INTO [Beneficiary_Area] ([RegistrationID], [Area]) VALUES (@RegistrationID, @Area)" SelectCommand="SELECT * FROM [Beneficiary_Area]" UpdateCommand="UPDATE Beneficiary_Area SET Area = @Area WHERE (AreaID = @AreaID)" OnDeleted="AreaSQL_Deleted" OnInserted="AreaSQL_Inserted" OnUpdated="AreaSQL_Updated">
       <DeleteParameters>
           <asp:Parameter Name="AreaID" />
       </DeleteParameters>
       <InsertParameters>
           <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
           <asp:ControlParameter ControlID="AreaTextBox" Name="Area" PropertyName="Text" Type="String" />
       </InsertParameters>
       <UpdateParameters>
           <asp:Parameter Name="Area" Type="String" />
           <asp:Parameter Name="AreaID" Type="Int32" />
       </UpdateParameters>
   </asp:SqlDataSource>
</asp:Content>
