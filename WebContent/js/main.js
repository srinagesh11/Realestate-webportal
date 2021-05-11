(function () 
    {
        displayMap();
        

})();
/*
(function () 
    {
        
        var ourRequest = new XMLHttpRequest();
        ourRequest.overrideMimeType("application/json");
        ourRequest.open('GET', 'person.json',true);
        ourRequest.onload = function() {
          renderData(ourRequest.responseText);
          //console.log(ourRequest.responseText); 
        };

        ourRequest.onerror = function() {
          alert("Connection error");
        };

        ourRequest.send();

})();

function renderData(data)
{
    var result= document.getElementById("result");
    var ourData = JSON.parse(data);
    for(var i in ourData[0].gps_location[0])
    {
      result.innerHTML += i +" : "+ ourData[0].gps_location[0][i]+"<br />";
    }

    displayMap(ourData);
    
}

function test()
{
  alert("Hello World");
}
*/
function displayMap()
{
    var gm = google.maps;
    var pos = new Object(); // var pos = {};


    var geocoder = new google.maps.Geocoder();
    var address = request.getParameter("hello");
    geocoder.geocode( { 'address': address}, function(results, status) {

      if (status == google.maps.GeocoderStatus.OK) {
        var latitude = results[0].geometry.location.lat();
        var longitude = results[0].geometry.location.lng();
        console.log("{'lat':"+latitude+", 'lng':"+longitude+"}");
      } 
    }); 
   


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
    
   // var content = "<b>This is test</b><input value='click' type='button' onclick='test()' />'";
        var content = "<a href='#' data-toggle='modal' data-target='#registerUser'>Register</a>"
        var map = new gm.Map(document.getElementById('map'), {
          zoom: 10,
          center: new gm.LatLng(markers[0].lat, markers[0].lng)
        });

        var infowindow = new gm.InfoWindow();

        for(var p in markers)
        {
          var data = markers[p];
          var myLatlng = new gm.LatLng(data.lat, data.lng);
          console.log(myLatlng)
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

