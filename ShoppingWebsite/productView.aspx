<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="productView.aspx.cs" Inherits="ShoppingWebsite.productView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link rel="stylesheet" type="text/css" href="shopping.css">--%>
    <link href="css/shopping.css" rel="stylesheet" />
    <title>productView</title>

    <style>
        main {
            /*padding: 2rem;*/
            background-color: rgb(234, 240, 253);
        }


        aside {
            width:auto;
            height: 50%;
            float: left;
        }

        /* .content-info {
            margin-left: auto;
        } */

        .prod-img {
            /* padding: 20px; */
            display: block;
            margin: auto;
            width: 100%; /*28em*/
            /*width: 40rem;*/
            border: 1px solid black;
            /*position: -webkit-sticky;
            position: sticky;*/
            top: 0;
        }

        .productCost {
            font-weight: bold;
            font-size: large;
            color: rgb(180, 13, 13);
        }

        #star_rating {
            color: var(--bs-warning);
            font-size: 2em;
        }

        .content-info button {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        main label {
            font-weight: 500;
        }

        @media only screen and (max-width: 770px) {
            .prod-img {
                width: 98%;
            }
        }

        .rate {
            float: right;
            height: 46px;
            padding: 0 10px;
            width: 11em;
        }

            .rate:not(:checked) > input {
                position: absolute;
                top: -9999px;
            }

            .rate:not(:checked) > label {
                float: right;
                width: 1em;
                overflow: hidden;
                white-space: nowrap;
                cursor: pointer;
                font-size: 30px;
                color: #ccc;
            }

                .rate:not(:checked) > label:before {
                    content: '★ ';
                }

            .rate > input:checked ~ label {
                color: #ffc700;
            }

            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }

            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bg-white">
        <div class="row">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE (([category_type] = @category_type) AND ([Id] = @Id))">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="Women" Name="category_type" QueryStringField="category_type" Type="String" />
                    <asp:QueryStringParameter DefaultValue="10003" Name="Id" QueryStringField="Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataSourceID="SqlDataSource1"
                EnableTheming="False" BorderStyle="None" CommandRowStyle-BorderStyle="None">
                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="row my-4">
                                <div class="col-sm-5">
                                    <aside>
                                        <a href="<%# Eval("img_path") %>" target="_blank">
                                            <img class="img-fluid prod-img" src="<%# Eval("img_path") %>" alt="<%# Eval("img_name") %>">
                                        </a>
                                        &nbsp;&nbsp;
                                    </aside>
                                </div>

                                <div class="col-sm-7">
                                    <section id="item">
                                        <div class="row">
                                            <p>
                                                <small>
                                                    <label for="brand">Brand:</label>
                                                    <span id="brand" runat="server"><%# Eval("brand") %></span>
                                                </small>
                                            </p>
                                        </div>
                                        <div class="row">
                                            <h3 id="name" runat="server"><%# Eval("name") %></h3>
                                        </div>
                                        <div class="row">
                                            <asp:Label ID="star_rating" CssClass="mb-2" runat="server" ClientIDMode="Static" Text='<%# Eval("rating") %>'></asp:Label>
                                            <%--0   &#9734;&#9734;&#9734;&#9734;&#9734;
                                        1   &#9733;&#9734;&#9734;&#9734;&#9734;
                                        2   &#9733;&#9733;&#9734;&#9734;&#9734;
                                        3   &#9733;&#9733;&#9733;&#9734;&#9734;
                                        4   &#9733;&#9733;&#9733;&#9733;&#9734;
                                        5   &#9733;&#9733;&#9733;&#9733;&#9733;--%>

                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    let length = 5;
                                                    let str = "";
                                                    let n = $("#star_rating").text();
                                                    for (let i = 0; i < length; i++) { //0 1 2 3 4 5
                                                        //0 - 00000, 1-10000, 2-11000
                                                        if (n > i) { //
                                                            str = str + "★"; //1
                                                        }
                                                        else {
                                                            str = str + "☆"; //0
                                                        }

                                                    }
                                                    $("#star_rating").text(str);

                                                });
                                            </script>

                                            <hr>
                                        </div>

                                        <div class="row">
                                            <p id="description" runat="server">
                                                <%# Eval("desc") %>
                                            </p>
                                        </div>
                                        <div class="row">
                                            <small>
                                                <label for="mrp_price">M.R.P: </label>
                                                &ensp;
                                            <strike><var id="mrp_price" runat="server">Rs. <%# Eval("mrp") %>.00</var></strike>
                                            </small>
                                            <br />
                                            <p>
                                                <label for="cost_price">Price: </label>
                                                &ensp;
                                            <var class="productCost" id="cost_price" runat="server">Rs. <%# Eval("price") %>.00</var>
                                            </p>
                                        </div>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                            SelectCommand="SELECT * FROM [dbo].[StockDetails] INNER JOIN [dbo].[MappingTable] ON [dbo].[StockDetails].[Id] = [dbo].[MappingTable].[stock_id] WHERE ([product_id] = @product_id)">
                                            <SelectParameters>
                                                <asp:QueryStringParameter DefaultValue="Women" Name="category_type" QueryStringField="category_type" Type="String" />
                                                <asp:QueryStringParameter DefaultValue="10003" Name="product_id" QueryStringField="Id" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <div class="row">
                                            <div class="col-md-6 inputs form-group">
                                                <label for="size">Size: </label>
                                                <asp:DropDownList class="form-control" ID="DropDownList1" runat="server"
                                                    AppendDataBoundItems="True" DataTextField="size" DataValueField="size" DataSourceID="SqlDataSource2">
                                                    <asp:ListItem Text="--Select--" Value="Select" />
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="vsize" ForeColor="Red"
                                                    runat="server" ControlToValidate="DropDownList1"
                                                    ErrorMessage="*Select your size to continue" ValidationGroup="grp1"
                                                    InitialValue="Select" Display="Dynamic" SetFocusOnError="True" Font-Italic="True">
                                                </asp:RequiredFieldValidator>
                                            </div>

                                            <div class="col-md-6 inputs form-group">
                                                <label for="qty">Qty:</label>
                                                <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                                    <asp:ListItem Text="1" Value="1" Selected="True" />
                                                    <asp:ListItem Text="2" Value="2" />
                                                    <asp:ListItem Text="3" Value="3" />
                                                    <asp:ListItem Text="4" Value="4" />
                                                    <asp:ListItem Text="5 (Max)" Value="5" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row p-4 bo">
                                            <ul>
                                                <li>
                                                    <asp:Label runat="server" Font-Bold="true">Care Instructions:</asp:Label>
                                                    <asp:Label ID="care_instruction" runat="server"><%# Eval("care_instr") %></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" Font-Bold="true">Fit Type:</asp:Label>
                                                    <asp:Label ID="fit_type" runat="server"><%# Eval("fit_type") %></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" Font-Bold="true">Color Name:</asp:Label>
                                                    <asp:Label ID="Label1" runat="server"> <%# Eval("color") %> </asp:Label>
                                                </li>
                                            </ul>
                                            <ul id="more_details" runat="server">
                                                <li><b>Product Details: </b> <%# Eval("more_details") %></li>
                                            </ul>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <asp:Button runat="server" ID="AddToCart" CssClass="btn btn-primary bg-customBlue w-100 my-2" Text="Add To Cart" CommandName="AddToCart" OnCommand="AddToCart_Command" ValidationGroup="grp1"></asp:Button>
                                            </div>
                                            <div class="col-sm-6">
                                                <asp:Button runat="server" ID="BuyNow" CssClass="btn btn-danger w-100 my-2" Text="Buy Now" CommandName="BuyNow" OnCommand="BuyNow_Command" ValidationGroup="grp1"></asp:Button>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>

        </div>

        <div class="row justify-content-center bg-secondary mb-3 py-3">
            <span style="float: right; font-size: larger; height: 46px; padding: 10px 10px; width: 180px; color: white">Rate This Product: </span>
            <div class="rate" runat="server">
                <asp:RadioButton ID="star5r" runat="server" GroupName="rate" Value="5" ClientIDMode="Static" />
                <%--<input type="radio" id="star5" runat="server">--%>
                <label for="star5r" title="text">5 stars</label>
                <asp:RadioButton ID="star4r" runat="server" GroupName="rate" Value="4" ClientIDMode="Static" />
                <label for="star4r" title="text">4 stars</label>
                <asp:RadioButton ID="star3r" runat="server" GroupName="rate" Value="3" ClientIDMode="Static" />
                <label for="star3r" title="text">3 stars</label>
                <asp:RadioButton ID="star2r" runat="server" GroupName="rate" Value="2" ClientIDMode="Static" />
                <label for="star2r" title="text">2 stars</label>
                <asp:RadioButton ID="star1r" runat="server" GroupName="rate" Value="1" ClientIDMode="Static" />
                <label for="star1r" title="text">1 star</label>
            </div>
            <button id="Rated" runat="server" type="button"
                style="width:3em;height:3em;background-color: var(--bs-teal);color: white;margin: 0 1em;" 
                class="btn rounded-circle btn-success " onserverclick="Rated_btnclicked"><i class="fas fa-thumbs-up"></i></button>

        </div>
        <!--Comments-->
        <div class="row">
            <div class="col-lg-12 w-100">
                <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="100%" data-numposts="5"></div>
            </div>
        </div>
        <!--/ Comments-->

    </div>
        

</asp:Content>
