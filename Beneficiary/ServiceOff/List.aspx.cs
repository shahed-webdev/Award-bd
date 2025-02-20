using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.ServiceOff
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BeneficiarySQL_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            CountLabel.Text = "(Total : " + e.AffectedRows.ToString() + ")";
        }

        protected void ClassDropDownList_DataBound(object sender, EventArgs e)
        {
            ClassDropDownList.Items.Insert(0, new ListItem("[ ALL Class ]", "%"));
        }
    }
}