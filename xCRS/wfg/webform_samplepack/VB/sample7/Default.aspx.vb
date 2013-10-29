Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports WorkflowGen.My.Web.UI.WebForms
Imports System.IO
Imports System.Threading
Imports System.Globalization
Imports WorkflowGen.My.Web.UI.WebControls
Imports System.Collections.Generic
Imports WorkflowGen.My.Web.Handlers


Partial Class _Default
    Inherits WorkflowPage

    Public Sub _Default()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '
        'Disable download link if file is a bmp
        '
        'Check if WorkflowFileUpload2 has a file
        If (WorkflowFileUpload2.HasFile) Then


            'Extract FileInfo from WorkflowFileUpload2
            Dim file2 As FileInfo = WorkflowUploadScriptManager.GetCurrentFile(WorkflowFileUpload2)

            'If the extension is .bmp
            If (file2.Extension.Equals(".bmp")) Then


                'Disable download link
                WorkflowFileUpload2.DownloadLink = False

            End If
        End If

        '
        'WorkflowFileUpload3 can upload a file only one time
        '
        'Check if WorkflowFileUpload3 has a file
        If (WorkflowFileUpload3.HasFile) Then


            'Set the WorkflowFileUpload3 in readonly
            WorkflowFileUpload3.ReadOnly = True
        End If
    End Sub

End Class