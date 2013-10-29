using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for PeopleListBusinessObject
/// </summary>
public class PeopleListBusinessObject
{
	// Reference to the people_list DataTable
    private FormData.PEOPLE_LISTDataTable peopleListTable;

    /// <summary>
    /// Constructor that affect the reference of the peopleListTable
    /// </summary>
    /// <param name="peopleListDataTable">The reference we need to populate our business object</param>
    public PeopleListBusinessObject(FormData.PEOPLE_LISTDataTable peopleListDataTable)
    {
        peopleListTable = peopleListDataTable;
    }

    /// <summary>
    /// Returns the PeopleListDataTable, will be used by the ObjectDataSource
    /// </summary>
    /// <returns>A PEOPLE_LISTDataTable</returns>
    public FormData.PEOPLE_LISTDataTable GetPeopleList()
    {
        return peopleListTable;
    }

    /// <summary>
    /// Inserts / update data into the PEOPLE_LISTDataTable, will be used by the ObjectDataSource
    /// </summary>
    /// <param name="ID">The Person ID</param>
    /// <param name="firstName">First name of the person</param>
    /// <param name="lastName">Last name of the person</param>
    public void UpdateOrInsertPerson(int ID, string firstName, string lastName)
    {
        FormData.PEOPLE_LISTRow tempRow = peopleListTable.Rows.Find(ID) as FormData.PEOPLE_LISTRow;

        if (tempRow != null)
        {
            // we found a row, so we are updating it.
            tempRow.FIRSTNAME = firstName;
            tempRow.LASTNAME = lastName;
        }
        else
        {
            // we did not find a row with the requested ID, it means we are inserting
            peopleListTable.Rows.Add(firstName, lastName);
        }
    }

    /// <summary>
    /// Deletes a person from the PEOPLE_LISTDataTable, will be used by the ObjectDataSource
    /// </summary>
    /// <param name="ID"></param>
    public void DeletePerson(int ID)
    {
        FormData.PEOPLE_LISTRow tempRow = peopleListTable.Rows.Find(ID) as FormData.PEOPLE_LISTRow;
        peopleListTable.Rows.Remove(tempRow);
    }
}
