using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class SelectBus : System.Web.UI.Page
    {
        private int generateOrderID()
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select COUNT(orderID) from [Order]", con);
            int i = (int)cmd.ExecuteScalar();
            con.Close();
            i++;

            return i;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cldDeparture_SelectionChanged(object sender, EventArgs e)
        {
            if (cldDeparture.SelectedDate < DateTime.Now.Date)
            {
                txtDepartDate.Text = "";
            }
            else
            {
                txtDepartDate.Text = cldDeparture.SelectedDate.ToShortDateString();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtAdult.Text = "0";
            txtSenior.Text = "0";
            txtChild.Text = "0";
            txtStudent.Text = "0";
            txtDepartDate.Text = "";
            ddlRoute.SelectedIndex = 0;
        }

        protected void btnSelectSeat_Click(object sender, EventArgs e)
        {
            int senior = Convert.ToInt32(txtSenior.Text);
            int adult = Convert.ToInt32(txtAdult.Text);
            int child = Convert.ToInt32(txtChild.Text);
            int student = Convert.ToInt32(txtStudent.Text);
            int total = senior + adult + child + student;

            if (total == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please purchase at least one ticket.')", true);
            }
            else if (total > 40)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Number of tickets exceed number of seats.')", true);
            }
            else
            {
                Session["senior"] = txtSenior.Text;
                Session["adult"] = txtAdult.Text;
                Session["child"] = txtChild.Text;
                Session["student"] = txtStudent.Text;
                Session["route"] = ddlRoute.SelectedItem.Value;
                Session["date"] = txtDepartDate.Text;

                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();
                string strInsert = "Insert into [Order](orderID, orderDate, departureDate, route, senior, adult, child, student, totalSeats) Values (@oID, @oDate, @dDate, @route, @senior, @adult, @child, @student, @total)";
                SqlCommand cmdInsert;
                cmdInsert = new SqlCommand(strInsert, con);
                cmdInsert.Parameters.AddWithValue("@oID", generateOrderID());
                cmdInsert.Parameters.AddWithValue("@oDate", DateTime.Now);
                cmdInsert.Parameters.AddWithValue("@dDate", cldDeparture.SelectedDate);
                cmdInsert.Parameters.AddWithValue("@route", ddlRoute.SelectedItem.Value);
                cmdInsert.Parameters.AddWithValue("@senior", senior);
                cmdInsert.Parameters.AddWithValue("@adult", adult);
                cmdInsert.Parameters.AddWithValue("@child", child);
                cmdInsert.Parameters.AddWithValue("@student", student);
                cmdInsert.Parameters.AddWithValue("@total", total);
                int intInsertStatus = cmdInsert.ExecuteNonQuery();
                if (intInsertStatus > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order has been made!')", true);
                    Response.Redirect("SelectSeat.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error Placing Order')", true);
                }
                con.Close();
            }


        }

        protected void btnDisplayHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewHistory.aspx");
        }
    }
}