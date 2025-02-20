using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Award__bd.Volunteer
{
    public partial class Page_Access : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UserListDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            LinkGridView.DataBind();
            foreach (GridViewRow row in LinkGridView.Rows)
            {
                CheckBox LinkCheckBox = (CheckBox)row.FindControl("LinkCheckBox");

                SqlCommand LinkCmd = new SqlCommand("select LinkID from Link_Users where UserName = @UserName and LinkID = @LinkID", con);
                LinkCmd.Parameters.AddWithValue("@UserName", UserListDropDownList.SelectedValue);
                LinkCmd.Parameters.AddWithValue("@LinkID", LinkGridView.DataKeys[row.DataItemIndex].Value.ToString());

                object CheckPages = LinkCmd.ExecuteScalar();

                if (CheckPages != null)
                {
                    LinkCheckBox.Checked = true;
                    row.CssClass = "selected";
                }
            }

            foreach (ListItem item in CategoryCheckBoxList.Items)
            {

                SqlCommand BenefitCategoryCmd = new SqlCommand("SELECT  Volunteer_BenefitCategory.Volunteer_BenefitCategoryID FROM Registration INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID INNER JOIN Volunteer_BenefitCategory ON Volunteer.VolunteerID = Volunteer_BenefitCategory.VolunteerID WHERE (Registration.UserName = @UserName) AND (Volunteer_BenefitCategory.BenefitCategoryID = @BenefitCategoryID)", con);
                BenefitCategoryCmd.Parameters.AddWithValue("@UserName", UserListDropDownList.SelectedValue);
                BenefitCategoryCmd.Parameters.AddWithValue("@BenefitCategoryID", item.Value);

                object Obj_BenefitCategory = BenefitCategoryCmd.ExecuteScalar();

                if (Obj_BenefitCategory != null)
                {
                    item.Selected = true;
                }
                else
                { item.Selected = false; }

            }
            con.Close();
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

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            SqlCommand RegIDCmd = new SqlCommand("SELECT RegistrationID from Registration where UserName = @UserName", con);
            RegIDCmd.Parameters.AddWithValue("@UserName", UserListDropDownList.SelectedValue);

            con.Open();
            string RegistrationID = RegIDCmd.ExecuteScalar().ToString();
            con.Close();

            foreach (GridViewRow row in LinkGridView.Rows)
            {
                CheckBox LinkCheckBox = (CheckBox)row.FindControl("LinkCheckBox");

                if (LinkCheckBox.Checked)
                {
                    UpdateLinkSQL.InsertParameters["LinkID"].DefaultValue = LinkGridView.DataKeys[row.DataItemIndex]["LinkID"].ToString();
                    UpdateLinkSQL.InsertParameters["RegistrationID"].DefaultValue = RegistrationID;
                    UpdateLinkSQL.Insert();

                    if (Roles.RoleExists(LinkGridView.DataKeys[row.DataItemIndex]["RoleName"].ToString().Trim()))
                    {
                        if (!Roles.IsUserInRole(UserListDropDownList.SelectedValue, LinkGridView.DataKeys[row.DataItemIndex]["RoleName"].ToString().Trim()))
                        {
                            Roles.AddUserToRole(UserListDropDownList.SelectedValue, LinkGridView.DataKeys[row.DataItemIndex]["RoleName"].ToString().Trim());
                        }
                    }
                }
                else
                {
                    UpdateLinkSQL.DeleteParameters["LinkID"].DefaultValue = LinkGridView.DataKeys[row.DataItemIndex]["LinkID"].ToString();
                    UpdateLinkSQL.Delete();

                    if (Roles.RoleExists(LinkGridView.DataKeys[row.DataItemIndex]["RoleName"].ToString().Trim()))
                    {
                        if (Roles.IsUserInRole(UserListDropDownList.SelectedValue, LinkGridView.DataKeys[row.DataItemIndex]["RoleName"].ToString().Trim()))
                        {
                            Roles.RemoveUserFromRole(UserListDropDownList.SelectedValue, LinkGridView.DataKeys[row.DataItemIndex]["RoleName"].ToString().Trim());
                        }
                    }
                }
            }


            //Beneficiary_BenefitCategory insert
            CategorySQL.Delete();
            foreach (ListItem item in CategoryCheckBoxList.Items)
            {
                if (item.Selected)
                {
                    CategorySQL.InsertParameters["BenefitCategoryID"].DefaultValue = item.Value;
                    CategorySQL.Insert();
                }
            }
        }
    }
}