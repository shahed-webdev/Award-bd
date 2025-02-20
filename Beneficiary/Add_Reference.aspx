<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Add_Reference.aspx.cs" Inherits="Award__bd.Beneficiary.Add_Reference" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Add Reference</h3>

   <div class="form-inline">
      <div class="form-group">
         <asp:TextBox ID="ReferenceTextBox" runat="server" CssClass="form-control" placeholder="Enter Category Name"></asp:TextBox>
      </div>
      <div class="form-group">
         <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
      </div>
   </div>
   <br />
   <asp:GridView ID="Benefit_CategoryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="ReferenceID" DataSourceID="ReferenceSQL" AllowSorting="True">
      <Columns>
          <asp:BoundField DataField="Reference" HeaderText="Reference" SortExpression="Reference"   />
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="ReferenceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM Beneficiary_Reference WHERE (ReferenceID = @ReferenceID)"
      InsertCommand="INSERT INTO [Beneficiary_Reference] ([RegistrationID], [Reference]) VALUES (@RegistrationID, @Reference)" SelectCommand="SELECT * FROM [Beneficiary_Reference]" UpdateCommand="UPDATE Beneficiary_Reference SET Reference = @Reference WHERE (ReferenceID = @ReferenceID)" OnDeleted="ReferenceSQL_Deleted" OnInserted="ReferenceSQL_Inserted" OnUpdated="ReferenceSQL_Updated">
       <DeleteParameters>
           <asp:Parameter Name="ReferenceID" />
       </DeleteParameters>
       <InsertParameters>
           <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
           <asp:ControlParameter ControlID="ReferenceTextBox" Name="Reference" PropertyName="Text" Type="String" />
       </InsertParameters>
       <UpdateParameters>
           <asp:Parameter Name="Reference" Type="String" />
           <asp:Parameter Name="ReferenceID" Type="Int32" />
       </UpdateParameters>
   </asp:SqlDataSource>
</asp:Content>
