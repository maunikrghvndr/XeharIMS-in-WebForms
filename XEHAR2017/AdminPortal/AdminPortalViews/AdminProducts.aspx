<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.AdminProducts" %>
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
<div class="tabs">
    <ul class="tab-links">
        <li class="active1"><a href="#tab1">By Total Sold</a></li>
        <li><a href="#tab2">By Total Profit</a></li>
        
    </ul>
 
    <div class="tab-content">
        <div id="tab1" class="tab active1">
            <section id="stats" style="overflow-x:auto">
            <asp:ScriptManager ID="ScriptManager1" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
            <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-left">
               
                  
                <li >Show Top Products : <select id="ddlRows1">
                     <option value='1'  >Today</option>
                     <option value='7' selected="selected" >week</option>
                     <option value='31'>month</option>
                     <option value='365'>year</option>

                                                </select>
                 </li>
              
            </ul>
             
            
          </div>
        <div id="piechart" style="width: 900px; height: 500px; margin-left: 410px"></div>
      <div id="piechar" style="width: 2000px; height: 200px;"></div>
 
        </section>

    </div>
 
        <div id="tab2" class="tab">
            <p>Tab #2 content goes here!</p>
            <p>with profit will be shown here.</p>
        </div>
 
       
    </div>
</div>
      
  

       <%-- <section id="stats" style="overflow-x:auto">
            <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
            <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-left">
               
                  
                <li >Show Top Products : <select id="ddlRows1">
                     <option value='1'  >Today</option>
                     <option value='7' selected="selected" >week</option>
                     <option value='31'>month</option>
                     <option value='365'>year</option>

                                                </select>
                 </li>
              
            </ul>
             
            
          </div>
        <div id="piechart" style="width: 900px; height: 500px; margin-left: 410px"></div>
      <div id="piechar" style="width: 2000px; height: 200px;"></div>
 
        </section>--%>
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
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="PID">PID</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="SKU">SKU</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="product name">Product Name</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Description">Description</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Model Number">Model Number</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Department">Department</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Available Stock">Quantity</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Brand">Brand</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Manufactuer">Manufactuer</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Vendor Cost">Vendor Cost</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Gender">Gender</th>
                             </tr>
            </HeaderTemplate>
            <ItemTemplate>
                            <tr role="row" class="odd">
                            <td width="100">
                                <a href="AdminPortalProduct.aspx?pid=<%# DataBinder.Eval(Container, "DataItem.PID")%>"><%# DataBinder.Eval(Container, "DataItem.PID")%></a>
               

                            </td>
                            <td>
                            <%# DataBinder.Eval(Container, "DataItem.SKU")%>
                            </td>
                            <td width="150">
                            <%# DataBinder.Eval(Container, "DataItem.ProductName")%>
                            </td>
                            <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Description")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.ModelNumber")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Department")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Quantity")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Brand")%>
                            </td>
                                 <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Manufactuer")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.VendorCost")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Gender")%>
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
            <div>
            </div>
        </section>
   
           </div>
    <%--<script type="text/javascript">
        var f = $(".wrapper");
        f.css("overflow-x", "auto");
    </script>--%>
             <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
              <script src='//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
         <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js'></script>
    <script type="text/javascript">



        // Load the Visualization API and the piechart package.
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
            //-----------------------to generate random color code---------------------------------------------
            //function getRandomColor() {
            //    var letters = '0123456789ABCDEF';
            //    var color = '#';
            //    for (var i = 0; i < 6; i++) {
            //        color += letters[Math.floor(Math.random() * 16)];
            //    }
            //    return color;
            //}
            //--------------------------------------------------------------------------------------------------------------


            PageMethods.Customers(date,onSucess, onError);

            function onSucess(result) {
                //-------------------------------this is for google charts--------------------------------
                var result1 = [];
               
                result1 = JSON.parse(result);
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Key');
                data.addColumn('number', 'Total Sold');
                //data.addColumn({ type: 'string', role: 'style' });
                // data.addColumn('number', 'Wholesale');

                result1.forEach(function (row) {
                   // var color = getRandomColor();
                    //console.log(color);
                    data.addRow([
                      row.ProductName,
                      row.TotalSold,
                    //row.color
                    ]);
                });
                console.log(result1);
                if (result1.length <1) {
                    alert("Nothing Sold today");
                }
                var chart = new google.visualization.ColumnChart(document.getElementById('piechart'));
                chart.draw(data, { title: "Top Products", width: 700, height: 400 });

                var pid = [];
                var productNames = [];

                for (var x = 0; x < result1.length; x++) {
                    pid.push(result1[x].PID);
                    productNames.push(result1[x].ProductName);
                }
                console.log(productNames);




                //////----------------------------------------------------------------------------------------------------
                // var result1 = [];
                // var pid = [];
                // result1 = JSON.parse(result);

                // for (var x = 0; x < result1.length; x++) {
                //     pid.push(result1[x].PID);

                // }
                // //var matchingResults = JSON['result1'].filter(function (x) { return x.PID; });
                // //console.log(matchingResults);
                // //$.each(result1[0], function (k, v) {
                // //    pid.push(v.PID);
                // //});
                // console.log(pid);



                // var dataPoints1 = [];

                //for (var i = 0; i < result1.length; i++) {
                //    dataPoints1.push({
                //        label:result1[i].ProductName ,y:result1[i].s
                //    })
                //}
                //console.log(dataPoints1);
                // var chart = new CanvasJS.Chart("piechart", {
                //     title: {
                //         text: "Top 3 Selling Products"
                //     },
                //     data: [
                //     {
                //         // Change type to "doughnut", "line", "splineArea", etc.
                //         type: "column",
                //         dataPoints: dataPoints1,

                //     }
                //     ]

                // });

                // chart.render();
                // ----------------------------------------------this code is for displayin chart for top sales channels for top 3 products 
                PageMethods.TopSalesChannels(date,pid, onSucess, onError);
                function onSucess(result) {
                    //-----------------------------------using google charts--------------------------------------------------
                   
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
                        d.id = "piechart" + x;
                        //d.className = "chartFloat";
                        //d.style.display = "inline-block;";
                        d.style.float = 'left';
                        document.getElementById("piechar").appendChild(d);
                        var chart = new google.visualization.ColumnChart(document.getElementById(d.id));
                        chart.draw(data, { title: productNames[x], is3D: true, width: 400, height: 240 });


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
                    jQuery('#piechar div').html('');
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    //alert(lastWeekDisplay);
                    drawChart(lastWeekDisplay);
                }

                if (val == 7) {
                    jQuery('#piechar div').html('');
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    //alert(lastWeekDisplay);
                    drawChart(lastWeekDisplay);
                }
                if (val == 31) {
                    jQuery('#piechar div').html('');
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    drawChart(lastWeekDisplay);
                }
                if (val == 365) {
                    jQuery('#piechar div').html('');
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    drawChart(lastWeekDisplay);
                }
            });

        }


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
</asp:Content>

