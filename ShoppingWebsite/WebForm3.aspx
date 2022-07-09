<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="ShoppingWebsite.WebForm3" %>
<%--<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>--%>  


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
    </script>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--<asp:Chart ID="Chart1" runat="server" Width="350">
                <Titles>
                    <asp:Title Text="Total marks of students">
                    </asp:Title>
                </Titles>
                <Series>
                    <asp:Series Name="Series1" ChartArea="ChartArea1">
                        <Points>
                            <asp:DataPoint AxisLabel="Mark" YValues="800" />
                            <asp:DataPoint AxisLabel="Steve" YValues="900" />
                            <asp:DataPoint AxisLabel="John" YValues="700" />
                            <asp:DataPoint AxisLabel="Mary" YValues="900" />
                            <asp:DataPoint AxisLabel="Ben" YValues="600" />
                        </Points>
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Student Name">
                        </AxisX>
                        <AxisY Title="Total Marks">
                        </AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>--%>
        </div>
        <canvas id="myChart" style="width: 100%; max-width: 700px"></canvas>
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HiddenField2" runat="server" />
        
        <%--<script type="text/javascript">
            $(document).ready(function () {
                var xValues = <%=HiddenField1.Value %>;
                var yValues = <%=HiddenField2.Value %>;

                new Chart("myChart", {
                    type: "line",
                    data: {
                        labels: xValues,
                        datasets: [{
                            fill: false,
                            lineTension: 0,
                            backgroundColor: "rgba(0,0,255,1.0)",
                            borderColor: "rgba(0,0,255,0.1)",
                            data: yValues
                        }]
                    },
                    options: {
                        legend: { display: false },
                        scales: {
                            yAxes: [{ ticks: { min: 6, max: 16 } }],
                        }
                    }
                });
            });
        </script>--%>

        <script type="text/javascript">
            $(document).ready(function () {
                var xValues = <%=HiddenField1.Value %>;
                var yValues = <%=HiddenField2.Value %>;
                var barColors = [
                    "#ff0000",
                    "#00ffff",
                    "#0000ff",
                    "#ffcccc",
                    "#00ff00",
                    "#ff0000",
                    "#00ffff",
                    "#0000ff",
                    "#ffcccc",
                    "#00ff00"
                ];

                new Chart("myChart", {
                    type: "doughnut",
                    data: {
                        labels: xValues,
                        datasets: [{
                            fill: false,
                            backgroundColor: barColors,
                            data: yValues
                        }]
                    },
                    options: {
                        legend: { display: true },
                        scales: {
                            yAxes: [{ ticks: { min: 100, max: 10000 } }],
                        },
                        title: {
                            display: true,
                            text: "Stocks per product"
                        }
                    }
                });
            });
            <%--document.write(<%=HiddenField1.Value %>);
            document.write(<%=HiddenField2.Value %>);--%>
        </script>
    </form>
</body>
</html>
