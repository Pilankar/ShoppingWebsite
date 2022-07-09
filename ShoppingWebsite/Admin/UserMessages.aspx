<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserMessages.aspx.cs" Inherits="ShoppingWebsite.Admin.UserMessages" %>

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
                    <li class="nav-item btn">
                        <a class="" id="" href='<%=Response.ApplyAppPathModifier("SellerManagement.aspx")%>'>
                            <i class="fas fa-2x fa-users-cog"></i>
                        </a>
                    </li>
                    <li class="nav-item mt-3 btn activeView">
                        <a class="" id="" href='#top'>
                            <i class="fas fa-2x fa-envelope-open-text"></i>
                        </a>
                    </li>
                </ul>

            </nav>
        </div>

        <div class="row" style="margin-left: 5em; margin-top: 3em;">
            <%--second top navbar--%>
            <div class="d-flex justify-content-between mb-3 bg-light mx-0 pt-3 px-3" style="color: #42A;">
                <h5><i class="fas fa-envelope-open-text me-1"></i>User Messages</h5>
                <span class="nav-item "></span>
            </div>

            <%--content--%>
            <div class="row" id="top">
                <div class="col-9 mx-auto">
                    <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False">
                        <Columns>

                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Email-Id" HeaderText="Email-Id" />
                            <asp:BoundField DataField="Message" HeaderText="Message" />

                            <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-outline-danger" style="width:5em;">
                                        <a href="mailto:<%# Eval("Email-Id") %>?subject=Reply%20from%20FunkyFashion%20Site&body=Dear%20<%# Eval("Name") %>, %0A%0AThank you for your valuable response. %0A%0A%0ARegards, %0AFunkyFashion Team%0A" class="btn-outline-danger text-decoration-none">Reply</a>
                                    </button>
                                </ItemTemplate>
                                <ItemStyle CssClass="text-center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                   
                </div>
            </div>
        </div>
    </div>
</asp:Content>
