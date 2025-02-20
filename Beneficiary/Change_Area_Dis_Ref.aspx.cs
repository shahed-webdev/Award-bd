using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary
{
    public partial class Change_Area_Dis_Ref : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangeAreaButton_Click(object sender, EventArgs e)
        {
            OldAreaSQL.Update();
        }

        protected void ChangeDistrictButton_Click(object sender, EventArgs e)
        {
            OldDistrictSQL.Update();
        }

        protected void ChangeReferenceButton_Click(object sender, EventArgs e)
        {
            OldReferenceSQL.Update();
        }
    }
}