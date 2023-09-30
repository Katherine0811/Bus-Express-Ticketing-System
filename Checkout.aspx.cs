using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblSenior.Text = Session["senior"].ToString();
            lblAdult.Text = Session["adult"].ToString();
            lblChild.Text = Session["child"].ToString();
            lblStudent.Text = Session["student"].ToString();
            lblRoute.Text = Session["route"].ToString();
            lblDate.Text = Session["date"].ToString();

            double senior = Convert.ToInt32(Session["senior"].ToString()) * 2.0;
            double adult = Convert.ToInt32(Session["adult"].ToString()) * 8.0;
            double child = Convert.ToInt32(Session["child"].ToString()) * 2.0;
            double student = Convert.ToInt32(Session["student"].ToString()) * 4.0;

            lblSeniorTotal.Text = String.Format("{0:0.00}", senior);
            lblAdultTotal.Text = String.Format("{0:0.00}", adult);
            lblChildTotal.Text = String.Format("{0:0.00}", child);
            lblStudentTotal.Text = String.Format("{0:0.00}", student);

            lblTotal.Text = String.Format("{0:0.00}", senior + adult + child + student);
        }

        protected void cvYear_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string year = DateTime.Now.Year.ToString();
            int month = DateTime.Now.Month;
            if (ddlYear.SelectedItem.Value == year && ddlMonth.SelectedIndex < month)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            var page = HttpContext.Current.CurrentHandler as Page;
            string msg = "Successfully checkout!";
            string aspx = "SelectBus.aspx";
            ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", "alert('" + msg + "');window.location ='" + aspx + "';", true);
            Session.Abandon();
            Session.Clear();
        }
    }
}