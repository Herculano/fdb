var map;
var markers = [];
var lookup = [];
var icon1 = "images/marker/marker.png";
var icon2 = "images/marker/marker_active.png";

function initMap() {
    var center = { lat: -23.0129191, lng: -43.3073804 };

    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 18,
        center: center,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true
    });

    var myCity = new google.maps.Circle({
      center:center,
      radius:1000,
      strokeColor:"#0000FF",
      strokeOpacity:0,
      strokeWeight:2,
      fillColor:"#0000FF",
      fillOpacity:0
    });


    $("#radio").on("change", function(slideEvt) {
        var km = 5;
        switch (slideEvt.value.newValue) {
            case 5:
                km = 1;
                break;
            case 6:
                km = 5;
                break;
            case 7:
                km = 15;
                break;
            case 8:
                km = 30;
                break;
            case 9:
                km = 55;
                break;
        }
        $('b span').text(km);
        myCity.set('radius', km*1000);
        map.fitBounds(myCity.getBounds());
    });


    myCity.setMap(map);


    window.resize;

    // Faz algo quando a janela de exibição do mapa é alterada
    map.addListener('idle', function() {
        getData(); 
    });

    map.fitBounds(myCity.getBounds());
}
google.maps.event.addDomListener(window, 'load', initMap);

function getData() {

    var currentBounds = map.getBounds();

    // Faz requisição ao servidor pedindo os dados
    $.ajax({
        url: "http://127.0.0.1/fabricadebolo/js/markers.json",
        dataType: 'json',
        data: {'currentBounds': JSON.stringify(currentBounds)},
        success: function(result) {
              
            for (i = 0; i < result.length; i++) {

                var latlng = new google.maps.LatLng(result[i].lat, result[i].lng);
                var lojaId = result[i].lojaId;
                var loja = result[i].loja;
                var endereco = result[i].endereco;
                var telefone = result[i].telefone;
                var horario = result[i].horario;

                // insere novo marcador se esta na area visive do mapa e ainda não foi inserido
                if (currentBounds.contains(latlng) && isLocationFree([result[i].lat, result[i].lng])) {
                    lookup.push([result[i].lat, result[i].lng]);
                    addMarker(latlng, lojaId, loja, endereco, telefone, horario);
                }
            }
            showInfo();
        }
    });
}

function addMarker(latlng, lojaId, loja, endereco, telefone, horario) {

    // pin customizado
    var icon = {
        path: "M322.621,42.825C294.073,14.272,259.619,0,219.268,0c-40.353,0-74.803,14.275-103.353,42.825 c-28.549,28.549-42.825,63-42.825,103.353c0,20.749,3.14,37.782,9.419,51.106l104.21,220.986 c2.856,6.276,7.283,11.225,13.278,14.838c5.996,3.617,12.419,5.428,19.273,5.428c6.852,0,13.278-1.811,19.273-5.428 c5.996-3.613,10.513-8.562,13.559-14.838l103.918-220.986c6.282-13.324,9.424-30.358,9.424-51.106 C365.449,105.825,351.176,71.378,322.621,42.825z M270.942,197.855c-14.273,14.272-31.497,21.411-51.674,21.411 s-37.401-7.139-51.678-21.411c-14.275-14.277-21.414-31.501-21.414-51.678c0-20.175,7.139-37.402,21.414-51.675 c14.277-14.275,31.504-21.414,51.678-21.414c20.177,0,37.401,7.139,51.674,21.414c14.274,14.272,21.413,31.5,21.413,51.675 C292.355,166.352,285.217,183.575,270.942,197.855z",
        fillColor: '#ff0000',
        fillOpacity: 1,
        anchor: new google.maps.Point(0, 0),
        strokeWeight: 1,
        scale: 0.1
    }

    var marker = new google.maps.Marker({
        position: latlng,
        map: map,
        lojaId: lojaId,
        loja: loja,
        endereco: endereco,
        telefone: telefone,
        horario: horario,
        icon: icon1
    });
    markers.push(marker);

    google.maps.event.addListener(marker, 'mouseover', function() {
        marker.setIcon(icon2);
        $('#loja_'+marker.lojaId).addClass('active');
    });
    google.maps.event.addListener(marker, 'mouseout', function() {
        marker.setIcon(icon1);
        $('#loja_'+marker.lojaId).removeClass('active');
    });

}

$(document).on('mouseover mouseout', '.onde-encontrar .col-list-map li', function(event){
    var lojaId = $(this).prop('id').replace('loja_', '');
    for (var i = 0; i < markers.length; i++) {
        if(markers[i].lojaId == lojaId){
            if(event.type == "mouseover"){
                markers[i].setIcon(icon2);
            }else{
                markers[i].setIcon(icon1);
            }
        }
    }
});

// $(document).on('mouseout', '.onde-encontrar .col-list-map li', function(){
//     var lojaId = $(this).prop('id').replace('loja_', '');
//     for (var i = 0; i < markers.length; i++) {
//         if(markers[i].lojaId == lojaId){
//             markers[i].setIcon(icon1);
//             console.log(event.type);
//         }
//     } 
// });


function showInfo() {
    $('.onde-encontrar .col-list-map ul').html('');
    for (var i = 0; i < markers.length; i++) {

        var currentBounds = map.getBounds()
        var latlng = new google.maps.LatLng(markers[i].position.lat(), markers[i].position.lng());
        if(currentBounds.contains(latlng)){

            var item =   '<li id="loja_'+markers[i].lojaId+'">'
                        +'    <div class="panel panel-default">'
                        +'        <div class="panel-body">'
                        +'            <h4 class="loja">'+markers[i].loja+'</h4>'
                        +'            <p>'
                        +'                <span class="telefone">'+markers[i].telefone+'</span>'
                        +'                <span class="horario">'+markers[i].horario+'</span>'
                        +'            </p>'
                        +'            <p class="endereco">'+markers[i].endereco+'</p>'
                        +'        </div>'
                        +'    </div>'
                        +'</li>';

            $('.onde-encontrar .col-list-map ul').append(item);

        }
    }
}

function isLocationFree(search) {
    for (var i = 0, l = lookup.length; i < l; i++) {
        if (lookup[i][0] === search[0] && lookup[i][1] === search[1]) {
            return false;
        }
    }
    return true;
}
