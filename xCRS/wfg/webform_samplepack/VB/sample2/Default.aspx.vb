
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Collections.Generic
Imports System.Xml
Imports System.IO

Partial Class _Default
    Inherits WorkflowGen.My.Web.UI.WebForms.WorkflowPage

    Private NewformData As FormData

    Public Sub New()
        MyBase.New()
        ' Set the SimpleMode property to False in order to use the Advanced mode.
        IsSimpleMode = False

        ' Set the automatic xml signatures enabled
        IsXmlSigningEnabled = True
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' fill the form data
        NewformData = New FormData
        FillFormData(NewformData)

        ' List all precedent xml signatures
        SignatureList.Text = "<strong>Xml signatures of previous actions :</strong><br>"
        For Each key As String In XmlSignatures.Keys

            SignatureList.Text += "<br>" + key + "<br>"

            For Each index As Integer In XmlSignatures(key).Keys

                SignatureList.Text += "<strong>" + index.ToString() + " : </strong> isValid : " + Me.IsXmlSignatureValid(key, index).ToString() + "<br>"
            Next
        Next

        ' Bind the page
        If Not Page.IsPostBack Then
            ' Be sure that the submit button uses the WorkflowPage validation group, or else, 
            ' validation does not occur
            Me.SubmitButton.ValidationGroup = WorkflowGen.My.Web.UI.WebForms.Fields.PAGE_VALIDATION_GROUP

            ' Bind the form data to the fields on the page
            BindFormDataToFields(NewformData)
        End If
    End Sub

    Protected Sub SubmitButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        ' Save the file attachments
        SaveFileAttachment(FILE_UPLOAD.PostedFile)
        SaveFileAttachment(HTML_INPUT_FILE.PostedFile)

        ' update the form data values with the web form field values
        SaveFieldsData(NewformData)

        ' submit to workflowgen
        SubmitToWorkflow(NewformData)
    End Sub

    Protected Sub PEOPLE_LIST_RowUpdated(ByVal sender As Object, ByVal e As GridViewUpdatedEventArgs)

        ' When we update a row, we save the data
        SaveFormData(NewformData)
    End Sub

    Protected Sub PEOPLE_LIST_RowDeleted(ByVal sender As Object, ByVal e As GridViewDeletedEventArgs)

        ' When we delete a row, we save the data
        SaveFormData(NewformData)
    End Sub

	Protected Sub PeopleListObjectDataSource_ObjectCreating(ByVal sender As Object, ByVal e As ObjectDataSourceEventArgs)
        ' Attach the instance of the PEOPLE_LIST to the PeopleListObjectDataSource
        If Not NewformData.PEOPLE_LIST Is Nothing Then
            e.ObjectInstance = New PeopleListBusinessObject(NewformData.PEOPLE_LIST)
        End If
    End Sub



    Protected Sub InsertPerson_Click(ByVal sender As Object, ByVal e As EventArgs)

        ' Insert a new row in the PEOPLE_LIST data table, change the EditIndex so that we can fill in
        ' the new person's informations and then rebind the PEOPLE_LIST.
        NewformData.PEOPLE_LIST.AddPEOPLE_LISTRow("", "")
        PEOPLE_LIST.EditIndex = NewformData.PEOPLE_LIST.Rows.Count - 1
        PEOPLE_LIST.DataBind()
    End Sub

End Class