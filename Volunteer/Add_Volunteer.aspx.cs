using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Award__bd
{
    public partial class Add_Volunteer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubAdminCreateUserWizard_CreatedUser(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());

            Roles.AddUserToRole(SubAdminCreateUserWizard.UserName, "Volunteer");

            SqlDataSource RegistrationSQL = (SqlDataSource)SubAdminCreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegistrationSQL");
            RegistrationSQL.Insert();

            con.Open();
            SqlCommand RegistrationID_Cmd = new SqlCommand("Select IDENT_CURRENT('Registration')", con);
            string RegistrationID = RegistrationID_Cmd.ExecuteScalar().ToString();
            con.Close();

            ViewState["RegistrationID"] = RegistrationID;

            VolunteerSQL.InsertParameters["Volunteer_RegistrationID"].DefaultValue = RegistrationID;
            VolunteerSQL.Insert();

            UserInfoSQL.InsertParameters["RegistrationID"].DefaultValue = RegistrationID;
            UserInfoSQL.InsertParameters["UserName"].DefaultValue = SubAdminCreateUserWizard.UserName;
            UserInfoSQL.InsertParameters["Password"].DefaultValue = SubAdminCreateUserWizard.Password;
            UserInfoSQL.Insert();

            EduSQL.SelectParameters["VolunteerID"].DefaultValue = ViewState["VolunteerID"].ToString();
            Education_InfoGridView.DataBind();

            SubAdminCreateUserWizard.ActiveStepIndex = 1;
        }
        protected void LinkAssignButton_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in LinkGridView.Rows)
            {
                CheckBox LinkCheckbox = row.FindControl("LinkCheckBox") as CheckBox;

                if (LinkCheckbox.Checked)
                {
                    if (Roles.RoleExists(LinkGridView.DataKeys[row.DataItemIndex]["RoleName"].ToString()))
                    {
                        if (!Roles.IsUserInRole(SubAdminCreateUserWizard.UserName, LinkGridView.DataKeys[row.DataItemIndex]["RoleName"].ToString()))
                        {
                            Roles.AddUserToRole(SubAdminCreateUserWizard.UserName, LinkGridView.DataKeys[row.DataItemIndex]["RoleName"].ToString());
                        }
                    }

                    Link_UserSQL.InsertParameters["RegistrationID"].DefaultValue = ViewState["RegistrationID"].ToString();
                    Link_UserSQL.InsertParameters["LinkID"].DefaultValue = LinkGridView.DataKeys[row.DataItemIndex]["LinkID"].ToString();
                    Link_UserSQL.InsertParameters["UserName"].DefaultValue = SubAdminCreateUserWizard.UserName;
                    Link_UserSQL.Insert();

                    SubAdminCreateUserWizard.ActiveStepIndex = 2;
                }
            }

            //Beneficiary_BenefitCategory insert
            foreach (ListItem item in CategoryCheckBoxList.Items)
            {
                if (item.Selected)
                {
                    CategorySQL.InsertParameters["RegistrationID"].DefaultValue = ViewState["RegistrationID"].ToString();
                    CategorySQL.InsertParameters["BenefitCategoryID"].DefaultValue = item.Value;
                    CategorySQL.InsertParameters["VolunteerID"].DefaultValue = ViewState["VolunteerID"].ToString();
                    CategorySQL.Insert();

                }
            }
        }

        protected void LinkGridView_DataBound(object sender, EventArgs e)
        {
            int RowSpan = 2;
            for (int i = LinkGridView.Rows.Count - 2; i >= 0; i--)
            {
                GridViewRow currRow = LinkGridView.Rows[i];
                GridViewRow prevRow = LinkGridView.Rows[i + 1];

                if (currRow.Cells[0].Text == prevRow.Cells[0].Text && currRow.Cells[1].Text == prevRow.Cells[1].Text)
                {
                    currRow.Cells[0].RowSpan = RowSpan;
                    prevRow.Cells[0].Visible = false;

                    currRow.Cells[1].RowSpan = RowSpan;
                    prevRow.Cells[1].Visible = false;
                    RowSpan += 1;
                }
                else
                    RowSpan = 2;

            }
        }
        protected void VolunteerSQL_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ViewState["VolunteerID"] = e.Command.Parameters["@VolunteerID"].Value;           
        }

        protected void Education_Info_Button_Click(object sender, EventArgs e)
        {
            EduSQL.InsertParameters["VolunteerID"].DefaultValue = ViewState["VolunteerID"].ToString();
            EduSQL.Insert();

            Education_InfoGridView.DataBind();

            Institution_NameTextBox.Text = "";
            StartDateTextBox.Text = "";
            EndDateTextBox.Text = "";
            ResultTextBox.Text = "";
        }

        protected void NextButton_Click(object sender, EventArgs e)
        {
            ExperienceSQL.SelectParameters["VolunteerID"].DefaultValue = ViewState["VolunteerID"].ToString();
            ExperienceGridView.DataBind();

            SubAdminCreateUserWizard.ActiveStepIndex = 3;
        }

        protected void Ex_NextButton_Click(object sender, EventArgs e)
        {
            SkillSSQL.SelectParameters["VolunteerID"].DefaultValue = ViewState["VolunteerID"].ToString();
            SkillGridView.DataBind();

            SubAdminCreateUserWizard.ActiveStepIndex = 4;
        }

        protected void AddExperienceButton_Click(object sender, EventArgs e)
        {
            ExperienceSQL.InsertParameters["VolunteerID"].DefaultValue = ViewState["VolunteerID"].ToString();
            ExperienceSQL.Insert();
            ExperienceGridView.DataBind();
        }

        protected void SkillButton_Click(object sender, EventArgs e)
        {
            SkillSSQL.InsertParameters["VolunteerID"].DefaultValue = ViewState["VolunteerID"].ToString();
            SkillSSQL.Insert();
            SkillsTextBox.Text = "";
        }

        protected void SkillNextButton_Click(object sender, EventArgs e)
        {
            SubAdminCreateUserWizard.ActiveStepIndex = 5;
        }
    }
}