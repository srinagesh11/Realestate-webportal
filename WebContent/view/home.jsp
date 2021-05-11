<%@include file="/common/header.jspf" %>
<%@include file="/common/nav_home.jspf" %>
<style>
body {
    background-image: url("https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569__340.jpg");
}
nav {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: black;
}

li {
    float: left;
    border-right:1px solid #bbb;
}

li:last-child {
    border-right: none;
}
li a {
    display: block;
    color: white;
    text-align: center;
    padding: 100% 100%;
    text-decoration: none;
}

a:hover:not(.active) {
    background-color: white;
}

.active {
background-color:white;
}
p2
{
 color: white;
 font-family: verdana;
    text-align: center;
     font-size: 20px;
}
p1 {
    color: white;
    text-align: center;
}
center{
color: white;
    text-align: center;
    font-size:20x;
   
}
p1 {
    font-family: verdana;
    font-size: 20px;
}


.map {
        width: 100%;
        height: 500px;
        background-color: silver;

}
.footer {
    background-image: url("https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569__340.jpg");
    
         font-size: 30px;
    
}

</style> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHhAxEqUUzSdNMb8SZibp-G0WlZvrdr_g">
    </script>
    
<div class="container" align="center">
<form action="map.do" method="post">
<br><br>
<p2>Enter Location:</p2> <input name="hello" type="text" id="l" placeholder="Search" autofocus="">


<p1>Type Of Property:</p1> <select  name="hello1" name="Type Of Property">
    <option value="Apartment">Apartment</option>
    <option value="Agricultural Land">Agriculture Land</option>
    <option value="Commercial Land">Commercial Land</option>
    <option value="Plot">Plot</option>
  </select>
<br><br>
<button class="btn btn-lg btn-primary" type="submit" >Submit</button>
</form>
</div>

<div class="map" id="map"></div>

<script>


(function () 
	    {
	//alert("asd");
	//console.log('${dataValues}');
	var obj = '${dataValues}';
	console.log(obj);
	if(obj=="")
		{
		console.log("if");

			
			
		var markers = [{
		        "title": 'Aksa Beach',
		        "lat": '19.1759668',
		        "lng": '72.79504659999998',
		        "description": 'Aksa Beach is a popular beach and a vacation spot in Aksa village at Malad, Mumbai.'
		     
		      },{
		        "title": 'Juhu Beach',
		        "lat": '19.0883595',
		        "lng": '72.82652380000002',
		        "description": 'Juhu Beach is one of favourite tourist attractions situated in Mumbai.'
		      },{
		        "title": 'Girgaum Beach',
		        "lat": '18.9542149',
		        "lng": '72.81203529999993',
		        "description": 'Girgaum Beach commonly known as just Chaupati is one of the most famous public beaches in Mumbai.'

		      }]
		
        displayMap(markers);

			}
		else
			{
			var obj1 = JSON.parse(obj);
			

			var markers=obj1;

	        displayMap(markers);
			}
	        

})();



