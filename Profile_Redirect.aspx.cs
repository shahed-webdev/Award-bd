using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace Award__bd
{
    public partial class Profile_Redirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());

            SqlCommand User_Validity = new SqlCommand("SELECT Validation FROM Registration WHERE UserName = @UserName and Validation = 'Valid'", con);
            User_Validity.Parameters.AddWithValue("@UserName", User.Identity.Name.Trim());

            con.Open();
            string User_Validation = User_Validity.ExecuteScalar().ToString();
            con.Close();

            if (User_Validation == "Valid")  //Is User Invalid
            {
                if (Roles.IsUserInRole(User.Identity.Name.Trim(), "Admin"))
                    Response.Redirect("~/Profile/Admin.aspx");

                if (Roles.IsUserInRole(User.Identity.Name.Trim(), "Volunteer"))
                    Response.Redirect("~/Profile/Volunteer.aspx");

               
            }
            else
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Login.aspx?Invalid=User Locked by Admin");
            }
        }
    }
}