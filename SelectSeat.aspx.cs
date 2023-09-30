using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class SelectSeat : System.Web.UI.Page
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

            return i;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowSeatQty();
        }

        protected void ShowSeatQty()
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();
            string strReadOrderID = "SELECT TOP 1 orderID FROM [Order] ORDER BY orderID DESC";
            SqlCommand cmdReadOrder;
            cmdReadOrder = new SqlCommand(strReadOrderID, con);
            lblOrder.Text = cmdReadOrder.ExecuteScalar().ToString();

            string strReadSeatQty = "SELECT totalSeats FROM [Order] WHERE orderID = @id";
            SqlCommand cmdReadQty;
            cmdReadQty = new SqlCommand(strReadSeatQty, con);
            cmdReadQty.Parameters.AddWithValue("@id", lblOrder.Text);
            int qty = Convert.ToInt32(cmdReadQty.ExecuteScalar().ToString());
            con.Close();
            lblSeats.Text = qty.ToString();
        }

        protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Button b = (Button)e.Item.FindControl("btnSeat");

                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();
                
                string strReadDate = "SELECT departureDate FROM [Order] WHERE orderID = @oID";
                SqlCommand cmdReadDate;
                cmdReadDate = new SqlCommand(strReadDate, con);
                cmdReadDate.Parameters.AddWithValue("@oID", generateOrderID());
                lblDate.Text = cmdReadDate.ExecuteScalar().ToString();

                string strReadRoute = "SELECT route FROM [Order] WHERE orderID = @oID";
                SqlCommand cmdReadRoute;
                cmdReadRoute = new SqlCommand(strReadRoute, con);
                cmdReadRoute.Parameters.AddWithValue("@oID", generateOrderID());
                lblRoute.Text = cmdReadRoute.ExecuteScalar().ToString();

                string strReadSeat = "SELECT TOP 1 * FROM SeatDetails SD WHERE SD.departureDate = @date AND SD.route = @route AND SD.seatID = @seat";
                SqlCommand cmdReadSeat;
                cmdReadSeat = new SqlCommand(strReadSeat, con);
                cmdReadSeat.Parameters.AddWithValue("@date", Convert.ToDateTime(lblDate.Text));
                cmdReadSeat.Parameters.AddWithValue("@route", lblRoute.Text);
                cmdReadSeat.Parameters.AddWithValue("@seat", Convert.ToInt32(b.Text));
                object bookedSeats = cmdReadSeat.ExecuteScalar();

                if (bookedSeats != null)
                {
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                }

                con.Close();

            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            int seats = 0;
            int intInsertStatus;

            foreach (RepeaterItem itm in rSeat.Items)
            {
                Button b = (Button)itm.FindControl("btnSeat");
                if (itm.ItemType == ListItemType.Item || itm.ItemType == ListItemType.AlternatingItem)
                {
                    if (b.BackColor == Color.LightGreen)
                    {
                        seats++;
                    }
                }
            }

            if (seats == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select the correct number of seats.')", true);
            }
            else if (seats > Convert.ToInt32(lblSeats.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Selected seats outnumber order amount.')", true);
            }
            else
            {
                foreach (RepeaterItem itm in rSeat.Items)
                {
                    
                    Button b = (Button)itm.FindControl("btnSeat");
                    if (itm.ItemType == ListItemType.Item || itm.ItemType == ListItemType.AlternatingItem)
                    {
                        SqlConnection con;
                        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        con = new SqlConnection(strCon);
                        con.Open();

                        if (b.BackColor == Color.LightGreen)
                        {
                            string strInsert = "Insert into SeatDetails(orderID, seatID, seatStatus, departureDate, route) Values (@oID, @sID, @status, @date, @route)";
                            SqlCommand cmdInsert;
                            cmdInsert = new SqlCommand(strInsert, con);
                            cmdInsert.Parameters.AddWithValue("@oID", generateOrderID());
                            cmdInsert.Parameters.AddWithValue("@sID", Convert.ToInt32(b.Text));
                            cmdInsert.Parameters.AddWithValue("@status", "Booked");
                            cmdInsert.Parameters.AddWithValue("@date", Convert.ToDateTime(lblDate.Text));
                            cmdInsert.Parameters.AddWithValue("@route", lblRoute.Text);

                            intInsertStatus = cmdInsert.ExecuteNonQuery();
                            
                            con.Close();
                        }
                    }  
                }

                Response.Redirect("Checkout.aspx");
            }
            
        }

        protected void btnSeat_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;

            if (b.BackColor == Color.Gainsboro)
            {
                b.BackColor = Color.LightGreen;
            }
            else if (b.BackColor == Color.Red)
            {
                b.Enabled = false;
            }
            else
            {
                b.BackColor = Color.Gainsboro;
            }
        }
    }
}