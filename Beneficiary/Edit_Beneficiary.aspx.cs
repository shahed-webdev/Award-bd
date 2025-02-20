using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary
{
    public partial class Edit_Beneficiary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void EditFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            LogSQL.InsertParameters["Details"].DefaultValue = "Beneficiary information Changed";
            LogSQL.Insert();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            FileUpload StudentImageFileUpload = (FileUpload)EditFormView.FindControl("ImageFileUpload");

            if (StudentImageFileUpload.PostedFile != null && StudentImageFileUpload.PostedFile.FileName != "")
            {

                string strExtension = System.IO.Path.GetExtension(StudentImageFileUpload.FileName);
                if ((strExtension.ToUpper() == ".JPG") | (strExtension.ToUpper() == ".GIF"))
                {
                    // Resize Image Before Uploading to DataBase
                    System.Drawing.Image imageToBeResized = System.Drawing.Image.FromStream(StudentImageFileUpload.PostedFile.InputStream);
                    int imageHeight = imageToBeResized.Height;
                    int imageWidth = imageToBeResized.Width;

                    int maxHeight = 430;
                    int maxWidth = 400;

                    imageHeight = (imageHeight * maxWidth) / imageWidth;
                    imageWidth = maxWidth;

                    if (imageHeight > maxHeight)
                    {
                        imageWidth = (imageWidth * maxHeight) / imageHeight;
                        imageHeight = maxHeight;
                    }

                    Bitmap bitmap = new Bitmap(imageToBeResized, imageWidth, imageHeight);
                    System.IO.MemoryStream stream = new MemoryStream();
                    bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                    stream.Position = 0;
                    byte[] image = new byte[stream.Length + 1];
                    stream.Read(image, 0, image.Length);


                    // Create SQL Command
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "UPDATE Beneficiary_Info SET Beneficiary_Image = @Image Where BeneficiaryID = @BeneficiaryID";

                    cmd.Parameters.AddWithValue("@BeneficiaryID", Request.QueryString["BeneficiaryID"]);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;

                    SqlParameter UploadedImage = new SqlParameter("@Image", SqlDbType.Image, image.Length);

                    UploadedImage.Value = image;
                    cmd.Parameters.Add(UploadedImage);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
            }
        
        }
        protected void Select(object sender, EventArgs e)
        {
            string selectedValue = "";
            foreach (ListItem item in CategoryCheckBoxList.Items)
            {
                if (item.Selected)
                {
                    selectedValue += item.Value + ',';
                }
            }

            Benefit_Expense_CategorySQL.SelectParameters["BenefitCategoryID"].DefaultValue = selectedValue;
            CategoryGridView.DataBind();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            foreach (GridViewRow rows in CategoryGridView.Rows)
            {
                TextBox PercentageTextBox = (TextBox)rows.FindControl("PercentageTextBox");
                HiddenField ExpenseCategoryID_HF = (HiddenField)rows.FindControl("ExpenseCategoryID_HF");

                SqlCommand BenefitCategoryIDcmd = new SqlCommand("SELECT Persentage FROM Beneficiary_Expense_Category WHERE (BeneficiaryID = @BeneficiaryID) AND (ExpenseCategoryID = @ExpenseCategoryID)", con);
                BenefitCategoryIDcmd.Parameters.AddWithValue("@BeneficiaryID", Request.QueryString["BeneficiaryID"]);
                BenefitCategoryIDcmd.Parameters.AddWithValue("@ExpenseCategoryID", ExpenseCategoryID_HF.Value);
                con.Open();
                if (BenefitCategoryIDcmd.ExecuteScalar() != null)
                {
                    PercentageTextBox.Text = BenefitCategoryIDcmd.ExecuteScalar().ToString();
                }
                con.Close();
            }
        }


        protected void CategoryCheckBoxList_DataBound(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            string selectedValue = "";
            foreach (ListItem item in CategoryCheckBoxList.Items)
            {
                SqlCommand BenefitCategoryIDcmd = new SqlCommand("SELECT  BenefitCategoryID FROM Beneficiary_BenefitCategory WHERE (BeneficiaryID = @BeneficiaryID) AND (BenefitCategoryID = @BenefitCategoryID)", con);
                BenefitCategoryIDcmd.Parameters.AddWithValue("@BeneficiaryID", Request.QueryString["BeneficiaryID"]);
                BenefitCategoryIDcmd.Parameters.AddWithValue("@BenefitCategoryID", item.Value);
                con.Open();
                if (BenefitCategoryIDcmd.ExecuteScalar() != null)
                {
                    item.Selected = true;
                    selectedValue += item.Value + ',';
                }
                con.Close();
            }

            Benefit_Expense_CategorySQL.SelectParameters["BenefitCategoryID"].DefaultValue = selectedValue;
            CategoryGridView.DataBind();

            foreach (GridViewRow rows in CategoryGridView.Rows)
            {
                TextBox PercentageTextBox = (TextBox)rows.FindControl("PercentageTextBox");
                HiddenField ExpenseCategoryID_HF = (HiddenField)rows.FindControl("ExpenseCategoryID_HF");

                SqlCommand BenefitCategoryIDcmd = new SqlCommand("SELECT Persentage FROM Beneficiary_Expense_Category WHERE (BeneficiaryID = @BeneficiaryID) AND (ExpenseCategoryID = @ExpenseCategoryID)", con);
                BenefitCategoryIDcmd.Parameters.AddWithValue("@BeneficiaryID", Request.QueryString["BeneficiaryID"]);
                BenefitCategoryIDcmd.Parameters.AddWithValue("@ExpenseCategoryID", ExpenseCategoryID_HF.Value);
                con.Open();
                if (BenefitCategoryIDcmd.ExecuteScalar() != null)
                {
                    PercentageTextBox.Text = BenefitCategoryIDcmd.ExecuteScalar().ToString();
                }
                con.Close();
            }
        }

        protected void Update_Benefit_Button_Click(object sender, EventArgs e)
        {
            bool Check_Category = false;
            foreach (ListItem item in CategoryCheckBoxList.Items)
            {
                if (item.Selected)
                {
                    Check_Category = true;
                }
            }
            if (Check_Category)
            {
                Benefit_Expense_CategorySQL.Delete();
                //Beneficiary_Expense insert
                foreach (GridViewRow rows in CategoryGridView.Rows)
                {
                    TextBox PercentageTextBox = (TextBox)rows.FindControl("PercentageTextBox");
                    HiddenField ExpenseCategoryID_HF = (HiddenField)rows.FindControl("ExpenseCategoryID_HF");
                    if (PercentageTextBox.Text != "")
                    {
                        Benefit_Expense_CategorySQL.InsertParameters["ExpenseCategoryID"].DefaultValue = ExpenseCategoryID_HF.Value;
                        Benefit_Expense_CategorySQL.InsertParameters["Persentage"].DefaultValue = PercentageTextBox.Text;
                        Benefit_Expense_CategorySQL.Insert();
                    }
                }

                CategorySQL.Delete();
                //Beneficiary_BenefitCategory insert
                foreach (ListItem item in CategoryCheckBoxList.Items)
                {
                    if (item.Selected)
                    {
                        CategorySQL.InsertParameters["BenefitCategoryID"].DefaultValue = item.Value;
                        CategorySQL.Insert();
                    }
                }

                LogSQL.InsertParameters["Details"].DefaultValue = "Beneficiary benefit Category & Persentage Changed";
                LogSQL.Insert();
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            Beneficiary_FamilySQL.Insert();

            LogSQL.InsertParameters["Details"].DefaultValue = "Beneficiary Family information added";
            LogSQL.Insert();
        }

        protected void FamilyGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

            LogSQL.InsertParameters["Details"].DefaultValue = "Beneficiary Family information Deleted";
            LogSQL.Insert();
        }

        protected void FamilyGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

            LogSQL.InsertParameters["Details"].DefaultValue = "Beneficiary Family information Changed";
            LogSQL.Insert();
        }
    }
}