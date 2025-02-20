<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Volunteer_Details.aspx.cs" Inherits="Award__bd.Volunteer.Volunteer_Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link href="../../Profile/CSS/Admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Details</h3>

   <asp:FormView ID="InfoFormView" runat="server" DataKeyNames="RegistrationID" DataSourceID="InfoSQL" Width="100%" OnItemUpdated="InfoFormView_ItemUpdated">
      <ItemTemplate>
         <div class="student-info well">
            <h3>
               <i class="glyphicon glyphicon-user rest-userico"></i>
               <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            </h3>

            <div class="Info col-md-2 col-sm-3">
               <img alt="No Image" src="/Handler/Admin.ashx?Img=<%#Eval("RegistrationID") %>" class="img-circle img-responsive P_Image" />
            </div>

            <div class="Info col-md-10 col-sm-9">
               <ul>
                  <li>
                     <i class="glyphicon glyphicon-user rest-userico"></i>
                     <b>Father's Name:</b>
                     <asp:Label ID="FatherNameLabel" runat="server" Text='<%# Bind("FatherName") %>' />
                  </li>
                  <li>
                     <span class="glyphicon glyphicon-earphone"></span>
                     <b>Mobile:</b>
                     <asp:Label ID="PhoneLabel1" runat="server" Text='<%# Bind("Phone") %>' />
                  </li>
                  <li>
                     <span class="glyphicon glyphicon-envelope"></span>
                     <b>Email: </b>
                     <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                  </li>
                  <li>
                     <span class="glyphicon glyphicon-map-marker"></span>
                     <b>Address: </b>
                     <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Present_Address") %>' />
                  </li>
               </ul>
            </div>

            <div>
               <asp:LinkButton ID="EditButton" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="Edit" Text="Update Info" />
            </div>
         </div>
      </ItemTemplate>

      <EditItemTemplate>
         <div class="col-md-6 col-sm-12">
            <div class="form-group">
               <label>Name</label>
               <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>' />
            </div>
            <div class="form-group">
               <label>Father&#39;s Name:</label>
               <asp:TextBox ID="FatherNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FatherName") %>' />
            </div>
            <div class="form-group">
               <label>Mother's Name:</label>
               <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("MotherName") %>' />
            </div>
            <div class="form-group">
               <label>Date of Birth:</label>
               <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("DateofBirth") %>' />
            </div>
            <div class="form-group">
               <label>Blood Group:</label>
               <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("BloodGroup") %>' />
            </div>
            <div class="form-group">
               <label>Gender:</label>
               <asp:TextBox ID="GenderTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Gender") %>' />
            </div>
            <div class="form-group">
               <label>Mobile:</label>
               <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Phone") %>' />
            </div>
            <div class="form-group">
               <label>Email:</label>
               <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Email") %>' />
            </div>
            <div class="form-group">
               <label>Present Address:</label>
               <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Present_Address") %>' TextMode="MultiLine" />
            </div>
            <div class="form-group">
               <label>Permanent Address:</label>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Permanent_Address") %>' TextMode="MultiLine" />
            </div>
            <div class="form-group">
               <label>Image:</label>
               <asp:FileUpload ID="ImageFileUpload" runat="server" />
            </div>

            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-default" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />

         </div>
      </EditItemTemplate>
   </asp:FormView>
   <asp:SqlDataSource ID="InfoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.RegistrationID, Registration.UserName, Registration.Validation, Registration.Category, Registration.Name, Registration.FatherName, Registration.MotherName, Registration.DateofBirth, Registration.BloodGroup, Registration.Gender, Registration.NationalID, Registration.Present_Address, Registration.Permanent_Address, Registration.Phone, Registration.Email, Registration.Image, Registration.CreateDate, Volunteer.Volunteer_SN, Volunteer.VolunteerID FROM Registration INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Volunteer.VolunteerID = @VolunteerID)" UpdateCommand="UPDATE Registration SET Name = @Name, FatherName = @FatherName, MotherName = @MotherName, DateofBirth = @DateofBirth, BloodGroup = @BloodGroup, Gender = @Gender, NationalID = @NationalID, Present_Address = @Present_Address, Permanent_Address = @Permanent_Address, Phone = @Phone, Email = @Email WHERE (RegistrationID = @RegistrationID)">
      <SelectParameters>
         <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VolunteerID" />
      </SelectParameters>
      <UpdateParameters>
         <asp:Parameter Name="Name" Type="String" />
         <asp:Parameter Name="FatherName" Type="String" />
         <asp:Parameter Name="MotherName" Type="String" />
         <asp:Parameter Name="DateofBirth" Type="String" />
         <asp:Parameter Name="BloodGroup" Type="String" />
         <asp:Parameter Name="Gender" Type="String" />
         <asp:Parameter Name="NationalID" Type="String" />
         <asp:Parameter Name="Present_Address" Type="String" />
         <asp:Parameter Name="Permanent_Address" Type="String" />
         <asp:Parameter Name="Phone" Type="String" />
         <asp:Parameter Name="Email" Type="String" />
         <asp:Parameter Name="RegistrationID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>

   <h4>Education Info <a data-toggle="modal" data-target="#Edu_Modal">Add New</a></h4>
   <asp:GridView ID="EducationGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="VolunteerEdu_ID" DataSourceID="EducationSQL">
      <Columns>
         <asp:TemplateField HeaderText="Institution Name" SortExpression="InstitutionName">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Degree" SortExpression="Degree">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Text='<%# Bind("Degree") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("Degree") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Field of Study" SortExpression="Field_of_Study">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" Text='<%# Bind("Field_of_Study") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("Field_of_Study") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="From Date" SortExpression="StartDate">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" CssClass="form-control datepicker" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("StartDate", "{0:d MMM yyyy}") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="To Date" SortExpression="EndDate">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" CssClass="form-control datepicker" runat="server" Text='<%# Bind("EndDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("EndDate", "{0:d MMM yyyy}") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Result" SortExpression="Result">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" Text='<%# Bind("Result") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("Result") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="EducationSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT VolunteerEdu_ID, VolunteerID, InstitutionName, Degree, Field_of_Study, StartDate, EndDate, Result FROM Volunteer_Education_Info WHERE (VolunteerID = @VolunteerID)" DeleteCommand="DELETE FROM [Volunteer_Education_Info] WHERE [VolunteerEdu_ID] = @VolunteerEdu_ID" UpdateCommand="UPDATE Volunteer_Education_Info SET InstitutionName = @InstitutionName, Degree = @Degree, Field_of_Study = @Field_of_Study, StartDate = @StartDate, EndDate = @EndDate, Result = @Result WHERE (VolunteerEdu_ID = @VolunteerEdu_ID)" InsertCommand="INSERT INTO Volunteer_Education_Info(VolunteerID, InstitutionName, StartDate, EndDate, Result, Field_of_Study, Degree) VALUES (@VolunteerID, @InstitutionName, @StartDate, @EndDate, @Result, @Field_of_Study, @Degree)">
      <DeleteParameters>
         <asp:Parameter Name="VolunteerEdu_ID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VolunteerID" />
         <asp:ControlParameter ControlID="Institution_NameTextBox" Name="InstitutionName" PropertyName="Text" />
         <asp:ControlParameter ControlID="StartDateTextBox" Name="StartDate" PropertyName="Text" />
         <asp:ControlParameter ControlID="EndDateTextBox" Name="EndDate" PropertyName="Text" />
         <asp:ControlParameter ControlID="ResultTextBox" Name="Result" PropertyName="Text" />
         <asp:ControlParameter ControlID="Field_of_StudyTextBox" Name="Field_of_Study" PropertyName="Text" />
         <asp:ControlParameter ControlID="DegreeTextBox" Name="Degree" PropertyName="Text" />
      </InsertParameters>
      <SelectParameters>
         <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VolunteerID" />
      </SelectParameters>
      <UpdateParameters>
         <asp:Parameter Name="InstitutionName" Type="String" />
         <asp:Parameter Name="Degree" Type="String" />
         <asp:Parameter Name="Field_of_Study" Type="String" />
         <asp:Parameter DbType="Date" Name="StartDate" />
         <asp:Parameter DbType="Date" Name="EndDate" />
         <asp:Parameter Name="Result" Type="String" />
         <asp:Parameter Name="VolunteerEdu_ID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>
   <br />
   <h4>Experience <a data-toggle="modal" data-target="#Expr_Modal">Add New</a></h4>
   <asp:GridView ID="ExperienceGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Volunteer_ExperienceID" DataSourceID="ExperienceSQL">
      <Columns>
         <asp:TemplateField HeaderText="Title" SortExpression="Title">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Institution Name" SortExpression="InstitutionName">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Location" SortExpression="Location">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Start Date" SortExpression="StartDate">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" CssClass="form-control datepicker" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("StartDate", "{0:d MMM yyyy}") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="End Date" SortExpression="EndDate">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" CssClass="form-control datepicker" runat="server" Text='<%# Bind("EndDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("EndDate", "{0:d MMM yyyy}") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Description" SortExpression="Job_Description">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" Text='<%# Bind("Job_Description") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("Job_Description") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Current Work" SortExpression="Is_Current">
            <EditItemTemplate>
               <asp:CheckBox ID="CheckBox1" runat="server" Text=" " Checked='<%# Bind("Is_Current") %>' />
            </EditItemTemplate>
            <ItemTemplate>
               <asp:CheckBox ID="CheckBox1" Text=" " runat="server" Checked='<%# Bind("Is_Current") %>' Enabled="false" />
            </ItemTemplate>
         </asp:TemplateField>
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="ExperienceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer_ExperienceID, VolunteerID, Title, InstitutionName, Location, StartDate, EndDate, Job_Description, Is_Current FROM Volunteer_Experience WHERE (VolunteerID = @VolunteerID)" DeleteCommand="DELETE FROM [Volunteer_Experience] WHERE [Volunteer_ExperienceID] = @Volunteer_ExperienceID" UpdateCommand="UPDATE Volunteer_Experience SET Title = @Title, InstitutionName = @InstitutionName, Location = @Location, StartDate = @StartDate, EndDate = @EndDate, Job_Description = @Job_Description, Is_Current = @Is_Current WHERE (Volunteer_ExperienceID = @Volunteer_ExperienceID)" InsertCommand="INSERT INTO [Volunteer_Experience] ([VolunteerID], [Title], [InstitutionName], [Location], [StartDate], [EndDate], [Job_Description], [Is_Current]) VALUES (@VolunteerID, @Title, @InstitutionName, @Location, @StartDate, @EndDate, @Job_Description, @Is_Current)">
      <DeleteParameters>
         <asp:Parameter Name="Volunteer_ExperienceID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VolunteerID" />
         <asp:ControlParameter ControlID="TitleTextBox" Name="Title" PropertyName="Text" />
         <asp:ControlParameter ControlID="Ex_InstitutionName_TextBox" Name="InstitutionName" PropertyName="Text" />
         <asp:ControlParameter ControlID="LocationTextBox" Name="Location" PropertyName="Text" />
         <asp:ControlParameter ControlID="Ex_StartDateTextBox" Name="StartDate" PropertyName="Text" />
         <asp:ControlParameter ControlID="Ex_EndDateTextBox" Name="EndDate" PropertyName="Text" />
         <asp:ControlParameter ControlID="Job_DescriptionTextBox" Name="Job_Description" PropertyName="Text" />
         <asp:ControlParameter ControlID="is_Current_CheckBox" Name="Is_Current" PropertyName="Checked" />
      </InsertParameters>
      <SelectParameters>
         <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VolunteerID" />
      </SelectParameters>
      <UpdateParameters>
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
   <h4>Skills <a data-toggle="modal" data-target="#Skills_Modal">Add New</a></h4>
   <asp:GridView ID="SkillsGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="Volunteer_SkillsID" DataSourceID="SkillsSQL">
      <Columns>
         <asp:TemplateField HeaderText="Skills Name" SortExpression="SkillsName">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("SkillsName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("SkillsName") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:CommandField ShowEditButton="True" />
         <asp:CommandField ShowDeleteButton="True" />
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="SkillsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer_SkillsID, VolunteerID, SkillsName FROM Volunteer_Skills WHERE (VolunteerID = @VolunteerID)" DeleteCommand="DELETE FROM [Volunteer_Skills] WHERE [Volunteer_SkillsID] = @Volunteer_SkillsID" UpdateCommand="UPDATE Volunteer_Skills SET SkillsName = @SkillsName WHERE (Volunteer_SkillsID = @Volunteer_SkillsID)" InsertCommand="INSERT INTO [Volunteer_Skills] ([VolunteerID], [SkillsName]) VALUES (@VolunteerID, @SkillsName)">
      <DeleteParameters>
         <asp:Parameter Name="Volunteer_SkillsID" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VolunteerID" />
         <asp:ControlParameter ControlID="SkillsTextBox" Name="SkillsName" PropertyName="Text" />
      </InsertParameters>
      <SelectParameters>
         <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VolunteerID" />
      </SelectParameters>
      <UpdateParameters>
         <asp:Parameter Name="SkillsName" Type="String" />
         <asp:Parameter Name="Volunteer_SkillsID" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>

   <!-- Edu Modal -->
   <div id="Edu_Modal" class="modal fade" role="dialog">
      <div class="modal-dialog">
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Education Info</h4>
            </div>
            <div class="modal-body">
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
         </div>
      </div>
   </div>

   <!-- Experience Modal -->
   <div id="Expr_Modal" class="modal fade" role="dialog">
      <div class="modal-dialog">
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Experience</h4>
            </div>
            <div class="modal-body">
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
               <div class="form-group">
                  <asp:Button ID="Experience_Button" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="AddExperienceButton_Click" ValidationGroup="Exp" />
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- Skills Modal -->
   <div id="Skills_Modal" class="modal fade" role="dialog">
      <div class="modal-dialog">
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Skills</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  <asp:TextBox ID="SkillsTextBox" runat="server" CssClass="form-control" placeholder="Skills Name"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="SkillsTextBox" CssClass="EroorStar" ErrorMessage="*" ValidationGroup="Skill"></asp:RequiredFieldValidator>
               </div>
               <div class="form-group">
                  <asp:Button ID="SkillButton" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="SkillButton_Click" ValidationGroup="Skill" />
               </div>
            </div>
         </div>
      </div>
   </div>


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
      });
   </script>
</asp:Content>
