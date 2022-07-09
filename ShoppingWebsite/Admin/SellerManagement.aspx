<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellerManagement.aspx.cs" Inherits="ShoppingWebsite.Admin.SellerManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="adminTemplate.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-0">
        <%--side left floating navbar--%>
        <div class="nav-main col-md-1 bg-customBlue bg-gradient p-0">
            <nav class="navbar mt-2 p-2">
                <ul class="navbar-nav w-100">
                    <li class="nav-item btn activeView">
                        <a class="" id="" href='#top'>
                            <i class="fas fa-2x fa-users-cog"></i>
                        </a>
                    </li>
                    <%--<li class="nav-item btn">
						<a class="" id="orders" href='<%=Response.ApplyAppPathModifier("SellerManagement.aspx")%>'>
							<i class="bi bi-cash-coin"></i>Seller Requests
						</a>
					</li>--%>
                    <li class="nav-item mt-3 btn">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("UserMessages.aspx")%>'>
                            <i class="fas fa-2x fa-envelope"></i>
                        </a>
                    </li>
                    <%--<li class="nav-item btn">
						<a class="" id="" href='<%=Response.ApplyAppPathModifier("#")%>'>
							<i class="bi bi-pencil-square"></i>Edit Products
						</a>
					</li>--%>
                </ul>

            </nav>
        </div>

        <div class="row" style="margin-left: 5em; margin-top: 3em;">
            <%--second top navbar--%>
            <div class="d-flex justify-content-between mb-3 bg-light mx-0 pt-3 px-3" style="color: #42A;">
                <h5><i class="fas fa-users-cog me-1"></i>Seller Management</h5>
                <span class="nav-item "></span>
            </div>

            <%--content--%>
            <div class="row" id="top">
                <div class="col-lg-8 pt-2">
                    <%--Seller Requests--%>
                    <div class="card small">
                        <div class="card-body">
                            <h4 class="card-title text-center">Sellers List</h4>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [seller_info]"></asp:SqlDataSource>
                            <asp:GridView class="table table-striped table-bordered mt-2" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Seller Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                                    <asp:TemplateField HeaderText="Fullname">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#String.Format("{0} {1}", Eval("firstname"), Eval("lastname"))%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="contact" HeaderText="Contact No" SortExpression="contact" />
                                    <asp:BoundField DataField="email" HeaderText="Email Id" SortExpression="email" />
                                    <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                    <asp:BoundField DataField="status" HeaderText="Status" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 pt-2">
                    <div class="card small">
                        <div class="card-body">
                            <h4 class="card-title text-center">Seller Details</h4>

                            <%--<asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px"></asp:DetailsView>--%>

                            <div class="row">
                                <div class="col text-center">
                                    <img src="../imgs/guy.gif" width="100" />
                                </div>
                                <div class="col-12">
                                    <hr>
                                </div>
                            </div>

                            <div class="row g-2">
                                <div class="col-md-6">
                                    <label>Seller ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Seller ID"></asp:TextBox>
                                            <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" ToolTip="Enter Seller ID To Get Details"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Username</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="username" runat="server" placeholder="UserName" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>First Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="fname" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Last Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="lname" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label>Account Status</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="accStatus" runat="server" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                            <asp:LinkButton class="btn btn-success input-group-text" ID="LinkButton1" runat="server" ToolTip="Active" OnClick="LinkButton1_Click"><i class="fas fa-check-circle d-inline"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-warning input-group-text" ID="LinkButton2" runat="server" ToolTip="Pending" OnClick="LinkButton2_Click"><i class="far fa-pause-circle d-inline"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-danger input-group-text" ID="LinkButton3" runat="server" ToolTip="Deactive" OnClick="LinkButton3_Click"><i class="fas fa-times-circle d-inline"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <label>Adhar No.</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="adharno" runat="server" placeholder="Adhar no" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Email ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label>Full Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-8 mx-auto">
                                    <asp:Button ID="Button2" class="btn btn btn-block btn-danger" runat="server" Text="Delete Seller Permanently" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</asp:Content>
