<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="AmbassadorView.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.AmbassadorView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="content-wrapper">
        
        <section id="stats" style="overflow-x:auto">
            <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
            <div>
                 <asp:Image ID="Image1" runat="server" class="img-thumbnail" AlternateText="Ambassador Picture" style="Width: 495px;height:433px;margin-bottom:auto ;float:right"/>  
                <h2 id="AmbName" style="margin-left: 410px"> Name</h2>
                
            </div>
            <div id="piechar" style="float:left;width: 410px; height: 200px;"></div>   
<div style=" width: 1000px; height: 448px; margin-left: 410px">
  
        <div id="piechart" style="float:left;width: 500px; height: 500px"></div>
 
           
    </div>
            <div style="float:left; width: 1000px; height: 500px">
               <div id="piechart2" style="float:left;width: 410px; height: 242px"></div>

     <div id="piechart3" style="float:left;width: 500px; height: 500px"></div>
</div>

     
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

 <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
   
  

       <script src='//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
         <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js'></script>

    <script type="text/javascript">
        // Load the Visualization API and the piechart package.
        google.charts.load('current', {'packages':['corechart']});
      
        // Set a callback to run when the Google Visualization API is loaded.
       google.charts.setOnLoadCallback(drawChart);
        
       
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

        function drawChart() {
            var aid = '<%=GetAid()%>'
            console.log(aid);
            PageMethods.TopAmbassadorsRevenue(aid, onSucess, onError);

            function onSucess(result) {

                //--------------------------------------------------------------
                var result1 = [];
                var newResult = [];
                var comm = [];
                var prod = []
                var profit_amb = [];
                console.log(result);
                    result1 = JSON.parse(result[0]);
                    console.log(result1);
                    newResult = JSON.parse(result[1]);
                    comm = JSON.parse(result[2]);
                    prod = JSON.parse(result[3]);
                    profit_amb = JSON.parse(result[4]);
                    console.log(comm);
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Key');
                    data.addColumn('number', 'Total Revenue');

                    // data.addColumn('number', 'Wholesale');

                    result1.forEach(function (row) {
                        data.addRow([
                          row.orderdate,
                          row.revenue,

                        ]);
                    });

                    
                  //  var commisonEarned = commision[0].comm
                    var commisonEarned = Math.round(comm[0].commision * 100) / 100;
                
                    var scid = [];
                    var salesChannelName = [];
                    var r = 0;
                    for (var x = 0; x < result1.length; x++) {
                        scid.push(result1[x].Name);
                        r = r + result1[x].revenue;
                        
                        // salesChannelName.push(result1[x].Name);
                    }

                  
                 

                 var  t_revenue = Math.round(r * 100) / 100;
                    var chart = new google.visualization.LineChart(document.getElementById('piechart'));
                    chart.draw(data, { hAxis: { title: 'Time', format: 'M/d/yy' }, vAxis: { title: 'Revenue' }, title: (result1[0].Name + "  " + " Total Revenue= $" + t_revenue + " Commission= $" + commisonEarned), width: 700, height: 400 });
                  
                //---------------------------------------------------

                    var data1 = new google.visualization.DataTable();
                    data1.addColumn('string', 'Key');
                    data1.addColumn('number', 'Total Expense');

                    prod.forEach(function (row) {
                        data1.addRow([
                         
                          row.pname,
                          row.AmountSpend,

                        ]);
                    });
                  
                   
                  
                    
                    var chart = new google.visualization.ColumnChart(document.getElementById('piechart2'));
                    chart.draw(data1, { title: "Expense Products", is3D: true, width: 400, height: 240 });

                //---------------------------------------------------------------------------------------


                    var data2 = new google.visualization.DataTable();
                    data2.addColumn('string', 'Key');
                    data2.addColumn('number', 'Total Expense');

                    newResult.forEach(function (row) {
                        data2.addRow([
                           row.OrderDate,
                          row.AmountSpend,
                        ]);
                    });

                    var r = 0;
                    for (var x = 0; x < newResult.length; x++) {
                      //  scid.push(result1[x].Name);
                        r = r + newResult[x].AmountSpend;

                        // salesChannelName.push(result1[x].Name);
                    }
                    var t_exp = Math.round(r * 100) / 100;
                    var chart = new google.visualization.LineChart(document.getElementById('piechart3'));
                   
                    chart.draw(data2, { hAxis: { title: 'Time', format: 'M/d/yy'}, vAxis: { title: 'Expense' }, title: (result1[0].Name + "  " + " Total Expense= $" + t_exp), width: 700, height: 400 });
                console.log(result1[0].orderdate);
                //--------------------------------------------------------------------------------------------------------------------------
                PageMethods.AmbassadorsProduct1( aid, onSucess, onError);
                function onSucess(result) {
                    //-----------------------------------using google charts--------------------------------------------------
                    console.log(result);
                    var result2 = [];

                    for (var x = 0; x < result.length ; x++) {
                        result2= JSON.parse(result[x]);
                        var data = new google.visualization.DataTable();



                        data.addColumn('string', 'Key');
                        data.addColumn('number', 'Value');


                        result2.forEach(function (row) {
                            data.addRow([
                              row.Key,
                             row.Value,

                            ]);
                        });

                      //  var d = document.createElement("div");
                      //  d.id = "piechar" + x;
                      //  //d.className = "chartFloat";
                      //  //d.style.display = "inline-block;";
                      ////  d.style.float = 'center';
                      //  document.getElementById("piechar").appendChild(d);
                        var chart = new google.visualization.ColumnChart(piechar);
                        chart.draw(data, { title: "Revenue Products", is3D: true, width: 400, height: 240 });


                        var t_profit = profit_amb - t_exp;
                        document.getElementById('AmbName').innerHTML = (result1[0].Name+" brings $"+Math.round(t_profit * 100) / 100 +" profit");


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

   
</script>
            </section>
         </div> 
</asp:Content>
