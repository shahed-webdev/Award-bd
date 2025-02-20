using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.FoodToken
{
    public partial class Food_Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PageDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(PageDropDownList.SelectedValue);
            BeneficiaryGridView.PageSize = page;
        }
        protected void Add_Schedule_Button_Click(object sender, EventArgs e)
        {
            Add_SQL.Insert();
            ScheduleGridView.DataBind();
            PopupGridView.DataBind();

            Schedule_NameTextBox.Text = "";
            AmountTextBox.Text = "";
            DetailsTextBox.Text = "";
        }

        protected void SUbmit_Button_Click(object sender, EventArgs e)
        {
            int del = 0;
            DateTime StartDate = new DateTime();
            DateTime EndDate = new DateTime();
            StartDate = Convert.ToDateTime(FromDateTextBox.Text);
            EndDate = Convert.ToDateTime(ToDateTextBox.Text);

            foreach (DateTime day in EachDay(StartDate, EndDate))
            {
                foreach (GridViewRow row in ScheduleGridView.Rows)
                {
                    CheckBox SelectCheckBox = row.FindControl("SelectCheckBox") as CheckBox;
                    string Food_ScheduleID = ScheduleGridView.DataKeys[row.DataItemIndex]["Food_ScheduleID"].ToString();
                    Label SH_Amount_Label = row.FindControl("SH_Amount_Label") as Label;
                    if (SelectCheckBox.Checked)
                    {
                        foreach (GridViewRow B_row in BeneficiaryGridView.Rows)
                        {
                            CheckBox B_SelectCheckBox = B_row.FindControl("SelectCheckBox") as CheckBox;


                            if (B_SelectCheckBox.Checked)
                            {
                                del++;
                                In_De_SQL.InsertParameters["BeneficiaryID"].DefaultValue = BeneficiaryGridView.DataKeys[B_row.DataItemIndex % BeneficiaryGridView.PageSize]["BeneficiaryID"].ToString();
                                In_De_SQL.InsertParameters["Food_ScheduleID"].DefaultValue = Food_ScheduleID;
                                In_De_SQL.InsertParameters["ActiveDate"].DefaultValue = day.ToString();
                                In_De_SQL.InsertParameters["Amount"].DefaultValue = SH_Amount_Label.Text;
                                In_De_SQL.Insert();
                                B_row.CssClass = "selected";
                            }
                        }
                        row.CssClass = "selected";
                    }
                }
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + del.ToString() + " Record Inserted Successfully')", true);
        }

        public IEnumerable<DateTime> EachDay(DateTime from, DateTime thru)
        {
            for (var day = from.Date; day.Date <= thru.Date; day = day.AddDays(1))
                yield return day;
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            int del = 0;
            DateTime StartDate = new DateTime();
            DateTime EndDate = new DateTime();
            StartDate = Convert.ToDateTime(FromDateTextBox.Text);
            EndDate = Convert.ToDateTime(ToDateTextBox.Text);

            foreach (DateTime day in EachDay(StartDate, EndDate))
            {
                foreach (GridViewRow row in ScheduleGridView.Rows)
                {
                    CheckBox SelectCheckBox = row.FindControl("SelectCheckBox") as CheckBox;

                    string Food_ScheduleID = ScheduleGridView.DataKeys[row.DataItemIndex]["Food_ScheduleID"].ToString();

                    if (SelectCheckBox.Checked)
                    {
                        foreach (GridViewRow B_row in BeneficiaryGridView.Rows)
                        {
                            CheckBox B_SelectCheckBox = B_row.FindControl("SelectCheckBox") as CheckBox;

                            if (B_SelectCheckBox.Checked)
                            {
                                del++;
                                In_De_SQL.DeleteParameters["BeneficiaryID"].DefaultValue = BeneficiaryGridView.DataKeys[B_row.DataItemIndex % BeneficiaryGridView.PageSize]["BeneficiaryID"].ToString();
                                In_De_SQL.DeleteParameters["Food_ScheduleID"].DefaultValue = Food_ScheduleID;
                                In_De_SQL.DeleteParameters["ActiveDate"].DefaultValue = day.ToString();
                                In_De_SQL.Delete();
                            }
                        }
                    }
                }
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + del.ToString() + " Record Deleted Successfully')", true);
        }
    }
}