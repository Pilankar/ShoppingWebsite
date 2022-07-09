<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ShoppingWebsite.Seller.Products" %>
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
                    <li class="nav-item btn">
                        <a class="" id="orders" href='<%=Response.ApplyAppPathModifier("Orders.aspx")%>'>
                            <i class="bi bi-cash-coin"></i>Orders
                        </a>
                    </li>
                    <li class="nav-item btn activeView">
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
                <div class="d-flex justify-content-between align-items-center mb-4 bg-light mx-0 pt-3 px-3 py-2"  style="color: #42A;">
                    <h5> <i class="fas fa-shapes me-1"></i> Products</h5>
                    <span>
                        Total Products: <asp:Label ID="Badge" runat="server" Font-Bold="true" CssClass="ms-1"></asp:Label>
                    </span>
                </div>
                <div class="container mt-5 mb-5">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, name, brand, mrp, price, img_name, img_path, stocked_date FROM Product" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM Product WHERE (Id = @original_Id) AND (name = @original_name OR name IS NULL AND @original_name IS NULL) AND (brand = @original_brand OR brand IS NULL AND @original_brand IS NULL) AND (mrp = @original_mrp OR mrp IS NULL AND @original_mrp IS NULL) AND (price = @original_price OR price IS NULL AND @original_price IS NULL) AND (img_name = @original_img_name OR img_name IS NULL AND @original_img_name IS NULL) AND (img_path = @original_img_path OR img_path IS NULL AND @original_img_path IS NULL) AND (stocked_date = @original_stocked_date OR stocked_date IS NULL AND @original_stocked_date IS NULL)" InsertCommand="INSERT INTO Product(name, brand, mrp, price, img_name, img_path, stocked_date) VALUES (@name, @brand, @mrp, @price, @img_name, @img_path, @stocked_date)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE Product SET name = @name, brand = @brand, mrp = @mrp, price = @price, img_name = @img_name, img_path = @img_path, stocked_date = @stocked_date WHERE (Id = @original_Id) AND (name = @original_name OR name IS NULL AND @original_name IS NULL) AND (brand = @original_brand OR brand IS NULL AND @original_brand IS NULL) AND (mrp = @original_mrp OR mrp IS NULL AND @original_mrp IS NULL) AND (price = @original_price OR price IS NULL AND @original_price IS NULL) AND (img_name = @original_img_name OR img_name IS NULL AND @original_img_name IS NULL) AND (img_path = @original_img_path OR img_path IS NULL AND @original_img_path IS NULL) AND (stocked_date = @original_stocked_date OR stocked_date IS NULL AND @original_stocked_date IS NULL)">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_name" Type="String" />
                            <asp:Parameter Name="original_brand" Type="String" />
                            <asp:Parameter Name="original_mrp" Type="Int32" />
                            <asp:Parameter Name="original_price" Type="Int32" />
                            <asp:Parameter Name="original_img_name" Type="String" />
                            <asp:Parameter Name="original_img_path" Type="String" />
                            <asp:Parameter Name="original_stocked_date" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="brand" Type="String" />
                            <asp:Parameter Name="mrp" Type="Int32" />
                            <asp:Parameter Name="price" Type="Int32" />
                            <asp:Parameter Name="img_name" Type="String" />
                            <asp:Parameter Name="img_path" Type="String" />
                            <asp:Parameter Name="stocked_date" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="brand" Type="String" />
                            <asp:Parameter Name="mrp" Type="Int32" />
                            <asp:Parameter Name="price" Type="Int32" />
                            <asp:Parameter Name="img_name" Type="String" />
                            <asp:Parameter Name="img_path" Type="String" />
                            <asp:Parameter Name="stocked_date" Type="String" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_name" Type="String" />
                            <asp:Parameter Name="original_brand" Type="String" />
                            <asp:Parameter Name="original_mrp" Type="Int32" />
                            <asp:Parameter Name="original_price" Type="Int32" />
                            <asp:Parameter Name="original_img_name" Type="String" />
                            <asp:Parameter Name="original_img_path" Type="String" />
                            <asp:Parameter Name="original_stocked_date" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1"
                        DataKeyNames="Id" CssClass="table table-striped table-bordered"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image2" CssClass="w-100 img-fluid prod-img" style="height: 8em;" runat="server" ImageUrl='<%# Eval("img_path") %>' />
                                </ItemTemplate>
                                <ItemStyle CssClass="py-2" Width="12%"></ItemStyle>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Id" HeaderText="Product Id" SortExpression="Id">
                                <ItemStyle CssClass="py-2" Width="12%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="name" HeaderText="Product Name" SortExpression="name">
                                <ItemStyle CssClass="py-2" Width="15%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand">
                                <ItemStyle CssClass="py-2" Width="10%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="mrp" HeaderText="M.R.P." SortExpression="mrp">
                                <ItemStyle CssClass="py-2" Width="10%"></ItemStyle>
                            </asp:BoundField>
                            
                            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price">
                                <ItemStyle CssClass="py-2" Width="10%"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="stocked_date" HeaderText="Stocked Date" SortExpression="stocked_date">
                                <ItemStyle CssClass="py-2" Width="15%"></ItemStyle>
                            </asp:BoundField>

                            <asp:CommandField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderText="Action" EditText="&lt;i class=&quot;fas fa-edit&quot;&gt;&lt;/i&gt;" ShowEditButton="True" />

                        </Columns>
                        
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </div> 
            </div>
        </div>
</asp:Content>


