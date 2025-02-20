<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Edit_Beneficiary.aspx.cs" Inherits="Award__bd.Beneficiary.Edit_Beneficiary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      .img { border: 1px solid #ddd; width: 100px; height: 100px; }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

   <asp:FormView ID="EditFormView" runat="server" DataKeyNames="BeneficiaryID" DataSourceID="Beneficiary_InfoSQL" DefaultMode="Edit" Width="100%" OnItemUpdated="EditFormView_ItemUpdated">
      <EditItemTemplate>
         <div id="form">
            <h3>Edit
            <b>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("BeneficiaryName") %>'></asp:Label>'s</b> Info.
            Case No:
         <asp:Label ID="CaseNoLabel" runat="server" Text='<%# Bind("CaseNo") %>'></asp:Label>
            </h3>
            <img alt="No Image" src="/Handler/Beneficiry_Img.ashx?Img=<%#Eval("BeneficiaryID") %>" class="img-circle img-responsive img" />

            <div class="row">
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Beneficiary's Name</label>
                     <asp:TextBox ID="BeneficiaryNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("BeneficiaryName") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Date Of birth</label>
                     <asp:TextBox ID="Beneficiary_DOB_TextBox" runat="server" CssClass="form-control datepicker" Text='<%# Bind("Beneficiary_DOB","{0:d MMM yyyy}") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>NID No.</label><label id="Statuserr"></label>
                     <asp:TextBox ID="Beneficiary_NID_TextBox" runat="server" CssClass="form-control Check" Text='<%# Bind("Beneficiary_NID") %>'></asp:TextBox>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Father/Husband's Name</label>
                     <asp:TextBox ID="Father_Husband_NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FatherName") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Date Of birth</label>
                     <asp:TextBox ID="Father_Husband_DOB_TextBox" runat="server" CssClass="form-control datepicker" Text='<%# Bind("Father_DOB","{0:d MMM yyyy}") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>NID No.</label>
                     <asp:TextBox ID="Father_Husband_NID_TextBox" runat="server" CssClass="form-control" Text='<%# Bind("Father_NID") %>'></asp:TextBox>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Mother's Name</label>
                     <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("MotherName") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Date Of birth</label>
                     <asp:TextBox ID="Mother_DOB_TextBox" runat="server" CssClass="form-control datepicker" Text='<%# Bind("Mother_DOB","{0:d MMM yyyy}") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>NID No.</label>
                     <asp:TextBox ID="Mother_NID_TextBox" runat="server" CssClass="form-control" Text='<%# Bind("Mother_NID") %>'></asp:TextBox>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Guardian's Name</label>
                     <asp:TextBox ID="GuardianName_TextBox" runat="server" CssClass="form-control" Text='<%# Bind("GuardianName") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Date Of birth</label>
                     <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control datepicker" Text='<%# Bind("Guardian_DOB","{0:d MMM yyyy}") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>NID No.</label>
                     <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("Guardian_NID") %>'></asp:TextBox>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-6">
                  <div class="form-group">
                     <label>School/College/Univ. Name</label>
                     <asp:TextBox ID="School_CollegeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("School_College") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="form-group">
                     <label>Roll No</label>
                     <asp:TextBox ID="Roll_NoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Roll_No") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="form-group">
                     <label>Class/Year</label>
                     <asp:TextBox ID="Class_YearTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Class_Year") %>'></asp:TextBox>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-6">
                  <div class="form-group">
                     <label>Present Address</label>
                     <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Text='<%# Bind("PresentAddress") %>'></asp:TextBox>
                  </div>
               </div>

               <div class="col-sm-6">
                  <div class="form-group">
                     <label>Permanent Address</label>
                     <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Text='<%# Bind("PermanentAddress") %>'></asp:TextBox>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-5">
                  <div class="form-group">
                     <label>Present Area</label>
                     <asp:DropDownList ID="AreaDropDownList" runat="server" CssClass="form-control" DataSourceID="AreaSQL" DataTextField="Area" DataValueField="Area" SelectedValue='<%# Bind("PresentArea") %>'>
               </asp:DropDownList>
               <asp:SqlDataSource ID="AreaSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT [Area] FROM [Beneficiary_Area]"></asp:SqlDataSource>
          
                  </div>
               </div>

               <div class="col-sm-5">
                  <div class="form-group">
                     <label>Present District</label>
                   <asp:DropDownList ID="DistrictDropDownList" runat="server" CssClass="form-control" DataSourceID="DistrictSQL" DataTextField="District" DataValueField="District" SelectedValue='<%# Bind("PresentDistrict") %>'>
               </asp:DropDownList>
               <asp:SqlDataSource ID="DistrictSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [District] FROM [Beneficiary_District]"></asp:SqlDataSource>
            </div>
               </div>

               <div class="col-sm-2">
                  <div class="form-group">
                     <label>Contact No</label>
                     <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Text='<%# Bind("ContactNo") %>'></asp:TextBox>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Total No. of Person Working in Family</label>
                     <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Text='<%# Bind("WorkingPerson_in_Family") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Total No. Of Student</label>
                     <asp:TextBox ID="No_Of_Student_TextBox" runat="server" CssClass="form-control" Text='<%# Bind("Total_Stu_in_Family") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="form-group">
                     <label>Total Fasting Member</label>
                     <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" Text='<%# Bind("FastingMember") %>'></asp:TextBox>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-6">
                  <div class="form-group">
                     <label>Total Monthly Income In Family (TK)</label>
                     <asp:TextBox ID="Total_Monthly_IncomeTextBox" runat="server" CssClass="form-control" autocomplete="off" onDrop="blur();return false;" onpaste="return false" onkeypress="return isNumberKey(event)" Text='<%# Bind("Monthly_Income_in_Family") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="form-group">
                     <label>Other Benefit From Award or Others</label>
                     <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Text='<%# Bind("Other_Benefit") %>'></asp:TextBox>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-3">
                  <div class="form-group">
                     <label>Entry Date</label>
                     <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control datepicker" Text='<%# Bind("EntryDate","{0:d MMM yyyy}") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="form-group">
                     <label>
                        Categoty
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select" ControlToValidate="Category_DropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S" /></label>
                     <asp:DropDownList ID="Category_DropDownList" runat="server" CssClass="form-control" Text='<%# Bind("Categoty") %>'>
                        <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
                        <asp:ListItem>Orphan</asp:ListItem>
                        <asp:ListItem>Like Orphan</asp:ListItem>
                        <asp:ListItem>Deserve</asp:ListItem>
                        <asp:ListItem>Parents Less</asp:ListItem>
                        <asp:ListItem>Widow</asp:ListItem>
                     </asp:DropDownList>
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="form-group">
                     <label>Reference</label>
                    <asp:DropDownList ID="ReferenceDropDownList" runat="server" CssClass="form-control" DataSourceID="ReferenceSQL" DataTextField="Reference" DataValueField="Reference" SelectedValue='<%# Bind("Reference") %>'>
               </asp:DropDownList>
               <asp:SqlDataSource ID="ReferenceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [Reference] FROM [Beneficiary_Reference]"></asp:SqlDataSource>
           
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="form-group">
                     <label>Beneficiary Image</label>
                     <asp:FileUpload ID="ImageFileUpload" runat="server" />
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-6">
                  <div class="form-group">
                     <label>Observation</label>
                     <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control" TextMode="MultiLine" Text='<%# Bind("Observation") %>'></asp:TextBox>
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="form-group">
                     <label>
                        Volunteer
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select" ControlToValidate="VolunteerDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S" /></label>&nbsp;<asp:DropDownList ID="VolunteerDropDownList" runat="server" CssClass="form-control" DataSourceID="VolunteerSQL" DataTextField="Name" DataValueField="VolunteerID" AppendDataBoundItems="True" SelectedValue='<%# Bind("VolunteerID") %>'>
                           <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
                        </asp:DropDownList>
                     <asp:SqlDataSource ID="VolunteerSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer.VolunteerID, Volunteer.Volunteer_RegistrationID, Registration.Name FROM Volunteer INNER JOIN Registration ON Volunteer.Volunteer_RegistrationID = Registration.RegistrationID"></asp:SqlDataSource>
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="form-group">
                     <label>Donor</label>
                     <asp:DropDownList ID="DonatorDropDownList" runat="server" CssClass="form-control" DataSourceID="DonatorSQL" DataTextField="Name" DataValueField="VolunteerID" AppendDataBoundItems="True" SelectedValue='<%# Bind("Donator_VolunteerID") %>'>
                        <asp:ListItem Value="">[ SELECT ]</asp:ListItem>
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="DonatorSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer.VolunteerID, Volunteer.Volunteer_RegistrationID, Registration.Name FROM Volunteer INNER JOIN Registration ON Volunteer.Volunteer_RegistrationID = Registration.RegistrationID"></asp:SqlDataSource>
                  </div>
               </div>
            </div>

            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandName="Update" Text="Update Info" ValidationGroup="S" />
         </div>
      </EditItemTemplate>
   </asp:FormView>
   <asp:SqlDataSource ID="Beneficiary_InfoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM Beneficiary_Info WHERE (BeneficiaryID = @BeneficiaryID)" UpdateCommand="UPDATE Beneficiary_Info SET BeneficiaryName = @BeneficiaryName, Beneficiary_DOB = @Beneficiary_DOB, Beneficiary_NID = @Beneficiary_NID, FatherName = @FatherName, Father_DOB = @Father_DOB, Father_NID = @Father_NID, MotherName = @MotherName, Mother_DOB = @Mother_DOB, Mother_NID = @Mother_NID, GuardianName = @GuardianName, Guardian_DOB = @Guardian_DOB, Guardian_NID = @Guardian_NID, PresentAddress = @PresentAddress, PresentDistrict = LTRIM(RTRIM(@PresentDistrict)), PresentArea = LTRIM(RTRIM(@PresentArea)), ContactNo = @ContactNo, PermanentAddress = @PermanentAddress, Categoty = LTRIM(RTRIM(@Categoty)), Reference = LTRIM(RTRIM(@Reference)), WorkingPerson_in_Family = @WorkingPerson_in_Family, Monthly_Income_in_Family = @Monthly_Income_in_Family, Total_Stu_in_Family = @Total_Stu_in_Family, FastingMember = @FastingMember, Other_Benefit = @Other_Benefit, Observation = @Observation, EntryDate = @EntryDate, Donator_VolunteerID = @Donator_VolunteerID, School_College = @School_College, Roll_No = @Roll_No, Class_Year = @Class_Year, VolunteerID = @VolunteerID WHERE (BeneficiaryID = @BeneficiaryID)
