<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.AddProduct" EnableEventValidation="false" EnableViewState="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function Validation() {
            var VendorName, StyleNumber, Quantity;
            VendorName = document.getElementById("VendorText").value;
            StyleNumber = document.getElementById("StyleNumberText").value;
            //Quantity = document.getElementById("QuantityText").value;

            if (VendorName == "" )
            { //alert( "Enter Vendor's  Name");
                document.getElementById('errors').innerHTML = "*Please enter a Vendor Name*";
              return false;
            }
            if (StyleNumber == "") {
                document.getElementById('errors').innerHTML = "*Please enter a Style Number*";
                //alert("Enter the StyleNumber");
                return false;
            }

          
        }

    </script>
    
   <div id ="errors">
      </div>
    <div class="content-wrapper" style="min-height: 200px">
        <div class="col-xs-12">
            <div class="row">
                <label class="fs-24"></label>
                <div class="clearfix"></div>
                <div class="col-md-2">
                    <label for="name" class="fs-24">Style number</label>
                    <input type="text" name="french-hens" id="StyleNumberText" value=""  runat="server" style="width: 50% !important;" required="required"/>

                </div>
                <div class="col-md-2">
                    <label for="name" class="fs-24">Color Code</label>
                    <asp:ListBox ID="DropDownList2" runat="server" SelectionMode="multiple"  >
                        <asp:ListItem Value="000" >Select</asp:ListItem>
                    </asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        InitialValue=""
                        ControlToValidate="DropDownList2"
                        ErrorMessage="Please select atleast one item"
                        CssClass="Error"
                        Text="*Please select atleast one item"
                        
                      > 
                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-md-7">
                    <label for="name" class="fs-24">Vendor Name</label>
                    <input type="text" name="french-hens" id="VendorText" value="" runat="server" required="required"/>
                    <asp:Button id="btnSubmitProduct1" runat="server" class="btn btn-warning custom-button-width .navbar-right" text="ADD" onclick="AddProducts" style="padding-bottom: 30px !important;" ></asp:Button>
                 <%--   <button type="button" id="btnSubmitProduct" runat="server" class="btn btn-warning custom-button-width .navbar-right" onclientclick="Validation()" onserverclick="AddProducts" style="padding-bottom: 30px !important;">ADD</button>--%>
                    <button type="button" id="Button1" runat="server" class="btn btn-danger custom-button-width .navbar-right" onserverclick="CancelProducts" style="padding-bottom: 30px !important;">Cancel</button>
                </div>
                <div class="clearfix"></div>
                <div>
                    <div class="col-xs-12" id="dynamic1" runat="server"></div>
                    <button type="button" id="Button2" runat="server" class="btn btn-warning custom-button-width .navbar-right" onserverclick="AddProductsSize" style="margin-left:15px; padding-bottom: 30px !important;">Save</button>
                </div>
                <div class="alert alert-success" id="succMessage" runat="server" visible="false">
                    <strong>Success!</strong>
                </div>
            </div>
        </div>
    </div>
       
</asp:Content>
