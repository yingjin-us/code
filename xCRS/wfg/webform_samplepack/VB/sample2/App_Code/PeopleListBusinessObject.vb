Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports System.Collections.Generic

'<summary>
' Summary description for PeopleListBusinessObject
' </summary>

Public Class PeopleListBusinessObject

'Reference to the people_list DataTable

    Private peopleListTable As FormData.PEOPLE_LISTDataTable
    ' <summary>
    ' Constructor that affect the reference of the peopleListTable
    ' </summary>
    ' <param name="peopleListDataTable">The reference we need to populate our business object</param>

    Public Sub New(ByVal peopleListDataTable As FormData.PEOPLE_LISTDataTable)
        peopleListTable = peopleListDataTable
    End Sub
    
    ' <summary>
    ' Returns the PeopleListDataTable, will be used by the ObjectDataSource
    ' </summary>
    ' <returns>A PEOPLE_LISTDataTable</returns>
    
    Public Function GetPeopleList() As FormData.PEOPLE_LISTDataTable
        Return peopleListTable
    End Function

    ' <summary>
    ' Inserts / update data into the PEOPLE_LISTDataTable, will be used by the ObjectDataSource
    ' </summary>
    ' <param name="ID">The Person ID</param>
    ' <param name="firstName">First name of the person</param>
    ' <param name="lastName">Last name of the person</param>

    Public Sub UpdateOrInsertPerson(ByVal ID As Integer, ByVal firstName As String, ByVal lastName As String)
        Dim tempRow As FormData.PEOPLE_LISTRow = CType(peopleListTable.Rows.Find(ID), FormData.PEOPLE_LISTRow)
        If Not (tempRow Is Nothing) Then
		
           'we found a row, so we are updating it.
		
            tempRow.FIRSTNAME = firstName
            tempRow.LASTNAME = lastName

	'we did not find a row with the requested ID, it means we are inserting
        Else
            peopleListTable.Rows.Add(firstName, lastName)
        End If
    End Sub
	
    '<summary>
    ' Deletes a person from the PEOPLE_LISTDataTable, will be used by the ObjectDataSource
    ' </summary>
    ' <param name="ID"></param>
    Public Sub DeletePerson(ByVal ID As Integer)
        Dim tempRow As FormData.PEOPLE_LISTRow = CType(peopleListTable.Rows.Find(ID), FormData.PEOPLE_LISTRow)
        peopleListTable.Rows.Remove(tempRow)
    End Sub
End Class
