
function formValidation()
{ 

    //var uid = document.registration.userid;
    var uvin = document.getElementById("vin").value;
    var uname = document.getElementById("name").value;

    
    var uvin = document.getElementById("vin").value;
    
    var uname = document.getElementById("username").value;

    var uadd = document.getElementById("address").value;
    var ucountry = document.getElementById("country").value;
    var uzip = document.getElementById("zip").value;
    var uemail = document.getElementById("email").value;
    var ucity = document.getElementById("city").value;


 
    if(allLetter(uname))  
     {  
      if (vin_validation(uvin)) {

          if (ValidateEmail(uemail)) {

          if (alphanumeric(uadd))
          {   
              if (validCity(ucity)) {


                if(countryselect(ucountry))  
                {  

                    if (allnumeric(uzip, uname, uvin, uemail, uadd, ucity, ucountry, uzip))

                    if (allnumeric(uzip, uname, uvin, uemail, uadd, ucity, ucountry))

                    {  
                         
                           
                            }  
                        }   
                    }  
                }   
            }  
        }  
    }  
  
return false;  
  
} 
function vin_validation(uvin)  
{  
    var vin_len = uvin.length;  
    if (vin_len == 0 )  
    {  
        alert("VIN should not be empty ");  
        uvin.focus();  
        return false;  
    }  
    return true;  
}  
function allLetter(uname)  
{
    var un_len = uname.length;
    var letters = /^[A-Za-z]+$/;  
    if(un_len > 0 && uname.match(letters) )  
    {  
        return true;  
    }  
    else  
    {  
        alert('Username must have alphabet characters only');  
        uname.focus();  
        return false;  
    }  
}  
function alphanumeric(uadd)  
{
    var add_len = uadd.length;
    var letters = /^[\s\-\,0-9a-zA-Z]+$/;  
    if(add_len >0 && uadd.match(letters))  
    {  
        return true;  
    }  
    else  
    {  
        alert('User address must not be empty and should have alphanumeric characters only');  
        uadd.focus();  
        return false;  
    }  
}

function validCity(ucity) {

    var city_len = ucity.length;
    var letters = /^[a-zA-Z]+$/;
    if (city_len >0 &&  ucity.match(letters)) {
        return true;
    }
    else {
        alert('City must not be empty and must be characters only');
        ucity.focus();
        return false;
    }
}
function countryselect(ucountry)  
{  
    if(ucountry == "Default")  
    {  
        alert('Select your country from the list');  
        ucountry.focus();  
        return false;  
    }  
    else  
    {  
        return true;  
    }  
}  
function allnumeric(uzip, uname, uvin, uemail, uadd, ucity, ucountry)
{
    //var zip_len = uzip.value.length;
    var numbers = /^[0-9]+$/;  
    if ( uzip.match(numbers))
    {

        PageMethods.AddVendor(uname, uvin, uemail, uadd, ucity, ucountry, uzip);

        function onSucess() {
            alert("Success");
        }

        function onError() {
            alert('Cannot process your request at the moment, please try later.');
        }
        //var xhttp = new XMLHttpRequest();
        //xhttp.onreadystatechange = function () {
        //    if (this.readyState == 4 && this.status == 200) {
        //        alert('Form Succesfully Submitted');
        //    }
        //};
        //xhttp.open("POST", "page2.aspx/AddVendor", true);
        //xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        //xhttp.send("username=Reginald");
       // window.location.reload();
        //var $form = $("<form/>").attr("id", "registration")
        //                    .attr("action", "Page2.aspx")
        //                    .attr("method", "post");
        //$("body").append($form);



        PageMethods.RegisterUser(uzip, uname, uvin, uemail, uadd, ucity, ucountry,onSucess, onError);

        function onSucess(result) {
            alert(result);
        }

        function onError(result) {
            alert('Cannot process your request at the moment, please try later.');
        }
       
    }  
    else  
    {  
        alert('ZIP code must not be empty and should have numeric characters only');  
        uzip.focus();  
        return false;  
    }  
}  
function ValidateEmail(uemail)  
{  
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
    if(uemail.match(mailformat))  
    {

        
        return true;
    }  
    else  
    {  
        alert("You have entered an invalid email address!");  
        uemail.focus();  
        return false;  
    }  
}

function AddParameter(form, name, value) {
    var $input = $("<input />").attr("type", "hidden")
    .attr("name", name)
    .attr("value", value);
    form.append($input);
}