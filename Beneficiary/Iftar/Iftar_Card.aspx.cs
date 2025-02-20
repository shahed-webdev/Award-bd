using System;

namespace Award__bd.Beneficiary.Iftar
{
    public partial class Iftar_Card : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IDTextBox.Text != "")
            {
                IftarCardSQL.FilterExpression = "CaseNo IN (" + IDTextBox.Text + ")";
                IftarCardRepeater.DataBind();
            }
        }
    }
}