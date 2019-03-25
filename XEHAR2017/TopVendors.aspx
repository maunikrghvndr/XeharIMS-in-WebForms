<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopVendors.aspx.cs" Inherits="XEHAR2017.TopVendors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
    <div>
    <div id="SalesChannelChart" style="width: 1000px; height: 500px;"></div>
        <div id="topvendarProductChart" style="width: 1000px; height: 200px;"></div>
    </div>
    </form>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
    
    // Load the Visualization API and the piechart package.
    google.charts.load('current', {'packages':['corechart']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);
    
        
    function drawChart() {
        
        PageMethods.TopVendor(onSucess, onError);
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
                  row.sm,
                  //row.Wholesale
                ]);
            });

         
            var chart = new google.visualization.ColumnChart(document.getElementById('SalesChannelChart'));
            chart.draw(data, { title: "Top Vendors", width: 500, height: 400 });

            var vid = [];
            var vendorName = [];

            for (var x = 0; x < result1.length; x++) {
                vid.push(result1[x].VID);
                vendorName.push(result1[x].Name);
            }
           


//---------------------------top products for top vendors-----------------------------------------------------------------------------
            PageMethods.TopVendorProduct(vid, onSucess, onError);
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
                    d.id = "topvendarProductChart" + x;
                    //d.className = "chartFloat";
                    //d.style.display = "inline-block;";
                    d.style.float = 'left';
                    document.getElementById("topvendarProductChart").appendChild(d);
                    var chart = new google.visualization.PieChart(document.getElementById(d.id));
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
        

        </script>
    
</body>
</html>
