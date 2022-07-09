<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ShoppingWebsite.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        main .container {
            max-width: 960px;
        }

        input[type=radio] {
            float: left;
            margin-left: -1.5em;
            margin-top: .25em;
            width: 1em;
            height: 1em;
        }

        main {
            background-color: #EEEEEE66;
            /*background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://www.lsretail.com/hubfs/BLOG_6-technology-trends-reshaping-luxury-fashion-industry.jpg');
            background-position: right;
            background-repeat: no-repeat;
            background-size: cover;*/
            position: relative;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        main .row {
            margin-top: calc(var(--bs-gutter-y) * -1);
            margin-right: calc(var(--bs-gutter-x) * -.5);
            margin-left: calc(var(--bs-gutter-x) * -.5);
        }

            main .row > * {
                margin-top: var(--bs-gutter-y);
            }
    </style>

    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">

    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="py-4 text-center">
                    <h2>Checkout form</h2>
                </div>
                <div class="row py-5 g-5">

                    <!-- Cart Start-->
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <div>
                            <h4 class="d-flex justify-content-between align-items-center mb-4">
                                <span>Your Cart</span>
                                <asp:Label ID="badge" runat="server" CssClass="badge bg-customBlue rounded-pill"></asp:Label>
                            </h4>
                        </div>

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"
                            ShowHeader="False" CellPadding="4" ShowFooter="True" GridLines="None" ForeColor="#333333" Width="18em">
                            <AlternatingRowStyle BackColor="#F9F9F9" ForeColor="#284775" />
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
                                        <div class="d-flex justify-content-between align-items-center">
                                            <span>Total:</span>
                                            <asp:Label ID="lbltotal" runat="server" Text="Label" Font-Bold="true"></asp:Label>
                                        </div>
                                    </FooterTemplate>
                                    <FooterStyle CssClass="p-3" HorizontalAlign="Left" />
                                    <ItemStyle Width="100px" HorizontalAlign="Left" />

                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>

                    </div>
                    <!-- Cart Done -->

                    <!-- Checkout Start-->
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Billing address</h4>
                        <div class="needs-validation">
                            <div class="row g-3">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName" class="form-label">First name</label>
                                    <asp:TextBox CssClass="form-control" ID="firstName" runat="server" placeholder="John"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="firstName" ErrorMessage="*Enter your name">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="lastName" class="form-label">Last name</label>
                                    <asp:TextBox CssClass="form-control" ID="lastName" runat="server" placeholder="Doe"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="lastName" ErrorMessage="*Enter your name">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-12 mb-3">
                                    <label for="phone" class="form-label">Phone Number</label>
                                    <asp:TextBox CssClass="form-control" ID="contact" runat="server" placeholder="9876543210"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vcontact1" runat="server" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="contact" ErrorMessage="*Enter Phone Number">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="contact" ErrorMessage="Enter Valid Number"
                                        ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-12 mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="doe@123.com" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="email" ErrorMessage="*Enter email ID">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="email" ErrorMessage="Enter your email"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                    </asp:RegularExpressionValidator>
                                </div>

                                <div class="col-12 mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <asp:TextBox CssClass="form-control" ID="address" runat="server" placeholder="1234 Main St" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="address" ErrorMessage="*Enter address">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-5 mb-3">
                                    <label for="city" class="form-label">City</label>
                                    <asp:TextBox CssClass="form-control" ID="city" runat="server" placeholder=""></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vcity" Display="Dynamic" ForeColor="Red"
                                        runat="server" ControlToValidate="city"
                                        ErrorMessage="*Enter city">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label for="state" class="form-label">State</label>
                                    <asp:DropDownList class="form-control" ID="state" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                        <asp:ListItem Text="Assam" Value="Assam" />
                                        <asp:ListItem Text="Bihar" Value="Bihar" />
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Goa" Value="Goa" />
                                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                        <asp:ListItem Text="Haryana" Value="Haryana" />
                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                        <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                        <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                        <asp:ListItem Text="Kerala" Value="Kerala" />
                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                        <asp:ListItem Text="Manipur" Value="Manipur" />
                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                        <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                        <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                        <asp:ListItem Text="Odisha" Value="Odisha" />
                                        <asp:ListItem Text="Punjab" Value="Punjab" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                        <asp:ListItem Text="Telangana" Value="Telangana" />
                                        <asp:ListItem Text="Tripura" Value="Tripura" />
                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                        <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic"
                                        runat="server" ControlToValidate="state" ForeColor="Red"
                                        ErrorMessage="Select your state"
                                        InitialValue="select">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-3 mb-3">
                                    <label for="pincode" class="form-label">Pincode</label>
                                    <asp:TextBox CssClass="form-control" ID="pincode" runat="server" placeholder=""></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vpincode" runat="server" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="pincode" ErrorMessage="*Enter pincode">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="mb-3">
                                <asp:CheckBox CssClass="" ID="sameaddress" runat="server" AutoPostBack="True" OnCheckedChanged="sameaddress_CheckedChanged" />
                                <label class="form-check-label" for="sameaddress">Shipping address is the same as my billing address</label>
                            </div>

                            <asp:Panel ID="Panel1" runat="server" Visible="true">
                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <label for="s_address" class="form-label">Address</label>
                                        <asp:TextBox CssClass="form-control" ID="s_address" runat="server" placeholder="1234 Main St" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ForeColor="Red"
                                            ControlToValidate="s_address" ErrorMessage="*Enter address">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-5 mb-3">
                                        <label for="s_city" class="form-label">City</label>
                                        <asp:TextBox CssClass="form-control" ID="s_city" runat="server" placeholder=""></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" ForeColor="Red"
                                            runat="server" ControlToValidate="s_city"
                                            ErrorMessage="*Enter city">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-4 mb-3">
                                        <label for="s_state" class="form-label">State</label>
                                        <asp:DropDownList class="form-control" ID="s_state" runat="server">
                                            <asp:ListItem Text="Select" Value="select" />
                                            <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                            <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                            <asp:ListItem Text="Assam" Value="Assam" />
                                            <asp:ListItem Text="Bihar" Value="Bihar" />
                                            <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                            <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                            <asp:ListItem Text="Goa" Value="Goa" />
                                            <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                            <asp:ListItem Text="Haryana" Value="Haryana" />
                                            <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                            <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                                            <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                            <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                            <asp:ListItem Text="Kerala" Value="Kerala" />
                                            <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                            <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                            <asp:ListItem Text="Manipur" Value="Manipur" />
                                            <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                            <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                            <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                            <asp:ListItem Text="Odisha" Value="Odisha" />
                                            <asp:ListItem Text="Punjab" Value="Punjab" />
                                            <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                            <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                            <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                            <asp:ListItem Text="Telangana" Value="Telangana" />
                                            <asp:ListItem Text="Tripura" Value="Tripura" />
                                            <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                            <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                            <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic"
                                            runat="server" ControlToValidate="s_state" ForeColor="Red"
                                            ErrorMessage="Select your state"
                                            InitialValue="select">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <label for="s_pincode" class="form-label">Pincode</label>
                                        <asp:TextBox CssClass="form-control" ID="s_pincode" runat="server" placeholder=""></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic" ForeColor="Red"
                                            ControlToValidate="s_pincode" ErrorMessage="*Enter pincode">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </asp:Panel>

                            <hr class="my-4">

                            <h4 class="mb-3">Payment</h4>

                            <div class="my-3">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                                    CellPadding="5" CellSpacing="5"
                                    CssClass="form-check"
                                    AutoPostBack="true" OnTextChanged="RadioButtonList1_TextChanged">
                                    <asp:ListItem Selected="True">Credit card</asp:ListItem>
                                    <asp:ListItem>Debit card</asp:ListItem>
                                    <asp:ListItem Value="COD">Cash On Delivery</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

                            <asp:Panel ID="Panel2" runat="server">
                                <div class="row gy-3">
                                    <div class="col-md-6">
                                        <label for="ccname" class="form-label">Name on card</label>
                                        <asp:TextBox ID="ccname" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                        <small class="text-muted d-inline-block">Full name as displayed on card</small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic" ForeColor="Red"
                                            ControlToValidate="ccname" ErrorMessage="*Name on card is required">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="ccnumber" class="form-label">Card number</label>
                                        <asp:TextBox ID="ccnumber" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" Display="Dynamic" ForeColor="Red"
                                            ControlToValidate="ccnumber" ErrorMessage="*Credit card number is required">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-4">
                                        <label for="ccexpiration" class="form-label">Expiration</label>
                                        <asp:TextBox ID="ccexpiration" runat="server" CssClass="form-control" TextMode="Month"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" Display="Dynamic" ForeColor="Red"
                                            ControlToValidate="ccexpiration" ErrorMessage="* Expiration date required">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-3">
                                        <label for="cvv" class="form-label">CVV</label>
                                        <asp:TextBox ID="cvv" runat="server" CssClass="form-control" TextMode="Number" MaxLength="3"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" Display="Dynamic" ForeColor="Red"
                                            ControlToValidate="cvv" ErrorMessage="*Security code required">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </asp:Panel>
                            <hr class="my-4">
                            <asp:Button ID="Pay" CssClass="w-100 btn btn-primary bg-customBlue btn-lg" runat="server" Text="Checkout" OnClick="Pay_Click" />
                        </div>

                    </div>
                    <!-- Checkout Done-->

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
