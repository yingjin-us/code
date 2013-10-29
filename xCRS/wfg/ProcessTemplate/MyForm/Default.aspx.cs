using System;
using System.Data;
using System.IO;
using System.Configuration;
using System.Globalization;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using WorkflowGen.My.Web.UI.WebForms;

public partial class _Default : WorkflowPage
{

    protected void Page_Load(object sender, EventArgs e)
    {

        // Initialization
        this.DRAFT.Text = "No";

        // Display the active panel according to the current action
        switch (this.CurrentWorkflowActionName)
        {
            case "ACTION1":
                this.ACTION1_TITLE.CssClass = "PanelTitleActive";
                this.ACTION1_INFO.CssClass = "PanelInfoActive";
                break;

            case "ACTION2":
                this.ACTION2_TITLE.CssClass = "PanelTitleActive";
                this.ACTION2_INFO.CssClass = "PanelInfoActive";
                this.ACTION1_ATTACHMENT.ReadOnly = true;
                break;

            case "ACTION3":
                this.ACTION1_TITLE.CssClass = "PanelTitleActive";
                this.ACTION1_INFO.CssClass = "PanelInfoActive";
                break;
            default:
                break;
        }

        // Change the behavior after a postback
        if (IsPostBack)
        {
            RequiredFieldValidator rfvACTION2_APPROVE = new RequiredFieldValidator();
            SetRequiredField(rfvACTION2_APPROVE, ACTION2_COMMENT, ACTION2_COMMENT.ToolTip, (ACTION2_APPROVE.SelectedValue == "No" || ACTION2_APPROVE.SelectedValue == "To be completed"), false);
        }

    }


    protected void saveButton_Click(object sender, EventArgs e)
    {
        this.DRAFT.Text = "Yes";
        SubmitToWorkflow();
    }


    protected void SetRequiredField(RequiredFieldValidator rfv, TextBox ctrl, String description, bool condition, bool isReadonly)
    {

        rfv.ControlToValidate = ctrl.ID;
        rfv.ErrorMessage = String.Format(this.RequiredFieldsErrorMessage, description);
        rfv.ValidationGroup = "WFGENPage";
        rfv.Display = ValidatorDisplay.None;

        if (condition)
        {
            form1.Controls.Add(rfv);
            ctrl.CssClass = "InputTextRequired";
            ctrl.ReadOnly = false;
            ctrl.Enabled = true;
        }
        else
        {
            ctrl.CssClass = "InputText";
            if (isReadonly)
            {
                ctrl.Text = String.Empty;
                ctrl.ReadOnly = true;
                ctrl.Enabled = false;
            }
        }

    }


    protected override void ChangeFormArchiveLayout()
    {
        base.ChangeFormArchiveLayout();
        
        // Set the CSS file
        this.FormArchiveCssPath = "App_Themes/css/form_archive.css";

        // Hide calendars images
        this.ACTION1_DATE_CAL.Visible = false;

        // Set the file upload in readonly
        this.ACTION1_ATTACHMENT.ReadOnly = true;
        
        // Hide images
        foreach (Control ctrl in this.Form.Controls)
        {
            if (ctrl is Image)
            {
                ctrl.Visible = false;
            }
        }

        // Hide buttons
        foreach (Control ctrl in this.Form.Controls)
        {
            if (ctrl is Button)
            {
                ctrl.Visible = false;
            }
        }

    }


}
