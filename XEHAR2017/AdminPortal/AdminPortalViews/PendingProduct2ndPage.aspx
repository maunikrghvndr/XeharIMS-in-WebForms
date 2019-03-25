<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPortal/adminmaster/AdminPortalMaster.Master" AutoEventWireup="true" CodeBehind="PendingProduct2ndPage.aspx.cs" Inherits="XEHAR2017.AdminPortal.AdminPortalViews.PendingProduct2ndPage" EnableEventValidation="false" %>

<%@ Import Namespace="CloudinaryDotNet" %>
<%@ Import Namespace="CloudinaryDotNet.Actions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script>
        function ShowImg1(e) {
            //  var id = e.target.id;
            e = e || window.event;
            e = e.target || e.srcElement;
            var reggiMaggic = $("input[name*='ctl00$ContentPlaceHolder1$fileupload']");
            var sstyle = document.getElementById("ContentPlaceHolder1_Style").value;
            var mmeasure = document.getElementById("ContentPlaceHolder1_measurments").value;
            var mmaterial = document.getElementById("ContentPlaceHolder1_Material").value;
            var pname = document.getElementById("ContentPlaceHolder1_TextBox1").value;
            var des = document.getElementById("ContentPlaceHolder1_MyBox").value;
            var price = document.getElementById("ContentPlaceHolder1_TextBox2").value;
            var drp = document.getElementById("ContentPlaceHolder1_DropDownList2");
            var cou = document.getElementById("input_1");
            var strUser = drp.options[drp.selectedIndex].value;
            var country = cou.options[cou.selectedIndex].value;
            var sim = [];
            for (var i = 0; i < reggiMaggic.length; i++) {
                sim.push(reggiMaggic[i].value);
                //  sim = sim + "," + reggiMaggic[i].value ;
            }
            $("input#ContentPlaceHolder1_tit").val(sim);

            $("input#ContentPlaceHolder1_savebtn").click();

            //t.click();
            PageMethods.ShowImg(mmaterial, sstyle, mmeasure, price, country, des, pname, strUser, sim, onSucess, onError);
            function onSucess() {
                window.location.href = "PendingProducts.aspx";
            }
            function onError() {
                alert('Cannot process your request at the moment, please try later.');
            }

        }
    </script>
    <div class="content-wrapper">
        <asp:HiddenField runat="server" ID="tit" />
        <section class="content">
            <asp:Label runat="server" ID="stylenumber" Font-Size="X-Large"></asp:Label>
            <h2>Product Description</h2>
            <asp:TextBox runat="server" ID="MyBox" TextMode="MultiLine" Rows="10" Height="108px" Width="722px" />
            <h2>Product Name</h2>
            <asp:TextBox runat="server" ID="TextBox1" TextMode="MultiLine" Rows="10" Height="108px" Width="722px" />
            <div>
                <label for="price">Price</label>
                <asp:TextBox runat="server" ID="TextBox2" />
            </div>
            <div>
                <label for="country">Made In</label>
                <select class="form-dropdown" id="input_1" name="q1_countries" style="width: 150px;" data-component="dropdown">
                    <option value=""></option>
                    <option value="Afghanistan">Afghanistan </option>
                    <option value="Albania">Albania </option>
                    <option value="Algeria">Algeria </option>
                    <option value="American Samoa">American Samoa </option>
                    <option value="Andorra">Andorra </option>
                    <option value="Angola">Angola </option>
                    <option value="Anguilla">Anguilla </option>
                    <option value="Antigua and Barbuda">Antigua and Barbuda </option>
                    <option value="Argentina">Argentina </option>
                    <option value="Armenia">Armenia </option>
                    <option value="Aruba">Aruba </option>
                    <option value="Australia">Australia </option>
                    <option value="Austria">Austria </option>
                    <option value="Azerbaijan">Azerbaijan </option>
                    <option value="The Bahamas">The Bahamas </option>
                    <option value="Bahrain">Bahrain </option>
                    <option value="Bangladesh">Bangladesh </option>
                    <option value="Barbados">Barbados </option>
                    <option value="Belarus">Belarus </option>
                    <option value="Belgium">Belgium </option>
                    <option value="Belize">Belize </option>
                    <option value="Benin">Benin </option>
                    <option value="Bermuda">Bermuda </option>
                    <option value="Bhutan">Bhutan </option>
                    <option value="Bolivia">Bolivia </option>
                    <option value="Bosnia and Herzegovina">Bosnia and Herzegovina </option>
                    <option value="Botswana">Botswana </option>
                    <option value="Brazil">Brazil </option>
                    <option value="Brunei">Brunei </option>
                    <option value="Bulgaria">Bulgaria </option>
                    <option value="Burkina Faso">Burkina Faso </option>
                    <option value="Burundi">Burundi </option>
                    <option value="Cambodia">Cambodia </option>
                    <option value="Cameroon">Cameroon </option>
                    <option value="Canada">Canada </option>
                    <option value="Cape Verde">Cape Verde </option>
                    <option value="Cayman Islands">Cayman Islands </option>
                    <option value="Central African Republic">Central African Republic </option>
                    <option value="Chad">Chad </option>
                    <option value="Chile">Chile </option>
                    <option value="China">China </option>
                    <option value="Republic of China">Republic of China </option>
                    <option value="Christmas Island">Christmas Island </option>
                    <option value="Cocos(Keeling) Islands">Cocos(Keeling) Islands </option>
                    <option value="Colombia">Colombia </option>
                    <option value="Comoros">Comoros </option>
                    <option value="Congo">Congo </option>
                    <option value="Cook Islands">Cook Islands </option>
                    <option value="Costa Rica">Costa Rica </option>
                    <option value="Cote d'Ivoire">Cote d'Ivoire </option>
                    <option value="Croatia">Croatia </option>
                    <option value="Cuba">Cuba </option>
                    <option value="Cyprus">Cyprus </option>
                    <option value="Czech Republic">Czech Republic </option>
                    <option value="Denmark">Denmark </option>
                    <option value="Djibouti">Djibouti </option>
                    <option value="Dominica">Dominica </option>
                    <option value="Dominican Republic">Dominican Republic </option>
                    <option value="Ecuador">Ecuador </option>
                    <option value="Egypt">Egypt </option>
                    <option value="El Salvador">El Salvador </option>
                    <option value="Equatorial Guinea">Equatorial Guinea </option>
                    <option value="Eritrea">Eritrea </option>
                    <option value="Estonia">Estonia </option>
                    <option value="Ethiopia">Ethiopia </option>
                    <option value="Falkland Islands">Falkland Islands </option>
                    <option value="Faroe Islands">Faroe Islands </option>
                    <option value="Fiji">Fiji </option>
                    <option value="Finland">Finland </option>
                    <option value="France">France </option>
                    <option value="French Polynesia">French Polynesia </option>
                    <option value="Gabon">Gabon </option>
                    <option value="The Gambia">The Gambia </option>
                    <option value="Georgia">Georgia </option>
                    <option value="Germany">Germany </option>
                    <option value="Ghana">Ghana </option>
                    <option value="Gibraltar">Gibraltar </option>
                    <option value="Greece">Greece </option>
                    <option value="Greenland">Greenland </option>
                    <option value="Grenada">Grenada </option>
                    <option value="Guadeloupe">Guadeloupe </option>
                    <option value="Guam">Guam </option>
                    <option value="Guatemala">Guatemala </option>
                    <option value="Guernsey">Guernsey </option>
                    <option value="Guinea">Guinea </option>
                    <option value="Guinea - Bissau">Guinea - Bissau </option>
                    <option value="Guyana">Guyana </option>
                    <option value="Haiti">Haiti </option>
                    <option value="Honduras">Honduras </option>
                    <option value="Hong Kong">Hong Kong </option>
                    <option value="Hungary">Hungary </option>
                    <option value="Iceland">Iceland </option>
                    <option value="India">India </option>
                    <option value="Indonesia">Indonesia </option>
                    <option value="Iran">Iran </option>
                    <option value="Iraq">Iraq </option>
                    <option value="Ireland">Ireland </option>
                    <option value="Israel">Israel </option>
                    <option value="Italy">Italy </option>
                    <option value="Jamaica">Jamaica </option>
                    <option value="Japan">Japan </option>
                    <option value="Jersey">Jersey </option>
                    <option value="Jordan">Jordan </option>
                    <option value="Kazakhstan">Kazakhstan </option>
                    <option value="Kenya">Kenya </option>
                    <option value="Kiribati">Kiribati </option>
                    <option value="North Korea">North Korea </option>
                    <option value="South Korea">South Korea </option>
                    <option value="Kosovo">Kosovo </option>
                    <option value="Kuwait">Kuwait </option>
                    <option value="Kyrgyzstan">Kyrgyzstan </option>
                    <option value="Laos">Laos </option>
                    <option value="Latvia">Latvia </option>
                    <option value="Lebanon">Lebanon </option>
                    <option value="Lesotho">Lesotho </option>
                    <option value="Liberia">Liberia </option>
                    <option value="Libya">Libya </option>
                    <option value="Liechtenstein">Liechtenstein </option>
                    <option value="Lithuania">Lithuania </option>
                    <option value="Luxembourg">Luxembourg </option>
                    <option value="Macau">Macau </option>
                    <option value="Macedonia">Macedonia </option>
                    <option value="Madagascar">Madagascar </option>
                    <option value="Malawi">Malawi </option>
                    <option value="Malaysia">Malaysia </option>
                    <option value="Maldives">Maldives </option>
                    <option value="Mali">Mali </option>
                    <option value="Malta">Malta </option>
                    <option value="Marshall Islands">Marshall Islands </option>
                    <option value="Martinique">Martinique </option>
                    <option value="Mauritania">Mauritania </option>
                    <option value="Mauritius">Mauritius </option>
                    <option value="Mayotte">Mayotte </option>
                    <option value="Mexico">Mexico </option>
                    <option value="Micronesia">Micronesia </option>
                    <option value="Moldova">Moldova </option>
                    <option value="Monaco">Monaco </option>
                    <option value="Mongolia">Mongolia </option>
                    <option value="Montenegro">Montenegro </option>
                    <option value="Montserrat">Montserrat </option>
                    <option value="Morocco">Morocco </option>
                    <option value="Mozambique">Mozambique </option>
                    <option value="Myanmar">Myanmar </option>
                    <option value="Nagorno - Karabakh">Nagorno - Karabakh </option>
                    <option value="Namibia">Namibia </option>
                    <option value="Nauru">Nauru </option>
                    <option value="Nepal">Nepal </option>
                    <option value="Netherlands">Netherlands </option>
                    <option value="Netherlands Antilles">Netherlands Antilles </option>
                    <option value="New Caledonia">New Caledonia </option>
                    <option value="New Zealand">New Zealand </option>
                    <option value="Nicaragua">Nicaragua </option>
                    <option value="Niger">Niger </option>
                    <option value="Nigeria">Nigeria </option>
                    <option value="Niue">Niue </option>
                    <option value="Norfolk Island">Norfolk Island </option>
                    <option value="Turkish Republic of Northern Cyprus">Turkish Republic of Northern Cyprus </option>
                    <option value="Northern Mariana">Northern Mariana </option>
                    <option value="Norway">Norway </option>
                    <option value="Oman">Oman </option>
                    <option value="Pakistan">Pakistan </option>
                    <option value="Palau">Palau </option>
                    <option value="Palestine">Palestine </option>
                    <option value="Panama">Panama </option>
                    <option value="Papua New Guinea">Papua New Guinea </option>
                    <option value="Paraguay">Paraguay </option>
                    <option value="Peru">Peru </option>
                    <option value="Philippines">Philippines </option>
                    <option value="Pitcairn Islands">Pitcairn Islands </option>
                    <option value="Poland">Poland </option>
                    <option value="Portugal">Portugal </option>
                    <option value="Puerto Rico">Puerto Rico </option>
                    <option value="Qatar">Qatar </option>
                    <option value="Romania">Romania </option>
                    <option value="Russia">Russia </option>
                    <option value="Rwanda">Rwanda </option>
                    <option value="Saint Barthelemy">Saint Barthelemy </option>
                    <option value="Saint Helena">Saint Helena </option>
                    <option value="Saint Kitts and Nevis">Saint Kitts and Nevis </option>
                    <option value="Saint Lucia">Saint Lucia </option>
                    <option value="Saint Martin">Saint Martin </option>
                    <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon </option>
                    <option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines </option>
                    <option value="Samoa">Samoa </option>
                    <option value="San Marino">San Marino </option>
                    <option value="Sao Tome and Principe">Sao Tome and Principe </option>
                    <option value="Saudi Arabia">Saudi Arabia </option>
                    <option value="Senegal">Senegal </option>
                    <option value="Serbia">Serbia </option>
                    <option value="Seychelles">Seychelles </option>
                    <option value="Sierra Leone">Sierra Leone </option>
                    <option value="Singapore">Singapore </option>
                    <option value="Slovakia">Slovakia </option>
                    <option value="Slovenia">Slovenia </option>
                    <option value="Solomon Islands">Solomon Islands </option>
                    <option value="Somalia">Somalia </option>
                    <option value="Somaliland">Somaliland </option>
                    <option value="South Africa">South Africa </option>
                    <option value="South Ossetia">South Ossetia </option>
                    <option value="Spain">Spain </option>
                    <option value="Sri Lanka">Sri Lanka </option>
                    <option value="Sudan">Sudan </option>
                    <option value="Suriname">Suriname </option>
                    <option value="Svalbard">Svalbard </option>
                    <option value="Swaziland">Swaziland </option>
                    <option value="Sweden">Sweden </option>
                    <option value="Switzerland">Switzerland </option>
                    <option value="Syria">Syria </option>
                    <option value="Taiwan">Taiwan </option>
                    <option value="Tajikistan">Tajikistan </option>
                    <option value="Tanzania">Tanzania </option>
                    <option value="Thailand">Thailand </option>
                    <option value="Timor - Leste">Timor - Leste </option>
                    <option value="Togo">Togo </option>
                    <option value="Tokelau">Tokelau </option>
                    <option value="Tonga">Tonga </option>
                    <option value="Transnistria Pridnestrovie">Transnistria Pridnestrovie </option>
                    <option value="Trinidad and Tobago">Trinidad and Tobago </option>
                    <option value="Tristan da Cunha">Tristan da Cunha </option>
                    <option value="Tunisia">Tunisia </option>
                    <option value="Turkey">Turkey </option>
                    <option value="Turkmenistan">Turkmenistan </option>
                    <option value="Turks and Caicos Islands">Turks and Caicos Islands </option>
                    <option value="Tuvalu">Tuvalu </option>
                    <option value="Uganda">Uganda </option>
                    <option value="Ukraine">Ukraine </option>
                    <option value="United Arab Emirates">United Arab Emirates </option>
                    <option value="United Kingdom">United Kingdom </option>
                    <option value="United States">United States </option>
                    <option value="Uruguay">Uruguay </option>
                    <option value="Uzbekistan">Uzbekistan </option>
                    <option value="Vanuatu">Vanuatu </option>
                    <option value="Vatican City">Vatican City </option>
                    <option value="Venezuela">Venezuela </option>
                    <option value="Vietnam">Vietnam </option>
                    <option value="British Virgin Islands">British Virgin Islands </option>
                    <option value="Isle of Man">Isle of Man </option>
                    <option value="US Virgin Islands">US Virgin Islands </option>
                    <option value="Wallis and Futuna">Wallis and Futuna </option>
                    <option value="Western Sahara">Western Sahara </option>
                    <option value="Yemen">Yemen </option>
                    <option value="Zambia">Zambia </option>
                    <option value="Zimbabwe">Zimbabwe </option>
                </select>
            </div>
            <div>
                <div class="numbers-row">
                    <label for="name">Sub Category</label>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </div>
                <div>
                    <label for="measurments">Measurements</label>
                    <asp:TextBox runat="server" ID="measurments" Width="670px" />
                </div>
                <div>
                    <label for="Material">Material</label>
                    <asp:TextBox runat="server" ID="Material" Width="670px" />
                </div>
                <div>
                    <label for="Style">Style</label>
                    <asp:TextBox runat="server" ID="Style" />
                </div>
            </div>
            <h2>&nbsp;&nbsp; Upload Images(Front, Left, Back, Right)</h2>
            <div runat="server" id="myDiv">
            </div>
            <%--  <div class="Content" style="float: left">
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">Front:
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:Button ID="btnUpload" runat="server" BackColor="#009933" Font-Bold="True"
                                ForeColor="White" Height="30px" OnClick="btnUpload_Click" Text="Upload"
                                Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>--%>

            <%-- ----------------------pics start here-------------------------------------

               <div class="Content" style="float: left">
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">Front:
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:Button ID="btnUpload" runat="server" BackColor="#009933" Font-Bold="True"
                                ForeColor="White" Height="30px" OnClick="btnUpload_Click" Text="Upload"
                                Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="Content" style="float: left">
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">Left:
                            <asp:FileUpload ID="FileUpload2" runat="server" />
                            <asp:Button ID="Button1" runat="server" BackColor="#009933" Font-Bold="True"
                                ForeColor="White" Height="30px" OnClick="btnUpload_Click" Text="Upload"
                                Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="Content" style="float: left">
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Image ID="Image3" runat="server" Height="100px" Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">Back:
                            <asp:FileUpload ID="FileUpload3" runat="server" />
                            <asp:Button ID="Button3" runat="server" BackColor="#009933" Font-Bold="True"
                                ForeColor="White" Height="30px" OnClick="btnUpload_Click" Text="Upload"
                                Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="Content" style="float: left">
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Image ID="Image4" runat="server" Height="100px" Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">Right:
                            <asp:FileUpload ID="FileUpload4" runat="server" />
                            <asp:Button ID="Button5" runat="server" BackColor="#009933" Font-Bold="True"
                                ForeColor="White" Height="30px" OnClick="btnUpload_Click" Text="Upload"
                                Width="100px" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style3"></td>
                        <td class="style1">
                            <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>--%>

            <%------------------pics end here-------------------------------------------------------------- %>

            <%--          <div class="col-md-2">
      <div class="numbers-row">
        <label for="name" class="fs-24"> Select Category</label>
       
          <asp:DropDownList ID="DropDownList1" runat="server">
          </asp:DropDownList>
      </div>
                </div>--%>
            <div class="alert alert-success" id="succMessage" runat="server" visible="false">
                <strong>Success!</strong>
            </div>
            <%--  <asp:Button ID="savebtn" runat="server" OnClick="ShowImg" style="display:none" />--%>
            <button value="upload" id="n" runat="server" onclick="ShowImg1(event)" class="btn btn-primary">Upload </button>
            <%--<asp:Button ID="no4" runat="server" value="click" OnClick="ShowImg" />--%>
            <%--  <input type="button" runat="server"  id="myCheck" onclick="ShowImg()" />--%>
            <%--<button type="button" id="Button1" runat="server" class="btn btn-danger custom-button-width .navbar-right" onserverclick="CancelProducts" style="padding-bottom: 30px !important;">Cancel</button>
            --%>
        </section>
    </div>

</asp:Content>
