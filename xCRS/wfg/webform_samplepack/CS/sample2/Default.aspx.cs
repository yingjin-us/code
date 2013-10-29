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
using System.Collections.Generic;
using System.Xml;
using System.IO;

public partial class _Default : WorkflowPage
{
    private FormData formData;

    public _Default() : base()
    {
        // Set the SimpleMode property to False in order to use the Advanced mode.
        IsSimpleMode = false;

        // Set the automatic xml signatures enabled
        IsXmlSigningEnabled = true;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // fill the form data
        formData = new FormData();
        FillFormData(formData);

        // List all precedent xml signatures
        SignatureList.Text = "<strong>Xml signatures of previous actions :</strong><br>";
        foreach (string key in XmlSignatures.Keys)
        {
            SignatureList.Text  += "<br>" + key + "<br>";

            foreach (int index in XmlSignatures[key].Keys)
            {
                SignatureList.Text += "<strong>" + index + " : </strong> isValid : " + this.IsXmlSignatureValid(key, index) + "<br>";
            }
        }

        // bind the page
        if (!Page.IsPostBack)
        {
            // Be sure that the submit button uses the WorkflowPage validation group, or else, 
            // validation does not occur
            this.SubmitButton.ValidationGroup = Fields.PAGE_VALIDATION_GROUP;

            // Binds the form data to the page fields
            BindFormDataToFields(formData);
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {

        // Save the file attachments
        SaveFileAttachment(FILE_UPLOAD.PostedFile);
        SaveFileAttachment(HTML_INPUT_FILE.PostedFile);

        // update the form data values with the web form field values
        SaveFieldsData(formData);

        // submit to workflowgen
        SubmitToWorkflow(formData);
    }

    protected void PEOPLE_LIST_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        // When we update a row, we save the data
        SaveFormData(formData);
    }

    protected void PEOPLE_LIST_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        // When we delete a row, we save the data
        SaveFormData(formData);
    }

    protected void PeopleListObjectDataSource_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
    {
        // Attach the instance of the PEOPLE_LIST to the PeopleListObjectDataSource
        e.ObjectInstance = new PeopleListBusinessObject(formData.PEOPLE_LIST);
    }

    protected void InsertPerson_Click(object sender, EventArgs e)
    {
        // Insert a new row in the PEOPLE_LIST data table, change the EditIndex so that we can fill in
        // the new person's informations and then rebind the PEOPLE_LIST.
        formData.PEOPLE_LIST.AddPEOPLE_LISTRow("", "");
        PEOPLE_LIST.EditIndex = formData.PEOPLE_LIST.Rows.Count - 1;
        PEOPLE_LIST.DataBind();
    }
}
