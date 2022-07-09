<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addStock.aspx.cs" Inherits="ShoppingWebsite.Seller.addStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="sellerTemplate.css" rel="stylesheet" />
    <style>
        table {
            border: none;
            border-collapse: collapse;
        }

            table td {
                border-left: 2px solid #ddd;
                width: 10%;
                padding: 0.4em 0px
            }

            table th {
                border-left: 2px solid #ddd;
                border-bottom: 2px solid #ddd;
                padding: 0.8em 0px;
            }

            table td:first-child, th:first-child {
                border-left: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row m-0">
        <div class="nav-main col-lg-2 col-md-3 bg-customBlue bg-gradient p-0">
            <nav class="navbar mt-2 p-2">
                <ul class="navbar-nav w-100">
                    <li class="nav-item btn">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("SellerHomePage.aspx")%>'>
                            <i class="bi bi-house-door"></i>Sales Dashboard
                        </a>
                    </li>
                    <li class="nav-item btn">
                        <a class="" id="orders" href='<%=Response.ApplyAppPathModifier("Orders.aspx")%>'>
                            <i class="bi bi-cash-coin"></i>Orders
                        </a>
                    </li>
                    <li class="nav-item btn">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("Products.aspx")%>'>
                            <i class="bi bi-cart3"></i>View Products
                        </a>
                    </li>
                    <li class="nav-item btn">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("EditProducts.aspx")%>'>
                            <i class="bi bi-pencil-square"></i>Edit Products
                        </a>
                    </li>
                    <li class="nav-item btn">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("../addproduct.aspx")%>'>
                            <i class="bi bi-bag-plus"></i>Launch New Product
                        </a>
                    </li>
                    <li class="nav-item btn activeView">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("addStock.aspx")%>'>
                            <i class="bi bi-file-earmark-plus"></i>Add Stock
                        </a>
                    </li>
                    <li class="nav-item btn">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("SellerProfile.aspx")%>' target="_blank">
                            <i class="bi bi-person-fill"></i>My Profile
                        </a>
                    </li>
                </ul>

            </nav>

        </div>


        <div class="col-lg-10 col-md-9 px-0 content" >
            <div class="d-flex justify-content-between mb-4 bg-light mx-0 pt-3 px-3 py-2" style="color: #42A;">
                <h5><i class="fas fa-cart-plus"></i> Add Stocks</h5>
                <span>
                    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="text-black">Enter Product Id: </asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="OK" CausesValidation="false" OnClick="Button1_Click" />
                </span>
<%--                <span>
                    <a href="#">
                        <i class="fas fa-plus-circle text-black" style="font-size:1.5em"></i>
                    </a>
                </span>--%>
            </div>

            <div class="container">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Label ID="errormsg" runat="server" Text="Enter Product Id to Add Stocks."></asp:Label>
                </asp:Panel>
                    
                <div class="row g-2">
                    <div class="col-12">
                        <asp:Label ID="Label2" runat="server">Product Id: </asp:Label>
                        <asp:Label ID="pid" runat="server" Text="Label" Font-Bold="true" ></asp:Label>
                    </div>
                    <div class="col-12">
                        <asp:Label ID="Label3" runat="server">Product Name: </asp:Label>
                        <asp:Label ID="pname" runat="server" Text="Label" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-12 mt-3">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT StockDetails.size, StockDetails.stock_no, StockDetails.stock_date FROM StockDetails INNER JOIN MappingTable ON StockDetails.Id = MappingTable.stock_id INNER JOIN Product ON MappingTable.product_id = Product.Id WHERE (Product.Id = @Id)" InsertCommand="INSERT INTO StockDetails(stock_no, stock_date) VALUES (@stock_no, GETDATE())" UpdateCommand="UPDATE StockDetails SET stock_no = @stock_no, stock_date = GETDATE()">
                            <InsertParameters>
                                <asp:Parameter Name="stock_no" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextBox1" DefaultValue="" Name="Id" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="stock_no" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" 
                            ForeColor="#333333" GridLines="None" CssClass="w-100 table" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
                                <asp:BoundField DataField="stock_no" HeaderText="Stocks" SortExpression="stock_no" />
                                <asp:BoundField DataField="stock_date" HeaderText="Last Stocked Date" SortExpression="stock_date" />
                                <asp:CommandField EditText="&lt;i class=&quot;fas fa-edit&quot;&gt;&lt;/i&gt;" HeaderText="Action" ShowEditButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle CssClass="bg-customBlue p-2 text-center" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" CssClass="text-center"/>
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
