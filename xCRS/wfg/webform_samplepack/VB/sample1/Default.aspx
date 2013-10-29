<%@ Page Language="VB" MaintainScrollPositionOnPostback="True" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Form" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Simple Mode Example for WorkflowPage</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>TextBox:</strong><br />
        <asp:TextBox ID="TEXT_BOX" runat="server"></asp:TextBox>&nbsp;
        <br />
        <br />
        <strong>TextBox with a DATE_TIME value:</strong><br />
        <asp:TextBox ID="TEXT_BOX_DATE_TIME" runat="server" FieldDataType="DateTime"></asp:TextBox>
        &nbsp;
        <br />
        <br />
        <strong>
        TextBox with a DATE value:</strong><br />
        <asp:TextBox ID="TEXT_BOX_DATE" runat="server" FieldDataType="Date"></asp:TextBox>
        <ew:calendarpopup id="CalendarPopupForDateField" runat="server" controldisplay="Image" imageurl="images/calendar.gif"
            onclientchange="document.form1.TEXT_BOX_DATE.value = document.form1.CalendarPopupForDateField_hidden.value;"></ew:calendarpopup>
        <br />
        <br />
        <strong>
        TextBox with a NUMERIC value:</strong><br />
        <asp:TextBox FieldDataType="Numeric" ID="TEXT_BOX_DOUBLE" runat="server"></asp:TextBox><br />
        <br />
        <strong>
        TextBox with a CURRENCY value:</strong><br />
        <asp:TextBox FieldDataType="Currency" ID="TEXT_BOX_CURRENCY" runat="server"></asp:TextBox><br />
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
        <asp:FileUpload ID="FILE_UPLOAD" runat="server" /><br />
        <br />
        <strong>HtmlInputFile:</strong><br />
        <input type="file" runat=server id="HTML_INPUT_FILE" /><br />
        <br />
        <strong>GridView:</strong><br />
        <asp:GridView ID="PeopleList" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" EmptyDataText="No data is present."
            ToolTip="person" ForeColor="Black" GridLines="None" Width="778px">
            <FooterStyle BackColor="Tan" />
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First name" >
                    <ControlStyle Width="100px" />
                    <ItemStyle Width="25px" />
                </asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="Last name" >
                    <ControlStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField ApplyFormatInEditMode="True" DataField="DateExample" DataFormatString="{0:d}"
                    HeaderText="Date example" HtmlEncode="False" >
                    <ControlStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField ApplyFormatInEditMode="True" DataField="DateTime" DataFormatString="{0:G}"
                    HeaderText="Date Time example" HtmlEncode="False" >
                    <ControlStyle Width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="Age" DataFormatString="{0:R}" HeaderText="Age" HtmlEncode="False" >
                    <ControlStyle Width="40px" />
                </asp:BoundField>
                <asp:BoundField DataField="Salary" DataFormatString="{0:C}" HeaderText="Salary" HtmlEncode="False" >
                    <ControlStyle Width="50px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Template numeric field">
                    <EditItemTemplate>
                        <asp:TextBox ID="TemplateNumericField" runat="server" FieldDataType="Numeric" Text='<%# Bind("TemplateNumericField") %>'></asp:TextBox>&nbsp;
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="TemplateNumericField" runat="server" FieldDataType="Numeric" Text='<%# Bind("TemplateNumericField") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Template Date field">
                    <EditItemTemplate>
                        <asp:TextBox ID="TemplateDateField" ToolTip="Template date field" FieldDataType="Date" runat="server" Text='<%# Bind("TemplateDateField") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="TemplateDateField" FieldDataType="Date" runat="server" Text='<%# Bind("TemplateDateField") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Template Date/time field">
                    <EditItemTemplate>
                        <asp:TextBox ID="TemplateDateTimeField" ToolTip="Template date/time field" FieldDataType="DateTime" runat="server" Text='<%# Bind("TemplateDateTimeField") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="TemplateDateTimeField" FieldDataType="DateTime" runat="server" Text='<%# Bind("TemplateDateTimeField") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="Active" HeaderText="Active">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CheckBoxField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" />
            </Columns>
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        <br />
        <asp:Button ID="SubmitButton" runat="server" Text="SUBMIT" /></div>
    </form>
</body>
</html>
