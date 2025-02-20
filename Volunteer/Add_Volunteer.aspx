<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Add_Volunteer.aspx.cs" Inherits="Award__bd.Add_Volunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
      .mGrid { text-align: left; width: 100%; }
         .mGrid th { text-align: left; padding: 4px; }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

   <h3>New Registration For Volunteer</h3>

   <asp:CreateUserWizard ID="SubAdminCreateUserWizard" runat="server" OnCreatedUser="SubAdminCreateUserWizard_CreatedUser" LoginCreatedUser="False" Width="100%">
      <WizardSteps>
         <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            <ContentTemplate>
               <div class="col-md-6 col-sm-12 well">
                  <p class="alert-info">Personal Info</p>
                  <div class="form-group">
                     <label>Name</label>
                     <asp:RequiredFieldValidator ID="FnameRequired" runat="server" ControlToValidate="NameTextBox" CssClass="EroorStar" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                     <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" placeholder="Input First Name"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Father's Name</label>
                     <asp:TextBox ID="FatherNameTextBox" placeholder="Father's Name" runat="server" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Mother's Name</label>
                     <asp:TextBox ID="MotherNameTextBox" placeholder="Mother's Name" runat="server" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Date of Birth</label>
                     <asp:TextBox ID="DateofBirthTextBox" placeholder="Date of Birth" runat="server" CssClass="form-control datepicker"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Blood Group</label>
                     <asp:TextBox ID="BloodGroupTextBox" runat="server" placeholder="Blood Group" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Gender</label>
                     <asp:RadioButtonList ID="GenderRadioButtonList" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                     </asp:RadioButtonList>
                  </div>
                  <div class="form-group">
                     <label>Present Address</label>
                     <asp:TextBox ID="Present_AddressTextBox" placeholder="Present Address" runat="server" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Permanent Address</label>
                     <asp:TextBox ID="Permanent_AddressTextBox" placeholder="Permanent Address" runat="server" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Phone</label>
                     <asp:TextBox ID="PhoneTextBox" placeholder="Phone" runat="server" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>User Name</label>
                     <asp:RequiredFieldValidator ID="UsernameRequired" runat="server" ControlToValidate="UserName" CssClass="EroorStar" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="UserName" CssClass="EroorStar" Display="Dynamic" ErrorMessage="Minimum 8 and Maximum 30 characters required." ValidationExpression="^[\s\S]{8,30}$" ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                     <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Input User Name" tooltipText="UserName must be minimum of 6 characters or digites, first 1 must be letter, Only use (- _ ) after 5 digites"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                        ErrorMessage="Enter Password" ToolTip="Password is required." ValidationGroup="CreateUserWizard1" CssClass="EroorStar">*</asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Password" CssClass="EroorStar" Display="Dynamic" ErrorMessage="Minimum 8 and Maximum 30 characters required." ValidationExpression="^[\s\S]{8,30}$" ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                     <asp:TextBox ID="Password" runat="server" placeholder="Input Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Confirm Password</label>
                     <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server"
                        ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password" ToolTip="Confirm Password is required."
                        ValidationGroup="CreateUserWizard1" CssClass="EroorStar">*</asp:RequiredFieldValidator>
                     <asp:TextBox ID="ConfirmPassword" runat="server" placeholder="Password Again" TextMode="Password" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>E-mail</label>
                     <asp:RequiredFieldValidator ID="EmailRequired" runat="server"
                        ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1" CssClass="EroorStar">*</asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Email" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="EroorStar"></asp:RegularExpressionValidator>
                     <asp:TextBox ID="Email" runat="server" placeholder="Write@mail.com" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Security Question</label>
                     <asp:RequiredFieldValidator ID="QuestionRequired" runat="server"
                        ControlToValidate="Question"
                        ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1" InitialValue="Select your security question" CssClass="EroorStar">*</asp:RequiredFieldValidator>
                     <asp:DropDownList ID="Question" runat="server" CssClass="form-control" ValidationGroup="CreateUserWizard1" EnableViewState="False">
                        <asp:ListItem>Select your security question</asp:ListItem>
                        <asp:ListItem>What is the first name of your favorite uncle?</asp:ListItem>
                        <asp:ListItem>What is your oldest child&#39;s nick name?</asp:ListItem>
                        <asp:ListItem>What is the first name of your oldest nephew?</asp:ListItem>
                        <asp:ListItem>What is the first name of your aunt?</asp:ListItem>
                        <asp:ListItem>Where did you spend your honeymoon?</asp:ListItem>
                        <asp:ListItem>What is your favorite game?</asp:ListItem>
                        <asp:ListItem>what is your favorite food?</asp:ListItem>
                        <asp:ListItem>What was your favorite sport in high school?</asp:ListItem>
                        <asp:ListItem>In what city were you born?</asp:ListItem>
                        <asp:ListItem>What is the country of your ultimate dream vacation?</asp:ListItem>
                        <asp:ListItem>What is the title and author of your favorite book?</asp:ListItem>
                        <asp:ListItem>What is your favorite TV program?</asp:ListItem>
                     </asp:DropDownList>
                  </div>
                  <div class="form-group">
                     <label>Security Answer</label>
                     <asp:RequiredFieldValidator ID="AnswerRequired" runat="server"
                        ControlToValidate="Answer"
                        ErrorMessage="Security answer is required."
                        ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1" CssClass="EroorStar">*</asp:RequiredFieldValidator>
                     <asp:TextBox ID="Answer" runat="server" placeholder="Answer the Question" CssClass="form-control"></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Volunteer Image</label>
                     <asp:FileUpload ID="ImageFileUpload" runat="server" />
                  </div>
                  <div class="form-group">
                     <asp:CompareValidator ID="PasswordCompare" runat="server"
                        ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        Display="Dynamic"
                        ErrorMessage="The Password and Confirmation Password must match."
                        ValidationGroup="CreateUserWizard1" CssClass="EroorStar"></asp:CompareValidator>

                     <div class="alert-danger">
                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                     </div>

                     <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" CssClass="btn btn-success" Text="Save &amp; Continue" ValidationGroup="CreateUserWizard1" />
                  </div>
               </div>

               <asp:SqlDataSource ID="RegistrationSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Registration(UserName, Validation, Category, Name, Email, FatherName, MotherName, DateofBirth, Gender, BloodGroup, Present_Address, Permanent_Address, Phone, Image) VALUES (@UserName, 'Valid', 'Volunteer', @Name, @Email, @FatherName, @MotherName, @DateofBirth, @Gender, @BloodGroup, @Present_Address, @Permanent_Address, @Phone, @Image)" SelectCommand="SELECT * FROM [Registration]">
                  <InsertParameters>
                     <asp:ControlParameter ControlID="UserName" Name="UserName" PropertyName="Text" Type="String" />
                     <asp:ControlParameter Name="Name" Type="String" ControlID="NameTextBox" PropertyName="Text" />
                     <asp:ControlParameter ControlID="Email" Name="Email" PropertyName="Text" Type="String" />
                     <asp:ControlParameter ControlID="FatherNameTextBox" Name="FatherName" PropertyName="Text" />
                     <asp:ControlParameter ControlID="MotherNameTextBox" Name="MotherName" PropertyName="Text" />
                     <asp:ControlParameter ControlID="DateofBirthTextBox" Name="DateofBirth" PropertyName="Text" />
                     <asp:ControlParameter ControlID="GenderRadioButtonList" Name="Gender" PropertyName="SelectedValue" />
                     <asp:ControlParameter ControlID="BloodGroupTextBox" Name="BloodGroup" PropertyName="Text" />
                     <asp:ControlParameter ControlID="Present_AddressTextBox" Name="Present_Address" PropertyName="Text" />
                     <asp:ControlParameter ControlID="Permanent_AddressTextBox" Name="Permanent_Address" PropertyName="Text" />
                     <asp:ControlParameter ControlID="PhoneTextBox" Name="Phone" PropertyName="Text" />
                     <asp:ControlParameter ControlID="ImageFileUpload" Name="Image" PropertyName="FileBytes" />
                  </InsertParameters>
               </asp:SqlDataSource>
            </ContentTemplate>
            <CustomNavigationTemplate>
            </CustomNavigationTemplate>
         </asp:CreateUserWizardStep>

         <asp:WizardStep runat="server" Title="PageAccess">
            <div class="alert-info">Assign Work Responsibility For Volunteer</div>

            <asp:GridView ID="LinkGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="LinkID,RoleName" DataSourceID="LinkPageSQL" OnDataBound="LinkGridView_DataBound"
               PagerStyle-CssClass="pgr" CssClass="mGrid">
               <AlternatingRowStyle CssClass="alt" />
               <Columns>
                  <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                  <asp:BoundField DataField="SubCategory" HeaderText="Sub Category" SortExpression="SubCategory" />
                  <asp:TemplateField>
                     <HeaderTemplate>
                        <asp:CheckBox ID="AllCheckBox" runat="server" Text="Page Title (Allow Selected Pages)" />
                     </HeaderTemplate>
                     <ItemTemplate>
                        <asp:CheckBox ID="LinkCheckBox" runat="server" Text='<%#Bind("PageTitle") %>' />
                     </ItemTemplate>
                  </asp:TemplateField>
               </Columns>
               <PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="LinkPageSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Link_Pages.LinkID, Link_Pages.LinkCategoryID, Link_Pages.SubCategoryID, Link_Pages.PageURL, Link_Pages.PageTitle, Link_SubCategory.SubCategory, Link_Category.Category, aspnet_Roles.RoleName FROM Link_Pages INNER JOIN aspnet_Roles ON Link_Pages.RoleId = aspnet_Roles.RoleId LEFT OUTER JOIN Link_SubCategory ON Link_Pages.SubCategoryID = Link_SubCategory.SubCategoryID LEFT OUTER JOIN Link_Category ON Link_Pages.LinkCategoryID = Link_Category.LinkCategoryID ORDER BY Link_Pages.SubCategoryID, Link_Category.Ascending, Link_SubCategory.Ascending"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Link_UserSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Link_Users(RegistrationID, LinkID, UserName, InstitutionID) VALUES (@RegistrationID, @LinkID, @UserName, 0)" SelectCommand="SELECT * FROM [Link_Users]">
               <InsertParameters>
                  <asp:Parameter Name="RegistrationID" Type="Int32" />
                  <asp:Parameter Name="LinkID" Type="Int32" />
                  <asp:Parameter Name="UserName" Type="String" />
               </InsertParameters>
            </asp:SqlDataSource>
            <p>Assign Benefit Category</p>
            <asp:CheckBoxList ID="CategoryCheckBoxList" runat="server" DataSourceID="CategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" RepeatDirection="Horizontal">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Benefit_Category]" InsertCommand="INSERT INTO Volunteer_BenefitCategory(RegistrationID, BenefitCategoryID, VolunteerID) VALUES (@RegistrationID, @BenefitCategoryID, @VolunteerID)">
               <InsertParameters>
                  <asp:Parameter Name="RegistrationID" />
                  <asp:Parameter Name="BenefitCategoryID" />
                  <asp:Parameter Name="VolunteerID" />
               </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="LinkAssignButton" runat="server" OnClick="LinkAssignButton_Click" Text="Submit" CssClass="btn btn-success" />
         </asp:WizardStep>

         <asp:WizardStep runat="server" Title="Education">
            <p class="alert-info">Education Info</p>

            <div class="form-inline">
               <div class="form-group">
                  <asp:TextBox ID="Institution_NameTextBox" runat="server" CssClass="form-control" placeholder="Institution Name"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Institution_NameTextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="Edu"></asp:RequiredFieldValidator>
               </div>
               <div class="form-group">
                  <asp:TextBox ID="DegreeTextBox" runat="server" CssClass="form-control" placeholder="Degree"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DegreeTextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="Edu"></asp:RequiredFieldValidator>
               </div>
               <div class="form-group">
                  <asp:TextBox ID="Field_of_StudyTextBox" runat="server" CssClass="form-control" placeholder="Field of Study"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Field_of_StudyTextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="Edu"></asp:RequiredFieldValidator>
               </div>
               <div class="form-group">
                  <asp:TextBox ID="StartDateTextBox" runat="server" CssClass="form-control datepicker" placeholder="Start Date"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="StartDateTextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="Edu"></asp:RequiredFieldValidator>
               </div>
               <div class="form-group">
                  <asp:TextBox ID="EndDateTextBox" runat="server" CssClass="form-control datepicker" placeholder="End Date"></asp:TextBox>
               </div>

               <div class="form-group">
                  <asp:TextBox ID="ResultTextBox" runat="server" CssClass="form-control" placeholder="Result"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Button ID="Education_Info_Button" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="Education_Info_Button_Click" ValidationGroup="Edu" />

               </div>
            </div>
            <br />
            <asp:GridView ID="Education_InfoGridView" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataKeyNames="VolunteerEdu_ID" DataSourceID="EduSQL">
               <Columns>
                  <asp:BoundField DataField="InstitutionName" HeaderText="Institution Name" SortExpression="InstitutionName" />
                  <asp:BoundField DataField="Degree" HeaderText="Degree" SortExpression="Degree" />
                  <asp:BoundField DataField="Field_of_Study" HeaderText="Field of Study" SortExpression="Field_of_Study" />
                  <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:d MMM yyyy}" />
                  <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString="{0:d MMM yyyy}" />
                  <asp:BoundField DataField="Result" HeaderText="Result" SortExpression="Result" />
               </Columns>
               <EmptyDataTemplate>
                  Empty
               </EmptyDataTemplate>
            </asp:GridView>

            <br />

            <div class="form-group">
               <asp:Button ID="NextButton" runat="server" CssClass="btn btn-primary" Text="Skip" OnClick="NextButton_Click" />
            </div>

            <asp:SqlDataSource ID="EduSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Volunteer_Education_Info] WHERE [VolunteerEdu_ID] = @VolunteerEdu_ID" InsertCommand="INSERT INTO Volunteer_Education_Info(VolunteerID, InstitutionName, StartDate, EndDate, Result, Field_of_Study, Degree) VALUES (@VolunteerID, @InstitutionName, @StartDate, @EndDate, @Result, @Field_of_Study, @Degree)" SelectCommand="SELECT VolunteerEdu_ID, VolunteerID, InstitutionName, Degree, Field_of_Study, StartDate, EndDate, Result FROM Volunteer_Education_Info WHERE (VolunteerID = @VolunteerID)" UpdateCommand="UPDATE [Volunteer_Education_Info] SET [VolunteerID] = @VolunteerID, [InstitutionName] = @InstitutionName, [StartDate] = @StartDate, [EndDate] = @EndDate, [Result] = @Result WHERE [VolunteerEdu_ID] = @VolunteerEdu_ID">
               <DeleteParameters>
                  <asp:Parameter Name="VolunteerEdu_ID" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                  <asp:Parameter Name="VolunteerID" Type="Int32" />
                  <asp:ControlParameter ControlID="Institution_NameTextBox" Name="InstitutionName" PropertyName="Text" Type="String" />
                  <asp:ControlParameter ControlID="StartDateTextBox" DbType="Date" Name="StartDate" PropertyName="Text" />
                  <asp:ControlParameter ControlID="EndDateTextBox" DbType="Date" Name="EndDate" PropertyName="Text" />
                  <asp:ControlParameter ControlID="ResultTextBox" Name="Result" PropertyName="Text" Type="String" />
                  <asp:ControlParameter ControlID="DegreeTextBox" Name="Degree" PropertyName="Text" />
                  <asp:ControlParameter ControlID="Field_of_StudyTextBox" Name="Field_of_Study" PropertyName="Text" />
               </InsertParameters>
               <SelectParameters>
                  <asp:Parameter Name="VolunteerID" />
               </SelectParameters>
               <UpdateParameters>
                  <asp:Parameter Name="VolunteerID" Type="Int32" />
                  <asp:Parameter Name="InstitutionName" Type="String" />
                  <asp:Parameter DbType="Date" Name="StartDate" />
                  <asp:Parameter DbType="Date" Name="EndDate" />
                  <asp:Parameter Name="Result" Type="String" />
                  <asp:Parameter Name="VolunteerEdu_ID" Type="Int32" />
               </UpdateParameters>
            </asp:SqlDataSource>
         </asp:WizardStep>

         <asp:WizardStep runat="server" Title="Experience">
            <p class="alert-info">Experience</p>
            <div class="form-inline">
               <div class="form-group">
                  <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control" placeholder="Title"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TitleTextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="Exp"></asp:RequiredFieldValidator>
               </div>
               <div class="form-group">
                  <asp:TextBox ID="Ex_InstitutionName_TextBox" runat="server" CssClass="form-control" placeholder="Institution Name"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Ex_InstitutionName_TextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="Exp"></asp:RequiredFieldValidator>
               </div>
               <div class="form-group">
                  <asp:TextBox ID="LocationTextBox" runat="server" CssClass="form-control" placeholder="Location"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:TextBox ID="Ex_StartDateTextBox" runat="server" CssClass="form-control datepicker" placeholder="Start Date"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:TextBox ID="Ex_EndDateTextBox" runat="server" CssClass="form-control datepicker" placeholder="End Date"></asp:TextBox>
                  <asp:CheckBox ID="is_Current_CheckBox" runat="server" Text="I currently work here" />
               </div>
               <div class="form-group">
                  <asp:TextBox ID="Job_DescriptionTextBox" runat="server" CssClass="form-control" placeholder="Job Description"></asp:TextBox>
               </div>
               <br />
               <div class="form-group">
                  <asp:Button ID="AddExperienceButton" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="AddExperienceButton_Click" ValidationGroup="Exp" />
               </div>
            </div>

            <br />
            <asp:GridView ID="ExperienceGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Volunteer_ExperienceID" DataSourceID="ExperienceSQL">
               <Columns>
                  <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                  <asp:BoundField DataField="InstitutionName" HeaderText="Institution Name" SortExpression="InstitutionName" />
                  <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                  <asp:BoundField DataField="StartDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Start Date" SortExpression="StartDate" />
                  <asp:BoundField DataField="EndDate" DataFormatString="{0:d MMM yyyy}" HeaderText="End Date" SortExpression="EndDate" />
                  <asp:BoundField DataField="Job_Description" HeaderText="Job Description" SortExpression="Job_Description" />
               </Columns>
               <EmptyDataTemplate>
                  Empty
               </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="ExperienceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Volunteer_Experience] WHERE [Volunteer_ExperienceID] = @Volunteer_ExperienceID" InsertCommand="INSERT INTO [Volunteer_Experience] ([VolunteerID], [Title], [InstitutionName], [Location], [StartDate], [EndDate], [Job_Description], [Is_Current]) VALUES (@VolunteerID, @Title, @InstitutionName, @Location, @StartDate, @EndDate, @Job_Description, @Is_Current)" SelectCommand="SELECT Volunteer_ExperienceID, VolunteerID, Title, InstitutionName, Location, StartDate, EndDate, Job_Description, Is_Current FROM Volunteer_Experience WHERE (VolunteerID = @VolunteerID)" UpdateCommand="UPDATE [Volunteer_Experience] SET [VolunteerID] = @VolunteerID, [Title] = @Title, [InstitutionName] = @InstitutionName, [Location] = @Location, [StartDate] = @StartDate, [EndDate] = @EndDate, [Job_Description] = @Job_Description, [Is_Current] = @Is_Current WHERE [Volunteer_ExperienceID] = @Volunteer_ExperienceID">
               <DeleteParameters>
                  <asp:Parameter Name="Volunteer_ExperienceID" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                  <asp:Parameter Name="VolunteerID" Type="Int32" />
                  <asp:ControlParameter ControlID="TitleTextBox" Name="Title" PropertyName="Text" Type="String" />
                  <asp:ControlParameter ControlID="Ex_InstitutionName_TextBox" Name="InstitutionName" PropertyName="Text" Type="String" />
                  <asp:ControlParameter ControlID="LocationTextBox" Name="Location" PropertyName="Text" Type="String" />
                  <asp:ControlParameter ControlID="Ex_StartDateTextBox" DbType="Date" Name="StartDate" PropertyName="Text" />
                  <asp:ControlParameter ControlID="Ex_EndDateTextBox" DbType="Date" Name="EndDate" PropertyName="Text" />
                  <asp:ControlParameter ControlID="Job_DescriptionTextBox" Name="Job_Description" PropertyName="Text" Type="String" />
                  <asp:ControlParameter ControlID="is_Current_CheckBox" Name="Is_Current" PropertyName="Checked" Type="Boolean" />
               </InsertParameters>
               <SelectParameters>
                  <asp:Parameter Name="VolunteerID" />
               </SelectParameters>
               <UpdateParameters>
                  <asp:Parameter Name="VolunteerID" Type="Int32" />
                  <asp:Parameter Name="Title" Type="String" />
                  <asp:Parameter Name="InstitutionName" Type="String" />
                  <asp:Parameter Name="Location" Type="String" />
                  <asp:Parameter DbType="Date" Name="StartDate" />
                  <asp:Parameter DbType="Date" Name="EndDate" />
                  <asp:Parameter Name="Job_Description" Type="String" />
                  <asp:Parameter Name="Is_Current" Type="Boolean" />
                  <asp:Parameter Name="Volunteer_ExperienceID" Type="Int32" />
               </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Ex_NextButton" runat="server" CssClass="btn btn-primary" OnClick="Ex_NextButton_Click" Text="Skip" />
         </asp:WizardStep>

         <asp:WizardStep runat="server" Title="Skills">
            <p class="alert-info">Skills</p>
            <div class="form-inline">
               <div class="form-group">
                  <asp:TextBox ID="SkillsTextBox" runat="server" CssClass="form-control" placeholder="Skills Name"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="SkillsTextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="Skill"></asp:RequiredFieldValidator>
               </div>
               <div class="form-group">
                  <asp:Button ID="SkillButton" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="SkillButton_Click" ValidationGroup="Skill" />
               </div>
            </div>
            <br />
            <asp:GridView ID="SkillGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Volunteer_SkillsID" DataSourceID="SkillSSQL">
               <Columns>
                  <asp:BoundField DataField="SkillsName" HeaderText="Skills Name" SortExpression="SkillsName" />
               </Columns>
               <EmptyDataTemplate>
                  Empty
               </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SkillSSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Volunteer_Skills] WHERE [Volunteer_SkillsID] = @Volunteer_SkillsID" InsertCommand="INSERT INTO [Volunteer_Skills] ([VolunteerID], [SkillsName]) VALUES (@VolunteerID, @SkillsName)" SelectCommand="SELECT Volunteer_SkillsID, VolunteerID, SkillsName FROM Volunteer_Skills WHERE (VolunteerID = @VolunteerID)" UpdateCommand="UPDATE [Volunteer_Skills] SET [VolunteerID] = @VolunteerID, [SkillsName] = @SkillsName WHERE [Volunteer_SkillsID] = @Volunteer_SkillsID">
               <DeleteParameters>
                  <asp:Parameter Name="Volunteer_SkillsID" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                  <asp:Parameter Name="VolunteerID" Type="Int32" />
                  <asp:ControlParameter ControlID="SkillsTextBox" Name="SkillsName" PropertyName="Text" Type="String" />
               </InsertParameters>
               <SelectParameters>
                  <asp:Parameter Name="VolunteerID" />
               </SelectParameters>
               <UpdateParameters>
                  <asp:Parameter Name="VolunteerID" Type="Int32" />
                  <asp:Parameter Name="SkillsName" Type="String" />
                  <asp:Parameter Name="Volunteer_SkillsID" Type="Int32" />
               </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="SkillNextButton" runat="server" CssClass="btn btn-primary" Text="Skip" OnClick="SkillNextButton_Click" />
         </asp:WizardStep>

         <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            <ContentTemplate>
               <div class="alert alert-success">Congratulation! Account has been successfully created.</div>
               <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" CssClass="btn btn-success" PostBackUrl="~/Profile_Redirect.aspx" />
            </ContentTemplate>
         </asp:CompleteWizardStep>
      </WizardSteps>
      <FinishNavigationTemplate>
         <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" Visible="False" />
         <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" Visible="False" />
      </FinishNavigationTemplate>
      <StepNavigationTemplate>
         <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" Visible="false" CommandName="MovePrevious" Text="Previous" />
         <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Visible="false" Text="Next" />
      </StepNavigationTemplate>
   </asp:CreateUserWizard>

   <asp:SqlDataSource ID="VolunteerSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Volunteer (Volunteer_RegistrationID, RegistrationID, Volunteer_SN) VALUES (@Volunteer_RegistrationID,@RegistrationID, dbo.Volunteer_SN())
