using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIMPRE_BDI
{
    public partial class DataBinding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            String author = row.Cells[3].Text;
            String review = row.Cells[4].Text;
            var movieId = row.Cells[2].Text;
            Label1.Text = "Review author " + author + ", value: " + review;
            Session["movieId"] = movieId;

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.NewSelectedIndex];
            String label = row.Cells[4].Text;

            if (float.Parse(label) < 9.0){
                e.Cancel = true;
                Label1.Text = "You can't select a review lower than 9.0!";
            }

        }
    }
}