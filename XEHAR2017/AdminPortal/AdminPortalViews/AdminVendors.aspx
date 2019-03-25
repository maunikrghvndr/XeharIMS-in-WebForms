<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="AdminVendors.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.AdminVendors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
body {font-family: Arial;}

div.tabs {
    width:100%;
    display:inline-block;
}
 
    /*----- Tab Links -----*/
    /* Clearfix */
    .tab-links:after {
        display:block;
        clear:both;
        content:'';
    }
 
    .tab-links li {
        margin:0px 5px;
        float:left;
        list-style:none;
    }
 
        .tab-links a {
            padding:9px 15px;
            display:inline-block;
            border-radius:3px 3px 0px 0px;
            background:#7FB5DA;
            font-size:16px;
            font-weight:600;
            color:#4c4c4c;
            transition:all linear 0.15s;
        }
 
        .tab-links a:hover {
            background:#a7cce5;
            text-decoration:none;
        }
 
    li.active1 a, li.active1 a:hover {
        background:#fff;
        color:#4c4c4c;
    }
 
    /*----- Content of Tabs -----*/
    .tab-content {
        padding:15px;
        border-radius:3px;
        box-shadow:-1px 1px 1px rgba(0,0,0,0.15);
        background:#fff;
    }
 
        .tab {
            display:none;
        }
 
        .tab.active1 {
            display:block;
        }
</style>


    <div class="content-wrapper">
     <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
                    <div class="tabs">
    <ul class="tab-links">
        <li class="active1"><a href="#tab1">By Total Sold</a></li>
        <li><a href="#tab2">By Total Profit</a></li>
        
    </ul>
 
    <div class="tab-content">
        <div id="tab1" class="tab active1" > 
          
             <section id="vendorStats" style="overflow-x:auto">
                                      <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-left">
               
                               
                <li >Show Top Vendors : <select id="ddlRows1">
                    <option value='1'  >Today</option>
    <option value='7' selected="selected" >week</option>
    <option value="31">month</option>
    <option value="365">year</option>

                     </select>
</li>
              
            </ul>
             
            
          </div>
  
    <div>
    <div id="SalesChannelChart" style="width: 1000px; height: 500px; margin-left: 410px"></div>
        <div id="topvendorProductChart" style="width: 2000px; height: 200px;"></div>
    </div>
                 </section>
            </div>
         <div id="tab2" class="tab" >
                     <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-left">
               
                               
                <li >Show Top Vendors : <select id="ddlRows">
                    <option value='1'  >Today</option>
    <option value='7' selected="selected" >week</option>
    <option value="31">month</option>
    <option value="365">year</option>

                     </select>
