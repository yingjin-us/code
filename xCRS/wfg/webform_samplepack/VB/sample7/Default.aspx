<%@ Page Language="VB" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" Trace="false" ValidateRequest="false" %>

<%@ Register Assembly="WorkflowGen.My.Web.Handlers" Namespace="WorkflowGen.My.Web.Handlers"
    TagPrefix="cc1" %>
    
<%@ Register Assembly="WorkflowGen.My.Web.UI.WebControls" Namespace="WorkflowGen.My.Web.UI.WebControls"
    TagPrefix="wfg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sample #7 - WorkflowFileUpload example</title>
    <link href="css/form.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <span class="Form-title-text">Document
            approval</span><br />
            <br />
        &nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <table class="Form-table" style="width: 100%">
                <tr>
                    <td class="Form-table-title" colspan="2">
                        Attached documents</td>
                </tr>
                <tr>
                    <td class="Form-table-cell-label">
                        Text document (2MB maximum)</td>
                    <td class="Form-table-cell">
                <wfg:WorkflowFileUpload ID="WorkflowFileUpload1" runat="server" Width="300px" AddText="" Culture="(Default)" DeleteText="" DisplayMode="Display" EmptyFileErrorMessage="Please choose a document" ExtensionRestrictionErrorMessage="Only txt, rtf, doc and docx documents are allowed" SizeRestrictionErrorMessage="Maximum size is 2MB" UpdateText="" AllowedExtensions="doc,docx,rtf,txt" AutoPostBack="True" FileSizeLimit="2048" ShowFileSize="True"><ModifyStyle CssClass="Link" />
                    <FileSizeStyle Font-Bold="False" Font-Underline="False" />
                    <AddStyle CssClass="Link" />
                    <DeleteStyle CssClass="Link" />
                    <UploadStyle Width="300px" />
                    <DownloadStyle CssClass="Link" />
                </wfg:WorkflowFileUpload>
                    </td>
                </tr>
                <tr>
                    <td class="Form-table-cell-label">
                        Image document</td>
                    <td class="Form-table-cell">
                        <wfg:WorkflowFileUpload ID="WorkflowFileUpload2" runat="server" Width="300px" AddText="Add" Culture="(Default)" DeleteText="" DisplayMode="Display" EmptyFileErrorMessage="Please select an Image" ExtensionRestrictionErrorMessage="This file is not an Image" SizeRestrictionErrorMessage="This image is too heavy" UpdateText="" AllowedExtensions="gif,jpg,jpeg,bmp,png" AutoPostBack="False" FileSizeLimit="0" DownloadLink="True" ShowFileSize="False">
                            <ModifyStyle CssClass="Link" />
                            <FileSizeStyle Font-Bold="False" Font-Underline="False" />
                            <AddStyle CssClass="Link" />
                            <DeleteStyle CssClass="Link" />
                            <UploadStyle Width="300px" />
                            <DownloadStyle CssClass="Link" />
                        </wfg:WorkflowFileUpload>
                    </td>
                </tr>
                <tr>
                    <td class="Form-table-cell-label">
                        Other document (except *.exe)</td>
                    <td class="Form-table-cell">
                        <wfg:WorkflowFileUpload ID="WorkflowFileUpload3" runat="server" Width="300px" AddText="" Culture="(Default)" DeleteText="" DisplayMode="Display" EmptyFileErrorMessage="" ExtensionRestrictionErrorMessage="Executables are not allowed" SizeRestrictionErrorMessage="" UpdateText="" AllowedExtensions="" AutoPostBack="False" ForbiddenExtensions="exe" DownloadLink="True" FileSizeLimit="0" ShowFileSize="True">
                            <ModifyStyle CssClass="Link" />
                            <FileSizeStyle Font-Bold="False" Font-Underline="False" />
                            <AddStyle CssClass="Link" />
                            <DeleteStyle CssClass="Link" />
                            <UploadStyle Width="300px" />
                            <DownloadStyle CssClass="Link" />
                        </wfg:WorkflowFileUpload>
                    </td>
                </tr>
            </table>
            </ContentTemplate>
        </asp:UpdatePanel>
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