SET @VolunteerID = SCOPE_IDENTITY()"
      SelectCommand="SELECT * FROM [Volunteer]" OnInserted="VolunteerSQL_Inserted">
      <InsertParameters>
         <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
         <asp:Parameter Name="Volunteer_RegistrationID" Type="Int32" />
         <asp:Parameter Name="VolunteerID" Direction="Output" Size="100" />
      </InsertParameters>
   </asp:SqlDataSource>

   <asp:SqlDataSource ID="UserInfoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO [User_Info] ([RegistrationID], [UserName], [Password], [Category]) VALUES (@RegistrationID, @UserName, @Password, @Category)" SelectCommand="SELECT * FROM [User_Info]">
      <InsertParameters>
         <asp:Parameter Name="RegistrationID" Type="Int32" />
         <asp:Parameter Name="UserName" Type="String" />
         <asp:Parameter Name="Password" Type="String" />
         <asp:Parameter DefaultValue="Volunteer" Name="Category" Type="String" />
      </InsertParameters>
   </asp:SqlDataSource>

   <script>
      $(function () {
         $('.datepicker').datepicker({
            format: 'dd M yyyy',
            todayHighlight: true,
            autoclose: true
         });

         $('[id*=is_Current_CheckBox]').change(function () {
            $("[id*=Ex_EndDateTextBox]").prop("disabled", $(this).is(':checked')).val("");
         });

         $("[id*=AllCheckBox]").live("click", function () {
            var a = $(this), b = $(this).closest("table");
            $("input[type=checkbox]", b).each(function () {
               a.is(":checked") ? ($(this).attr("checked", "checked"), $("td", $(this).closest("tr")).addClass("selected")) : ($(this).removeAttr("checked"), $("td", $(this).closest("tr")).removeClass("selected"));
            });
         });

         $("[id*=LinkCheckBox]").live("click", function () {
            var a = $(this).closest("table"), b = $("[id*=chkHeader]", a);
            $(this).is(":checked") ? ($("td", $(this).closest("tr")).addClass("selected"), $("[id*=chkRow]", a).length == $("[id*=chkRow]:checked", a).length && b.attr("checked", "checked")) : ($("td", $(this).closest("tr")).removeClass("selected"), b.removeAttr("checked"));
         });
      });
   </script>
</asp:Content>
