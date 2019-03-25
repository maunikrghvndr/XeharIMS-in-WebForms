<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="VendorViewAdmin.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.VendorViewAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


         <div class="content-wrapper">
        
        <section id="stats" style="overflow-x:auto">
            <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
            <div>
                <%-- <asp:Image ID="Image1" runat="server" class="img-thumbnail" AlternateText="BodyMentor Picture" style="Width: 495px;height:433px;margin-bottom:auto ;float:right"/>  
               --%> <h2 id="AmbName" style="margin-left: 410px"> Name</h2>
                
            </div>
            <div id="piechar" style="float:left;width: 410px; height: 200px;"></div>   
<div style=" width: 1000px; height: 448px; margin-left: 410px">
  
        <div id="piechart" style="float:left;width: 500px; height: 500px"></div>
 
           
    </div>
<%--            <div style="float:left; width: 1000px; height: 500px">
               <div id="piechart2" style="float:left;width: 410px; height: 242px"></div>

     <div id="piechart3" style="float:left;width: 500px; height: 500px"></div>
</div>--%>

     
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
          var scid = '<%=GetVID()%>'
            console.log(scid);
            PageMethods.TopAmbassadorsRevenue(scid, onSucess, onError);

            function onSucess(result) {

                //--------------------------------------------------------------
                var result1 = [];
                var newResult = [];
                var comm = [];
                var prod=[]
                console.log(result);
                    result1 = JSON.parse(result[0]);
                    console.log(result1);
                    newResult = JSON.parse(result[1]);
                    comm = JSON.parse(result[2]);
                    prod = JSON.parse(result[3]);
                    console.log(comm);
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Key');
                    data.addColumn('number', 'Total Revenue');

                    // data.addColumn('number', 'Wholesale');

                    result1.forEach(function (row) {
                        data.addRow([
                          row.pdate,
                          row.revenue,

                        ]);
                    });

                    
                  //  var commisonEarned = commision[0].comm
                    var commisonEarned = Math.round(comm[0].commission * 100) / 100;
                
                    var scid = [];
                    var salesChannelName = [];
                    var r = 0;
                    for (var x = 0; x < result1.length; x++) {
                      //  scid.push(result1[x].name);
                        r = r + result1[x].revenue;
                        
                        // salesChannelName.push(result1[x].Name);
                    }

                  
                 

                 var  t_revenue = Math.round(r * 100) / 100;
                    var chart = new google.visualization.LineChart(document.getElementById('piechart'));
                    chart.draw(data, { hAxis: { title: 'Time', format: 'M/d/yy' }, vAxis: { title: 'Revenue' }, title: (result1[0].name + "  " + " Total Revenue= $" + t_revenue + " Commission= $" + commisonEarned), width: 700, height: 400 });

                    document.getElementById('AmbName').innerHTML = (result1[0].name + " brings $" + Math.round(newResult[0].TotalProfit * 100) / 100 + " profit");
                //---------------------------------------------------

                    var data1 = new google.visualization.DataTable();
                    data1.addColumn('string', 'Key');
                    data1.addColumn('number', 'Total Revenue');

                    prod.forEach(function (row) {
                        data1.addRow([

                          row.ordname,
                          row.revenue,

                        ]);
                    });




                    var chart = new google.visualization.PieChart(document.getElementById('piechar'));
                    chart.draw(data1, { title: "Revenue Products", is3D: true, width: 400, height: 240 });

                //---------------------------------------------------------------------------------------


                  
                //--------------------------------------------------------------------------------------------------------------------------
                //PageMethods.AmbassadorsProduct1( scid, onSucess, onError);
                //function onSucess(result) {
                //    //-----------------------------------using google charts--------------------------------------------------
                //    console.log(result);
                //    var result2 = [];

                //    for (var x = 0; x < result.length ; x++) {
                //        result2= JSON.parse(result[x]);
                //        var data = new google.visualization.DataTable();



                //        data.addColumn('string', 'Key');
                //        data.addColumn('number', 'Value');


                //        result2.forEach(function (row) {
                //            data.addRow([
                //              row.Key,
                //             row.Value,

                //            ]);
                //        });

                //      //  var d = document.createElement("div");
                //      //  d.id = "piechar" + x;
                //      //  //d.className = "chartFloat";
                //      //  //d.style.display = "inline-block;";
                //      ////  d.style.float = 'center';
                //      //  document.getElementById("piechar").appendChild(d);
                //        var chart = new google.visualization.PieChart(piechar);
                //        chart.draw(data, { title: "Revenue Products", is3D: true, width: 400, height: 240 });


                //        var t_profit = t_revenue - commisonEarned - t_exp;
                //        document.getElementById('AmbName').innerHTML = (result1[0].Name+" brings $"+Math.round(t_profit * 100) / 100 +" profit");


                //    }
                //}
                //function onError(result) {
                //    alert('Cannot process your request at the moment, please try later.');
                //}


            }
            function onError(result) {
                alert('Cannot process your request at the moment, please try later.');
            }

        }

   
</script>
            </section>
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
                                <%--<th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Department">Department</th>--%>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Available Stock">Quantity</th>
                                <%--<th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Brand">Brand</th>--%>
                               <%-- <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Manufactuer">Manufactuer</th>--%>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Vendor Cost">Vendor Cost</th>
                                <%--<th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Gender">Gender</th>--%>
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
                           <%--     <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Department")%>
                            </td>--%>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Quantity")%>
                            </td>
                                <%--<td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Brand")%>
                            </td>--%>
                            <%--     <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Manufactuer")%>
                            </td>--%>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.VendorCost")%>
                            </td>
                          <%--      <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Gender")%>
                            </td>--%>
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



</asp:Content>
