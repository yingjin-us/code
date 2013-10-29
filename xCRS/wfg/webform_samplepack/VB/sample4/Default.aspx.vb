Imports System.Threading
Imports WorkflowGen.My.Web.UI.WebForms

Partial Class _Default
    Inherits WorkflowPage

    'Define a class level formDataSet
    Protected myFormDataSet As MyDataSet

    Public Sub New()

        'Set the SimpleMode property to False in order to use the Advanced mode.
        Me.IsSimpleMode = False

        'Disabled the automatic xml signatures
        Me.IsXmlSigningEnabled = False

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Create the form dataset and load the WorkflowGen data 
        Me.myFormDataSet = New MyDataSet
        Me.FillFormData(Me.myFormDataSet)

        SubmitButton.ValidationGroup = Fields.PAGE_VALIDATION_GROUP

        'Bind the fields value
        If (Not Page.IsPostBack) Then

            'Bind the page
            Me.BindFormDataToFields(Me.myFormDataSet)

            'Bind selected department 
            If (Not Me.myFormDataSet.Tables("Table1").Rows(0)("EMP_DEPT").Equals(System.DBNull.Value)) Then
                Me.EMP_DEPT.SelectedValue = Convert.ToString(Me.myFormDataSet.Tables("Table1").Rows(0)("EMP_DEPT"))

                'Bind the selected department unit
                If (Not Me.myFormDataSet.Tables("Table1").Rows(0)("EMP_UNIT").Equals(System.DBNull.Value)) Then
                    Me.EMP_UNIT.SelectedValue = Convert.ToString(Me.myFormDataSet.Tables("Table1").Rows(0)("EMP_UNIT"))
                End If
            End If
        End If

        'Setup the calendar object
        If (Me.CurrentWorkflowActionName <> "INITIATES") Then
            Me.Date_CalendarPopup.Enabled = False
            Me.PROJECT_RESOURCES.Columns(6).Visible = False
        End If

    End Sub

    ''' <summary>
    ''' Overrides the ChangeFormArchiveLayout so that we can hide the calendar popup control
    ''' </summary>
    ''' <remarks></remarks>
    Protected Overrides Sub ChangeFormArchiveLayout()
        Date_CalendarPopup.Visible = False
        Me.PROJECT_RESOURCES.Columns(6).Visible = False

        MyBase.ChangeFormArchiveLayout()
    End Sub

    Protected Sub SubmitButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitButton.Click

        'Save the fields value into the Form DataSet

        If (Me.CurrentWorkflowActionName = "INITIATES") Then

            'Save attachment files into temporary folders
            Me.SaveFileAttachment(Me.PROJECT_ATTACHMENT.PostedFile)

            'Hide the calendar objects
            Me.Date_CalendarPopup.Visible = False

        ElseIf Me.CurrentWorkflowActionName = "APPROVES" Then

        End If

        'Update the form data values with the web form field values
        Me.SaveFieldsData(Me.myFormDataSet)

        'Submit to workflowgen
        Me.SubmitToWorkflow(Me.myFormDataSet)

    End Sub

    Protected Sub ObjectDataSource1_ObjectCreating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles ResourceListDataSource.ObjectCreating
        e.ObjectInstance = New ResourceListBusinessObject(myFormDataSet.ResourceList)
    End Sub

    Protected Sub INSERT_RESOURCE_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles INSERT_RESOURCE.Click
        myFormDataSet.ResourceList.AddResourceListRow("", "", Date.Now, Date.Now, 0)
        PROJECT_RESOURCES.EditIndex = myFormDataSet.ResourceList.Rows.Count - 1
        PROJECT_RESOURCES.DataBind()
    End Sub

    Protected Sub ResourceListGridView_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles PROJECT_RESOURCES.RowDeleted
        SaveFormData(myFormDataSet)
    End Sub

    Protected Sub ResourceListGridView_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles PROJECT_RESOURCES.RowUpdated
        SaveFormData(myFormDataSet)
    End Sub
End Class
