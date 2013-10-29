using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using WorkflowGen.My.Web.UI.WebForms;
using System.Reflection;
using System.Collections;


public partial class _Default : WorkflowPage
{
    public _Default()
    {
        // Turn Off Client Side Optimization in order to use Atlas properly.
        this.UseClientSideOptimization = false;
    }
   

    protected void Page_Load(object sender, EventArgs e)
    {
        // Make sure that if the user saved the form as a draft, we choose the correct values
        // in both drop down lists and the Date picker too

        if (!Page.IsPostBack && FormData.Tables["Table1"].Rows.Count > 0)
        {
            if (FormData.Tables["Table1"].Rows[0]["Unit"] != DBNull.Value)
            {
                Department.DataBind();
                Department.SelectedIndex = Department.Items.IndexOf(Department.Items.FindByValue((string)FormData.Tables["Table1"].Rows[0]["Department"]));
                Unit.DataBind();
                Unit.SelectedIndex = Unit.Items.IndexOf(Unit.Items.FindByValue((string)FormData.Tables["Table1"].Rows[0]["Unit"]));
            }

            if (FormData.Tables["Table1"].Rows[0]["DatePickerTextBox"] != DBNull.Value)
            {
                this.CalendarSample.SelectedDate = DateTime.Parse(FormData.Tables["Table1"].Rows[0]["DatePickerTextBox"].ToString());
                this.CalendarSample.VisibleDate = this.CalendarSample.SelectedDate;
            }
        }
    }

    protected void EMPLOYEE_LIST_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow &&
            (e.Row.RowState == DataControlRowState.Normal ||
            e.Row.RowState == (DataControlRowState.Normal | DataControlRowState.Alternate)))
        {
            Label salary = e.Row.FindControl("SALARY") as Label;

            // If salary is over a milion, colorize the back color of the row
            if (!string.IsNullOrEmpty(salary.Text))
            {
                if (Double.Parse(salary.Text) > 1000000)
                {
                    e.Row.BackColor = System.Drawing.Color.LightGray;
                }
            }
        }
    }

    protected void CalendarSample_SelectionChanged(object sender, EventArgs e)
    {
        // Put the selected date in the TextBox
        this.DatePickerTextBox.Text = CalendarSample.SelectedDate.ToShortDateString();
    }
}