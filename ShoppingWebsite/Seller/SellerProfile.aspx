﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellerProfile.aspx.cs" Inherits="ShoppingWebsite.Seller.SellerProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        main .nav-item .fas, .fab {
            margin: 0.5em;
        }

        main .navbar .btn {
            text-align: left;
        }

        main .navbar .nav-item:hover {
            background-color: var(--bs-danger);
        }

        .nav-main {
            min-height: 30rem;
        }

        @media only screen and (max-width: 770px) {
            .nav-main {
                min-height: auto;
            }
        }
    </style>

    <script runat="server">
        protected void editProfileClicked(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Response.Write(0);
        }
        
        protected void changePswClicked(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            Response.Write(1);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3><i class="fas fa-user-cog m-2"></i>My Profile</h3>
        <hr />
        <div class="row">
            <div class="nav-main col-md-3 bg-customBlue bg-gradient">
                <nav class="navbar">
                    <ul class="navbar-nav text-light w-100">
                        <li class="nav-item nav-tabs mb-3 active">
                            <button class="text-light btn w-100" id="editProfile" runat="server" onclick="editProfileClicked">
                                <i class="fas fa-pen ms-2"></i>Edit Profile
                            </button>
                        </li>
                        <li class="nav-item nav-tabs mb-3">
                            <button class="text-decoration-none text-light btn w-100" id="changePsw" runat="server" onclick="changePswClicked">
                                <i class="fas fa-key"></i>Change Password
                            </button>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-7">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <div class="row g-3 border-1">
                            <div class="col-12">
                                <h3>Edit Profile</h3>
                                <div class="w-100 text-center">
                                    <i class="fas fa-7x fa-user-circle" style="color: var(--bs-gray-500);"></i>
                                </div>
                            </div>
                            <div class="col-md-6 mb-2">
                                <label for="firstName" class="form-label">First name</label>
                                <asp:TextBox CssClass="form-control" ID="firstName" runat="server" placeholder="John"></asp:TextBox>
                            </div>

                            <div class="col-md-6 mb-2">
                                <label for="lastName" class="form-label">Last name</label>
                                <asp:TextBox CssClass="form-control" ID="lastName" runat="server" placeholder="Doe"></asp:TextBox>
                            </div>

                            <div class="col-12 mb-3">
                                <label for="phone" class="form-label">Adhar Number</label>
                                <asp:TextBox CssClass="form-control" ID="adhar_no" runat="server" placeholder=""></asp:TextBox>
                            </div>

                            <div class="col-md-6 mb-2">
                                <label for="phone" class="form-label">Phone Number</label>
                                <asp:TextBox CssClass="form-control" ID="contact" runat="server" placeholder="9876543210"></asp:TextBox>
                            </div>

                            <div class="col-md-6 mb-2">
                                <label for="email" class="form-label">Email</label>
                                <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="doe@123.com" TextMode="Email"></asp:TextBox>
                            </div>

                            <div class="col-12 mb-2">
                                <label for="address" class="form-label">Address</label>
                                <asp:TextBox CssClass="form-control" ID="address" runat="server" placeholder="1234 Main St" TextMode="MultiLine" Rows="1"></asp:TextBox>
                            </div>

                            <div class="col-md-4 mb-2">
                                <label for="city" class="form-label">City</label>
                                <asp:TextBox CssClass="form-control" ID="city" runat="server" placeholder=""></asp:TextBox>
                            </div>

                            <div class="col-md-4 mb-2">
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
                            </div>

                            <div class="col-md-4 mb-2">
                                <label for="pincode" class="form-label">Pincode</label>
                                <asp:TextBox CssClass="form-control" ID="pincode" runat="server" placeholder=""></asp:TextBox>
                            </div>

                            <div class="col-md-6 mb-2">
                                <label for="username" class="form-label">Username</label>
                                <asp:TextBox class="form-control" ID="username" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>

                            <div class="col-md-6 mb-2">
                                <label for="password" class="form-label">Password</label>
                                <div class="input-group">
                                    <asp:TextBox class="form-control" ID="password" runat="server" TextMode="Password" ReadOnly="true" ClientIDMode="Static"></asp:TextBox>
                                    <span class="input-group-text Show_password">
                                        <i class="fa fa-eye-slash icon"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="p-2">
                                <asp:Button class="btn btn-primary bg-customBlue bg-gradient btn-lg w-25" ID="Update" runat="server" Text="Save" CausesValidation="False" />
                            </div>
                        </div>
                    </asp:View>

                    <asp:View ID="View2" runat="server">
                        <div class="row g-3">
                            <div class="col-md-12 mb-2">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <label for="cnfpsw" class="form-label">Old Password <span id="pswsucc" runat="server" visible="false"><i id="check" runat="server"></i></span></label>
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" ID="cnfpsw" runat="server" TextMode="Password" placeholder=""
                                                OnTextChanged="cnfpsw_TextChanged" ClientIDMode="Static" AutoPostBack="true"></asp:TextBox>
                                            <span class="input-group-text Show_password">
                                                <i class="fa fa-eye-slash icon"></i>
                                            </span>
                                        </div>
                                        <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="cnfpsw" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label for="password">New Password:</label>
                                <div class="input-group">
                                    <asp:TextBox class="form-control" ID="passwordnew"
                                        runat="server" placeholder="" TextMode="Password"></asp:TextBox>
                                    <asp:Label runat="server" ToolTip="Minimum 8 characters" CssClass="input-group-text">
                                        <i class="fa fa-info-circle"></i>
                                    </asp:Label>
                                </div>
                                <asp:RequiredFieldValidator ID="vpasswordconfirm" runat="server" Display="Dynamic" ForeColor="Red"
                                    ErrorMessage="*password required" ControlToValidate="passwordnew"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-12 mb-3">
                                <label for="password">Confirm New Password:</label>
                                <div class="input-group">
                                    <asp:TextBox class="form-control" ID="passwordconfirm"
                                        runat="server" placeholder="" TextMode="Password"></asp:TextBox>

                                    <asp:Label runat="server" ToolTip="Minimum 8 characters" CssClass="input-group-text">
                                        <i class="fa fa-info-circle"></i>
                                    </asp:Label>
                                </div>

                                <asp:RequiredFieldValidator ID="vpassword" runat="server" Display="Dynamic" ForeColor="Red"
                                    ErrorMessage="*password required" ControlToValidate="passwordconfirm"></asp:RequiredFieldValidator>

                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password doesn't match" SetFocusOnError="True" ForeColor="Red"
                                    ControlToCompare="passwordnew" ControlToValidate="passwordconfirm"></asp:CompareValidator>
                            </div>
                            <div class="col-12">
                                <span id="updCheck" runat="server" visible="false">
                                    <i id="updCheckI1" runat="server" class="fas fa-check-circle text-success"></i>
                                    <asp:Label ID="updCheckLabel1" runat="server">Password Updated Successfully</asp:Label>
                                </span>
                            </div>
                            <div class="col-12 mt-3">
                                <asp:Button runat="server" ID="btnnext1"
                                    CssClass="btn bg-customBlue bg-gradient text-white btn-lg w-100" Text="Update" Enabled="False" OnClick="btnnext1_Click" />
                            </div>

                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
    </div>
</asp:Content>
