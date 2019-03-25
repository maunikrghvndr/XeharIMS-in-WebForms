<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertimage.aspx.cs" Inherits="XEHAR2017.AdminPortal.insertimage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
      
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
  
    <div style="height: 783px">  
        <div class="Heading">  
            Saving Image To Database</div>  
            <div class="Content">  
            <br />  
                <table style="width:100%;">  
                    <tr>  
                        <td class="style3">  
                             </td>  
                        <td class="style1">  
                            <asp:Image ID="Image1" runat="server" Height="293px" Width="584px" />  
                        </td>  
                        <td>  
                             </td>  
                    </tr>  
                    <tr>  
                        <td class="style3">  
                             </td>  
                        <td class="style1">  
                            <asp:FileUpload ID="FileUpload1" runat="server" />  
                            <asp:Button ID="btnUpload" runat="server" BackColor="#009933" Font-Bold="True"   
                                ForeColor="White" Height="30px" onclick="btnUpload_Click" Text="Upload"   
                                Width="100px" />  
                            <asp:Button ID="btnSave" runat="server" BackColor="#009900" Font-Bold="True"   
                                ForeColor="White" Height="30px" onclick="btnSave_Click" Text="Save"   
                                Width="100px" />  
                        </td>  
                        <td>  
                             </td>  
                    </tr>  
                    <tr>  
                        <td class="style3">  
                             </td>  
                        <td class="style1">  
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>  
                        </td>  
                        <td>  
                             </td>  
                    </tr>  
                </table>  
            </div>  
  
    </div>  
 

    </div>
    </form>
</body>
</html>
