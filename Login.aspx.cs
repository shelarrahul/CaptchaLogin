using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaptchaLogin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                fillCaptcha();
            }
        }

        private void fillCaptcha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                {
                    captcha.Append(combination[random.Next(combination.Length)]);
                    Session["captcha"] = captcha.ToString();
                    string cp = captcha.ToString();
                    imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
                }
            }
            catch
            {
                throw;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cp = Session["captcha"].ToString();
            if (cp != TextBox3.Text)
            {
                lblErrorMsg.Text = "Invalid Captcha Code";
            }
            else
            {
                SqlConnection con = new SqlConnection(@"Data Source=MOBS;Initial Catalog=rahul;Integrated Security=True");
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from register where name=@name and password=@password", con);
                    cmd.Parameters.AddWithValue("name", TextBox1.Text);
                    cmd.Parameters.AddWithValue("password", TextBox2.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["id"] = dr.GetValue(0).ToString();
                            Session["usertype"] = dr.GetValue(6).ToString();
                            Session["name"] = dr.GetValue(1).ToString();
                            Response.Write("<script> alert('login sucessful')</script>");
                        }
                        if (Session["usertype"].Equals("Admin"))
                        {
                            Response.Redirect("admin.aspx");
                        }
                        else
                        {
                            Response.Redirect("Homepage.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script> alert('Invalid Credentials')</script>");
                        dr.Close();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            fillCaptcha();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }
    }
}