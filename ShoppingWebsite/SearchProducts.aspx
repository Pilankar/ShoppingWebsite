<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchProducts.aspx.cs" Inherits="ShoppingWebsite.SearchProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Category</title>

    <style>
        /*section {
            padding: 1.5rem;
            margin: 20px 0px 20px 0px;
        }*/

        main {
            background-color: white;
        }

        .card a {
            text-decoration: none;
            color: black;
        }

        .card:hover {
            box-shadow: 0px 0px 30px 5px #666;
        }

        .productCost {
            font-weight: bold;
            font-size: medium;
            color: crimson;
        }

        .content-info button {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        main label {
            font-weight: 500;
        }

        tbody {
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
        }

        .prod-img {
            padding: 1em;
            display: block;
            margin: auto;
            width: 15rem;
            height: 17rem;
            object-fit: scale-down;
            background-size: cover;
        }

        
    </style>

    <%--<script type="text/javascript">
        $(document).ready(function () {
            $('.productList').DataTable();
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="d-flex justify-content-between">
            <h3>Searched Products</h3>

            <%--<asp:Label runat="server">Sort by
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Text="--Select--" Value="Select" />
                    <asp:ListItem Text="Popularity" Value="Popularity" />
                    <asp:ListItem Text="High to Low" Value="High to Low" />
                    <asp:ListItem Text="Low to High" Value="Low to High" />

                </asp:DropDownList>
            </asp:Label>--%>
            
        </div>
        
        <div class="row">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT name, Id, brand, mrp, price, img_name, img_path, category_type, category_subtype, rating FROM Product WHERE (brand LIKE '%' + @brand + '%') OR (name LIKE '%' + @name + '%') OR (category_subtype LIKE '%' + @category_subtype + '%')">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="brand" QueryStringField="s" />
                    <asp:QueryStringParameter Name="name" QueryStringField="s" />
                    <asp:QueryStringParameter DefaultValue="" Name="category_subtype" QueryStringField="s" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:GridView ID="GridView1" runat="server" CssClass="productList" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" ShowHeader="False" BorderWidth="0px">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="card" style="width: 16rem; margin: 1em;">
                                <a href="productView.aspx?category_type=<%# Eval("category_type") %>&subcat=<%# Eval("category_subtype") %>&id=<%# Eval("Id") %>" target="_blank">
                                    <img class="card-img-top prod-img" src="<%# Eval("img_path") %>" alt="<%# Eval("img_name") %>">
                                    <div class="card-body">
                                        <asp:Label ID="brand" runat="server" CssClass="card-text d-block" Font-Bold="true" Font-Size="Larger" ForeColor="#222288"><%# Eval("brand") %></asp:Label>
                                        <asp:Label ID="name" runat="server" CssClass="d-block card-text"><%# Eval("name") %></asp:Label>

                                        <p>
                                            <label class="productCost" id="cost_price" runat="server">Rs. <%# Eval("price") %>.00</label>
                                            &ensp;
                                                <small>
                                                    <strike><var id="Var1" runat="server">Rs. <%# Eval("mrp") %>.00</var></strike>
                                                </small>
                                        </p>
                                    </div>
                                </a>
                            &nbsp;</div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </section>
</asp:Content>

