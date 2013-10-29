<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" Trace="false" ValidateRequest="false" %>

<%@ Register Assembly="WorkflowGen.My.Web.Handlers" Namespace="WorkflowGen.My.Web.Handlers"
    TagPrefix="cc1" %>

<%@ Register Assembly="WorkflowGen.My.Web.UI.WebControls" Namespace="WorkflowGen.My.Web.UI.WebControls"
    TagPrefix="wfg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sample #6 - WorkflowFileUpload example</title>
    <link href="css/form.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <span class="Form-title-text">Document
            approval</span><br />
            <br />
            <table class="Form-table" style="width: 100%">
                <tr>
                    <td class="Form-table-title" colspan="2">
                        Attached document</td>
                </tr>
                <tr>
                    <td class="Form-table-cell-label">
                        Document</td>
                    <td class="Form-table-cell">
                <wfg:WorkflowFileUpload ID="WorkflowFileUpload1" runat="server" Width="300px" AddText="" Culture="(Default)" DeleteText="" DisplayMode="Display" EmptyFileErrorMessage="" ExtensionRestrictionErrorMessage="" SizeRestrictionErrorMessage="" UpdateText="">
                    <UploadStyle Width="300px" />
                    <ModifyStyle CssClass="Link" />
                    <FileSizeStyle Font-Bold="False" Font-Underline="False" />
                    <AddStyle CssClass="Link" />
                    <DeleteStyle CssClass="Link" />
                    <DownloadStyle CssClass="Link" />
                </wfg:WorkflowFileUpload>
                    </td>
                </tr>
            </table>
        <br />
        <asp:Button ID="submitButton" runat="server" Text="Submit" ValidationGroup="WFGENPage" CssClass="SubmitButton" /><br />
        <br />
        &nbsp;
        <cc1:WorkflowUploadScriptManager ID="WorkflowUploadScriptManager1"
            runat="server" ProgressBarImage="Images/progress-bar.gif" ControlStyle="DHTML" Culture="(Default)" Width="100%" >
        </cc1:WorkflowUploadScriptManager>

    </form>
</body>
</html>
