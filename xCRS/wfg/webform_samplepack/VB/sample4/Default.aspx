<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>My First WebForm in .NET 2.0 using WorkflowGen.My v2.0</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Large"
            Text="My First WebForm in .NET 2.0" ForeColor="Navy"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label15" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Large"
            Text="Current Action : " ForeColor="Navy"></asp:Label>
        <asp:Label ID="CURRENT_ACTION" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Medium"></asp:Label>
        <br />
        &nbsp;<table width="100%">
            <tr>
                <td valign="middle">
                    <asp:Label ID="Label3" runat="server" Text="Request # " Font-Bold="True" Font-Names="Arial" Font-Size="Small"></asp:Label>
                    <asp:Label ID="REQ_NUMBER" runat="server" Font-Names="Arial" Font-Size="Small"></asp:Label></td>
                <td  valign="middle">
                    <asp:Label ID="Label4" runat="server" Text="Date : " Font-Bold="True" Font-Names="Arial" Font-Size="Small"></asp:Label>
                    <asp:Label ID="REQ_DATE" runat="server" Font-Names="Arial" Font-Size="Small"></asp:Label></td>
            </tr>
        </table>
    </div>
        <br />
        <table width="100%">
            <tr>
                <td valign="middle" colspan=4>
                    <asp:Label ID="Label12" runat="server" Text="Employee Information" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="Navy"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Firstname:" Font-Bold="True" Font-Names="Arial" Font-Size="Small"></asp:Label></td>
                <td>
                    <asp:TextBox ID="EMP_FIRSTNAME" runat="server" Columns="50" Font-Names="Arial" Font-Size="Small" MaxLength="255"></asp:TextBox></td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Department:" Font-Bold="True" Font-Names="Arial" Font-Size="Small"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="EMP_DEPT" runat="server" Font-Names="Arial" Font-Size="Small" Width="200px" DataSourceID="AccessDataSource1" DataTextField="NAME" DataValueField="ID_DEPT" AutoPostBack="True">
                    </asp:DropDownList><asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/myDb.mdb"
                        SelectCommand="SELECT [ID_DEPT], [NAME] FROM [DEPARTMENT] ORDER BY [NAME]"></asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Lastname:" Font-Bold="True" Font-Names="Arial" Font-Size="Small"></asp:Label></td>
                <td>
                    <asp:TextBox ID="EMP_LASTNAME" runat="server" Columns="50" Font-Names="Arial" Font-Size="Small" MaxLength="255"></asp:TextBox></td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Unit:" Font-Bold="True" Font-Names="Arial" Font-Size="Small"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="EMP_UNIT" runat="server" Font-Names="Arial" Font-Size="Small" Width="200px" DataSourceID="AccessDataSource2" DataTextField="NAME" DataValueField="ID_UNIT">
                    </asp:DropDownList><asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/myDb.mdb"
                        SelectCommand="SELECT [ID_UNIT], [NAME] FROM [UNIT] WHERE ([ID_DEPT] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter Name="ID_DEPT" ControlID="EMP_DEPT" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%">
            <tr>
                <td colspan=2>
                <asp:Label id="Label11" runat="server" Text="Project Information" Font-Size="Medium" Font-Bold="True" Font-Names="Arial" ForeColor="Navy"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 169px">
                <asp:Label id="Label8" runat="server" Text="Name:" Font-Size="Small" Font-Bold="True" Font-Names="Arial"></asp:Label></td>
                <td>
                    <asp:TextBox ID="PROJECT_NAME" runat="server" Columns="60" Font-Names="Arial" Font-Size="Small" MaxLength="255"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 169px">
                <asp:Label id="Label9" runat="server" Text="Description:" Font-Size="Small" Font-Bold="True" Font-Names="Arial"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="PROJECT_DESC" runat="server" Columns="62" Font-Names="Arial" Font-Size="Small" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 169px">
                <asp:Label id="Label10" runat="server" Text="Budget Amount:" Font-Size="Small" Font-Bold="True" Font-Names="Arial"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="PROJECT_BUDGET" FieldDataType="Numeric" runat="server" Font-Names="Arial" Font-Size="Small" MaxLength="10"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 169px">
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="PROJECT_DEPT_FINANCE" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Text="Finance" />
                    <br />
                    <asp:CheckBox ID="PROJECT_DEPT_HR" runat="server" Font-Bold="True" Font-Names="Arial"
                        Font-Size="Small" Text="HR" />
                    <br />
                    <asp:CheckBox ID="PROJECT_DEPT_IT" runat="server" Font-Bold="True" Font-Names="Arial"
                        Font-Size="Small" Text="IT" /></td>
            </tr>
            <tr>
                <td style="width: 169px">
                <asp:Label id="Label14" runat="server" Text="Start Date:" Font-Size="Small" Font-Bold="True" Font-Names="Arial"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="PROJECT_STARTDATE" FieldDataType="Date" runat="server" Font-Names="Arial" Font-Size="Small"></asp:TextBox>&nbsp;
                    <ew:CalendarPopup ID="Date_CalendarPopup" runat="server" ControlDisplay="Image" ImageUrl="images/calendar.gif"
                        OnClientChange="document.form1.PROJECT_STARTDATE.value = document.form1.Date_CalendarPopup_hidden.value;">
                    </ew:CalendarPopup>
                </td>
            </tr>
            <tr>
                <td style="width: 169px; height: 26px">
                <asp:Label id="Label13" runat="server" Text="File Attachment:" Font-Size="Small" Font-Bold="True" Font-Names="Arial"></asp:Label>
                </td>
                <td style="height: 26px">
                    <asp:FileUpload ID="PROJECT_ATTACHMENT" runat="server" Font-Names="Arial" Font-Size="Small" Width="395px" /></td>
            </tr>
            <tr>
                <td style="width: 169px; height: 26px">
                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
                        Text="Project resources:"></asp:Label></td>
                <td style="height: 26px">
                    &nbsp;<asp:GridView ID="PROJECT_RESOURCES" runat="server" AutoGenerateColumns="False"
                        CellPadding="4" DataKeyNames="ID" DataSourceID="ResourceListDataSource" ForeColor="#333333"
                        GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="#" InsertVisible="False" ReadOnly="True"
                                SortExpression="ID" />
                            <asp:BoundField DataField="FIRST_NAME" HeaderText="First name" SortExpression="FIRST_NAME" />
                            <asp:BoundField DataField="LAST_NAME" HeaderText="Last name" SortExpression="LAST_NAME" />
                            <asp:TemplateField HeaderText="Employee ID" SortExpression="EMPLOYEE_ID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EMPLOYEE_ID") %>'></asp:TextBox>
                                    <asp:RangeValidator ID="rvNumeric" runat="server" ControlToValidate="TextBox3" Display="Dynamic"
                                        ErrorMessage="Invalid number!" MaximumValue="99999" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EMPLOYEE_ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Available from" SortExpression="FROMDATE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FROMDATE", "{0:d}") %>'></asp:TextBox>
                                    <asp:RangeValidator ID="rvDate" runat="server" ControlToValidate="TextBox1" Display="Dynamic"
                                        ErrorMessage="Invalid date!" MaximumValue="9999-01-01" MinimumValue="0001-01-01"
                                        SetFocusOnError="True" Type="Date"></asp:RangeValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FROMDATE", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="to" SortExpression="TODATE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TODATE", "{0:d}") %>'></asp:TextBox>
                                    <asp:RangeValidator ID="rvDate2" runat="server" ControlToValidate="TextBox2" Display="Dynamic"
                                        ErrorMessage="Invalid date!" MaximumValue="9999-01-01" MinimumValue="0001-01-01"
                                        SetFocusOnError="True" Type="Date"></asp:RangeValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TODATE", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:LinkButton ID="INSERT_RESOURCE" runat="server" CausesValidation="False">Add a resource</asp:LinkButton>
                    <asp:ObjectDataSource ID="ResourceListDataSource" runat="server" DeleteMethod="DeletePerson"
                        InsertMethod="UpdateOrInsertResource" SelectMethod="GetResourceList" TypeName="ResourceListBusinessObject"
                        UpdateMethod="UpdateOrInsertResource">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                            <asp:Parameter Name="FIRST_NAME" Type="String" />
                            <asp:Parameter Name="LAST_NAME" Type="String" />
                            <asp:Parameter Name="fromDate" Type="DateTime" />
                            <asp:Parameter Name="toDate" Type="DateTime" />
                            <asp:Parameter Name="EMPLOYEE_ID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                            <asp:Parameter Name="FIRST_NAME" Type="String" />
                            <asp:Parameter Name="LAST_NAME" Type="String" />
                            <asp:Parameter Name="fromDate" Type="DateTime" />
                            <asp:Parameter Name="toDate" Type="DateTime" />
                            <asp:Parameter Name="EMPLOYEE_ID" Type="Int32" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%">
            <tr>
                <td colspan=2>
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"
                        ForeColor="Navy" Text="Manager Approval"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
                        Text="Manager:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="APPROVAL_MGR" runat="server" Columns="50" MaxLength="255"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
                        Text="Date:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="APPROVAL_DATE" runat="server" FieldDataType="Date"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
                        Text="Approval:"></asp:Label></td>
                <td>
                    <asp:RadioButtonList ID="APPROVAL_DEC" runat="server" Font-Names="Arial" Font-Size="Small"
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="YES">Approved</asp:ListItem>
                        <asp:ListItem Value="NO">Declined</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="SubmitButton" runat="server" Text="Submit Form" />
    </form>
</body>
</html>
