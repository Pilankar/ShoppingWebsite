<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellerHomePage.aspx.cs" Inherits="ShoppingWebsite.Seller.SellerHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="sellerTemplate.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            var xValues1 = <%=HiddenField1.Value %>;
            var yValues1 = <%=HiddenField2.Value %>;
            var xValues2 = <%=HiddenField3.Value %>;
            var yValues2 = <%=HiddenField4.Value %>;
            var xValues3 = <%=HiddenField5.Value %>;
            var yValues3 = <%=HiddenField6.Value %>;
            var xValues4 = <%=HiddenField7.Value %>;
            var yValues4 = <%=HiddenField8.Value %>;

            var barColors = ["#ffc107", "#20c997", "#0dcaf0", "#d63384", "#6f42c1"];

            var mychrt1 = new Chart("myChart1", {
                type: "line",
                data: {
                    labels: xValues1,
                    datasets: [{
                        fill: false,
                        lineTension: 0,
                        backgroundColor: "rgba(0,0,255,1.0)",
                        borderColor: "rgba(0,0,255,0.1)",
                        data: yValues1,
                    }]
                },
                options: {
                    legend: { display: false },
                    scales: {
                        xAxes: [{
                            type: 'time',
                            time: {
                                unit: 'day'
                            }
                        }],
                        yAxes: [{
                            title: {
                                display: true,
                                text: 'Revenue',
                                ticks: { max: 10000 }
                            }
                        }]
                    },
                    title: {
                        display: true,
                        text: "Revenue Trend"
                    }
                }
            });

            var mychart2 = new Chart("myChart2", {
                type: "doughnut",
                data: {
                    labels: xValues2,
                    datasets: [{
                        fill: false,
                        backgroundColor: barColors,
                        data: yValues2
                    }]
                },
                options: {
                    legend: {
                        display: true,
                        position: 'right'
                    },
                    title: {
                        display: true,
                        text: "Sales Per Category This Month"
                    }
                }
            });

            var mychart3 = new Chart("myChart3", {
                type: "bar",
                data: {
                    labels: xValues3,
                    datasets: [{
                        backgroundColor: barColors,
                        data: yValues3
                    }]
                },
                options: {
                    legend: { display: false },
                    scales: {
                        yAxes: [{ ticks: { min: 0, max: 300 } }],
                    },
                    title: {
                        display: true,
                        text: "Less than 300 Stocks per Product"
                    }
                }
            });

            var mychart4 = new Chart("myChart4", {
                type: "line",
                data: {
                    labels: xValues4,
                    datasets: [{
                        fill: false,
                        lineTension: 0,
                        backgroundColor: "rgba(0,0,255,1.0)",
                        borderColor: "rgba(0,0,255,0.1)",
                        data: yValues4,
                    }]
                },
                options: {
                    legend: { display: false },
                    scales: {
                        xAxes: [{
                            type: 'time',
                            time: {
                                unit: 'day'
                            }
                        }],
                        yAxes: [{
                            title: {
                                display: true,
                                text: 'Profit',
                                ticks: { max: 10000 }
                            }
                        }]
                    },
                    title: {
                        display: true,
                        text: "Profit Trend"
                    }
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row m-0">
        <%--side left floating navbar--%>
        <div class="nav-main col-lg-2 col-md-3 bg-customBlue bg-gradient p-0">
            <nav class="navbar mt-2 p-2">
                <ul class="navbar-nav w-100">
                    <li class="nav-item btn activeView">
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

            <%--second top navbar--%>
            <div class="d-flex justify-content-between mb-1 bg-light mx-0 pt-3 px-3 py-2" style="color: #42A;">
                <h5><i class="fas fa-chart-bar me-1"></i>Dashboard</h5>
                <%--<span class="nav-item ">
                    <a class="nav-link p-0 d-inline" href="#">
                        <i class="fas fa-plus-circle" style="font-size: 1.2em"></i>
                    </a>
                </span>--%>
            </div>
            <%--content--%>
            <div id="Dashboard" class="row">


                <div class="col-lg-8 p-3 small">
                    <%--Overview--%>
                    <div class="d-flex justify-content-around p-4">
                        <div class="card card-overview">
                            <div class="card-body">
                                <h5 class="card-title">Total Profit</h5>
                                <p class="card-subtitle mb-2 text-muted">Today</p>
                                <h3 class="card-title" id="profit" runat="server">₹ 200</h3>

                            </div>
                        </div>

                        <div class="card card-overview">
                            <div class="card-body">
                                <h5 class="card-title">Total Revenue</h5>
                                <p class="card-subtitle mb-2 text-muted">Today</p>
                                <h3 class="card-title" id="revenue" runat="server">₹ 10K</h3>

                            </div>
                        </div>

                        <div class="card card-overview">
                            <div class="card-body">
                                <h5 class="card-title">Units Sold</h5>
                                <p class="card-subtitle mb-2 text-muted">Today</p>
                                <h3 class="card-title" id="unitsSold" runat="server">50</h3>
                            </div>
                        </div>
                    </div>

                    <%--Charts--%>
                    <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="HiddenField2" runat="server" />
                    <canvas id="myChart1" class="mt-4" style="width: 100%; background-color: aliceblue;"></canvas>
                </div>


                <div class="col-lg-4 p-3">
                    <%--Top 5 Products that are trending--%>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP (4) Product.Id, Product.name, SUM(OrderDetail.quantity) AS Units, AVG(Product.price) AS PriceAvg, Product.img_path FROM Product INNER JOIN OrderDetail ON Product.Id = OrderDetail.product_id INNER JOIN [Order] ON OrderDetail.order_id = [Order].Id WHERE (MONTH([Order].orderedDate) = MONTH(GETDATE())) AND (Product.seller_id = @seller_id) GROUP BY Product.Id, Product.name, Product.img_path ORDER BY Units DESC">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="101" Name="seller_id" SessionField="Id" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" class="table table-striped table-bordered mt-3" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Your Top Selling" HeaderStyle-CssClass="text-center text-secondary">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <asp:Image ID="Image1" CssClass="w-100 prod-img" runat="server" ImageUrl='<%# Eval("img_path") %>' />
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Label ID="prodname" runat="server" Font-Size="Larger" Font-Names="'Judson', serif" CssClass="lh-1"><%# Eval("name") %></asp:Label>
                                            <div class="d-flex justify-content-around mt-3">
                                                <span>Units Sold</span>
                                                <span>Revenue</span>
                                            </div>
                                            <div class="d-flex justify-content-around">
                                                <asp:Label ID="produnit" runat="server" Font-Bold="true"><%# Eval("Units") %></asp:Label>
                                                <asp:Label ID="prodrevenue" runat="server" Text='<%# (Convert.ToInt32(Eval("Units")) * Convert.ToInt32(Eval("PriceAvg"))).ToString() %>' Font-Bold="true"></asp:Label>
                                            </div>
                                        </div>
                                    </div>



                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <%--Charts--%>
                <div class="col-6">
                    <asp:HiddenField ID="HiddenField3" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="HiddenField4" runat="server" />
                    <canvas id="myChart2" class="mt-4" style="width: 100%; background-color: aliceblue;"></canvas>
                </div>

                <div class="col-6">
                    <asp:HiddenField ID="HiddenField5" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="HiddenField6" runat="server" />
                    <canvas id="myChart3" class="mt-4" style="width: 100%; background-color: aliceblue;"></canvas>
                </div>

                <div class="col-6">
                    <asp:HiddenField ID="HiddenField7" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="HiddenField8" runat="server" />
                    <canvas id="myChart4" class="mt-4" style="width: 100%; background-color: aliceblue;"></canvas>
                </div>



                <div class="col-6 d-flex justify-content-center align-content-center flex-column px-5">
                    <h4>Current Sales: 
                                <asp:Label ID="actS" runat="server"></asp:Label>
                    </h4>
                    <h4>Predicted Sales: 
                                <asp:Label ID="predS" runat="server"></asp:Label>
                    </h4>
                    <asp:Button ID="Predict" runat="server" CssClass="mt-2 btn btn-info bg-gradient" Text="Predict Now" />

                </div>

            </div>
        </div>
    </div>
</asp:Content>
