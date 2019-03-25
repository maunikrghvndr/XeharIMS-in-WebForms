<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="AdminPortalProduct.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.AdminPortalProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<script src='//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
 
   
    <script src="../../scripts/custom/incrementing.js"></script>

    <div class="content-wrapper">
        <div class="col-xs-12">
            <div class="box pad10">
                <div class="row">
                    <div class="col-md-4">
                        <img src="../../images/noimage_19.jpg" />

                    </div>


                    <div class="col-md-6">

                        <div class="form-group">
                            <%--<label class="fs-24">Product Description</label>--%>
                            <asp:Label ID="lblColor" runat="server" class="fs-24"></asp:Label>
                            <div class="clearfix"></div>
                            <label id="lblVendorDescription" runat="server"></label>
                        </div>
                    </div>

                    <div class="col-md-2">

                        <div class="form-group">
                            <label class="fs-24">Vendor Price</label>
                            <label id="lblVendorPrice" runat="server"></label>

                            <label class="fs-24">Suggested vendor price</label>
                            <input type="text" class="form-control" placeholder="Enter Buyer " id="txtSuggestedVendorPrice" runat="server" />
                        </div>
                    </div>

                     <div class="row">
                                    <div class="col-sm-12">
                                         <asp:repeater id="rptProducts" runat="server">           
            <HeaderTemplate>
                 <table id="products" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="products_info"">
                     <thead>
                           <tr role="row">
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Color">Color</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Small">Small</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Medium">Medium</th>
                               <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Large">Large</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="X-Large">X-Large</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="2X-Large">2X-Large</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="3X-Large">3X-Large</th>
                                
                             </tr>
            </HeaderTemplate>
            <ItemTemplate>
                            <tr role="row" class="odd">
                            
                            <td>
                            <%# DataBinder.Eval(Container, "DataItem.Color")%>
                            </td>
                            <td width="150">
                            <%# DataBinder.Eval(Container, "DataItem.Small")%>
                            </td>
                            <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Medium")%>
                            </td>
                                     <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Large")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.X-Large")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.2X-Large")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.3X-Large")%>
                            </td>
                            </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                            </table><!--<a href="addproducts.aspx"><i class="fa fa-circle-o"></i>Add Products</a>-->
                            </FooterTemplate>
        </asp:repeater>
                                  </div>
                                </div>

                    <div class="col-md-6 text-centre">
    		<button type="button" id="btnSubmitProduct" runat="server" class="btn btn-warning custom-button-width .navbar-right" onserverclick="btnConfirm_Click" style="padding-bottom: 30px ;width:auto">Make a Purchase order</button>
			
    	</div>




</asp:Content>
