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
            padding: 0.5em;
            display: block;
            margin: auto;
            width: 15rem;
            height: 17rem;
            object-fit: scale-down;
            background-size: cover;
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
                            <asp:Label ID="badge" runat="server" CssClass="badge bg-customBlue rounded-pill"></asp:Label>
                        </h3>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" CssClass="mt-4 mx-auto" ShowHeader="false" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Id" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#FDFDFD" />
                        <%--<Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="col-lg-3">
                                        <asp:Image class="img-fluid prod-img" ID="Image1" runat="server" ImageUrl='<%# Eval("img_path") %>' />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>--%> 
                        <Columns>
                            <%--<asp:BoundField DataField="name" HeaderText="name" SortExpression="name" ItemStyle-Width="15%" ItemStyle-CssClass="p-2">
                            <ItemStyle CssClass="p-2" Width="15%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="brand" SortExpression="brand" ItemStyle-Width="8%" ItemStyle-CssClass="p-2">
                            <ItemStyle CssClass="p-2" Width="8%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="rating" SortExpression="rating" ItemStyle-Width="5%" ItemStyle-CssClass="p-2">
                            <ItemStyle CssClass="p-2" Width="5%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="desc" SortExpression="desc" ItemStyle-Width="5%" ItemStyle-CssClass="p-2">
                            <ItemStyle CssClass="p-2" Width="5%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="mrp" SortExpression="mrp" ItemStyle-Width="10%" ItemStyle-CssClass="p-2">
                            <ItemStyle CssClass="p-2" Width="10%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="price" SortExpression="price" />
                            <asp:BoundField DataField="care_instr" SortExpression="care_instr" />
                            <asp:BoundField DataField="fit_type" SortExpression="fit_type" />
                            <asp:BoundField DataField="color" SortExpression="color" />
                            <asp:BoundField DataField="more_details" SortExpression="more_details" />
                            <asp:BoundField DataField="stocked_date" SortExpression="stocked_date" />
                            <asp:BoundField DataField="category_type" SortExpression="category_type" />
                            <asp:BoundField DataField="category_subtype" SortExpression="category_subtype" />--%>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-lg-9">
                                                <div class="row">
                                                    <div class="col-12">
                                                        ID -   
                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("id") %>'></asp:Label>
                                                        &nbsp;| Brand -
                                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("brand") %>'></asp:Label>
                                                    </div>
                                                    <div class="col-12">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                    </div>

                                                    <div class="col-12">
                                                        MRP -   &#8377;
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("mrp") %>'></asp:Label>
                                                        &nbsp;| Price -    &#8377;
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("price") %>'></asp:Label>
                                                    </div>
                                                    
                                                    <div class="col-12">
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("desc") %>'></asp:Label>
                                                    </div>

                                                    <div class="col-12">
                                                        Care Instructions -  
                                                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("care_instr") %>'></asp:Label>
                                                        &nbsp;| Fit Type -   
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("fit_type") %>'></asp:Label>
                                                        &nbsp;| Color -   
                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("color") %>'></asp:Label>

                                                    </div>
                                                    <div class="col-12">
                                                        More Details -  
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("more_details") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Image class="img-fluid prod-img" ID="Image1" runat="server" ImageUrl='<%# Eval("img_path") %>' />
                                            </div>
                                           
                                        </div>
                                    </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BorderColor ="Black" BorderWidth="1" BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </div>
            </div>
    </div>
</asp:Content>


</body>
</html>
