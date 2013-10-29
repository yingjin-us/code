<%@ Page ValidateRequest="False" Language="VB" AutoEventWireup="false" CodeFile="Form.aspx.vb" Inherits="Form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Timesheet example in VB</title>
    <META http-equiv="Content-Type" content="text/html; charset=utf-8">
	<LINK href="css/form.css" rel="STYLESHEET">
</head>
<body>
    <form id="form1" runat="server">
     
                     
        <table class="Form-table-main" cellSpacing="1" border="0" width="100%" cellPadding="1" align="center">
            <tr>                
                <td class="Form-title-text" valign="middle">
                   Timesheet #<asp:Label ID="REQUEST_NUMBER" runat="server"></asp:Label>
                        - Date:<asp:Label ID="REQUEST_DATE" runat="server" FieldDataType="Date"></asp:Label>
                   - Type: <asp:RadioButtonList ID="REQUEST_TYPE" runat="server" RepeatDirection="Horizontal" CellPadding="0" CellSpacing="0" RepeatLayout="Flow" ToolTip="Request Type" OnSelectedIndexChanged="REQUEST_TYPE_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="NEW">New</asp:ListItem>
                        <asp:ListItem Value="CORRECT">Correction</asp:ListItem>
                    </asp:RadioButtonList>
                    <strong>#</strong><asp:TextBox ID="REQUEST_CORRECT_NUM" FieldDataType="Numeric" runat="server" Width="63px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="REQUEST_CORRECT_NUM_RequiredFieldValidator" runat="server"
                        ControlToValidate="REQUEST_CORRECT_NUM" Display="Dynamic" Enabled="False" ErrorMessage="required!" SetFocusOnError="True" ForeColor="Firebrick"></asp:RequiredFieldValidator></td>
            </tr>             
        </table>
        <br />
        
        <!-- REQUEST SECTION -->
        

  
        <TABLE runat="server" id="_2_TITLE" style="border-bottom-style: none; margin-top:8px;"  class="Form-table" cellSpacing="1" cellPadding="1" width="98%" align="center">
            <TR>
                <TD id="_2_TITLE_CELL" runat=server class="Form-table-title" colSpan="6" style="height: 17px">
                    <font class="Form-table-title-text">Employee information</font></td>
            </tr>
        </table>
        <TABLE runat="server" id="_2_TABLE" class="Form-table" cellSpacing="1" cellPadding="1" width="98%" align="center">
            <TR>
                <TD valign="top" align="right" class="Form-table-cell-label" height="20">
                    First name:&nbsp;</td>
                <TD valign="top" class="Form-table-cell-value" style="width: 240px; height: 22px">
                    <asp:Label ID="EMP_FIRSTNAME" runat="server" Width="200px"></asp:Label></td>
                <TD valign="top" align="right" class="Form-table-cell-label" style="height: 22px">
                    Last name:&nbsp;</td>
                <TD valign="top" class="Form-table-cell-value" style="height: 22px">
                    <asp:Label ID="EMP_LASTNAME" runat="server" Width="200px"></asp:Label></td>
            </tr>
            <TR>
                <TD valign="top" align="right" class="Form-table-cell-label" height="20">
                    Department:&nbsp;
                </td>
                <TD valign="top" class="Form-table-cell-value">
                    <asp:Label ID="EMP_DEPT" runat="server" Width="200px"></asp:Label></td>
                <TD valign="top" align="right" class="Form-table-cell-label">
                    Date:&nbsp;</td>
                <TD valign="top" class="Form-table-cell-value">
                    <asp:Label ID="EMP_DATE" runat="server" FieldDataType="Date"></asp:Label></td>
            </tr>
            <TR>
                <TD valign="top" align="right" class="Form-table-cell-label">
                    Comments:&nbsp;</td>
                <TD valign="top" class="Form-table-cell-value" style="height: 18px;" colspan="3">
                    <asp:TextBox CssClass="TextBoxes" ID="EMP_COMMENT" runat="server" Height="65px" TextMode="MultiLine"
                        Width="700px"></asp:TextBox></td>
            </tr>
        </table>
        <br />
        
         <TABLE class="Form-table" id="TABLE_ACTIVITIES" style="border-bottom-style: none; margin-top:8px;"  runat=server cellSpacing="1" cellPadding="1" width="98%" align="center">
            <TR>
                <TD id="TD1" runat=server class="Form-table-title" colSpan="6" style="height: 17px">
                    <font class="Form-table-title-text">Activities</font></td>
            </tr>
        </table>
        <TABLE runat="server" id="TABLE1" class="Form-table" cellSpacing="1" cellPadding="1" width="98%" align="center">
            <TR>
                <TD valign="top" align="right" class="Form-table-cell-label">
                  
                       <asp:GridView ID="ACTIVITIES" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="Vertical" Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="Project">
                    <EditItemTemplate>
                        <asp:DropDownList ID="PROJECT_ID" CssClass="SelectStyles" runat="server" SelectedValue='<%# bind("PROJECT_ID") %>'>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Project 1</asp:ListItem>
                            <asp:ListItem>Project 2</asp:ListItem>
                            <asp:ListItem>Project 3</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="PROJECT_ID_LABEL" runat="server" Text='<%# bind("PROJECT_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle />
                </asp:TemplateField>
                <asp:BoundField DataField="TASK" HeaderText="Task" >
                    <ControlStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="DATE" HeaderText="Date" ApplyFormatInEditMode="True" DataFormatString="{0:d}" HtmlEncode="False" >
                    <ControlStyle Width="50px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Time start">
                    <EditItemTemplate>
                        <asp:TextBox ID="TIME_START" FieldDataType="Time" runat="server" Text='<%# Bind("TIME_START") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ControlStyle Width="40px" />
                    <ItemTemplate>
                        <asp:Label ID="TIME_START" FieldDataType="Time" runat="server" Text='<%# Bind("TIME_START") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time end">
                    <EditItemTemplate>
                        <asp:TextBox ID="TIME_END" FieldDataType="Time" runat="server" Text='<%# Bind("TIME_END") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ControlStyle Width="40px" />
                    <ItemTemplate>
                        <asp:Label ID="TIME_END" FieldDataType="Time" runat="server" Text='<%# Bind("TIME_END") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DURATION" HeaderText="Duration" DataFormatString="{0:R}" >
                    <ControlStyle Width="20px" />
                </asp:BoundField>
                <asp:BoundField DataField="TYPE" HeaderText="Type" >
                    <ControlStyle Width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="LEVEL" HeaderText="Level" >
                    <ControlStyle Width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="DESCRIPTION" HeaderText="Description" >
                    <ControlStyle Width="200px" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" />                
            </Columns>
                           <FooterStyle BackColor="#CCCC99" />
                           <RowStyle BackColor="#F7F7DE" />
                           <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                           <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                           <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                           <AlternatingRowStyle BackColor="White" />
                           <EmptyDataTemplate>
                               <asp:DropDownList ID="DropDownList1" runat="server">
                                   <asp:ListItem>test 1</asp:ListItem>
                               </asp:DropDownList>
                           </EmptyDataTemplate>
                 </asp:GridView>
            </td>
            </TR>
            </TABLE>
 
        <br />
  

        <TABLE class="Form-table" id="_11_TITLE" style="border-bottom-style: none; margin-top:8px;"  runat=server cellSpacing="1" cellPadding="1" width="98%" align="center">
            <TR>
                <TD id="_11_TITLE_CELL" runat=server class="Form-table-title" colSpan="6" style="height: 17px">
                    <font class="Form-table-title-text">Supervisor approval</font></td>
            </tr>
        </table>
        <TABLE class="Form-table" id="_11_TABLE" runat=server cellSpacing="1" cellPadding="1" width="98%" align="center">
            <TR>
                <TD valign="top" align="right" class="Form-table-cell-label" height="20">
                    First name:</td>
                <TD valign="top" class="Form-table-cell-value" style="width: 240px; height: 15px;">
                    <asp:Label ID="SUP_FIRSTNAME" runat="server" Width="200px"></asp:Label></td>
                <TD valign="top" align="right" class="Form-table-cell-label" style="height: 15px">
                    Last name:</td>
                <TD valign="top" class="Form-table-cell-value" style="height: 15px">
                    <asp:Label ID="SUP_LASTNAME" runat="server" Width="200px"></asp:Label></td>
            </tr>
            <TR>
                <TD valign="top" align="right" class="Form-table-cell-label" height="20">Department:</td>
                <TD valign="top" class="Form-table-cell-value" >
                    <asp:Label ID="SUP_DEPT" runat="server" Width="200px"></asp:Label></td>
                <TD valign="top" align="right" class="Form-table-cell-label">Date:</td>
                <TD valign="top" class="Form-table-cell-value" >
                    <asp:Label ID="SUP_DATE" runat="server" FieldDataType="Date"></asp:Label></td>
            </tr>
            <tr>
                <td align="right" class="Form-table-cell-label" valign="middle">
                    Decision:</td>
                <td class="Form-table-cell-value" colspan="3" valign="bottom">
                    <asp:RadioButtonList CssClass="RadioButtonLists" ID="SUP_APPROVAL" runat="server" RepeatDirection="Horizontal" ToolTip="Decision" BorderStyle="None" CellPadding="0" CellSpacing="0">
                        <asp:ListItem Value="YES">Approve</asp:ListItem>
                        <asp:ListItem Value="NO">Reject</asp:ListItem>
                    </asp:RadioButtonList></td></tr>
            <TR>
                <TD valign="top" align="right" class="Form-table-cell-label" style="height: 51px">
                    Comments:</td>
                <TD valign="top" class="Form-table-cell-value" colspan="3" style="height: 51px">
                    <asp:TextBox CssClass="TextBoxes" ID="SUP_COMMENT" runat="server" TextMode="MultiLine" Width="700px" Height="67px"></asp:TextBox></td>
            </tr>
        </table>
        


        
      
        <p align="center"><asp:Button ID="SubmitButton" CssClass="SubmitButton" runat="server" Text="Submit" />
            <asp:CheckBox ID="SAVEAS_DRAFT" runat="server" Text="Save as draft" /></p>

    </form>
</body>
</html>
