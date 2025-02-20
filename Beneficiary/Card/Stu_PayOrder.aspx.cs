using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.Card
{
    public partial class Stu_PayOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["BeneficiaryID"]))
            {
            }
            else
            {
                Response.Redirect("Beneficiary_List.aspx");
            }
        }

        protected void GenerateButton_Click(object sender, EventArgs e)
        {
            GenerateSQL.Insert();
            GenerateGridView.DataBind();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Generate Successfully!')", true);
        }
    }
}