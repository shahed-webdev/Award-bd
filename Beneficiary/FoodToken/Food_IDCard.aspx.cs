using System;

namespace Award__bd.Beneficiary.FoodToken
{
    public partial class Food_IDCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IDTextBox.Text != "")
            {
                IftarCardSQL.FilterExpression = "CaseNo IN (" + IDTextBox.Text + ")";
                FoodTokenRepeater.DataBind();
            }
        }
    }
}