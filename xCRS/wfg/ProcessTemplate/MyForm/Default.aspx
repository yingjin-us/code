<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="WorkflowGen.My.Web.UI.WebControls" Namespace="WorkflowGen.My.Web.UI.WebControls" TagPrefix="wfg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>My form</title>
    <link href="App_Themes/css/form.css" rel="stylesheet" type="text/css" />
</head>
<body class="WebForm">
    <form id="form1" runat="server">
    
    <!-- HEADER -->
    <table class="TitleHeader" cellpadding="0" cellspacing="0">
        <tr class="Row">
        <td class="CellIcon" rowspan="2"><asp:Image ID="ICON" class="Image" runat="server" Visible="true" ImageUrl="App_Themes/Images/dossier.gif" /></td>
        <td class="CellTitle"><span class="Title">Request #<asp:Label ID="CURRENT_REQUESTID" runat="server" Text="Label"></asp:Label></span></td>
        </tr>
        <tr class="Row">
        <td class="CellSubTitle"><span class="SubTitle"><asp:Image ID="LOGO" runat="server" Visible="true" ImageUrl="App_Themes/Images/my_logo.gif" /></span></td>
        </tr>
    </table>      

    <!-- ******** -->
    <!-- ACTION1 -->
    <!-- ******** -->
    <div id="ACTION1_" runat="server">
    <asp:Panel id="ACTION1_TITLE" runat="server" CssClass="PanelTitle">
    <table id="Table1" class="Title">
        <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Fill the form</span></td>
        </tr>
    </table>
    </asp:Panel>   
   
        <asp:Panel ID="ACTION1_INFO" runat="server" CssClass="PanelInfo">
        
            <table id="Table2" class="Info">

            <!-- NAME -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Name:</span></td>
            <td class="CellValue"><span class="Label"><asp:Label ID="ACTION1_LASTNAME" runat="server" ToolTip="Name"></asp:Label>&nbsp;<asp:Label ID="ACTION1_FIRSTNAME" runat="server" ToolTip="Firstname"></asp:Label></span></td>
            </tr>

            <!-- LABEL -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Label:</span></td>
            <td class="CellValue"><span class="Label"><asp:Label ID="ACTION1_LABEL" runat="server" ToolTip="Label"></asp:Label></span></td>
            </tr>
            
            <!-- TEXTBOX -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">TextBox:</span></td>
            <td class="CellValue"><span class="Label"><asp:TextBox ID="ACTION1_TEXTBOX" CssClass="InputText" runat="server"></asp:TextBox></span></td>
            </tr>

            <!-- NUMERIC -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Numeric:</span></td>
            <td class="CellValue"><span class="Label"><asp:TextBox ID="ACTION1_NUMERIC" CssClass="InputText" runat="server" FieldDataType="Numeric" ToolTip="'Numeric'"></asp:TextBox></span></td>
            </tr>

            <!-- CURRENCY -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Currency:</span></td>
            <td class="CellValue"><span class="Label"><asp:TextBox ID="ACTION1_CURRENCY" CssClass="InputText" runat="server" FieldDataType="Currency" ToolTip="'Currency'"></asp:TextBox></span></td>
            </tr>

            <!-- DATETIME -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Date time:</span></td>
            <td class="CellValue"><span class="Label">
                <asp:TextBox ID="ACTION1_DATE" ToolTip="Date" CssClass="InputText" FieldDataType="DateTime" FieldFormat="{0:d}" runat="server" Width="65px" AutoPostBack="true"></asp:TextBox>
                <ew:calendarpopup id="ACTION1_DATE_CAL" runat="server" AutoPostBack="true" controldisplay="Image" imageurl="App_Themes/Images/calendar.gif" 
                onclientchange="document.form1.ACTION1_DATE.value = document.form1.ACTION1_DATE_CAL_hidden.value;" ></ew:calendarpopup></span>
            </td>
            </tr>
          
            <!-- MULTILINE TEXTBOX -->
            <tr class="ListRow">
            <td class="CellCaption" style="vertical-align:top"><span class="LabelHeader">Multi line TextBox:</span></td>
            <td class="CellValue"><span class="Label"><asp:TextBox ID="RQ_JUSTIFICATION" ToolTip="Justification du déplacement" runat="server" CssClass="InputText" TextMode="MultiLine" Width="450px" Rows=6></asp:TextBox></span></td>
            </tr> 

            <!-- RADIOBUTTONLIST -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">RadioButtonList:</span></td>
            <td class="CellValue"><span class="Label">
                <asp:RadioButtonList ID="ACTION1_RADIO" 
                    ToolTip="Radio Button List" runat="server" CssClass="Select" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="Item 1" Selected>Item 1</asp:ListItem>
                    <asp:ListItem Value="Item 2">Item 2</asp:ListItem>
                    <asp:ListItem Value="Item 3">Item 3</asp:ListItem>
                </asp:RadioButtonList></span></td>
            </tr>
            
            <!-- DROPDOWNLIST -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">DropDownList:</span></td>
            <td class="CellValue"><span class="Label">
                <asp:DropDownList ID="ACTION1_DROPDOWNLIST" 
                    ToolTip="Dropdown List" runat="server" CssClass="Select" 
                    DataSourceID="SqlDataSource1" DataTextField="Description" DataValueField="ID" >
                    <asp:ListItem Value=""></asp:ListItem>
                </asp:DropDownList> (populated from an external database)</span></td>
            </tr>            
            
            <!-- LISTBOX -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">ListBox:</span></td>
            <td class="CellValue"><span class="Label">
                <asp:ListBox ID="ACTION1_LISTBOX" 
                    ToolTip="ListBox" runat="server" CssClass="Select" SelectionMode="Multiple" Rows="3" >
                    <asp:ListItem Value="Item 1">Item 1</asp:ListItem>
                    <asp:ListItem Value="Item 2">Item 2</asp:ListItem>
                    <asp:ListItem Value="Item 3">Item 3</asp:ListItem>
                </asp:ListBox></span></td>
            </tr> 

            <!-- CHECKBOXLIST -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">CheckBoxList:</span></td>
            <td class="CellValue"><span class="Label">
                <asp:CheckBoxList ID="ACTION1_CHECKBOXLIST" 
                    ToolTip="CheckBoxList" runat="server" CssClass="Select" RepeatDirection="Horizontal">
                    <asp:ListItem Value="Item 1">Item 1</asp:ListItem>
                    <asp:ListItem Value="Item 2">Item 2</asp:ListItem>
                    <asp:ListItem Value="Item 3">Item 3</asp:ListItem>
                </asp:CheckBoxList></span></td>
            </tr> 
            
            <!-- WORKFLOWFILEUPLOAD -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Attachment:</span></td>
            <td class="CellValue"><span class="Label">
                <wfg:WorkflowFileUpload ID="ACTION1_ATTACHMENT" runat="server" AddText="Add" UpdateText="Update" Culture="(Default)" DeleteText="Delete" DisplayMode="Display">
                    <UploadStyle cssclass="InputText" Width="300px" />
                    <ModifyStyle CssClass="Link" />
                    <FileSizeStyle Font-Bold="False" Font-Underline="False" />
                    <AddStyle CssClass="Link" />
                    <DeleteStyle CssClass="Link" />
                    <DownloadStyle CssClass="Link" />
                </wfg:WorkflowFileUpload> 
            </span></td>
            </tr>


            <!-- GRIDVIEW -->
            <tr class="ListRow">
            <td class="CellCaption" style="vertical-align:top"><span class="LabelHeader">GridView :</span></td>
            <td class="CellValue"><span class="Label">
            
                <asp:GridView ID="ACTION1_GRIDVIEW" CssClass="GridView" runat="server" ToolTip="GridView" AutoGenerateColumns="False" ShowFooter="False">
                <Columns>
                
                    <asp:TemplateField HeaderText="Column 1">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ACTION1_GRIDVIEW_COL1" runat="server" AppendDataBoundItems="True" SelectedValue='<%# Bind("ACTION1_GRIDVIEW_COL1") %>'>
                                <asp:ListItem Value="">- Select -</asp:ListItem>
                                <asp:ListItem Value="Item 1">Item 1</asp:ListItem>
                                <asp:ListItem Value="Item 2">Item 2</asp:ListItem>
                                <asp:ListItem Value="Item 3">Item 3</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ACTION1_GRIDVIEW_COL1" runat="server" Text='<%# Bind("ACTION1_GRIDVIEW_COL1") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle CssClass="Value" />
                        <HeaderStyle CssClass="Label" HorizontalAlign="Right"/>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Column 2">
                        <EditItemTemplate>
                            <asp:TextBox ID="ACTION1_GRIDVIEW_COL2" runat='server' Text='<%# Bind("ACTION1_GRIDVIEW_COL2") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ACTION1_GRIDVIEW_COL2" runat="server" Width="100px" Text='<%# Bind("ACTION1_GRIDVIEW_COL2") %>' ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="Label" HorizontalAlign="Right" />
                        <FooterStyle HorizontalAlign="Right"/>
                        <ItemStyle HorizontalAlign="Right" Width="150px" />
                        <ControlStyle CssClass="Value" />
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Column 3">
                        <EditItemTemplate>
                            <asp:TextBox ID="ACTION1_GRIDVIEW_COL3" runat='server' Text='<%# Bind("ACTION1_GRIDVIEW_COL3") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ACTION1_GRIDVIEW_COL3" runat="server" Width="100px" Text='<%# Bind("ACTION1_GRIDVIEW_COL3") %>' ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="Label" HorizontalAlign="Right" />
                        <FooterStyle HorizontalAlign="Right"/>
                        <ItemStyle HorizontalAlign="Right" Width="150px"/>
                        <ControlStyle CssClass="Value" />
                    </asp:TemplateField>                
                    
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" InsertVisible="False" UpdateText="Add" EditText="Update" DeleteText="Delete">
                        <ItemStyle HorizontalAlign="Right" />
                        <ControlStyle CssClass="Value" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle CssClass="Header" />
                <RowStyle CssClass="Row" />
                <AlternatingRowStyle CssClass="AlternatingRow" />
                </asp:GridView>
            </span></td>
            </tr>     


            </table>
            
        </asp:Panel>
        <br />
    </div>  


    <!-- ******** -->
    <!-- ACTION2 -->
    <!-- ******** -->
    
    <div id="ACTION2_" runat="server">
    <asp:Panel id="ACTION2_TITLE" runat="server" CssClass="PanelTitle">
    <table id="Table9" class="Title">
        <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Approbation</span></td>
        </tr>
    </table>
    </asp:Panel>   
  
        <asp:Panel id="ACTION2_INFO" runat="server" CssClass="PanelInfo">
        
            <table id="Table10" class="Info">

            <!-- NAME -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Name :</span></td>
            <td class="CellValue"><span class="Label"><asp:Label ID="ACTION2_LASTNAME" runat="server"></asp:Label>&nbsp;<asp:Label ID="ACTION2_FIRSTNAME" runat="server"></asp:Label>&nbsp;(<asp:Label ID="ACTION2_EMAIL" runat="server"></asp:Label>)</span></td>
            </tr>

            <!-- DATE -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Date :</span></td>
            <td class="CellValue"><span class="Label"><asp:Label ID="ACTION2_DATE" FieldDataType="DateTime" FieldFormat="{0:D}" runat="server"></asp:Label></span></td>
            </tr>

            <!-- APPROVAL -->
            <tr class="ListRow">
            <td class="CellCaption"><span class="LabelHeader">Approve :</span></td>
            <td class="CellValue"><span class="Label">
                <asp:RadioButtonList ID="ACTION2_APPROVE" 
                    ToolTip="Approve the request" runat="server" CssClass="Select" AutoPostBack="true" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                    <asp:ListItem Value="No">No</asp:ListItem>
                    <asp:ListItem Value="To be completed">To be completed</asp:ListItem>
                </asp:RadioButtonList></span></td>
            </tr>
            
            <!-- COMMENT -->
            <tr class="ListRow">
            <td class="CellCaption" style="vertical-align:top"><span class="LabelHeader">Comment :</span></td>
            <td class="CellValue"><span class="Label"><asp:TextBox ID="ACTION2_COMMENT" ToolTip="Comment" runat="server" CssClass="InputText" TextMode="MultiLine" Width="450px" Rows=6></asp:TextBox></span></td>
            </tr>

            </table>
        </asp:Panel>
        <br/>
    </div>
    
    
    <!-- BUTTONS -->
    <div class="ButtonDiv">
    <table class="Button" cellspacing="0" cellpadding="0">
        <tr class="ListRow">
        <td class="CellButton"><span class="Label">
            <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="Button" onclick="saveButton_Click" />
            <asp:Button ID="submitButton" runat="server" Text="Submit" CssClass="Button"/>
        </span></td>
        </tr>
    </table>
    </div>


    <!-- HIDDEN FIELDS AND DATA SOURCES -->
    <asp:Panel ID="HiddenFields" runat="server">
        <asp:TextBox ID="DRAFT" runat="server" Visible="false"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyDataBase %>" 
            ProviderName="<%$ ConnectionStrings:MyDataBase.ProviderName %>" 
            SelectCommand="SELECT [ID], [Description] FROM [MYTABLE]">
        </asp:SqlDataSource>
    </asp:Panel>


    </form>
</body>
</html>