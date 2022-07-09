﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShoppingWebsite.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        section {
            padding: 0.5rem;
        }

        main {
            background-color: white;
        }
        /* Ids */
        .productName {
            width: 50%;
            color: darkslateblue;
            font-weight: bolder;
            font-size: larger;
        }

        .productCost {
            width: 20%;
            font-weight: bold;
            text-align: right;
        }

        @media only screen and (max-width: 600px) {
            table {
                margin-left: 1rem;
            }

            .productQty {
                width: 30%;
            }

            td {
                font-size: small;
            }
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>

        <%--<h3> Cart</h3>
        <hr>--%>
        <%--<table>
                <tr class="table-row">
                    <td class="productName">Lorem ipsum 1</td>
                    <td class="productCost"><var>$ 250 </var></td>
                    <td class="productQty">
                        <label>Qty:</label>

                        <select class="qty" >
                            <option value="0">0 (Delete)</option>
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5 (Maximum)</option>
                        </select>
                    </td>
                    <td class="productCancel">
                        <button type="button" class="btn btn-outline-danger text-center">
                            <i class="far fa-trash-alt"></i>
                        </button>
                    </td>

                </tr>

                <tr class="table-row">
                    <td class="productName">Lorem ipsum 2</td>
                    <td class="productCost"><var>$ 250 </var></td>
                    <td class="productQty">
                        <label>Qty:</label>

                        <select class="qty">
                            <option value="0">0 (Delete)</option>
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5 (Maximum)</option>
                        </select>
                    </td>
                    <td class="productCancel">
                        <button type="button" class="btn btn-outline-danger text-center">
                            <i class="far fa-trash-alt"></i>
                        </button>
                    </td>

                </tr>

                <tr class="table-row">
                    <td class="productName">Lorem ipsum 3</td>
                    <td class="productCost"><var>$ 250 </var></td>
                    <td class="productQty">
                        <label>Qty:</label>

                        <select class="qty">
                            <option value="0">0 (Delete)</option>
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5 (Maximum)</option>
                        </select>
                    </td>
                    <td class="productCancel">
                        <button type="button" class="btn btn-outline-danger text-center">
                            <i class="far fa-trash-alt"></i>
                        </button>
                    </td>

                </tr>
            </table>--%>

        <%--<<%--asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Cart] WHERE [Id] = @original_Id AND (([product_id] = @original_product_id) OR ([product_id] IS NULL AND @original_product_id IS NULL)) AND (([quantity] = @original_quantity) OR ([quantity] IS NULL AND @original_quantity IS NULL))" InsertCommand="INSERT INTO [Cart] ([quantity]) VALUES (@quantity)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT  [Id], [product_id], [quantity] FROM [Cart] WHERE ([customer_id] = @customer_id)" UpdateCommand="UPDATE [Cart] SET [product_id] = @product_id, [quantity] = @quantity WHERE [Id] = @original_Id AND (([product_id] = @original_product_id) OR ([product_id] IS NULL AND @original_product_id IS NULL)) AND (([quantity] = @original_quantity) OR ([quantity] IS NULL AND @original_quantity IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_product_id" Type="Int32" />
                <asp:Parameter Name="original_quantity" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="quantity" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="101" Name="customer_id" QueryStringField="cust" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="product_id" Type="Int32" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_product_id" Type="Int32" />
                <asp:Parameter Name="original_quantity" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="product_id" HeaderText="product_id" SortExpression="product_id" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <button class="btn btn-warning text-light add" name="add">Add</button>--%>

            <div class="col-md-5 col-lg-4 order-md-last mx-auto">
                      <h4 class="d-flex justify-content-between align-items-center mb-3">
                          <span class="text-primary">Your cart</span>
                          <span class="badge bg-primary rounded-pill">3</span>
                      </h4>
                      <ul class="list-group mb-3">
                          <li class="list-group-item d-flex justify-content-between lh-sm">
                              <div>
                                  <h6 class="my-0">Product name</h6>
                                  <small class="text-muted">Brief description</small>
                              </div>
                              <span class="text-muted">$12</span>
                          </li>
                          <li class="list-group-item d-flex justify-content-between lh-sm">
                              <div>
                                  <h6 class="my-0">Second product</h6>
                                  <small class="text-muted">Brief description</small>
                              </div>
                              <span class="text-muted">$8</span>
                          </li>
                          <li class="list-group-item d-flex justify-content-between lh-sm">
                              <div>
                                  <h6 class="my-0">Third item</h6>
                                  <small class="text-muted">Brief description</small>
                              </div>
                              <span class="text-muted">$5</span>
                          </li>
                          <li class="list-group-item d-flex justify-content-between bg-light">
                              <div class="text-success">
                                  <h6 class="my-0">Promo code</h6>
                                  <small>EXAMPLECODE</small>
                              </div>
                              <span class="text-success">−$5</span>
                          </li>
                          <li class="list-group-item d-flex justify-content-between">
                              <span>Total (USD)</span>
                              <strong>$20</strong>
                          </li>
                      </ul>

                  </div>
    </section>
        <%--<section style="margin-top: 2rem;">
            <b>Total :</b> <var>$ 750</var>
        </section>--%>
</asp:Content>
