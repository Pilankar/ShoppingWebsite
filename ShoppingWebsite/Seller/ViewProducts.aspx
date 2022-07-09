<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="ShoppingWebsite.Seller.ViewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        main {
            padding: 0px;
        }

            main .nav-item .fas, .fab, .far, .bi {
                margin: 0.5em;
            }

            main .navbar .btn {
                text-align: left;
            }

            main .navbar .nav-item:hover {
                background-color: var(--bs-danger);
            }

        .nav-main {
            min-height: 32rem;
        }

            .nav-main .btn {
                font-size: 0.875em;
            }

            .nav-main a {
                text-decoration: none;
                color: var(--bs-dark);
                font-family: sans-serif;
            }

            .nav-main .active a {
                color: var(--bs-primary);
            }

            .nav-main .nav-item:hover a {
                color: white;
            }

            .nav-main .activeView {
                background-color: var(--bs-danger);
                border-radius: .25rem;
            }

                .nav-main .activeView a {
                    color: white;
                }


        .footer {
            display: none;
        }

        .prod-img {
            padding: 0.2em;
            width: 10rem;
            height: 10rem;
            object-fit: cover;
        }

        @media only screen and (max-width: 770px) {
            .nav-main {
                min-height: auto;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row m-0">

        <div class="nav-main col-lg-2 col-md-3 bg-gradient">
            <nav class="navbar">
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
                    <li class="nav-item btn activeView">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("ViewProducts.aspx")%>'>
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
                </ul>

                <h6 class="w-100 d-flex justify-content-between px-3 mt-4 mb-2 text-muted">
                    <span class="text-dark">Saved reports</span>
                    <a class="link-secondary" href="#" aria-label="Add a new report">
                        <i class="fas fa-plus-circle"></i>
                    </a>
                </h6>

                <ul class="navbar-nav w-100">
                    <li class="nav-item btn">
                        <a class="" href="#">
                            <i class="far fa-file-alt"></i>
                            Current month
                        </a>
                    </li>
                    <li class="nav-item btn">
                        <a class="" href="#">
                            <i class="far fa-file-alt"></i>
                            Last quarter
                        </a>
                    </li>
                    <li class="nav-item btn">
                        <a class="" href="#">
                            <i class="far fa-file-alt"></i>
                            Social engagement
                        </a>
                    </li>
                    <li class="nav-item btn">
                        <a class="t" href="#">
                            <i class="far fa-file-alt"></i>
                            Year-end sale
                        </a>
                    </li>
                </ul>
            </nav>

        </div>


            <div class="col-lg-10 col-md-9" style="background-color: #ffe5e5">
                <div class="container mt-5 mb-5">
                    <div class="mx-auto" style="width: 80%">
                        <h3 class="d-flex justify-content-between align-items-center mb-4">
                            <span style="color: #228;">Your Products</span>
                            <asp:Label ID="Badge" runat="server" CssClass="badge bg-customBlue rounded-pill"></asp:Label>
                        </h3>
                    </div>
                    <asp:SqlDataSource ID="ProdSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
                    <asp:GridView ID="ProdGridView1" runat="server" CssClass="mt-4 mx-auto text-center" ShowHeader="true" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Id" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Both">
                        <AlternatingRowStyle BackColor="#FDFDFD" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image class="img-fluid prod-img" ID="Image1" runat="server" ImageUrl='<%# Eval("img_path") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="name" HeaderText="Product Name" SortExpression="name">
                                <ItemStyle CssClass="py-2" Width="15%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand">
                                <ItemStyle CssClass="py-2" Width="10%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price">
                                <ItemStyle CssClass="py-2" Width="10%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="mrp" HeaderText="M.R.P." SortExpression="mrp">
                                <ItemStyle CssClass="py-2" Width="10%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="stocked_date" HeaderText="Stocked Date" SortExpression="stocked_date">
                                <ItemStyle CssClass="py-2" Width="15%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="category_type" HeaderText="Category" SortExpression="category_type">
                                <ItemStyle CssClass="py-2" Width="10%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="category_subtype" HeaderText="Subcategory" SortExpression="category_subtype">
                                <ItemStyle CssClass="py-2" Width="10%"></ItemStyle>
                            </asp:BoundField>

                        </Columns>
                        <HeaderStyle BackColor="white" BorderWidth="1px" CssClass="py-3" Height="2em" Font-Size="Large" ForeColor="#225588" Font-Bold="true" />
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BorderColor="#999999" BorderWidth="1" BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </div>
                <script>
                $(document).ready(function () {
                    var gridHeader = $("#<%=ProdGridView1.ClientID%>").clone(true); // Here Clone Copy of Gridview with style
                    $(gridHeader).find("tr:gt(0)").remove(); // Here remove all rows except first row (header row)
                    $('#<%=ProdGridView1.ClientID%> tr th').each(function (i) {
                        // Here Set Width of each th from gridview to new table(clone table) th 
                        $("th:nth-child(" + (i + 1) + ")", gridHeader).css('width', ($(this).width()).toString() + "px");
                    });
                    $("#GHead").append(gridHeader);
                    $('#GHead').css('position', 'absolute');
                    $('#GHead').css('top', $('#<%=ProdGridView1.ClientID%>').offset().top);

                });
                </script>
            </div>
    </div>
</asp:Content>

