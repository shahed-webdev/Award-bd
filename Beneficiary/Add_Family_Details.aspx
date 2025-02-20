<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Add_Family_Details.aspx.cs" Inherits="Award__bd.Beneficiary.Add_Family_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Family Details</h3>
   <div class="row">
      <div class="col-sm-5">
         <div class="form-group">
            <label>Name</label>
            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
         </div>
      </div>
      <div class="col-sm-3">
         <div class="form-group">
            <label>Date Of birth</label>
            <asp:TextBox ID="DOB_TextBox" runat="server" CssClass="form-control datepicker"></asp:TextBox>
         </div>
      </div>
      <div class="col-sm-4">
         <div class="form-group">
            <label>Relationship</label>
            <asp:TextBox ID="Relationship_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
         </div>
      </div>
   </div>

   <div class="row">
      <div class="col-sm-4">
         <div class="form-group">
            <label>Living Together or Not</label>
            <asp:TextBox ID="Living_TogetherTextBox" runat="server" CssClass="form-control"></asp:TextBox>
         </div>
      </div>
      <div class="col-sm-4">
         <div class="form-group">
            <label>Marital Status</label>
            <asp:TextBox ID="Marital_StatusTextBox" runat="server" CssClass="form-control"></asp:TextBox>
         </div>
      </div>
      <div class="col-sm-4">
         <div class="form-group">
            <label>Occupation</label>
            <asp:TextBox ID="OccupationTextBox" runat="server" CssClass="form-control"></asp:TextBox>
         </div>
      </div>
   </div>

   <div class="row">
      <div class="col-sm-12">
         <asp:Button ID="SubmitButton" runat="server" Text="Save &amp; Add More" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
      </div>
   </div>
   <br />
   <asp:GridView ID="FamilyGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryFamilyID" DataSourceID="Beneficiary_FamilySQL">
      <Columns>
         <asp:BoundField DataField="PersonName" HeaderText="Name" SortExpression="PersonName" />
         <asp:BoundField DataField="Person_DOB" DataFormatString="{0:d MMM yyyy}" HeaderText="Date Of Birth" SortExpression="Person_DOB" />
         <asp:BoundField DataField="Relationship" HeaderText="Relationship" SortExpression="Relationship" />
         <asp:BoundField DataField="Living_Together" HeaderText="Living Together or Not" SortExpression="Living_Together" />
         <asp:BoundField DataField="Marital_Status" HeaderText="Marital Status" SortExpression="Marital_Status" />
         <asp:BoundField DataField="Occupation" HeaderText="Occupation" SortExpression="Occupation" />
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="Beneficiary_FamilySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Beneficiary_Family] WHERE [BeneficiaryFamilyID] = @BeneficiaryFamilyID" InsertCommand="INSERT INTO Beneficiary_Family(BeneficiaryID, RegistrationID, PersonName, Person_DOB, Relationship, Living_Together, Marital_Status, Occupation) VALUES (@BeneficiaryID, @RegistrationID, @PersonName, @Person_DOB, @Relationship, @Living_Together, @Marital_Status, @Occupation)" SelectCommand="SELECT BeneficiaryFamilyID, BeneficiaryID, RegistrationID, PersonName, Person_DOB, Relationship, Living_Together, Marital_Status, Occupation, InsertDate FROM Beneficiary_Family WHERE (BeneficiaryID = @BeneficiaryID)" UpdateCommand="UPDATE Beneficiary_Family SET PersonName = @PersonName, Person_DOB = @Person_DOB, Relationship = @Relationship, Living_Together = @Living_Together, Marital_Status = @Marital_Status, Occupation = @Occupation WHERE (BeneficiaryFamilyID = @BeneficiaryFamilyID)">
      <DeleteParameters>
         <asp:Parameter Name="BeneficiaryFamilyID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" Type="Int32" />
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
         <asp:ControlParameter ControlID="NameTextBox" Name="PersonName" PropertyName="Text" Type="String" />
         <asp:ControlParameter ControlID="DOB_TextBox" DbType="Date" Name="Person_DOB" PropertyName="Text" />
         <asp:ControlParameter ControlID="Relationship_TextBox" Name="Relationship" PropertyName="Text" Type="String" />
         <asp:ControlParameter ControlID="Living_TogetherTextBox" Name="Living_Together" PropertyName="Text" Type="String" />
         <asp:ControlParameter ControlID="Marital_StatusTextBox" Name="Marital_Status" PropertyName="Text" Type="String" />
         <asp:ControlParameter ControlID="OccupationTextBox" Name="Occupation" PropertyName="Text" Type="String" />
      </InsertParameters>
      <SelectParameters>
         <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
      </SelectParameters>
      <UpdateParameters>
         <asp:Parameter Name="PersonName" Type="String" />
         <asp:Parameter DbType="Date" Name="Person_DOB" />
         <asp:Parameter Name="Relationship" Type="String" />
         <asp:Parameter Name="Living_Together" Type="String" />
         <asp:Parameter Name="Marital_Status" Type="String" />
         <asp:Parameter Name="Occupation" Type="String" />
         <asp:Parameter Name="BeneficiaryFamilyID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>

   <%if (FamilyGridView.Rows.Count > 0)
     {%>
   <br />
   <asp:Button ID="CompleteButton" runat="server" Text="Complete" CssClass="btn btn-success" OnClick="CompleteButton_Click"/>
   <%} %>

   <script type="text/javascript">
      $(function () {
         $('.datepicker').datepicker({
            format: 'dd M yyyy',
            autoclose: true
         });
      });
   </script>
</asp:Content>
