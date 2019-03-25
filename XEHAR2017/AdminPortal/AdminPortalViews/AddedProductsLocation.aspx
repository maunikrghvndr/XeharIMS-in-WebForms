<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="AddedProductsLocation.aspx.cs"  MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.AddedProductsLocation" EnableEventValidation="false" EnableViewState="true"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderlocation" runat="server">
    <div class="content-wrapper" style="min-height: 200px">
        <div class="col-xs-12">
            <div class="row" style="width: 1500px; height: 200px; margin-left: 16px; float: left">

                <div class="clearfix"></div>
                <div class="col-md-2">
                    <div class="numbers-row">
                        <asp:label id="sku" for="name" class="fs-24" runat="server">SKU</asp:label>
                    </div>
                </div>
                <div class="col-md-2" style="float: left">
                    <div class="numbers-row">
                        <label for="name" class="fs-24">location1</label>
                        <asp:DropDownList  ID="dropdownlist" runat="server"></asp:DropDownList>
                        <label for="name" class="fs-24">quantity1</label>
                         <input type="text" name="french-hens" id="quantity1" value="0" runat="server" style="width: 30% !important;" />
                            
                    </div>
                </div>
                <div class="col-md-2" style="float: left">
                    <div class="numbers-row">
                        <label for="name" class="fs-24">location2</label>
                        <asp:DropDownList  ID="dropdownlist1" runat="server"></asp:DropDownList>
                        <label for="name" class="fs-24">quantity2</label>
                        <input type="text" name="french-hens" id="quantity2" value="0" runat="server" style="width: 30% !important;" />

                    </div>
                </div>
                 <div class="col-md-2" style="float: left">
                    <div class="numbers-row">
                        <label for="name" class="fs-24">location3</label>
                        <asp:DropDownList  ID="dropdownlist2" runat="server"></asp:DropDownList>
                        <label for="name" class="fs-24">quantity3</label>
                        <input type="text" name="french-hens" id="quantity3" value="0" runat="server" style="width: 30% !important;" />

                    </div>
                </div>

                <div class="col-md-2" style="float: left">
                    <button type="button" id="btnSubmitProduct" runat="server" class="btn btn-warning custom-button-width .navbar-right"  onserverclick="AddProductslocation" style="padding-bottom: 30px !important;">ADD</button>
                   <%-- <button type="button" id="Button1" runat="server" class="btn btn-danger custom-button-width .navbar-right" onserverclick="CancelProducts" style="padding-bottom: 30px !important;">Cancel</button>
                  --%>  
                </div>
                <div class="alert alert-success" id="succMessage" runat="server" visible="false">
                    <strong>Success!</strong>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content-wrapper" style="min-height: 200px">
        <div class="col-xs-12">
            <div class="row" style="width: 1500px; height: 200px; margin-left: 16px; float: left">
                <label class="fs-24"></label>
                <div class="clearfix"></div>
                <div class="col-md-2" style="float: left">
                    <div class="numbers-row" id="dynamic1" runat="server">
                    </div>
                </div>
                <div class="col-md-2" style="float: left">
                    <div class="numbers-row">
                        <button type="button" id="Button2" runat="server" class="btn btn-warning custom-button-width .navbar-right" onserverclick="AddProductsSize" style="padding-bottom: 30px !important;">ADD</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>--%>
