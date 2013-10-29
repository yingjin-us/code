<%@ Page Language="VB" AutoEventWireup="false" MaintainScrollPositionOnPostback="True" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Advanced Mode Example</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
        <strong>TextBox:</strong><br />
        <asp:TextBox ID="TEXT_BOX" runat="server"></asp:TextBox>
        <br />
        <br />
        <strong>TextBox with a DATE_TIME value:</strong><br />
        <asp:TextBox ID="TEXT_BOX_DATE_TIME" runat="server" FieldDataType="DateTime"></asp:TextBox>&nbsp;
        <br />
        <br />
        <strong>
        TextBox with a DATE value:</strong><br />
        <asp:TextBox FieldDataType="Date" ID="TEXT_BOX_DATE" runat="server"></asp:TextBox>&nbsp;
        <br />
        <br />
        <strong>
        TextBox with a DOUBLE value:</strong><br />
        <asp:TextBox FieldDataType="Numeric" ID="TEXT_BOX_DOUBLE" runat="server"></asp:TextBox>&nbsp;
        <br />
        <br />
        <strong>DropDownList:</strong><br />
        <asp:DropDownList ID="DROP_DOWN_LIST" runat="server">
            <asp:ListItem>Test_1</asp:ListItem>
            <asp:ListItem>Test_2</asp:ListItem>
            <asp:ListItem>Test_3</asp:ListItem>
        </asp:DropDownList><br />
        <br />
        <strong>ListBox:</strong><br />
        <asp:ListBox ID="LIST_BOX" SelectionMode="Multiple" runat="server">
            <asp:ListItem>Test_1</asp:ListItem>
            <asp:ListItem>Test_2</asp:ListItem>
            <asp:ListItem>Test_3</asp:ListItem>
        </asp:ListBox><br />
        <br />
        <strong>CheckBox:</strong><br />
        <asp:CheckBox ID="CHECK_BOX" runat="server" Text="CheckBox_Test" /><br />
        <br />
        <strong>CheckBoxList:<br />
        </strong>
        <asp:CheckBoxList ID="CHECK_BOX_LIST" runat="server" >
            <asp:ListItem>Test_1</asp:ListItem>
            <asp:ListItem>Test_2</asp:ListItem>
            <asp:ListItem>Test_3</asp:ListItem>
        </asp:CheckBoxList><br />
        <strong>RadioButton:<br />
        </strong>
        <asp:RadioButton ID="RADIO_BUTTON" runat="server" Text="RadioButton_Test" /><br />
        <br />
        <strong>RadioButtonList:<br />
        </strong>
        <asp:RadioButtonList ID="RADIO_BUTTON_LIST" runat="server">
            <asp:ListItem>Test_1</asp:ListItem>
            <asp:ListItem>Test_2</asp:ListItem>
            <asp:ListItem>Test_3</asp:ListItem>
        </asp:RadioButtonList><br />
        <strong>FileUpload:</strong><br />
        <asp:FileUpload ID="FILE_UPLOAD" runat="server" />
        <br />
        <br />
        <strong>HtmlInputFile:</strong><br />
        <input type="file" runat=server id="HTML_INPUT_FILE" />&nbsp;<br />
        <br />
        <strong>GridView:<br />
            <asp:GridView ID="PEOPLE_LIST" runat="server" AutoGenerateColumns="False" DataSourceID="PeopleListObjectDataSource" DataKeyNames="ID" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnRowDeleted="PEOPLE_LIST_RowDeleted" OnRowUpdated="PEOPLE_LIST_RowUpdated">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" />
                    <asp:BoundField DataField="FIRSTNAME" HeaderText="First name" SortExpression="FIRSTNAME" />
                    <asp:BoundField DataField="LASTNAME" HeaderText="Last name" SortExpression="LASTNAME" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
            <asp:LinkButton ID="InsertPerson" runat="server" OnClick="InsertPerson_Click">Insert a new person</asp:LinkButton><br />
            <br />
        </strong>
            <asp:ObjectDataSource ID="PeopleListObjectDataSource"
                runat="server" SelectMethod="GetPeopleList"
                TypeName="PeopleListBusinessObject" UpdateMethod="UpdateOrInsertPerson" DeleteMethod="DeletePerson" OnObjectCreating="PeopleListObjectDataSource_ObjectCreating">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        <asp:Literal ID="SignatureList" runat="server"></asp:Literal><br />
        &nbsp;
        <br />
        <asp:Button ID="SubmitButton" runat="server" Text="SUBMIT" OnClick="SubmitButton_Click"  /></div>
    </form>
</body>
</html>
