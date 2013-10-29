Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports WorkflowGen.My.Web.UI.Webforms
Imports System.Reflection
Imports System.Collections
Partial Class _Default
    Inherits WorkflowPage
    Public Sub _Default()
        'Turn Off Client Side Optimization in order to use Atlas properly.
        Me.UseClientSideOptimization = False
    End Sub
    Protected Sub CalendarSample_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        'Put the selected date in the TextBox
        Me.DatePickerTextBox.Text = CalendarSample.SelectedDate.ToShortDateString()
    End Sub
    Protected Sub EMPLOYEE_LIST_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If (e.Row.RowType = System.Web.UI.WebControls.DataControlRowType.DataRow And _
            (e.Row.RowState = DataControlRowState.Normal) Or _
            e.Row.RowState = (DataControlRowState.Normal Or DataControlRowState.Alternate)) Then
            Dim salary As Label

            salary = e.Row.FindControl("SALARY")

            'If salary is over a milion, colorize the back color of the row
            If (Not String.IsNullOrEmpty(salary.Text)) Then

                If (Double.Parse(salary.Text) > 1000000) Then
                    e.Row.BackColor = System.Drawing.Color.LightGray
                End If
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Make sure that if the user saved the form as a draft, we choose the correct values
        'in both drop down lists and the Date picker too

        If (Not Page.IsPostBack) And (FormData.Tables("Table1").Rows.Count > 0) Then
            If (Not IsNothing(FormData.Tables("Table1").Rows(0)("Unit"))) Then
                Department.DataBind()
                Department.SelectedIndex = Department.Items.IndexOf(Department.Items.FindByValue((FormData.Tables("Table1").Rows(0)("Department")).ToString()))
                Unit.DataBind()
                Unit.SelectedIndex = Unit.Items.IndexOf(Unit.Items.FindByValue((FormData.Tables("Table1").Rows(0)("Unit")).ToString()))
            End If

            If (Not IsNothing(FormData.Tables("Table1").Rows(0)("DatePickerTextBox"))) Then

                If (Not String.IsNullOrEmpty(FormData.Tables("Table1").Rows(0)("DatePickerTextBox").ToString())) Then
                    Me.CalendarSample.SelectedDate = FormData.Tables("Table1").Rows(0)("DatePickerTextBox")
                    Me.CalendarSample.VisibleDate = Me.CalendarSample.SelectedDate
                End If

            End If
        End If
    End Sub
End Class