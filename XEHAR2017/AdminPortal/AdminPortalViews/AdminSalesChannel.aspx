<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="AdminSalesChannel.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.AdminSalesChannel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<body>
     <style>
         body {
             font-family: Arial;
         }

         div.tabs {
             width: 100%;
             display: inline-block;
         }

         /*----- Tab Links -----*/
         /* Clearfix */
         .tab-links:after {
             display: block;
             clear: both;
             content: '';
         }

         .tab-links li {
             margin: 0px 5px;
             float: left;
             list-style: none;
         }

         .tab-links a {
             padding: 9px 15px;
             display: inline-block;
             border-radius: 3px 3px 0px 0px;
             background: #7FB5DA;
             font-size: 16px;
             font-weight: 600;
             color: #4c4c4c;
             transition: all linear 0.15s;
         }

             .tab-links a:hover {
                 background: #a7cce5;
                 text-decoration: none;
             }

         li.active1 a, li.active1 a:hover {
             background: #fff;
             color: #4c4c4c;
         }

         /*----- Content of Tabs -----*/
         .tab-content {
             padding: 15px;
             border-radius: 3px;
             box-shadow: -1px 1px 1px rgba(0,0,0,0.15);
             background: #fff;
         }

         .tab {
             display: none;
         }

             .tab.active1 {
                 display: block;
             }
     </style>


    
        <div class="content-wrapper">

            <div class="tabs">
    <ul class="tab-links">
        <li class="active1"><a href="#tab1">By Total Profit</a></li>
        <li><a href="#tab2">By Total Sold</a></li>
        
    </ul>
 
    <div class="tab-content">
        <div id="tab1" class="tab active1">
            <section id="stats" style="overflow-x:auto">
            <asp:ScriptManager ID="ScriptManager1" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
            <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-left">   
                 <li >Profit From Sales Channels : <select id="ddlRows">
                                                        <option value='1'  >Today</option>
                                                        <option value='7' selected="selected" >week</option>
                                                        <option value='31'>month</option>
                                                        <option value='365'>year</option>
                                                </select>
                 </li>     
            </ul>     
          </div>
    <div>
        <div id="SalesChannelChart" style="width: 900px; height: 500px;margin-left: 410px"></div>
        <div id="topsalesproduct" style="width: 3000px; height: 200px"></div>
    </div>
        </section>
    </div>
 
        <div id="tab2" class="tab">
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
        </div>     
    </div>
