<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="ShoppingWebsite.signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sign Up</title>

    <link href="css/signup.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section class="bg-img">
            <div class="container container-form">
                <div class="row">
                    <div class="col-sm-12 my-3">
                        <h2>User Registration</h2>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-4">
                        <label for="fullname">Full Name:</label>
                    </div>
                    <div class="col-sm-8 inputs form-group">
                        <asp:TextBox CssClass="form-control" ID="fullname" runat="server" placeholder="John Doe"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vfullnamename" runat="server"
                            ControlToValidate="fullname" ErrorMessage="*Enter your name">
                        </asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-4">
                        <label for="contact">Contact No:</label>
                    </div>
                    <div class="col-sm-8 inputs form-group">
                        <asp:TextBox CssClass="form-control" ID="contact" runat="server" placeholder="9812345670"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vcontact1" runat="server"
                            ControlToValidate="contact" ErrorMessage="*Enter Phone Number">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="vcontact2" runat="server"
                            ControlToValidate="contact" ErrorMessage="Enter Valid Number"
                            ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-4">
                        <label for="email">Email Id:</label>
                    </div>
                    <div class="col-sm-8 inputs form-group">
                        <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="doe@123.com" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vemail" runat="server"
                            ControlToValidate="email" ErrorMessage="*Enter email ID">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="vemail1" runat="server"
                            ControlToValidate="email" ErrorMessage="Enter your email"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-4">
                        <asp:Label for="usertype" Font-Bold="True" runat="server">User Type: </asp:Label>
                    </div>
                    <div class="col-sm-8 inputs form-group">
                        <asp:DropDownList class="form-control" ID="usertype" runat="server">
                            <asp:ListItem Text="Select" Value="select" />
                            <asp:ListItem Text="Customer" Value="Customer" />
                            <asp:ListItem Text="Seller" Value="Seller" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="vusertype"
                            runat="server" ControlToValidate="usertype"
                            ErrorMessage="*Select User Type"
                            InitialValue="select">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-4">
                        <label for="address">Full Address:</label>
                    </div>
                    <div class="col-sm-8 inputs form-group">
                        <asp:TextBox CssClass="form-control" ID="address" runat="server" placeholder="Enter Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vaddress" runat="server"
                            ControlToValidate="address" ErrorMessage="*Enter address">
                        </asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-4">
                        <label for="state">State:</label>
                    </div>
                    <div class="col-sm-8 inputs form-group">
                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
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
                        <asp:RequiredFieldValidator ID="vstate" Display="Dynamic"
                            runat="server" ControlToValidate="DropDownList1"
                            ErrorMessage="*Select your state"
                            InitialValue="select">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-4">
                        <label for="city">City:</label>
                    </div>
                    <div class="col-sm-8 inputs form-group">
                        <asp:TextBox class="form-control" ID="city" runat="server" placeholder="borivali"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vcity" runat="server"
                            ControlToValidate="city" ErrorMessage="*Enter your name">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row my-2">
                            <div class="col-sm-4">
                                <label for="city">User Name:</label>
                            </div>
                            <div class="col-sm-8 inputs form-group">
                                <asp:TextBox class="form-control" ID="username" runat="server" OnTextChanged="CheckUserNameAvailability"
                                    placeholder="john123" ToolTip="Enter user name for login purpose" AutoPostBack="True"></asp:TextBox>
                                <div id="checkun" runat="server" visible="false">
                                    <i id="checkicon" runat="server"></i>
                                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                </div>
                                <asp:RequiredFieldValidator ID="vusername" runat="server"
                                    ControlToValidate="username" ErrorMessage="*Enter your name">
                                </asp:RequiredFieldValidator>
                            </div>

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="row my-2">
                    <div class="col-sm-4">
                        <label for="password">New Password:</label>
                    </div>
                    <div class="col-sm-8 inputs form-group">
                        <asp:TextBox class="form-control" ID="passwordconfirm" ToolTip="Minimum 8 characters" runat="server" placeholder="" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vpasswordconfirm" runat="server"
                            ErrorMessage="*password required" ControlToValidate="passwordconfirm"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-4">
                        <label for="password">Confirm Password:</label>
                    </div>
                    <div class="col-sm-8 inputs form-group">
                        <asp:TextBox class="form-control" ID="password" ToolTip="Minimum 8 characters" runat="server" placeholder="" TextMode="Password"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="vpassword" runat="server"
                            ErrorMessage="*password required" ControlToValidate="password"></asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="d-flex flex-row-reverse" style="margin-right: 2%;">
                    <div class="p-2">
                        <asp:Button class="btn btn-success btn-lg" ID="Submit2" runat="server" Text="Submit" OnClick="Submit2_Click" />
                    </div>
                    <div class="p-2">
                        <asp:Button class="btn btn-danger btn-lg" ID="Submit1" runat="server" Text="Reset" CausesValidation="False" />
                    </div>
                </div>

<%--                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="firstName" class="form-label">First name</label>
                        <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Valid first name is required.
             
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label for="lastName" class="form-label">Last name</label>
                        <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Valid last name is required.
             
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="username" class="form-label">Username</label>
                        <div class="input-group has-validation">
                            <span class="input-group-text">@</span>
                            <input type="text" class="form-control" id="username" placeholder="Username" required>
                            <div class="invalid-feedback">
                                Your username is required.
               
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                        <input type="email" class="form-control" id="email" placeholder="you@example.com">
                        <div class="invalid-feedback">
                            Please enter a valid email address for shipping updates.
             
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
                        <div class="invalid-feedback">
                            Please enter your shipping address.
             
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="address2" class="form-label">Address 2 <span class="text-muted">(Optional)</span></label>
                        <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                    </div>

                    <div class="col-md-5">
                        <label for="country" class="form-label">Country</label>
                        <select class="form-select" id="country" required>
                            <option value="">Choose...</option>
                            <option>United States</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select a valid country.
             
                        </div>
                    </div>

                    <div class="col-md-4">
                        <label for="state" class="form-label">State</label>
                        <select class="form-select" id="state" required>
                            <option value="">Choose...</option>
                            <option>California</option>
                        </select>
                        <div class="invalid-feedback">
                            Please provide a valid state.
             
                        </div>
                    </div>

                    <div class="col-md-3">
                        <label for="zip" class="form-label">Zip</label>
                        <input type="text" class="form-control" id="zip" placeholder="" required>
                        <div class="invalid-feedback">
                            Zip code required.
             
                        </div>
                    </div>
                </div>--%>

            </div>

        </section>
        <%--<a href="homepage.aspx"><< Back to Home</a><br>--%>
        <br>
    </section>
</asp:Content>
