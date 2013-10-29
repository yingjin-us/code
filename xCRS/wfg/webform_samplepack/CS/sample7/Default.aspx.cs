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
using System.IO;
using System.Threading;
using System.Globalization;
using WorkflowGen.My.Web.UI.WebControls;
using System.Collections.Generic;
using WorkflowGen.My.Web.Handlers;

public partial class _Default : WorkflowPage
{

    public _Default()
    {
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {

        //
        //Disable download link if file is a bmp
        //
        //Check if WorkflowFileUpload2 has a file
        if (WorkflowFileUpload2.HasFile)
        {

            //Extract FileInfo from WorkflowFileUpload2
            FileInfo file2 = WorkflowUploadScriptManager.GetCurrentFile(WorkflowFileUpload2);

            //If the extension is .bmp
            if (file2.Extension.Equals(".bmp"))
            {

                //Disable download link
                WorkflowFileUpload2.DownloadLink = false;
            }
        }

        //
        //WorkflowFileUpload3 can upload a file only one time
        //
        //Check if WorkflowFileUpload3 has a file
        if (WorkflowFileUpload3.HasFile)
        {

            //Set the WorkflowFileUpload3 in readonly
            WorkflowFileUpload3.ReadOnly = true;
        }
    }

}