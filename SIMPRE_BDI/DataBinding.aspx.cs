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
            Label author = (Label)row.Cells[3].Controls[1];
            Label review = (Label)row.Cells[4].Controls[1];
            Label movieId = (Label)row.Cells[2].Controls[1];
            Label1.Text = "Review author " + author.Text + ", value: " + review.Text;
            Session["movieId"] = movieId.Text;

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.NewSelectedIndex];
            Label label = (Label)row.Cells[4].Controls[1];

            if (float.Parse(label.Text) < 9.0){
                e.Cancel = true;
                Label1.Text = "You can't select a review lower than 9.0!";
            }

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Add" && Page.IsValid) {
                ReviewsSqlDataSource.Insert();
            }
        }

        protected void ReviewsSqlDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            DropDownList ddlMovies = (DropDownList)GridView1.FooterRow.FindControl("ddlMovies");
            TextBox tbAuthor = (TextBox)GridView1.FooterRow.FindControl("tbAuthor");
            TextBox tbReview = (TextBox)GridView1.FooterRow.FindControl("tbReview");

            e.Command.Parameters["@idMovie"].Value = ddlMovies.SelectedItem.Value;
            e.Command.Parameters["@author"].Value = tbAuthor.Text;
            e.Command.Parameters["@evaluation"].Value = tbReview.Text;


        }
    }
}