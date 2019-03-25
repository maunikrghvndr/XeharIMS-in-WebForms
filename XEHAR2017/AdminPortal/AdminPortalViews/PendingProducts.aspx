<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="PendingProducts.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.PendingProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">All Products</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-6"></div>
                                    <div class="col-sm-6"></div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:repeater id="rptProducts" runat="server">
                                            <HeaderTemplate>
                                                <table id="products" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="products_info"">
                                                <thead>
                                                <tr role="row">
                                                    <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="SKU">SKU</th>
                                                    <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="product name">Product Name</th>
                                                    <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Model Number">Model Number</th>

                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr role="row" class="odd">
                                                    <td width="100">
                                                        <%-- changed dataitem.pid to sku --%>
                                                        <a href="PendingProduct2ndPage.aspx?pid=<%# DataBinder.Eval(Container, "DataItem.PID") + "-" + DataBinder.Eval(Container, "DataItem.ModelNumber") %>"><%# DataBinder.Eval(Container, "DataItem.PID") %></a>
                                                    </td>
                                                    <td >
                                                        <%# DataBinder.Eval(Container, "DataItem.ModelNumber") %>
                                                    </td>
                                                    <td width="100" align=center>
                                                        <%# DataBinder.Eval(Container, "DataItem.ModelNumber") %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                            </table><!--<a href="addproducts.aspx"><i class="fa fa-circle-o"></i>Add Products</a>-->
                                            </FooterTemplate>
                                        </asp:repeater>
                                    </div>
                                </div>

                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->


            </div>
        </section>
    </div>
</asp:Content>
