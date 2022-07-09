<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="ShoppingWebsite.AddToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        main{
            padding-top: 10vh;
            padding-bottom: 10vh;
        }
        h6{
            font-size: 1.1em;
        }
        .footer{
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Product.name, Product.price, Cart.quantity, Cart.size FROM Product INNER JOIN Cart ON Product.Id = Cart.product_id WHERE (Cart.customer_id = @Cust_Id)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="101" Name="Cust_Id" SessionField="Id" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="mx-auto" style="width:28em;" >
        <h4 class="d-flex justify-content-between align-items-center mb-4">
            <span style="color: #228;">Your Cart</span>
            <asp:Label ID="badge" runat="server" CssClass="badge bg-customBlue rounded-pill"></asp:Label>
        </h4>
    </div>
    <asp:GridView ID="GridView1" CssClass="mx-auto" runat="server" AutoGenerateColumns="False" Width="28em"
        ShowHeader="False" DataSourceID="SqlDataSource1" CellPadding="4" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound" GridLines="None" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField>

                <ItemTemplate>
                    <div class="d-flex justify-content-between align-items-center">
                    <div class="p-3 lh-lg">
                        <h6 class="my-0">
                            <asp:Label ID="name" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                        </h6>
                        <small>
                            <span>Quantity: </span>
                            <asp:Label ID="quantity" runat="server" Text='<%# Bind("quantity") %>' Font-Bold="true"></asp:Label>
                            &ensp;
                            <span>Size: </span>
                            <asp:Label ID="size" runat="server" Text='<%# Bind("size") %>' Font-Bold="true"></asp:Label>
                        </small>
                    </div>
                    <div class="p-3">
                        <span>&#8377;
                            <asp:Label ID="Label1" runat="server" Text='<%# (Convert.ToInt32(Eval("price")) * Convert.ToInt32(Eval("quantity"))).ToString() %>'></asp:Label>
                        </span>
                    </div>
                        </div>
                </ItemTemplate>
            
                <FooterTemplate>
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary bg-customBlue btn-lg bg-gradient form-control mt-0" runat="server" 
                        CausesValidation="False" CommandArgument="getData" OnCommand="LinkButton1_Command">
                        Proceed To Pay &ensp;-> <asp:Label ID="lbltotal" runat="server" Text="Label" Font-Bold="true"></asp:Label>
                    </asp:LinkButton>
                </FooterTemplate>
                <FooterStyle CssClass="pt-3 pb-3" HorizontalAlign="Center" />
                <ItemStyle Width="100px" HorizontalAlign="Left" />
                
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <%--<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />--%>
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    
</asp:Content>
