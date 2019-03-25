<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="XEHAR2017.location" %>

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
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
    </div>
    </form>
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
        
        

    
    
</body>
</html>
