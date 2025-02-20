using System;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary
{
    public partial class Food_Token : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PageDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(PageDropDownList.SelectedValue);
            BeneficiaryGridView.PageSize = page;
            Provided_GridView.PageSize = page;
        }
        protected void SUbmit_Button_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in BeneficiaryGridView.Rows)
            {
                TextBox WordTextBox = row.FindControl("WordTextBox") as TextBox;
                TextBox BedTextBox = row.FindControl("BedTextBox") as TextBox;
                TextBox AmountTextBox = row.FindControl("AmountTextBox") as TextBox;

                if (WordTextBox.Text != "" && BedTextBox.Text != "" && AmountTextBox.Text != "")
                {
                    BeneficiarySQL.InsertParameters["BeneficiaryID"].DefaultValue = BeneficiaryGridView.DataKeys[row.DataItemIndex % BeneficiaryGridView.PageSize]["BeneficiaryID"].ToString();
                    BeneficiarySQL.InsertParameters["Word"].DefaultValue = WordTextBox.Text;
                    BeneficiarySQL.InsertParameters["Bed"].DefaultValue = BedTextBox.Text;
                    BeneficiarySQL.InsertParameters["Amount"].DefaultValue = AmountTextBox.Text;
                    BeneficiarySQL.Insert();
                }
            }

            Provided_GridView.DataBind();
            BeneficiaryGridView.DataBind();
        }

        protected void Provided_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (Provided_GridView.Rows.Count > 0)
            {
                Provided_GridView.UseAccessibleHeader = true;
                Provided_GridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}