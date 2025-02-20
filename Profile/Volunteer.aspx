<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Volunteer.aspx.cs" Inherits="Award__bd.Profile.Volunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link href="/Volunteer/CSS/CV.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <asp:FormView ID="InfoFormView" runat="server" DataKeyNames="RegistrationID" DataSourceID="InfoSQL" Width="100%">
      <ItemTemplate>
         <div class="form-inline uline">
            <div class="form-group">
               <img alt="No Image" src="/Handler/Admin.ashx?Img=<%#Eval("RegistrationID") %>" class="img-responsive P_Image" />
            </div>
            <div class="form-group">
               <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' CssClass="UName" /><br />
               <b>Father's Name:</b>
               <asp:Label ID="FatherNameLabel" runat="server" Text='<%# Bind("FatherName") %>' /><br />

               <b>Mobile:</b>
               <asp:Label ID="PhoneLabel1" runat="server" Text='<%# Bind("Phone") %>' />
               ,

               <b>Email: </b>
               <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' /><br />

               <b>Address: </b>
               <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Present_Address") %>' />
            </div>
         </div>
      </ItemTemplate>
   </asp:FormView>
   <asp:SqlDataSource ID="InfoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.RegistrationID, Registration.UserName, Registration.Validation, Registration.Category, Registration.Name, Registration.FatherName, Registration.MotherName, Registration.DateofBirth, Registration.BloodGroup, Registration.Gender, Registration.NationalID, Registration.Present_Address, Registration.Permanent_Address, Registration.Phone, Registration.Email, Registration.Image, Registration.CreateDate, Volunteer.Volunteer_SN, Volunteer.VolunteerID FROM Registration INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Volunteer.VolunteerID = @VolunteerID)">
      <SelectParameters>
         <asp:SessionParameter Name="VolunteerID" SessionField="VolunteerID" />
      </SelectParameters>
   </asp:SqlDataSource>

   <div class="CV_Title">Experience</div>
   <asp:DataList ID="ExperienceDL" runat="server" DataSourceID="ExperienceSQL" Width="100%">
      <ItemTemplate>
         <div class="row row_border">
            <div class="col-sm-3">
               <div class="Degree">
                  <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
               </div>
               <div class="St_Date">
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("StartDate","{0:d MMM yyyy}") %>' />
                  -
                  <asp:Label ID="Experince_ED_Label" runat="server" Text='<%# Bind("EndDate","{0:d MMM yyyy}") %>' />
               </div>
            </div>
            <div class="col-sm-9">
               Institution Name:
            <asp:Label ID="InstitutionNameLabel" runat="server" Text='<%# Bind("InstitutionName") %>' />
               <br />
               Location:
            <asp:Label ID="LocationLabel" runat="server" Text='<%# Bind("Location") %>' />
               <br />
               <asp:Label ID="Job_DescriptionLabel" runat="server" Text='<%# Bind("Job_Description") %>' />
            </div>
      </ItemTemplate>
   </asp:DataList>
   <asp:SqlDataSource ID="ExperienceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer_ExperienceID, VolunteerID, Title, InstitutionName, Location, StartDate, EndDate, Job_Description, Is_Current FROM Volunteer_Experience WHERE (VolunteerID = @VolunteerID) ORDER BY StartDate DESC">
      <SelectParameters>
         <asp:SessionParameter Name="VolunteerID" SessionField="VolunteerID" />
      </SelectParameters>
   </asp:SqlDataSource>

   <div class="CV_Title">Skills</div>
   <asp:DataList ID="SkillsDL" runat="server" DataSourceID="SkillsSQL" Width="100%" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <ItemTemplate>
         <div class="Skills">
            <ul>
               <li>
                  <asp:Label ID="SkillsNameLabel" runat="server" Text='<%# Bind("SkillsName") %>' /></li>
            </ul>
         </div>
      </ItemTemplate>
   </asp:DataList>
   <asp:SqlDataSource ID="SkillsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer_SkillsID, VolunteerID, SkillsName FROM Volunteer_Skills WHERE (VolunteerID = @VolunteerID)">
      <SelectParameters>
         <asp:SessionParameter Name="VolunteerID" SessionField="VolunteerID" />
      </SelectParameters>
   </asp:SqlDataSource>

   <div class="CV_Title">Education</div>
   <asp:DataList ID="EducationDL" runat="server" DataSourceID="EducationSQL" Width="100%">
      <ItemTemplate>
         <div class="row row_border">
            <div class="col-sm-3">
               <div class="Degree">
                  <asp:Label ID="DegreeLabel" runat="server" Text='<%# Bind("Degree") %>' />
               </div>
               <div class="St_Date">
                  <asp:Label ID="StartDateLabel" runat="server" Text='<%# Bind("StartDate","{0:d MMM yyyy}") %>' />
                  -
            <asp:Label ID="EndDateLabel" runat="server" Text='<%# Bind("EndDate","{0:d MMM yyyy}") %>' />
               </div>
            </div>

            <div class="col-sm-9">
               Institution Name:
            <asp:Label ID="InstitutionNameLabel" runat="server" Text='<%# Bind("InstitutionName") %>' />
               <br />
               Field of Study:
            <asp:Label ID="Field_of_StudyLabel" runat="server" Text='<%# Bind("Field_of_Study") %>' />
               <br />
               Result:
            <asp:Label ID="ResultLabel" runat="server" Text='<%# Bind("Result") %>' />
            </div>
         </div>
      </ItemTemplate>
   </asp:DataList>
   <asp:SqlDataSource ID="EducationSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT VolunteerEdu_ID, VolunteerID, InstitutionName, Degree, Field_of_Study, StartDate, EndDate, Result FROM Volunteer_Education_Info WHERE (VolunteerID = @VolunteerID) ORDER BY StartDate">
      <SelectParameters>
         <asp:SessionParameter Name="VolunteerID" SessionField="VolunteerID" />
      </SelectParameters>
   </asp:SqlDataSource>

   <div class="pull-right DB">
      Develop by: Loops IT
   </div>

   <div class="NoPrint">
      <a onclick="window.print();">Print</a> | 
      <a href="Change_Password.aspx">Change Password</a> | 
      <a href="/Profile/Volunteer_edit.aspx">Edit</a>
   </div>

   <script>
      $(function () {
         if ($('#body_ExperienceDL_Experince_ED_Label_0').html() == "") {
            $('#body_ExperienceDL_Experince_ED_Label_0').html("At present");
         }
      })
   </script>
</asp:Content>
