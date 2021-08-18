$(document).ready(function() {

        //buttons
        $("#GetDetails,.card,#Hide").hide();
        $("#choicesforWomen,#choicesforMen").hide();
        $("#GetDetails").click(function(){
            $(".card").toggle();
            $("#Hide").show();
            $("#GetDetails").hide();
        });
        $("#Hide").click(function(){
            $(".card").toggle();
            $("#Hide").hide();
            $("#GetDetails").show();
        });
        // /buttons

        //form
     
        $("#Submit2").click( function() { 
 
        //Form coding
        
          
            var productName = $("#productName").val();
            
            var productDesc = $("#productDesc").val();
            
            var brandName = $("#brandName").val();   
            
            var mrp = Number($("#mrp").val());

            var productPrice = Number($("#productPrice").val());

            

            var category = $("#category").val();
            var invalid = category == "";
                
            if (myform.productName.value.length == "") { 
                $("#productName").after("<p> *Please provide Product Name </p>");
                myform.productName.focus();
                return 0;
            }

            if (invalid) {
                alert('Please select category');
                // $("#category").addClass("error");
                myform.category.focus();
                return 0;
            }
            //else {
                // $("#category").removeClass("error");
                //$.fn.checkforblank();
            //}

            if (mrp < productPrice) { 
                alert("Product price can't be greater than M.R.P.");
                myform.productPrice.focus();
                return 0;
            }

            if ((mrp-productPrice)>=1000) { 
                alert("Difference between M.R.P. and Product Price can't be greater than 1000.");
                myform.mrp.focus();
                return 0;
            }

            var catType1 = $('input[name*="catType"]:checked').val();
            alert(catType1);
            alert ("Successfully Register !!!"); 

            
            //button
               $("#GetDetails").show();
            // /button

            
            //Card
                $("#enteredName").text(productName);
                $("#fullName").text(productName);
                $("#enteredAddr").text(productDesc);
                $("#entetedbrand").text(brandName);
                $("#enteredcat").text(category);
                $("#enteredsec").text(catType1);
                $("#enteredmrp").text(mrp);
                $("#entetedprice").text(productPrice);
            // /Card

        });

        $("#Submit1").click( function() { 
           return confirm("Are you sure ?");
       });

       $("#category").change(function(){
        //alert(category.value);
        if (category.value == "Women") {
                    //$("#choicesAll").hide();
                    $("#choicesforWomen,#choicesforMen").hide();
                    //alert('You selected Women');
                    $("#choicesforWomen").show();
                    //$("<p>You should follow GeeksForGeeks</p>").insertAfter("#category");
                }
        else if (category.value == "Men") {
                    //$("#choicesAll").hide();
                    $("#choicesforWomen,#choicesforMen").hide();
                    //alert('You selected Men');
                    $("#choicesforMen").show();
                    //$("<p>You should follow GeeksForGeeks</p>").insertAfter("#category");
                }
        
      });
           
        
});