<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sample #5 - Using WorkflowGen.My with AJAX ASP.NET</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/form.css" rel="STYLESHEET" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="True" runat="server" />
        
        <table class="Form-table-main" cellspacing="1" border="0" width="100%" cellpadding="1" align="center">
            <tr>                
                <td class="Form-title-text" valign="middle">
                    Sample #5 - Using WorkflowGen.My with AJAX ASP.NET
                </td>
            </tr>
        </table>
        
        <asp:AccessDataSource ID="DeptAccessSource" runat="server" DataFile="~/App_Data/departments.mdb"
            SelectCommand="SELECT [Name], [ID_DEPARTMENT] FROM [Department]"></asp:AccessDataSource>
        <asp:AccessDataSource ID="UnitAccessSource" runat="server" DataFile="~/App_Data/departments.mdb"
            SelectCommand="SELECT [ID_UNIT], [Name] FROM [Unit] WHERE ([ID_DEPARTMENT] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Department" Name="ID_DEPARTMENT" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:UpdatePanel ID="upDependantDDLs" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table class="Form-table" cellSpacing="1" cellPadding="1" width="98%" align="center">
                    <tr>
                        <td width="150" valign="top" align="right" class="Form-table-cell-label">
                            Department:
                        </td>
                        <td valign="top" class="Form-table-cell-value"><asp:DropDownList ID="Department" runat="server" AutoPostBack="True"
                                DataSourceID="DeptAccessSource" DataTextField="Name" DataValueField="ID_DEPARTMENT" >
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="150" valign="top" align="right" class="Form-table-cell-label">
                            Unit:
                        </td>
                        <td valign="top" class="Form-table-cell-value">
                            <asp:DropDownList ID="Unit" runat="server" DataTextField="Name" DataValueField="ID_UNIT" DataSourceID="UnitAccessSource">
                            </asp:DropDownList>
                        </td>
                    </tr>  
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Department" EventName="SelectedIndexChanged" /> 
            </Triggers>
        </asp:UpdatePanel>
        &nbsp; &nbsp;
        &nbsp; &nbsp;
        <br />
        <asp:UpdatePanel ID="upCalendar" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table class="Form-table" cellspacing="1" cellpadding="1" width="98%" align="center">
                    <tr>
                        <td valign="top" align="right" class="Form-table-cell-label" width="160">
                            Selected Date:
                        </td>
                        <td valign="top" class="Form-table-cell-value">
                            <asp:TextBox ReadOnly="true" FieldDataType="Date" ID="DatePickerTextBox" runat="server"></asp:TextBox>&nbsp;<asp:Calendar
                                ID="CalendarSample" runat="server" OnSelectionChanged="CalendarSample_SelectionChanged">
                            </asp:Calendar>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="CalendarSample" EventName="SelectionChanged" />
            </Triggers>
        </asp:UpdatePanel>
        &nbsp; &nbsp;
        &nbsp; &nbsp;
        <br />
        <asp:UpdatePanel ID="upEmployeeList" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table class="Form-table" cellspacing="1" cellpadding="5" width="98%" align="center">
                <tr>
                    <td valign="top" class="Form-table-cell-label">
                        <asp:GridView ID="EMPLOYEE_LIST" ToolTip="Employee list" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="Outset" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="Vertical" Width="100%" OnRowDataBound="EMPLOYEE_LIST_RowDataBound">
                           <FooterStyle BackColor="#CCCC99" />
                           <RowStyle BackColor="#F7F7DE" />
                           <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                           <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                           <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                           <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="FIRST_NAME" HeaderText="First name" />
                                <asp:BoundField DataField="LAST_NAME" HeaderText="Last name" />
                                <asp:TemplateField HeaderText="Hire Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="HIRE_DATE" FieldDataType="Date" runat="server" Text='<%# Bind("HIRE_DATE", "{0:d}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="HIRE_DATE" FieldDataType="Date" runat="server" Text='<%# Bind("HIRE_DATE", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Salary">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="SALARY" FieldDataType="Numeric" runat="server" Text='<%# Bind("SALARY") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="SALARY" FieldDataType="Numeric" runat="server" Text='<%# Bind("SALARY") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        * Employees showed with a light gray background color have salaries over a milion dollars.<br />
                    </td>
                 </tr>
               </table>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="EMPLOYEE_LIST" EventName="RowDataBound" />
            </Triggers>
        </asp:UpdatePanel>
        &nbsp;
        <br />
        <p style="margin-left: 10px">
            <asp:Button CssClass="SubmitButton" ID="SubmitButton" runat="server" Text="Submit" />
            <asp:CheckBox ID="SAVE_AS_DRAFT" runat="server" Text="Save as draft" />
        </p>
    </form>
</body>
</html>