function displayMap(markers)
{
    if(markers!="")
    	{
    	  var gm = google.maps;

    	  //console.log("test");

    	   // var content = "<b>This is test</b><input value='click' type='button' onclick='test()' />'";
    	        //var content = "<a href="#" data-toggle='modal' data-target='#registerUser'>Register</a>"
    	        var map = new gm.Map(document.getElementById('map'), {
    	          zoom: 14,
    	          center: new gm.LatLng(markers[0].lat, markers[0].lng)
    	        });

    	        var infowindow = new gm.InfoWindow();

    	        for(var p in markers)
    	        {
    	          var data = markers[p];
    	          var myLatlng = new gm.LatLng(data.lat, data.lng);
    	          //console.log(myLatlng);
    	          var marker = new gm.Marker({
    	            position: myLatlng,
    	            map: map,
    	            title: data.title
    	          });


    	          (function (marker, data) {
    	          gm.event.addListener(marker, 'click', function(e) {
    	                //infowindow.setContent("<div style = 'width:200px;min-height:40px'>" + data.description + "</div>");
    	                //infowindow.setContent(content);
    	                //infowindow.open(map, marker);
    	                //$('#registerUser').modal('show');
    	                      var mymodal = $('#registerUser');
    	                      mymodal.find('.modal-header').html("<h4>" + data.title + "</h4>");
    	                      mymodal.find('.modal-body').html("<div style = 'width:200px;min-height:40px'>" + data.description + "</div>");
    	                      mymodal.modal('show');

    	          });
    	          })(marker, data);

    	        }
    	}
    else{
    	
    	console.log("hhkskfh");
    	 var markers = [{
        "title": 'Aksa Beach',
        "lat": '19.1759668',
        "lng": '72.79504659999998',
        "description": 'Aksa Beach is a popular beach and a vacation spot in Aksa village at Malad, Mumbai.'
     
      },{
        "title": 'Juhu Beach',
        "lat": '19.0883595',
        "lng": '72.82652380000002',
        "description": 'Juhu Beach is one of favourite tourist attractions situated in Mumbai.'
      },{
        "title": 'Girgaum Beach',
        "lat": '18.9542149',
        "lng": '72.81203529999993',
        "description": 'Girgaum Beach commonly known as just Chaupati is one of the most famous public beaches in Mumbai.'

      }]
  
  //var markers = JSON.parse(data);

	
    	  var gm = google.maps;

    	  console.log(markers[0].lat);

    	   // var content = "<b>This is test</b><input value='click' type='button' onclick='test()' />'";
    	        //var content = "<a href='#' data-toggle='modal' data-target='#registerUser'>Register</a>"
    	        var map = new gm.Map(document.getElementById('map'), {
    	          zoom: 14,
    	          center: new gm.LatLng(markers[0].lat, markers[0].lng)
    	        });

    	        var infowindow = new gm.InfoWindow();

    	        for(var p in markers)
    	        {
    	          var data = markers[p];
    	          var myLatlng = new gm.LatLng(data.lat, data.lng);
    	          //console.log(myLatlng)
    	          var marker = new gm.Marker({
    	            position: myLatlng,
    	            map: map,
    	            title: data.title
    	          });


    	          (function (marker, data) {
    	          gm.event.addListener(marker, 'click', function(e) {
    	                //infowindow.setContent("<div style = 'width:200px;min-height:40px'>" + data.description + "</div>");
    	                //infowindow.setContent(content);
    	                //infowindow.open(map, marker);
    	                //$('#registerUser').modal('show');
    	                      var mymodal = $('#registerUser');
    	                      mymodal.find('.modal-header').html("<h4>" + data.title + "</h4>");
    	                      mymodal.find('.modal-body').html("<div style = 'width:200px;min-height:40px'>" + data.description + "</div>");
    	                      mymodal.modal('show');

    	          });
    	          })(marker, data);

    	        }
    
    }
  /* var markers = [{
        "title": 'Aksa Beach',
        "lat": '19.1759668',
        "lng": '72.79504659999998',
        "description": 'Aksa Beach is a popular beach and a vacation spot in Aksa village at Malad, Mumbai.'
     
      },{
        "title": 'Juhu Beach',
        "lat": '19.0883595',
        "lng": '72.82652380000002',
        "description": 'Juhu Beach is one of favourite tourist attractions situated in Mumbai.'
      },{
        "title": 'Girgaum Beach',
        "lat": '18.9542149',
        "lng": '72.81203529999993',
        "description": 'Girgaum Beach commonly known as just Chaupati is one of the most famous public beaches in Mumbai.'

      }]
  */
  //var markers = JSON.parse(data);


        

    
}




</script>


 
<br><br>


<footer class=footer>
 	<center><div>Real Estate And Property Management</div></center>
 </footer>
		

   
</body>
</html>


<div class="modal fade" id="registerUser">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              
              <div class="modal-header">
                <h4 class="modal-title" id=“myModalLabel”>
            Register User
        </h4>
              </div>
              
              <div class="modal-body">
               <p>Modal body text goes here.</p>
              </div>
               
               <div class="modal-footer">
          
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    Close
                </button>
              </div>
            </div>  
          </div>







