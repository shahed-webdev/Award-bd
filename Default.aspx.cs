using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CustomerLogin_LoginError(object sender, EventArgs e)
        {
            MembershipUser usrInfo = Membership.GetUser(UserLogin.UserName.Trim());
            if (usrInfo != null)
            {
                if (usrInfo.IsLockedOut)
                {
                    UserLogin.FailureText = "Your account has been locked out because of too many invalid login attempts. Please contact the administrator to have your account unlocked.";
                }
                else if (!usrInfo.IsApproved)
                {
                    UserLogin.FailureText = "Your account has not been approved. You cannot login until an administrator has approved your account.";
                }
            }
            else
            {
                UserLogin.FailureText = "Your login attempt was not successful. Please try again.";
            }
        }

        protected void CustomerLogin_LoggedIn(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());

            SqlCommand RegistrationIDcmd = new SqlCommand("SELECT RegistrationID FROM Registration WHERE UserName = @UserName", con);
            RegistrationIDcmd.Parameters.AddWithValue("@UserName", UserLogin.UserName.Trim());

            con.Open();
            string RegistrationID = RegistrationIDcmd.ExecuteScalar().ToString(); 

            SqlCommand VolunteerID_Cmd = new SqlCommand("SELECT VolunteerID FROM Volunteer WHERE (Volunteer_RegistrationID = @Volunteer_RegistrationID)", con);
            VolunteerID_Cmd.Parameters.AddWithValue("@Volunteer_RegistrationID", RegistrationID);

            object O_VolunteerID = VolunteerID_Cmd.ExecuteScalar();
            con.Close();

            Session["RegistrationID"] = RegistrationID;


            if (O_VolunteerID != null)
            {
                Session["VolunteerID"] = O_VolunteerID;
            }
        }
    }
}