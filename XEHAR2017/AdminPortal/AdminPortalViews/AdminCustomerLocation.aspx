<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="AdminCustomerLocation.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.AdminCustomerLocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="content-wrapper">
        <section id="stats" style="overflow-x:auto">
            <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
    <div>
    <div id="chart_div" style="width: 900px; height: 500px;margin-left:300px;"></div>
    </div>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {
        'packages':['geochart'],
        // Note: you will need to get a mapsApiKey for your project.
        // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
        'mapsApiKey': 'AIzaSyDztGpJ-ajTgHAo8tLUWuhmfm7epHtcPT4'
      });
      google.charts.setOnLoadCallback(drawMarkersMap);

      function drawMarkersMap() {
          PageMethods.CustomerLocation(onSucess, onError);
          function onSucess(result) {
              var result1 = [];
              //  var datos = result.replace(/'/g, '"');
              result1 = JSON.parse(result);
              var data = new google.visualization.DataTable();
              data.addColumn('string', 'Key');
              data.addColumn('number', 'Value');
              // data.addColumn('number', 'Wholesale');

              result1.forEach(function (row) {
                  data.addRow([
                    row.Key,
                    row.Value,
                    //row.Wholesale
                  ]);
              });
              var options = {
                  //region: 'IT',
                  displayMode: 'markers',
                  dataMode: 'region',
                  colorAxis: { colors: ['green', 'blue'] }
              };

              var chart = new google.visualization.GeoChart(document.getElementById('chart_div'));
              chart.draw(data, options);
          }

              function onError(result) {
                  alert('Cannot process your request at the moment, please try later.');
              }

      //var data = google.visualization.arrayToDataTable([
      //  ['City',   'Population', 'Area'],
      //  ['California',      2761477,    1285.31],
      //  ['Texas',     1324110,    181.76],
      //  ['New York',    959574,     117.27],
      //  ['Chicago',     907563,     130.17],
      //  ['Florida',   655875,     158.9],
      //  ['New Jersey',     607906,     243.60],
      // // ['San Diego',   380181,     140.7],
      
      //]);

     
    };
    
        
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
                 <table id="customers" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="customers_info"">
                     <thead>
                           <tr role="row">
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="CID">Customer ID</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="FirstName">First Name</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="LastName">Last Name</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Email">Email Address</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Street">Street Address</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="City">City</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Zip">Zip code</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Country">Country</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Company">Company</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Phone">Phone</th>
                                <th class="sorting_asc" tabindex="0" aria-controls="products" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Purchasing Site">Site from which purchase was made</th>
                             </tr>
            </HeaderTemplate>
            <ItemTemplate>
                            <tr role="row" class="odd">
                            <td width="100">
                                <a href="../../VendorPortal/vendorviews/vendorportalproduct.aspx?pid=<%# DataBinder.Eval(Container, "DataItem.CID")%>"><%# DataBinder.Eval(Container, "DataItem.CID")%></a>
               

                            </td>
                            <td>
                            <%# DataBinder.Eval(Container, "DataItem.FirstName")%>
                            </td>
                            <td width="150">
                            <%# DataBinder.Eval(Container, "DataItem.LastName")%>
                            </td>
                            <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Email")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Street")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.City")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Zip")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Country")%>
                            </td>
                                 <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Company")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.Phone")%>
                            </td>
                                <td width="100" align=center>
                            <%# DataBinder.Eval(Container, "DataItem.State")%>
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