</li>
              
            </ul>
             
            
          </div>
        </div>
      </div> 
              </div>
           <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
              <script src='//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
         <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js'></script>
    <script type="text/javascript">
    
    // Load the Visualization API and the piechart package.
    //google.charts.load('current', {'packages':['corechart']});
      
    //// Set a callback to run when the Google Visualization API is loaded.
        //google.charts.setOnLoadCallback(draw2);

        google.charts.load('current', { 'packages': ['corechart'] });

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(draw2);
    function getLastWeek(value) {
        var today = new Date();
        var lastWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - parseInt(value));
        return lastWeek;
    }
    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek());
        
    function drawChart(date) {
        
        PageMethods.TopVendor(date,onSucess, onError);
        function onSucess(result) {
            var result1 = [];
          //  var datos = result.replace(/'/g, '"');
            result1 = JSON.parse(result);
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Key');
            data.addColumn('number', 'Total Sold');
           // data.addColumn('number', 'Wholesale');

            result1.forEach(function (row) {
                data.addRow([
                  row.Name,
                  row.TotalSold,
                  //row.Wholesale
                ]);
            });

            console.log(result1);
            var chart = new google.visualization.ColumnChart(document.getElementById('SalesChannelChart'));
            chart.draw(data, { title: "Top Vendors", width: 500, height: 400 });

            var vid = [];
            var vendorName = [];

            for (var x = 0; x < result1.length; x++) {
                vid.push(result1[x].vid);
                vendorName.push(result1[x].Name);
            }
            console.log(vid);


//---------------------------top products for top vendors-----------------------------------------------------------------------------
            PageMethods.TopVendorProduct(date,vid, onSucess, onError);
            function onSucess(result) {
                //-----------------------------------using google charts--------------------------------------------------
                console.log(result);
                var result1 = [];

                for (var x = 0; x < result.length ; x++) {
                    result1 = JSON.parse(result[x]);
                    var data = new google.visualization.DataTable();



                    data.addColumn('string', 'Key');
                    data.addColumn('number', 'Value');


                    result1.forEach(function (row) {
                        data.addRow([
                          row.Key,
                         row.Value,

                        ]);
                    });

                    var d = document.createElement("div");
                    d.id = "topvendorProductChart" + x;
                    //d.className = "chartFloat";
                    //d.style.display = "inline-block;";
                    d.style.float = 'left';
                    document.getElementById("topvendorProductChart").appendChild(d);
                    var chart = new google.visualization.ColumnChart(document.getElementById(d.id));
                    chart.draw(data, { title: vendorName[x], is3D: true, width: 400, height: 240 });


                }




            }
            function onError(result) {
                alert('Cannot process your request at the moment, please try later.');
            }
        }
        function onError(result) {
            alert('Cannot process your request at the moment, please try later.');
        }
    }
        
    function draw2() {

        var defaultval = $('#ddlRows1').val();
        var defaultdisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(defaultval));
        drawChart(defaultdisplay);
        $('#ddlRows1').change(function () {

            var val = $('#ddlRows1').val();
            if (val == 1) {
                jQuery('#topvendorProductChart div').html('');
                var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                //alert(lastWeekDisplay);
                drawChart(lastWeekDisplay);
            }

            if (val == 7) {
                jQuery('#topvendorProductChart div').html('');
                var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                //alert(lastWeekDisplay);
                drawChart(lastWeekDisplay);
            }
            if (val == 31) {
                jQuery('#topvendorProductChart div').html('');
                var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                drawChart(lastWeekDisplay);
            }
            if (val == 365) {
                jQuery('#topvendorProductChart div').html('');
                var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                drawChart(lastWeekDisplay);
            }
        });

    }

        //PageMethods.TopVendor(onSucess, onError);

        //function onSucess(result) {

        //    var result1 = [];
            
        //    result1 = JSON.parse(result);
        //    console.log(result1);
          
        //    var dataPoints1 = [];

        //    for (var i = 0; i < result1.length; i++) {
        //        dataPoints1.push({
        //            label: result1[i].Key, y: result1[i].Value
        //        })
        //    }
        //    console.log(dataPoints1);
        //    var chart = new CanvasJS.Chart("SalesChannelChart", {
        //        title: {
        //            text: "Top Vendors"
        //        },
        //        data: [
        //        {
        //            // Change type to "doughnut", "line", "splineArea", etc.
        //            type: "column",
        //            dataPoints: dataPoints1,

        //        }
        //        ]

        //    });
        //    chart.render();
        //}
           
        //function onError(result) {
        //    alert('Cannot process your request at the moment, please try later.');
        //}

    //-------------------------------------------

    jQuery(document).ready(function () {
        jQuery('.tabs .tab-links a').on('click', function (e) {
            var currentAttrValue = jQuery(this).attr('href');

            // Show/Hide Tabs
            jQuery('.tabs ' + currentAttrValue).show().siblings().hide();

            // Change/remove current tab to active
            jQuery(this).parent('li').addClass('active1').siblings().removeClass('active1');
            
            e.preventDefault();
        });
    });
        

        </script>
        
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
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Vendor Identification">VID</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name">Name</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="VIN">VIN</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Street">Street</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="City">Cityr</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="ZIP">ZIP</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Country">Country</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Email Address">Email</th>
                                
                             </tr>
            </HeaderTemplate>
            <ItemTemplate>
                            <tr role="row" class="odd">
                            <td width="100">
                                <a href="VendorViewAdmin.aspx?VID=<%# DataBinder.Eval(Container, "DataItem.VID")%>"><%# DataBinder.Eval(Container, "DataItem.VID")%></a>  <%-- Here we need ti add the seperate vendor page stats                        --%>   
                            </td>
                            <td>
                            <%# DataBinder.Eval(Container, "DataItem.Name")%>
                            </td>
                            <td width="150">
                            <%# DataBinder.Eval(Container, "DataItem.VIN")%>
                            </td>
                            <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Street")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.City")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.ZIP")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Country")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Email")%>
                            </td>
                             
                            </td>
                            </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                            </table>
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
            <div>
            </div>
                </div>
        </section>


           </div>
</asp:Content>
