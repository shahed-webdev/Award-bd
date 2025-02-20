using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Accounts.Collection
{
    public partial class Donation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["VolunteerID"]))
            {
                NameLabel.Text = Request.QueryString["N"].ToString();
            }
            else
            {
                Response.Redirect("DonatorList.aspx");
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            DonateSQL.Insert();

            AmountTextBox.Text = "";
            ExpenseDateTextBox.Text = "";
            ExpenseDetailsTextBox.Text = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Insert Successfully!')", true);
        }

        [WebMethod]
        public static string CheckCaseNo(string CaseNo, string BenefitCategoryID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());

            SqlCommand cmd = new SqlCommand("SELECT DISTINCT Beneficiary_Info.BeneficiaryID, Beneficiary_Info.CaseNo FROM Beneficiary_Info INNER JOIN Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID WHERE (Beneficiary_BenefitCategory.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Beneficiary_Info.CaseNo = @CaseNo)", con);
            cmd.Parameters.AddWithValue("@CaseNo",CaseNo.Trim());
            cmd.Parameters.AddWithValue("@BenefitCategoryID", BenefitCategoryID);

            con.Open();
            object dr = cmd.ExecuteScalar();
            con.Close();

            if (dr != null)
            {
                return "Ture";
            }
            else
            {
                return "false";
            }
        }
    }
}