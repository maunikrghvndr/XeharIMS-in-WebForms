<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="Ambassadors.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.Ambassadors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="row">
        <!-- Left col -->
        <section class="col-lg-7 connectedSortable">
         <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-left">
               
                  
                <li >Show Top Ambassadors : <select id="ddlRows">
    <option value='7' selected="selected" >week</option>
    <option value="31">month</option>
    <option value="365">year</option>

                     </select>
</li>
              
            </ul>
             
            
          </div>
            </section>
            </div>
        <section id="stats" style="overflow-x:auto">
            <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
        <div id="piechart" style="width: 900px; height: 500px; margin-left: 410px"></div>
      <div id="piechar" style="width: 2000px; height: 200px;"></div>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

 <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
   
  

       <script src='//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
         <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js'></script>

    <script type="text/javascript">
        // Load the Visualization API and the piechart package.
        google.charts.load('current', {'packages':['corechart']});
      
        // Set a callback to run when the Google Visualization API is loaded.
       google.charts.setOnLoadCallback(draw);
        
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

            PageMethods.TopAmbassadors(date,onSucess, onError);

            function onSucess(result) {

                //-------------------------------Display Top Sales Channels--------------------------------
                var result1 = [];

                result1 = JSON.parse(result);
                console.log(result1);
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Key');
                data.addColumn('number', 'Total Revenue');

                // data.addColumn('number', 'Wholesale');

                result1.forEach(function (row) {
                    data.addRow([
                      row.Name,
                      row.revenue,

                    ]);
                    
                });
                var chart = new google.visualization.ColumnChart(document.getElementById('piechart'));
                chart.draw(data, { title: "Top Ambassadors", width: 700, height: 400 });
             
                var scid = [];
                var salesChannelName = [];

                for (var x = 0; x < result1.length; x++) {
                    scid.push(result1[x].aid);
                    salesChannelName.push(result1[x].Name);
                }
               // console.log(scid, salesChannelName);
                //------------------------------------------------------Display top Products for top sales channels--------------------------------------------------------------------
                PageMethods.TopAmbassadorsProduct(date, scid, onSucess, onError);
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
                        d.id = "piechar" + x;
                        //d.className = "chartFloat";
                        //d.style.display = "inline-block;";
                        d.style.float = 'left';
                        document.getElementById("piechar").appendChild(d);
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

        function draw() {
            var defaultval = $('#ddlRows').val();
            var defaultdisplay = $.datepicker.formatDate('yy/mm/dd', getLastWeek(defaultval));
            drawChart(defaultdisplay);
            $('#ddlRows').change(function () {
                
                var val = $('#ddlRows').val();
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
</script>
        </section>
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
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="AID">AID</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name">Name</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Discount Code">Discount Code</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Address">Address</th>
                               <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Discount percentage">Discount %</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Email">Email</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Instagram">Instagram</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="SnapChat">SnapChat</th>
                  <%--              <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Twitter">Twitter</th>--%>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Facebook">Facebook</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Youtube">Blog</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Commission">Commision</th>
                             </tr>
            </HeaderTemplate>
            <ItemTemplate>
                            <tr role="row" class="odd">
                            <td width="100">

                                <%-- changed to aid --%>
                                <a href="AmbassadorView.aspx?aid=<%# DataBinder.Eval(Container, "DataItem.AID")%>"><%# DataBinder.Eval(Container, "DataItem.AID")%></a>
               

                            </td>
                            <td>
                            <%# DataBinder.Eval(Container, "DataItem.Name")%>
                            </td>
                            <td width="150">
                            <%# DataBinder.Eval(Container, "DataItem.DiscountCode")%>
                            </td>
                            <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Address")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.DiscountPercentage")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.EmailId")%>
                            </td>
                                <td width="100" align=center>
                           
                                    <a href="<%# DataBinder.Eval(Container, "DataItem.InstagramLink")%>"><%# DataBinder.Eval(Container, "DataItem.InstagramLink")%></a>

                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.SnapChat")%>
                            </td>
                             <%--    <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Twitter")%>
                            </td>--%>
                                <td width="100" align=center>

                                    <a href="<%# DataBinder.Eval(Container, "DataItem.FBLink")%>"><%# DataBinder.Eval(Container, "DataItem.FBLink")%></a>
               

                   <%--         <%# DataBinder.Eval(Container, "DataItem.FBLink")%>--%>
                            </td>
                                <td width="100" align=center>


                                    <a href="<%# DataBinder.Eval(Container, "DataItem.BlogLink")%>"><%# DataBinder.Eval(Container, "DataItem.BlogLink")%></a>
               
                        <%--    <%# DataBinder.Eval(Container, "DataItem.BlogLink")%>--%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Commision")%>
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


</asp:Content>
