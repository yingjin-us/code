
Partial Class Form
    Inherits WorkflowGen.My.Web.UI.WebForms.WorkflowPage

    Public Sub New()
    	Me.RequiredFieldsBorderColor = Drawing.Color.Firebrick
    End Sub

    Protected Sub REQUEST_TYPE_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles REQUEST_TYPE.SelectedIndexChanged
        Me.REQUEST_CORRECT_NUM_RequiredFieldValidator.Enabled = (Me.REQUEST_TYPE.SelectedValue = "CORRECT")
    End Sub

End Class
