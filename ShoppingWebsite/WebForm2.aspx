<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ShoppingWebsite.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <fieldset>
                <legend>Hello XML File  </legend>
                <table>
                    <tr>
                        <td>UID:</td>
                        <td>
                            <asp:TextBox runat="server" ID="UID"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:TextBox runat="server" ID="Name"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td>
                            <asp:RadioButtonList runat="server" ID="Gender">
                                <asp:ListItem Text="Male"></asp:ListItem>
                                <asp:ListItem Text="Female"></asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td>Class:</td>
                        <td>
                            <asp:DropDownList runat="server" ID="Class">
                                <asp:ListItem Text="FY"></asp:ListItem>
                                <asp:ListItem Text="SY"></asp:ListItem>
                                <asp:ListItem Text="TY"></asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                </table>
                <asp:Button runat="server" Text="Insert" />
            </fieldset>
        </div>
        </form>

</body>
</html>
