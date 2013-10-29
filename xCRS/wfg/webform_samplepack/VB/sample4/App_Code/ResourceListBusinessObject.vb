Imports Microsoft.VisualBasic

Public Class ResourceListBusinessObject
    Private resourceListDataTable As MyDataSet.ResourceListDataTable

    Public Sub New(ByVal resourceListDataTable As MyDataSet.ResourceListDataTable)
        Me.resourceListDataTable = resourceListDataTable
    End Sub

    Public Function GetResourceList() As MyDataSet.ResourceListDataTable
        Return Me.resourceListDataTable
    End Function

    Public Sub UpdateOrInsertResource(ByVal ID As Int32, ByVal FIRST_NAME As String, ByVal LAST_NAME As String, ByVal FROMDATE As Date, ByVal TODATE As Date, ByVal EMPLOYEE_ID As Int32)
        Dim tempRow As MyDataSet.ResourceListRow
        tempRow = resourceListDataTable.Rows.Find(ID)

        If Not tempRow Is Nothing Then
            tempRow.EMPLOYEE_ID = EMPLOYEE_ID
            tempRow.LAST_NAME = LAST_NAME
            tempRow.FIRST_NAME = FIRST_NAME
            tempRow.FROMDATE = FROMDATE
            tempRow.TODATE = TODATE
        Else
            resourceListDataTable.Rows.Add(FIRST_NAME, LAST_NAME, FROMDATE, TODATE, EMPLOYEE_ID)
        End If
    End Sub

    Public Sub DeletePerson(ByVal ID As Int32)
        Dim tempRow As MyDataSet.ResourceListRow
        tempRow = resourceListDataTable.Rows.Find(ID)
        resourceListDataTable.Rows.Remove(tempRow)
    End Sub

End Class
