<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Add_Benefit_Category.aspx.cs" Inherits="Award__bd.Beneficiary.Add_Benefit_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Add Benefit Category</h3>

   <div class="form-inline">
      <div class="form-group">
         <asp:TextBox ID="CategoryTextBox" runat="server" CssClass="form-control" placeholder="Enter Category Name"></asp:TextBox>
      </div>
      <div class="form-group">
         <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
      </div>
   </div>
   <br />
   <asp:GridView ID="Benefit_CategoryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BenefitCategoryID" DataSourceID="Benefit_CategorySQL">
      <Columns>
         <asp:TemplateField HeaderText="Category Name" SortExpression="CategoryName">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="Benefit_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="IF NOT EXISTS (SELECT top(1)  BenefitCategoryID FROM Beneficiary_BenefitCategory WHERE  BenefitCategoryID = @BenefitCategoryID)
BEGIN
DELETE FROM [Benefit_Category] WHERE [BenefitCategoryID] = @BenefitCategoryID
END"
      InsertCommand="INSERT INTO [Benefit_Category] ([RegistrationID], [CategoryName]) VALUES (@RegistrationID, @CategoryName)" SelectCommand="SELECT * FROM [Benefit_Category]" UpdateCommand="UPDATE Benefit_Category SET CategoryName = @CategoryName  WHERE (BenefitCategoryID = @BenefitCategoryID)">
      <DeleteParameters>
         <asp:Parameter Name="BenefitCategoryID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
         <asp:ControlParameter ControlID="CategoryTextBox" Name="CategoryName" PropertyName="Text" Type="String" />
      </InsertParameters>
      <UpdateParameters>
         <asp:Parameter Name="CategoryName" Type="String" />
         <asp:Parameter Name="BenefitCategoryID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>
</asp:Content>
