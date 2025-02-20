using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary
{
    public partial class Add_beneficiary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
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
                Beneficiary_InfoSQL.Insert();

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                SqlCommand BeneficiaryIDcmd = new SqlCommand("SELECT IDENT_CURRENT('Beneficiary_Info')", con);

                con.Open();
                string BeneficiaryID = BeneficiaryIDcmd.ExecuteScalar().ToString();
                con.Close();

                //Beneficiary_BenefitCategory insert
                foreach (ListItem item in CategoryCheckBoxList.Items)
                {
                    if (item.Selected)
                    {
                        Beneficiary_BenefitCategorySQL.InsertParameters["BeneficiaryID"].DefaultValue = BeneficiaryID;
                        Beneficiary_BenefitCategorySQL.InsertParameters["BenefitCategoryID"].DefaultValue = item.Value;
                        Beneficiary_BenefitCategorySQL.Insert();

                    }
                }
                //Beneficiary_Expense insert
                foreach (GridViewRow rows in CategoryGridView.Rows)
                {
                    TextBox PercentageTextBox = (TextBox)rows.FindControl("PercentageTextBox");

                    if (PercentageTextBox.Text != "")
                    {
                        Beneficiary_Expense_CategorySQL.InsertParameters["BeneficiaryID"].DefaultValue = BeneficiaryID;
                        Beneficiary_Expense_CategorySQL.InsertParameters["ExpenseCategoryID"].DefaultValue = CategoryGridView.DataKeys[rows.DataItemIndex]["ExpenseCategoryID"].ToString();
                        Beneficiary_Expense_CategorySQL.InsertParameters["Persentage"].DefaultValue = PercentageTextBox.Text;
                        Beneficiary_Expense_CategorySQL.Insert();
                    }
                }




                Image();
                Response.Redirect("Add_Family_Details.aspx?BeneficiaryID=" + BeneficiaryID);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Select Categoty');", true);
            }
        }

        protected void Image()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());

            if (ImageFileUpload.PostedFile != null && ImageFileUpload.PostedFile.FileName != "")
            {
                string strExtension = System.IO.Path.GetExtension(ImageFileUpload.FileName);
                if ((strExtension.ToUpper() == ".JPG") | (strExtension.ToUpper() == ".GIF") | (strExtension.ToUpper() == ".PNG"))
                {
                    // Resize Image Before Uploading to DataBase
                    System.Drawing.Image imageToBeResized = System.Drawing.Image.FromStream(ImageFileUpload.PostedFile.InputStream);
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


                    //Create SQL Command
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "UPDATE Beneficiary_Info SET Beneficiary_Image = @Beneficiary_Image WHERE (BeneficiaryID = (Select IDENT_CURRENT('Beneficiary_Info')))";
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = con;

                    SqlParameter UploadedImage = new SqlParameter("@Beneficiary_Image", SqlDbType.Image, image.Length);

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
        }


        [WebMethod]
        public static string CheckAvailability(string username)
        {
            string retval = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());


            SqlCommand cmd = new SqlCommand("SELECT Beneficiary_NID FROM  Beneficiary_Info WHERE (Beneficiary_NID = @Beneficiary_NID)", con);
            cmd.Parameters.AddWithValue("@Beneficiary_NID", username);

            con.Open();
            object  dr = cmd.ExecuteScalar();
            con.Close();

            if (dr != null)
            {
                retval = "true";
            }
            else
            {
                retval = "false";
            }

            return retval;
        }

    }
}
