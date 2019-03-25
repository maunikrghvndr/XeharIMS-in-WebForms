<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DesignerTest.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.DesignerTest" %>

<!DOCTYPE html>

<html >
<head>
<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
}

/* Create four equal columns that floats next to each other */
.column {
    float: left;
    width: 30%;
    padding: 10px;
    height: 800px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media (max-width: 700px) {
    .column {
        width: 100%;
    }
}
</style>
    <script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}
</script>
</head>
<body>

<h2>Designer Portal</h2>


<div class="row" >
    
  <div class="column" style="background-color:#aaa;">
  <div class="row">
      <div class="column" >
       
    <img src="img_w3slogo.gif" draggable="true" ondragstart="drag(event)" id="drag1" width="88" height="31"/>
           
    </div>
       <asp:repeater id="rptProducts" runat="server">
            <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl= DataItem.Front  />
            <%--    <%#: DataBinder.Eval(Container, "DataItem.Front") %>--%>
            
        </ItemTemplate>
   
      </asp:repeater>       
     <div class="column" >
    <p draggable="true" ondragstart="drag(event)" id="drag2" >Some text..</p>
    </div>
         
    </div>
          
  </div>
  <div id="div1" class="column" style="background-color:#bbb;" ondrop="drop(event)" ondragover="allowDrop(event)">
    <h2></h2>
    <p></p>
  </div>
 
  <div class="column" style="background-color:#ddd;">
    <h2>Column 4</h2>
    <p>Some text..</p>
  </div>
</div>
    
</body>
</html>
