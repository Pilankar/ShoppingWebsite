<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditProducts.aspx.cs" Inherits="ShoppingWebsite.Seller.EditProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="sellerTemplate.css" rel="stylesheet" />
    <style>
        input[type=radio], input[type=checkbox] {
            margin: 7px;
        }

        .choices {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            align-items: baseline;
        }

        #choicesAll table tr {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            align-items: baseline;
        }

        fieldset {
            /*border: inset;*/
            margin-bottom: .5em
        }
    </style>

    <!--Custom Javascript-->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Categories").change(function () {
                //alert(ContentPlaceHolder1_Categories.value);
                if (Categories.value == "Women") {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    $("#choicesforWomen").show();
                }
                else if (Categories.value == "Men") {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    $("#choicesforMen").show();
                }
                else if (Categories.value == "Kids") {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    $("#choicesforKids").show();
                }
                else if (Categories.value == "Accessories") {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    $("#choicesforAccessories").show();
                }
                else {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                }

            });

            ConfirmReset = function () {

                if (confirm("Are you sure to want to Reset Data?") == true) {
                    $('input:checkbox').attr('checked', false);
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    return true;
                }
                else
                    return false;
            }
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
                    <li class="nav-item btn">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("Products.aspx")%>'>
                            <i class="bi bi-cart3"></i>View Products
                        </a>
                    </li>
                    <li class="nav-item btn activeView">
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
                <h5><i class="bi bi-pencil-square me-1"></i>Edit Product Details</h5>
                <span>
                    <asp:Label ID="Label2" runat="server" Text="Label" CssClass="text-black">Enter Product Id: </asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="OK" OnClick="Button2_Click" CausesValidation="false" />
                </span>
            </div>

            <div class="row">
                <div class="col-lg-6 col-sm-12">

                    <!--Product Info-->
                    <section>
                        <fieldset>
                            <legend>Product Info</legend>

                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label for="Name" runat="server">Product Name:</asp:Label>
                                </div>
                                <div class="col-sm-8 inputs">
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="Name"
                                            placeholder="Eg. Lorem ipsum" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="vName" runat="server"
                                        ControlToValidate="Name" ErrorMessage="*Enter product name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label for="Desc" runat="server">Description:</asp:Label>
                                </div>
                                <div class="col-sm-8 inputs">
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="Desc" placeholder="Eg. Lorem ipsum, dolor sit amet consectetur adipisicing elit."
                                            runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="vDesc" runat="server"
                                        ControlToValidate="Desc" ErrorMessage="*Write full description" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label for="brand" runat="server">Brand Name:</asp:Label>
                                </div>
                                <div class="col-sm-8 inputs">
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="brand"
                                            placeholder="Eg. Harpa" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="vbrand" runat="server"
                                        ControlToValidate="brand" ErrorMessage="*Enter brand name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </fieldset>
                    </section>
                    <!--/--Product info---->

                    <!--Category-->
                    <section>
                        <fieldset>
                            <legend>Category</legend>

                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label for="category" runat="server">Category: </asp:Label>
                                </div>
                                <div class="col-sm-8 inputs">
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="Categories" runat="server" ClientIDMode="Static">
                                            <asp:ListItem Text="Select" Value="Select" />
                                            <asp:ListItem Text="Women" Value="Women" />
                                            <asp:ListItem Text="Men" Value="Men" />
                                            <asp:ListItem Text="Kids" Value="Kids" />
                                            <asp:ListItem Text="Accessories" Value="Accessories" />
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="VCategories" runat="server"
                                        ControlToValidate="Categories" ErrorMessage="*Select Category"
                                        InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row my-2">
                                <div class="col-12">
                                    <div id="choicesAll">
                                        <div class="form-group" id="choicesforWomen" runat="server" ClientIDMode="static">
                                            <asp:Label CssClass="d-block" for="RadioButtonList1" runat="server">Please select your category type: </asp:Label>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="w-100"
                                                RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="5" CellSpacing="5">
                                                <asp:ListItem>Tops</asp:ListItem>
                                                <asp:ListItem>Kurti</asp:ListItem>
                                                <asp:ListItem>Dress</asp:ListItem>
                                                <asp:ListItem>Jeans</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                ControlToValidate="RadioButtonList1" ErrorMessage="*Select Category"
                                                InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group" id="choicesforMen" runat="server" ClientIDMode="static">
                                            <asp:Label CssClass="d-block" for="RadioButtonList2" runat="server">Please select your category type: </asp:Label>
                                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" CssClass="w-100"
                                                RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="5" CellSpacing="5">
                                                <asp:ListItem>T-shirt</asp:ListItem>
                                                <asp:ListItem>Jeans</asp:ListItem>
                                                <asp:ListItem>Jacket</asp:ListItem>
                                                <asp:ListItem>Ethic Wear</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                ControlToValidate="RadioButtonList2" ErrorMessage="*Select Category"
                                                InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group" id="choicesforKids" runat="server" ClientIDMode="static">
                                            <asp:Label CssClass="d-block" for="RadioButtonList3" runat="server">Please select your category type: </asp:Label>
                                            <asp:RadioButtonList ID="RadioButtonList3" runat="server" CssClass="w-100"
                                                RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="5" CellSpacing="5">
                                                <asp:ListItem>Tops</asp:ListItem>
                                                <asp:ListItem>Dungree</asp:ListItem>
                                                <asp:ListItem>Dress</asp:ListItem>
                                                <asp:ListItem>Jeans</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                ControlToValidate="RadioButtonList3" ErrorMessage="*Select Category"
                                                InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group" id="choicesforAccessories" runat="server" ClientIDMode="static">
                                            <asp:Label CssClass="d-block" for="RadioButtonList4" runat="server">Please select your category type: </asp:Label>
                                            <asp:RadioButtonList ID="RadioButtonList4" runat="server" CssClass="w-100"
                                                RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="5" CellSpacing="5">
                                                <asp:ListItem>Watches</asp:ListItem>
                                                <asp:ListItem>Hand Bags</asp:ListItem>
                                                <asp:ListItem>Sunglass</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                                ControlToValidate="RadioButtonList4" ErrorMessage="*Select Category"
                                                InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </fieldset>
                    </section>
                    <!--/Category-->

                </div>

                <div class="col-lg-6 col-sm-12">

                    <!--Price-->
                    <section>
                        <fieldset>
                            <legend>Price</legend>

                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label for="mrp" runat="server">M.R.P:</asp:Label>
                                </div>
                                <div class="col-sm-8 inputs">
                                    <div class=" form-group">
                                        <asp:TextBox CssClass="form-control" ID="mrp" runat="server" placeholder="Eg. $300" TextMode="Number">100</asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ControlToValidate="mrp" ErrorMessage="*Enter Maximum Retail Price" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <%--<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator"
                                            ControlToValidate="mrp" SetFocusOnError="True" Display="Static" MinimumValue="99"></asp:RangeValidator>--%>
                                    </div>
                                </div>
                            </div>


                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label for="productPrice" runat="server">Price:</asp:Label>
                                </div>
                                <div class="col-sm-8 inputs form-group">
                                    <asp:TextBox CssClass="form-control" ID="productPrice" runat="server" placeholder="Eg. $250" TextMode="Number">99</asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="productPrice" ErrorMessage="*Enter selling price" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <%--<asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="RangeValidator"
                                            ControlToValidate="productPrice" SetFocusOnError="True" Display="Static" MinimumValue="99"></asp:RangeValidator>
                                    --%>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*Product price should be less than MRP" ForeColor="#FFCCCC"
                                        ControlToValidate="productPrice" ControlToCompare="mrp" EnableClientScript="True" Operator="LessThanEqual" Type="Integer" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>
                        </fieldset>
                    </section>
                    <!--/Price-->

                    <!--Extra Info-->
                    <section>
                        <fieldset>
                            <legend>Extra Info</legend>

                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label for="fit_type" runat="server">Fit Type:</asp:Label>
                                </div>
                                <div class="col-sm-8 inputs form-group">
                                    <asp:TextBox CssClass="form-control" ID="fit_type" runat="server" placeholder="Regular Fit"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vfit_type" runat="server"
                                        ControlToValidate="fit_type" ErrorMessage="*Mension fit type" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label for="color" runat="server">Color:</asp:Label>
                                </div>
                                <div class="col-sm-8 inputs form-group">
                                    <asp:TextBox CssClass="form-control" ID="color" runat="server" placeholder="Black" TextMode="SingleLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vcolor" runat="server"
                                        ControlToValidate="color" ErrorMessage="*Mension colour name" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label runat="server">Care Instructions :</asp:Label>
                                </div>
                                <div class="col-sm-8 inputs form-group">
                                    <asp:TextBox CssClass="form-control" ID="care_instr" runat="server" placeholder="Hand Wash Only"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row my-2">
                                <div class="col-sm-4">
                                    <asp:Label for="more_details" runat="server">More Details:</asp:Label>
                                </div>
                                <div class="col-sm-8 inputs form-group">
                                    <asp:TextBox CssClass="form-control" ID="more_details" runat="server" placeholder="100% Polyester,Hand wash" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                </div>
                            </div>
                        </fieldset>
                    </section>
                    <!--/Extra Info-->

                </div>
            </div>

            <div class="row mb-0">
                <div class="col-12 my-4">
                    <asp:Button CssClass="btn-danger btn-lg w-100" ID="Update" runat="server" Text="Update" OnClick="Update_Click" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>

