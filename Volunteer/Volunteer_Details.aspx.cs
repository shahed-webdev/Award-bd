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

namespace Award__bd.Volunteer
{
    public partial class Volunteer_Expense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["VolunteerID"]))
            {
                Response.Redirect("Volunteer_List.aspx");
            }
        }
        protected void InfoFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            FileUpload StudentImageFileUpload = (FileUpload)InfoFormView.FindControl("ImageFileUpload");

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
                    cmd.CommandText = "UPDATE Registration SET Image = @Image FROM Registration INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Volunteer.VolunteerID = @VolunteerID)";

                    cmd.Parameters.AddWithValue("@VolunteerID", Request.QueryString["VolunteerID"]);
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
        protected void Education_Info_Button_Click(object sender, EventArgs e)
        {
            EducationSQL.Insert();

            Institution_NameTextBox.Text = "";
            StartDateTextBox.Text = "";
            EndDateTextBox.Text = "";
            ResultTextBox.Text = "";
            DegreeTextBox.Text = "";
            Field_of_StudyTextBox.Text = "";
        }

        protected void AddExperienceButton_Click(object sender, EventArgs e)
        {
            ExperienceSQL.Insert();

            TitleTextBox.Text = "";
            Ex_InstitutionName_TextBox.Text = "";
            LocationTextBox.Text = "";
            Ex_StartDateTextBox.Text = "";
            Ex_EndDateTextBox.Text = "";
            is_Current_CheckBox.Checked = false;
            Job_DescriptionTextBox.Text = "";
            Experience_Button.Text = "";
        }

        protected void SkillButton_Click(object sender, EventArgs e)
        {
            SkillsSQL.Insert();
            SkillsTextBox.Text = "";
        }
    }
}