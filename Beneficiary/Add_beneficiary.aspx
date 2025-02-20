<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Add_beneficiary.aspx.cs" Inherits="Award__bd.Beneficiary.Add_beneficiary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div data-toggle="validator" role="form">
      <h3>Award Beneficiary Form</h3>
      <div class="row">
         <div class="col-sm-4">
            <div class="form-group">
               <label>Beneficiary's Name</label>
               <asp:TextBox ID="BeneficiaryNameTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>Date Of birth</label>
               <asp:TextBox ID="Beneficiary_DOB_TextBox" runat="server" CssClass="form-control datepicker" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>NID No.</label><label id="Statuserr"></label>
               <asp:TextBox ID="Beneficiary_NID_TextBox" runat="server" CssClass="form-control Check" required=""></asp:TextBox>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-4">
            <div class="form-group">
               <label>Father/Husband's Name</label>
               <asp:TextBox ID="Father_Husband_NameTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>Date Of birth</label>
               <asp:TextBox ID="Father_Husband_DOB_TextBox" runat="server" CssClass="form-control datepicker" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>NID No.</label>
               <asp:TextBox ID="Father_Husband_NID_TextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-4">
            <div class="form-group">
               <label>Mother's Name</label>
               <asp:TextBox ID="MotherNameTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>Date Of birth</label>
               <asp:TextBox ID="Mother_DOB_TextBox" runat="server" CssClass="form-control datepicker" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>NID No.</label>
               <asp:TextBox ID="Mother_NID_TextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-4">
            <div class="form-group">
               <label>Guardian's Name</label>
               <asp:TextBox ID="GuardianName_TextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>Date Of birth</label>
               <asp:TextBox ID="Guardian_DOBTextBox" runat="server" CssClass="form-control datepicker" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>NID No.</label>
               <asp:TextBox ID="Guardian_NIDTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-6">
            <div class="form-group">
               <label>School/College/Univ. Name</label>
               <asp:TextBox ID="School_CollegeTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="form-group">
               <label>Roll No</label>
               <asp:TextBox ID="Roll_NoTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="form-group">
               <label>Class/Year</label>
               <asp:TextBox ID="Class_YearTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-6">
            <div class="form-group">
               <label>Present Address</label>
               <asp:TextBox ID="PresentAddressTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>

         <div class="col-sm-6">
            <div class="form-group">
               <label>Permanent Address</label>
               <asp:TextBox ID="PermanentAddressTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
      </div>

      <div class="row">


         <div class="col-sm-5">
            <div class="form-group">
               <label>Present Area <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select" ControlToValidate="AreaDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S" /></label>&nbsp;
                <asp:DropDownList ID="AreaDropDownList" runat="server" CssClass="form-control" DataSourceID="AreaSQL" DataTextField="Area" DataValueField="Area" AppendDataBoundItems="True">
                  <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
               </asp:DropDownList>
               <asp:SqlDataSource ID="AreaSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT [Area] FROM [Beneficiary_Area]"></asp:SqlDataSource>
           </div>
         </div>

         <div class="col-sm-5">
            <div class="form-group">
               <label>Present District <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select" ControlToValidate="DistrictDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S" /></label>&nbsp;
                <asp:DropDownList ID="DistrictDropDownList" runat="server" CssClass="form-control" DataSourceID="DistrictSQL" DataTextField="District" DataValueField="District" AppendDataBoundItems="True">
                  <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
               </asp:DropDownList>
               <asp:SqlDataSource ID="DistrictSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [District] FROM [Beneficiary_District]"></asp:SqlDataSource>
           
            </div>
         </div>

         <div class="col-sm-2">
            <div class="form-group">
               <label>Contact No</label>
               <asp:TextBox ID="ContactNoTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-4">
            <div class="form-group">
               <label>Total No. of Person Working in Family</label>
               <asp:TextBox ID="WorkingPerson_in_FamilyTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>Total No. Of Student</label>
               <asp:TextBox ID="No_Of_Student_TextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-4">
            <div class="form-group">
               <label>Total Fasting Member</label>
               <asp:TextBox ID="FastingMemberTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-6">
            <div class="form-group">
               <label>Total Monthly Income In Family (TK)</label>
               <asp:TextBox ID="Total_Monthly_IncomeTextBox" runat="server" CssClass="form-control" required="" autocomplete="off" onDrop="blur();return false;" onpaste="return false" onkeypress="return isNumberKey(event)"></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-6">
            <div class="form-group">
               <label>Other Benefit From Award or Others</label>
               <asp:TextBox ID="Other_BenefitTextBox" runat="server" CssClass="form-control" required=""></asp:TextBox>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-3">
            <div class="form-group">
               <label>Entry Date</label>
               <asp:TextBox ID="EntryDateTextBox" runat="server" CssClass="form-control datepicker" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="form-group">
               <label>Categoty <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select" ControlToValidate="Category_DropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S" /></label>
               <asp:DropDownList ID="Category_DropDownList" runat="server" CssClass="form-control" required="">
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
               <label>Reference <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select" ControlToValidate="ReferenceDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S" /></label>&nbsp;
                <asp:DropDownList ID="ReferenceDropDownList" runat="server" CssClass="form-control" DataSourceID="ReferenceSQL" DataTextField="Reference" DataValueField="Reference" AppendDataBoundItems="True">
                  <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
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
               <asp:TextBox ID="ObservationTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" required=""></asp:TextBox>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="form-group">
               <label>Volunteer <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select" ControlToValidate="VolunteerDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="S" /></label>&nbsp;<asp:DropDownList ID="VolunteerDropDownList" runat="server" CssClass="form-control" DataSourceID="VolunteerSQL" DataTextField="Name" DataValueField="VolunteerID" AppendDataBoundItems="True">
                  <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
               </asp:DropDownList>
               <asp:SqlDataSource ID="VolunteerSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer.VolunteerID, Volunteer.Volunteer_RegistrationID, Registration.Name FROM Volunteer INNER JOIN Registration ON Volunteer.Volunteer_RegistrationID = Registration.RegistrationID"></asp:SqlDataSource>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="form-group">
               <label>Donor</label>&nbsp;<asp:DropDownList ID="DonatorDropDownList" runat="server" CssClass="form-control" DataSourceID="DonatorSQL" DataTextField="Name" DataValueField="VolunteerID" AppendDataBoundItems="True">
                  <asp:ListItem Value="">[ SELECT ]</asp:ListItem>
               </asp:DropDownList>
               <asp:SqlDataSource ID="DonatorSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer.VolunteerID, Volunteer.Volunteer_RegistrationID, Registration.Name FROM Volunteer INNER JOIN Registration ON Volunteer.Volunteer_RegistrationID = Registration.RegistrationID"></asp:SqlDataSource>
            </div>
         </div>
      </div>

      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
            <div class="row">
               <div class="col-sm-12">
                  <div class="form-group">
                     <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Select" ClientValidationFunction="ValidateCheckBoxList" runat="server" CssClass="EroorStar" ValidationGroup="S" />
                     <asp:CheckBoxList ID="CategoryCheckBoxList" runat="server" AutoPostBack="True" DataSourceID="CategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" RepeatDirection="Horizontal" OnSelectedIndexChanged="Select"></asp:CheckBoxList>
                     <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Benefit_Category]"></asp:SqlDataSource>

                     <asp:GridView ID="CategoryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="Benefit_Expense_CategorySQL" DataKeyNames="ExpenseCategoryID">
                        <Columns>
                           <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" />
                           <asp:TemplateField HeaderText="Percentage" SortExpression="ExpenseCategoryID">
                              <ItemTemplate>
                                 <asp:TextBox ID="PercentageTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                              </ItemTemplate>
                           </asp:TemplateField>
                        </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource ID="Benefit_Expense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Expense_Category.CategoryName, Benefit_Expense_Category.ExpenseCategoryID FROM Benefit_Expense_Category INNER JOIN Expense_Category ON Benefit_Expense_Category.ExpenseCategoryID = Expense_Category.ExpenseCategoryID WHERE (Benefit_Expense_Category.BenefitCategoryID IN (SELECT id FROM dbo.In_Function_Parameter(@BenefitCategoryID) AS In_Function_Parameter_1))">
                        <SelectParameters>
                           <asp:Parameter Name="BenefitCategoryID" />
                        </SelectParameters>
                     </asp:SqlDataSource>
                  </div>
               </div>
            </div>
         </ContentTemplate>
      </asp:UpdatePanel>

      <div class="row">
         <div class="col-sm-12">
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" ValidationGroup="S" />
         </div>
      </div>

      <asp:SqlDataSource ID="Beneficiary_InfoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Beneficiary_Info(BeneficiaryName, Beneficiary_DOB, Beneficiary_NID, RegistrationID, FatherName, Father_DOB, Father_NID, MotherName, Mother_DOB, Mother_NID, GuardianName, Guardian_DOB, Guardian_NID, PresentAddress, ContactNo, PermanentAddress, EntryDate, Categoty, Reference, WorkingPerson_in_Family, Monthly_Income_in_Family, Total_Stu_in_Family, FastingMember, Other_Benefit, VolunteerID, Observation, PresentDistrict, PresentArea, Donator_VolunteerID, School_College, Roll_No, Class_Year) VALUES (@BeneficiaryName, @Beneficiary_DOB, @Beneficiary_NID, @RegistrationID, @FatherName, @Father_DOB, @Father_NID, @MotherName, @Mother_DOB, @Mother_NID, @GuardianName, @Guardian_DOB, @Guardian_NID, @PresentAddress, @ContactNo, @PermanentAddress, @EntryDate, LTRIM(RTRIM(@Categoty)), LTRIM(RTRIM(@Reference)), @WorkingPerson_in_Family, @Monthly_Income_in_Family, @Total_Stu_in_Family, @FastingMember, @Other_Benefit, @VolunteerID, @Observation, LTRIM(RTRIM(@PresentDistrict)), LTRIM(RTRIM(@PresentArea)), @Donator_VolunteerID, @School_College, @Roll_No, @Class_Year)" SelectCommand="SELECT * FROM [Beneficiary_Info]">
         <InsertParameters>
            <asp:ControlParameter ControlID="BeneficiaryNameTextBox" Name="BeneficiaryName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Beneficiary_DOB_TextBox" DbType="Date" Name="Beneficiary_DOB" PropertyName="Text" />
            <asp:ControlParameter ControlID="Beneficiary_NID_TextBox" Name="Beneficiary_NID" PropertyName="Text" />
            <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
            <asp:ControlParameter ControlID="Father_Husband_NameTextBox" Name="FatherName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Father_Husband_DOB_TextBox" DbType="Date" Name="Father_DOB" PropertyName="Text" />
            <asp:ControlParameter ControlID="Father_Husband_NID_TextBox" Name="Father_NID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="MotherNameTextBox" Name="MotherName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Mother_DOB_TextBox" DbType="Date" Name="Mother_DOB" PropertyName="Text" />
            <asp:ControlParameter ControlID="Mother_NID_TextBox" Name="Mother_NID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="GuardianName_TextBox" Name="GuardianName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Guardian_DOBTextBox" DbType="Date" Name="Guardian_DOB" PropertyName="Text" />
            <asp:ControlParameter ControlID="Guardian_NIDTextBox" Name="Guardian_NID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="PresentAddressTextBox" Name="PresentAddress" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ContactNoTextBox" Name="ContactNo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="PermanentAddressTextBox" Name="PermanentAddress" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="EntryDateTextBox" DbType="Date" Name="EntryDate" PropertyName="Text" />
            <asp:ControlParameter ControlID="Category_DropDownList" Name="Categoty" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ReferenceDropDownList" Name="Reference" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="WorkingPerson_in_FamilyTextBox" Name="WorkingPerson_in_Family" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Total_Monthly_IncomeTextBox" Name="Monthly_Income_in_Family" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="No_Of_Student_TextBox" Name="Total_Stu_in_Family" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="FastingMemberTextBox" Name="FastingMember" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Other_BenefitTextBox" Name="Other_Benefit" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="VolunteerDropDownList" Name="VolunteerID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ObservationTextBox" Name="Observation" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DistrictDropDownList" Name="PresentDistrict" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="AreaDropDownList" Name="PresentArea" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DonatorDropDownList" Name="Donator_VolunteerID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="School_CollegeTextBox" Name="School_College" PropertyName="Text" />
            <asp:ControlParameter ControlID="Roll_NoTextBox" Name="Roll_No" PropertyName="Text" />
            <asp:ControlParameter ControlID="Class_YearTextBox" Name="Class_Year" PropertyName="Text" />
         </InsertParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="Beneficiary_BenefitCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Beneficiary_BenefitCategory  (BeneficiaryID, RegistrationID, BenefitCategoryID) VALUES (@BeneficiaryID, @RegistrationID, @BenefitCategoryID)" SelectCommand="SELECT * FROM  Beneficiary_BenefitCategory">
         <InsertParameters>
            <asp:Parameter Name="BeneficiaryID" />
            <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
            <asp:Parameter Name="BenefitCategoryID" />
         </InsertParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="Beneficiary_Expense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Beneficiary_Expense_Category(BeneficiaryID, RegistrationID, ExpenseCategoryID, Persentage) VALUES (@BeneficiaryID, @RegistrationID, @ExpenseCategoryID, @Persentage)" SelectCommand="SELECT * FROM [Beneficiary_Expense_Category]">
         <InsertParameters>
            <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
            <asp:Parameter Name="BeneficiaryID" Type="Int32" />
            <asp:Parameter Name="ExpenseCategoryID" Type="Int32" />
            <asp:Parameter Name="Persentage" Type="Double" />
         </InsertParameters>
      </asp:SqlDataSource>
   </div>

   <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
      <ProgressTemplate>
         <div class="modal">
            <div class="center">
               <b>Loading...</b>
            </div>
         </div>
      </ProgressTemplate>
   </asp:UpdateProgress>

   <script type="text/javascript">
      function isNumberKey(a) { a = a.which ? a.which : event.keyCode; return 46 != a && 31 < a && (48 > a || 57 < a) ? !1 : !0 };

      $(function () {
         $('.datepicker').datepicker({
            format: 'dd M yyyy',
            autoclose: true
         });
      });

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


      $(".Check").on('keyup keypress blur focus select drop', function () {
         $.ajax({
            type: "POST",
            url: "Add_beneficiary.aspx/CheckAvailability",
            data: '{username: "' + $("#<%=Beneficiary_NID_TextBox.ClientID%>")[0].value + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
               alert(response);
            }
         });
      });

      // function OnSuccess  
      function OnSuccess(response) {
         var msg = $("#Statuserr")[0];
         switch (response.d) {
            case "true":
               msg.style.color = "red";
               msg.innerHTML = "NID already exists.";
               $("[id*=SubmitButton]").prop("disabled", !0).removeClass("btn btn-primary").val("Beneficiary's NID already exists.");
               break;
            case "false":
               msg.innerHTML = "";
               $("[id*=SubmitButton]").prop("disabled", !1).addClass("btn btn-primary").val("Submit");
               break;
         }
      }
   </script>
</asp:Content>
