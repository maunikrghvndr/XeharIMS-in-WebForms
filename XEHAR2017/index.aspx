<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Quicky.index" MasterPageFile="~/Quicky.Master"%>
<asp:Content ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ContentPlaceHolderID="Title" runat="server">Home</asp:Content>
<asp:Content ContentPlaceHolderID="Body" runat="server">
    <%--<h1 runat="server" id="CLT"></h1>--%>
    <input type="hidden" name="json" id="json" runat="server" />
    <%--<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>--%>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
    
    // Load the Visualization API and the piechart package.
    google.charts.load('current', {'packages':['corechart']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);


    function drawChart() {
        //-----------------------to generate random color code---------------------------------------------
        function getRandomColor() {
            var letters = '0123456789ABCDEF';
            var color = '#';
            for (var i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }
//--------------------------------------------------------------------------------------------------------------


        PageMethods.Customers(onSucess, onError);

        function onSucess(result) {
            //-------------------------------this is for google charts--------------------------------
            var result1 = [];
           
            result1 = JSON.parse(result);
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Key');
            data.addColumn('number', 'ToTal Sold');
          data.addColumn({ type: 'string', role: 'style' });
            // data.addColumn('number', 'Wholesale');
           
          result1.forEach(function (row) {
              var color = getRandomColor();
              console.log(color);
                data.addRow([
                  row.ProductName,
                  row.s,
                row.color
                ]);
            });
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
            PageMethods.TopSalesChannels(pid, onSucess, onError);
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
                        d.id = "piechart" + x;
                        //d.className = "chartFloat";
                       //d.style.display = "inline-block;";
                      d.style.float = 'left';
                        document.getElementById("piechar").appendChild(d);
                        var chart = new google.visualization.PieChart(document.getElementById(d.id));
                        chart.draw(data, { title:productNames[x], is3D: true,  width: 400, height: 240 });
                    

                }






               // //------------------------------------------------------------------------------------------------------------------
               // var result1 = [];
              
               //// result1 = JSON.parse(result);
               // console.log(result);
               // //for (var i = 0; i < result1.length; i++) {
               // //    dataPoints.push({
               // //        label: result1[i].ProductName, y: result1[i].s
               // //    })
               // //}

               // //var newArr = result1.filter(function (item) {
               // //    return item.PID === 100;
               // //});
               // //console.log(newArr);

               // var dataPoints2 = [];
               // for (var x = 0; x < result.length ; x++) {
               //     result1 = JSON.parse(result[x]);
               //     for (var i = 0; i < result1.length; i++) {
               //         dataPoints2.push({
               //             label: result1[i].Key, y: result1[i].Value
               //         })
               //     }
               //     var d = document.createElement("div");
               //     d.id = "piechart" + x;
               //     d.className = "chartFloat";
               //     //d.style.display = "inline-block;";
               //     d.style.float = 'left';
               //     document.getElementById("piechar").appendChild(d);
                    
               //     var chart2 = new CanvasJS.Chart(d.id, {
               //         title: {
               //             text: "pie charts"
               //         },
               //         data: [
               //         {
               //             // Change type to "doughnut", "line", "splineArea", etc.
               //             type: "pie",
               //             dataPoints: dataPoints2,

               //         }
               //         ]

               //     });
               //     chart2.render();
               //     dataPoints2 = [];
               // }
                
                

                
            }
            function onError(result) {
                alert('Cannot process your request at the moment, please try later.');
            }
           
   }

        function onError(result) {
            alert('Cannot process your request at the moment, please try later.');
        }
        
        }
        </script>
</asp:Content>
