<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorsWithProfit.aspx.cs" Inherits="XEHAR2017.VendorsWithProfit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    

</head>
<body>
    <form id="form1" runat="server">
    <div class="content-wrapper">
        <div class="row">
        <!-- Left col -->
        <section class="col-lg-7 connectedSortable">
         <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-right">
               
                  
                <li >Show Top Vendors : <select id="ddlRows">
    <option value='7' selected="selected" >week</option>
    <option value="31">month</option>
    <option value="365">year</option>

                     </select>
</li>
              
            </ul>
             
            
          </div>
            </section>
            </div>
        </div>
       
        <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
    <div>
    <div id="SalesChannelChart" style="width: 900px; height: 500px;"></div>
         <div id="topsalesproduct" style="width: 1000px; height: 200px;"></div>
    </div>
    </form>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

 <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
   
  

       <script src='//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
         <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js'></script>

    <script type="text/javascript">
        // Load the Visualization API and the piechart package.
        google.charts.load('current', {'packages':['corechart']});
      
        // Set a callback to run when the Google Visualization API is loaded.
      //  google.charts.setOnLoadCallback(drawChart);
        
        function getLastWeek(value) {
            var today = new Date();
            var lastWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - parseInt( value));
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

            PageMethods.TopVendors(date, onSucess, onError);

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
                      row.Name,
                      row.profit,

                    ]);
                });
                var chart = new google.visualization.ColumnChart(document.getElementById('SalesChannelChart'));
                chart.draw(data, { title: "Top Vendors With Profit", width: 700, height: 400 });

                var vid = [];
                var VendorName = [];

                for (var x = 0; x < result1.length; x++) {
                    vid.push(result1[x].vid);
                    VendorName.push(result1[x].Name);
                }
                //console.log(scid, salesChannelName);
                //------------------------------------------------------Display top Products for top sales channels--------------------------------------------------------------------
                PageMethods.TopVendorsProduct(date,vid, onSucess, onError);
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
                        var chart = new google.visualization.PieChart(document.getElementById(d.id));
                        chart.draw(data, { title: VendorName[x], is3D: true, width: 400, height: 240 });




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

        $(document).ready(function () {

            var defaultval = $('#ddlRows').val();
            var defaultdisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(defaultval));
            drawChart(defaultdisplay);
            $('#ddlRows').change(function () {

                var val = $('#ddlRows').val();
                if (val == 7) {
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    //alert(lastWeekDisplay);
                    drawChart(lastWeekDisplay);
                }
                if (val == 31) {
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    drawChart(lastWeekDisplay);
                }
                if (val == 365) {
                    var lastWeekDisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(val));
                    drawChart(lastWeekDisplay);
                }
            });
            
        });
</script>
       

        </body>
</html>