</div>

       <%-- <section id="stats" style="overflow-x:auto">
            <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>


            <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-left">
               
                  
                <li >Profit From Sales Channels : <select id="ddlRows">
                     <option value='1'  >Today</option>
                     <option value='7' selected="selected" >week</option>
                     <option value='31'>month</option>
                     <option value='365'>year</option>

                                                </select>
                 </li>
              
            </ul>
             
            
          </div>
    <div>
    <div id="SalesChannelChart" style="width: 900px; height: 500px;margin-left: 410px"></div>
         <div id="topsalesproduct" style="width: 3000px; height: 200px"></div>
    </div>--%>
    
     <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

 <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
   
  

       <script src='//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
         <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js'></script>

    <script type="text/javascript">
        // Load the Visualization API and the piechart package.
        google.charts.load('current', { 'packages': ['corechart'] });

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(draw1);

        function getLastWeek(value) {
            var today = new Date();
            var lastWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - parseInt(value));
            return lastWeek;
        }
        var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek());

        //function DisplayChart(ddlValue){
        //    $.ajax({
        //        type: "POST",
        //        url: "home.aspx/MyMethod",
        //        data: "{Param1: '" + ddlValue + "'}",
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        async: "true",
        //        cache: "false",
        //        success: function (data) {

        //            var arr = [];
        //            var aData = JSON.parse(data.d);

        //            $.each(aData, function (inx, val) {
        //                var obj = {};
        //                obj.color = val.color;
        //                obj.value = val.value;
        //                obj.label = val.label;
        //                arr.push(obj);
        //            });

        //            //pie chart

        //            var pieChartCanvas = $('#pieChart').get(0).getContext('2d');
        //            var myPieChart = new Chart(pieChartCanvas).Pie(arr);


        //        },
        //        Error: function (x, e) {
        //            // On Error
        //        }
        //    });
        //}

        function drawChart(date) {

            PageMethods.SalesChannels(date, onSucess, onError);

            function onSucess(result) {

                //-------------------------------Display Top Sales Channels--------------------------------
                var result1 = [];

                result1 = JSON.parse(result);
                console.log(result1);
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Key');
                data.addColumn('number', 'Total Profit');

                // data.addColumn('number', 'Wholesale');

                result1.forEach(function (row) {
                    data.addRow([
                      row.name,
                      row.TotalProfit,

                    ]);
                });
                //if (result1.length < 1) {
                //    alert("Nothing Sold today");
                //}
                var chart = new google.visualization.ColumnChart(document.getElementById('SalesChannelChart'));
                chart.draw(data, { title: "Top Sales Channels", width: 700, height: 400 });

                var scid = [];
                var salesChannelName = [];

                for (var x = 0; x < result1.length; x++) {
                    scid.push(result1[x].scid);
                    salesChannelName.push(result1[x].name);
                }
                console.log(scid, salesChannelName);
                //------------------------------------------------------Display top Products for top sales channels--------------------------------------------------------------------
                PageMethods.TopSalesChannelProduct(date, scid, onSucess, onError);
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
                        d.id = "topsalesproduct" + x;
                        //d.className = "chartFloat";
                        //d.style.display = "inline-block;";
                        d.style.float = 'left';
                        document.getElementById("topsalesproduct").appendChild(d);
                        var chart = new google.visualization.ColumnChart(document.getElementById(d.id));
                        chart.draw(data, { title: salesChannelName[x], is3D: true, width: 400, height: 240 });




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

        //$(document).ready(function () {

        //    var defaultval = $('#ddlRows').val();
        //    var defaultdisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(defaultval));
        //    drawChart(defaultdisplay);
        //    $('#ddlRows').change(function () {

        //        var val = $('#ddlRows').val();
        //        if (val == 1) {
        //            var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
        //            //alert(lastWeekDisplay);
        //            drawChart(lastWeekDisplay);
        //        }

        //        if (val == 7) {
        //            var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
        //            //alert(lastWeekDisplay);
        //            drawChart(lastWeekDisplay);
        //        }
        //        if (val == 31) {
        //            var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
        //            drawChart(lastWeekDisplay);
        //        }
        //        if (val == 365) {
        //            var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
        //            drawChart(lastWeekDisplay);
        //        }
        //    });

        //});
        function draw1() {

            var defaultval = $('#ddlRows').val();
            var defaultdisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(defaultval));
            drawChart(defaultdisplay);
            $('#ddlRows').change(function () {

                var val = $('#ddlRows').val();
                if (val == 1) {
                    jQuery('#topsalesproduct div').html('');
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    //alert(lastWeekDisplay);
                    drawChart(lastWeekDisplay);
                }

                if (val == 7) {
                    jQuery('#topsalesproduct div').html('');
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    //alert(lastWeekDisplay);
                    drawChart(lastWeekDisplay);
                }
                if (val == 31) {
                    jQuery('#topsalesproduct div').html('');
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    drawChart(lastWeekDisplay);
                }
                if (val == 365) {
                    jQuery('#topsalesproduct div').html('');
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
   
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">All Ambassadors</h3>
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
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="BID">BID</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name">Name</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Site">Site</th>
                               </tr>
            </HeaderTemplate>
            <ItemTemplate>
                            <tr role="row" class="odd">
                                <td width="100">
                                <a href="BodyMentorView.aspx?SCID=<%# DataBinder.Eval(Container, "DataItem.SCID")%>"><%# DataBinder.Eval(Container, "DataItem.SCID")%></a>
               

                            </td>
                           
                            <td>
                            <%# DataBinder.Eval(Container, "DataItem.Name")%>
                            </td>
                            <td width="150">

                                <a href="<%# DataBinder.Eval(Container, "DataItem.StoreURL")%>"><%# DataBinder.Eval(Container, "DataItem.StoreURL")%></a>
                     <%--       <%# DataBinder.Eval(Container, "DataItem.Site")%>--%>
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





</body>

</html>



</asp:Content>
