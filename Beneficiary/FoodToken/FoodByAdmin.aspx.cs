using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.FoodToken
{
    public partial class FoodByAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GivenButton_Click(object sender, EventArgs e)
        {
            FoodSQL.UpdateParameters["Food_Schedule_AssignID"].DefaultValue = InfoFormView.DataKey["Food_Schedule_AssignID"].ToString();
            FoodSQL.Update();
            InfoFormView.DataBind();

            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void InfoFormView_DataBound(object sender, EventArgs e)
        {
            if (InfoFormView.DataItemCount == 0)
            {
                GivenButton.Visible = false;
            }
            else
            {
                GivenButton.Visible = true;
            }
        }
    }
}