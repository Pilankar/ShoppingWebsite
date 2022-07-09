<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ShoppingWebsite.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Categories</title>

    <style>
        main section {
            padding: 1.5rem;
            margin: 20px 0px 20px 0px;
        }

        main section .row {
            margin: 5px;
            justify-content: space-around;
            /* padding: 30px; */
            align-content: baseline;
        }

        .card {
            margin: .5em;
            border: none;
        }

        .card a {
            text-decoration: none;
            color: black;
        }

        /*.card:hover {
            box-shadow: 0px 0px 30px 5px #666;
            margin: 0.3em;
        }*/

        h3 {
            margin-bottom: 1em;
        }
        .card .card-text {
            font-size: 1.5em;
            font-family: 'Times New Roman';
            font-stretch: expanded;
        }
        .card .card-img-top {
            height: 18rem;
            object-fit:cover;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="WomenCategory">
        <h3>Stylish collections for Women</h3>
        <div class="row">
            <asp:Repeater ID="RepCat1" runat="server">
                <ItemTemplate>
                    <div class="card p-2" style="width: 18rem;">
                        <a href="SubCategory.aspx?cat=<%# Eval("name") %>&subcat=<%# Eval("subcategory") %>" target="_blank">
                            <img class="card-img-top img-fluid rounded-circle" src="imgs/<%# Eval("img_addr") %>" alt="<%# Eval("subcategory") %>">
                            <div class="card-body">
                                <p class="card-text text-center"><%# Eval("subcategory") %></p>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <section id="MenCategory">
        <h3>Stylish collections for Men</h3>
        <div class="row">
            <asp:Repeater ID="RepCat2" runat="server">
                <ItemTemplate>
                    <div class="card p-2" style="width: 18rem;">
                        <a href="SubCategory.aspx?cat=<%# Eval("name") %>&subcat=<%# Eval("subcategory") %>" target="_blank">
                            <img class="card-img-top img-fluid rounded-circle" src="imgs/<%# Eval("img_addr") %>" alt="<%# Eval("subcategory") %>">
                            <div class="card-body">
                                <p class="card-text text-center"><%# Eval("subcategory") %></p>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <section id="KidsCategory">
        <h3>Stylish collections for Kids</h3>
        <div class="row">
            <asp:Repeater ID="RepCat3" runat="server">
                <ItemTemplate>
                    <div class="card p-2" style="width: 18rem;">
                        <a href="SubCategory.aspx?cat=<%# Eval("name") %>&subcat=<%# Eval("subcategory") %>" target="_blank">
                            <img class="card-img-top img-fluid rounded-circle" src="imgs/<%# Eval("img_addr") %>" alt="<%# Eval("subcategory") %>">
                            <div class="card-body">
                                <p class="card-text text-center"><%# Eval("subcategory") %></p>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <section id="AccessoryCategory">
        <h3>Stylish collections of Accessories</h3>
        <div class="row">
            <asp:Repeater ID="RepCat4" runat="server">
               <ItemTemplate>
                    <div class="card p-2" style="width: 19rem;">
                        <a href="SubCategory.aspx?cat=<%# Eval("name") %>&subcat=<%# Eval("subcategory") %>" target="_blank">
                            <img class="card-img-top img-fluid rounded-circle" src="imgs/<%# Eval("img_addr") %>" alt="<%# Eval("subcategory") %>">
                            <div class="card-body">
                                <p class="card-text text-center"><%# Eval("subcategory") %></p>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
</asp:Content>
