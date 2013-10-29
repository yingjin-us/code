using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using WorkflowGen.My.Web.UI.WebForms;

public partial class Form : WorkflowPage
{
    public Form()
    {

        // Change Automatic colors default settings
        this.RequiredFieldsBorderColor = System.Drawing.Color.Firebrick;        
    }

    protected void REQUEST_TYPE_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Set the  REQUEST_CORRECT_NUM field required if CORRECTION request type       
        REQUEST_CORRECT_NUM_RequiredFieldValidator.Enabled = (REQUEST_TYPE.SelectedValue == "CORRECT");
    }

}
