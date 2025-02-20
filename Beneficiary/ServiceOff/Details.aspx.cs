using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.ServiceOff
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ServiceButton_Click(object sender, EventArgs e)
        {
            ApproveSQL.Update();
            Response.Redirect("List.aspx");
        }

        protected void EditLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Beneficiary/Edit_Beneficiary.aspx?BeneficiaryID=" + Request.QueryString["BeneficiaryID"]);
        }
    }
}