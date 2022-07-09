<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="ShoppingWebsite.Seller.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="sellerTemplate.css" rel="stylesheet" />
    
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
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
                    <li class="nav-item btn activeView">
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
                    <li class="nav-item btn">
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


        <div class="col-lg-10 col-md-9 px-0 content">
            <div class="d-flex justify-content-between align-items-center mb-4 bg-light mx-0 pt-3 px-3 py-2" style="color: #42A;">
                <h5><i class="bi bi-cash-coin"></i>Recent Orders</h5>
                <span class="text-black">
                    Total Orders: <asp:Label ID="badge" runat="server" CssClass="badge bg-customBlue rounded-pill ms-1"></asp:Label>
                </span>
            </div>
            <div class="container mt-5 mb-5">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OrderDetail.product_id, Product.name, Product.category_subtype, OrderDetail.quantity, OrderDetail.size, [Order].orderedDate FROM OrderDetail INNER JOIN [Order] ON [Order].Id = OrderDetail.order_id INNER JOIN Product ON OrderDetail.product_id = Product.Id ORDER BY OrderDetail.product_id"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" CssClass="table mt-4 mx-auto" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="product_id" HeaderText="Product id" SortExpression="product_id" ItemStyle-CssClass="p-2 border-1" ItemStyle-Width="5%" HeaderStyle-CssClass="p-2 border-1" />
                        <asp:BoundField DataField="name" HeaderText="Product Name" SortExpression="name" ItemStyle-Width="15%" ItemStyle-CssClass="p-2 border-1" />
                        <asp:BoundField DataField="category_subtype" HeaderText="Category subtype" SortExpression="category_subtype" ItemStyle-Width="8%" ItemStyle-CssClass="p-2 border-1" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" ItemStyle-Width="5%" ItemStyle-CssClass="p-2 border-1" />
                        <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" ItemStyle-Width="5%" ItemStyle-CssClass="p-2 border-1" />
                        <asp:BoundField DataField="orderedDate" HeaderText="OrderedDate" SortExpression="orderedDate" ItemStyle-Width="10%" ItemStyle-CssClass="p-2 border-1" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" Width="30%" CssClass="p-2" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