">
      <SelectParameters>
         <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
      </SelectParameters>
      <UpdateParameters>
         <asp:Parameter Name="BeneficiaryName" Type="String" />
         <asp:Parameter DbType="Date" Name="Beneficiary_DOB" />
         <asp:Parameter Name="Beneficiary_NID" Type="String" />
         <asp:Parameter Name="FatherName" Type="String" />
         <asp:Parameter DbType="Date" Name="Father_DOB" />
         <asp:Parameter Name="Father_NID" Type="String" />
         <asp:Parameter Name="MotherName" Type="String" />
         <asp:Parameter DbType="Date" Name="Mother_DOB" />
         <asp:Parameter Name="Mother_NID" Type="String" />
         <asp:Parameter Name="GuardianName" Type="String" />
         <asp:Parameter DbType="Date" Name="Guardian_DOB" />
         <asp:Parameter Name="Guardian_NID" Type="String" />
         <asp:Parameter Name="PresentAddress" Type="String" />
         <asp:Parameter Name="PresentDistrict" Type="String" />
         <asp:Parameter Name="PresentArea" Type="String" />
         <asp:Parameter Name="ContactNo" Type="String" />
         <asp:Parameter Name="PermanentAddress" Type="String" />
         <asp:Parameter Name="Categoty" Type="String" />
         <asp:Parameter Name="Reference" Type="String" />
         <asp:Parameter Name="WorkingPerson_in_Family" Type="String" />
         <asp:Parameter Name="Monthly_Income_in_Family" Type="Double" />
         <asp:Parameter Name="Total_Stu_in_Family" Type="String" />
         <asp:Parameter Name="FastingMember" Type="String" />
         <asp:Parameter Name="Other_Benefit" Type="String" />
         <asp:Parameter Name="Observation" Type="String" />
         <asp:Parameter Name="BeneficiaryID" Type="Int32" />
         <asp:Parameter Name="EntryDate" />
         <asp:Parameter Name="Donator_VolunteerID" />
         <asp:Parameter Name="School_College" />
         <asp:Parameter Name="Roll_No" />
         <asp:Parameter Name="Class_Year" />
         <asp:Parameter Name="VolunteerID" />
      </UpdateParameters>
   </asp:SqlDataSource>

   <br />
   <br />
    <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Select" ClientValidationFunction="ValidateCheckBoxList" runat="server" CssClass="EroorStar" ValidationGroup="S" />
   <asp:CheckBoxList ID="CategoryCheckBoxList" runat="server" AutoPostBack="True" DataSourceID="CategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" RepeatDirection="Horizontal" OnSelectedIndexChanged="Select" OnDataBound="CategoryCheckBoxList_DataBound"></asp:CheckBoxList>
   <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Benefit_Category]" DeleteCommand="DELETE FROM Beneficiary_BenefitCategory WHERE (BeneficiaryID = @BeneficiaryID)" InsertCommand="INSERT INTO Beneficiary_BenefitCategory  (BeneficiaryID, RegistrationID, BenefitCategoryID) VALUES (@BeneficiaryID, @RegistrationID, @BenefitCategoryID)">
      <DeleteParameters>
         <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
      </DeleteParameters>
      <InsertParameters>
         <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
         <asp:Parameter Name="BenefitCategoryID" />
      </InsertParameters>
   </asp:SqlDataSource>

   <asp:GridView ID="CategoryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="Benefit_Expense_CategorySQL" DataKeyNames="ExpenseCategoryID">
      <Columns>
         <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" />
         <asp:TemplateField HeaderText="Percentage" SortExpression="ExpenseCategoryID">
            <ItemTemplate>
                <asp:HiddenField ID="ExpenseCategoryID_HF" runat="server" Value='<%# Eval("ExpenseCategoryID") %>' />
               <asp:TextBox ID="PercentageTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </ItemTemplate>
         </asp:TemplateField>
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="Benefit_Expense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Expense_Category.CategoryName, Benefit_Expense_Category.ExpenseCategoryID FROM Benefit_Expense_Category INNER JOIN Expense_Category ON Benefit_Expense_Category.ExpenseCategoryID = Expense_Category.ExpenseCategoryID WHERE (Benefit_Expense_Category.BenefitCategoryID IN (SELECT id FROM dbo.In_Function_Parameter(@BenefitCategoryID) AS In_Function_Parameter_1))" DeleteCommand="DELETE FROM Beneficiary_Expense_Category WHERE (BeneficiaryID = @BeneficiaryID)" InsertCommand="INSERT INTO Beneficiary_Expense_Category(BeneficiaryID, RegistrationID, ExpenseCategoryID, Persentage) VALUES (@BeneficiaryID, @RegistrationID, @ExpenseCategoryID, @Persentage)">
      <DeleteParameters>
         <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
      </DeleteParameters>
      <InsertParameters>
         <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
         <asp:Parameter Name="ExpenseCategoryID" />
         <asp:Parameter Name="Persentage" />
      </InsertParameters>
      <SelectParameters>
         <asp:Parameter Name="BenefitCategoryID" />
      </SelectParameters>
   </asp:SqlDataSource>
   <br />
   <asp:Button ID="Update_Benefit_Button" runat="server" Text="Update Benefit Category" CssClass="btn btn-primary" OnClick="Update_Benefit_Button_Click" ValidationGroup="S" />
   <br /><br />
   <a data-toggle="modal" data-target="#Fami_Modal">Add New</a>
   <asp:GridView ID="FamilyGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryFamilyID" DataSourceID="Beneficiary_FamilySQL" OnRowDeleted="FamilyGridView_RowDeleted" OnRowUpdated="FamilyGridView_RowUpdated">
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

   


    <asp:SqlDataSource ID="LogSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO [Beneficiary_Log] ([RegistrationID], [Details]) VALUES (@RegistrationID, @Details)" SelectCommand="SELECT * FROM [Beneficiary_Log]">
        <InsertParameters>
            <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
            <asp:Parameter Name="Details" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

   


   <div id="Fami_Modal" class="modal fade" role="dialog">
      <div class="modal-dialog">
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Add Family Details</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  <label>Name</label>
                  <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

               <div class="form-group">
                  <label>Date Of birth</label>
                  <asp:TextBox ID="DOB_TextBox" runat="server" CssClass="form-control datepicker"></asp:TextBox>
               </div>

               <div class="form-group">
                  <label>Relationship</label>
                  <asp:TextBox ID="Relationship_TextBox" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

               <div class="form-group">
                  <label>Living Together or Not</label>
                  <asp:TextBox ID="Living_TogetherTextBox" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

               <div class="form-group">
                  <label>Marital Status</label>
                  <asp:TextBox ID="Marital_StatusTextBox" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

               <div class="form-group">
                  <label>Occupation</label>
                  <asp:TextBox ID="OccupationTextBox" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

               <div class="form-group">
                  <asp:Button ID="SubmitButton" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
               </div>
            </div>
         </div>
      </div>
   </div>

    <script>
             function ValidateCheckBoxList(sender, args) {
         var checkBoxList = document.getElementById("<%=CategoryCheckBoxList.ClientID %>");
         var checkboxes = checkBoxList.getElementsByTagName("input");
         var isValid = false;
         for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
               isValid = true;
               break;
            }
         }
         args.IsValid = isValid;
             }
      $(function () {
         $('.datepicker').datepicker({
            format: 'dd M yyyy',
            autoclose: true,
            orientation: "top auto",
            todayHighlight: true,
            todayBtn: true
         });
      });
   </script>
</asp:Content>
