'use strict';

const initDeliveryCard = () => {

  $(document).ready(function() {

    var animating = false;
    var step1 = 500;
    var step2 = 500;
    var step3 = 500;
    var reqStep1 = 600;
    var reqStep2 = 800;
    var reqClosingStep1 = 500;
    var reqClosingStep2 = 500;
    var $scrollCont = $(".scroll-cont");

    function initMap($card) {
      // my first experience with google maps api, so I have no idea what I'm doing
      var latLngFrom = {lat: 40.7878581, lng: -73.9671309};
      var latLngTo = {lat: 40.746433, lng: -73.9503613};
      var latLngCenter = {
        lat: (latLngFrom.lat + latLngTo.lat)/2,
        lng: (latLngFrom.lng + latLngTo.lng)/2
      };
      // var themeColor = $card.data("color");

      // var map = new google.maps.Map($(".card__map__inner", $card)[0], {
      //   zoom: 12,
      //   center: latLngCenter,
      //   mapTypeId: google.maps.MapTypeId.ROADMAP,
      //   disableDefaultUI: true
      // });

      // map.set('styles', [
      //   {
      //     "featureType": "landscape",
      //     "elementType": "geometry",
      //     "stylers": [
      //       { "hue": "#00ffdd" },
      //       { "gamma": 1 },
      //       { "lightness": 100 }
      //     ]
      //   },{
      //     "featureType": "road",
      //     "stylers": [
      //       { "lightness": 60 },
      //       { "hue": "#006eff" }
      //     ]
      //   }
      // ]);

      // var pinImage = new google.maps.MarkerImage(
      //   "https://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + themeColor.slice(1),
      //   new google.maps.Size(21, 34),
      //   new google.maps.Point(0,0),
      //   new google.maps.Point(10, 34)
      // );

      // var marker = new google.maps.Marker({
      //   position: latLngFrom,
      //   map: map,
      //   title: 'From',
      //   icon: pinImage
      // });

      // var marker = new google.maps.Marker({
      //   position: latLngTo,
      //   map: map,
      //   title: 'To',
      //   icon: pinImage
      // });

      // var polylineOpts = new google.maps.Polyline({
      //   strokeColor: themeColor,
      //   strokeWeight: 3
      // });
      // var rendererOptions = {map: map, polylineOptions: polylineOpts, suppressMarkers: true};
      // var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);

      // var request = {
      //   origin: latLngFrom,
      //   destination: latLngTo,
      //   travelMode: google.maps.DirectionsTravelMode.DRIVING
      // };

      // var directionsService = new google.maps.DirectionsService();
      // directionsService.route(request, function(response, status) {
      //   if (status == google.maps.DirectionsStatus.OK) {
      //     directionsDisplay.setDirections(response);
      //   }
      //   else {
      //     console.log("wtf")
      //   }
      // });
    };

    if (document.querySelector(".card") != null) {
      initMap($(".card"));
    }

    const showMap = () => {
      if (animating) return;
      animating = true;

      var $card = document.getElementById('card');
      var cardTop = $card.offsetTop;
      var scrollTopVal = cardTop - 30;

      $card.classList.add("req-active1", "map-active");

      initMap($card);

      setTimeout(function() {
        $card.classList.add("req-active2");
        $scrollCont.animate({scrollTop: scrollTopVal}, reqStep2);

        setTimeout(function() {
          animating = false;
          $card.classList.add("open")
        }, reqStep2);

      }, reqStep1);
    };

    // Unfolding card
    const unfoldCard = () => {
      if (animating) return;
      animating = true;

      var $card = document.getElementById('card');
      var cardTop = $card.offsetTop;
      var scrollTopVal = cardTop - 30;
      $card.classList.add("flip-step1", "active");

      setTimeout(function() {
        $card.classList.add("flip-step2");

        setTimeout(function() {
          $card.classList.add("flip-step3");

          setTimeout(function() {
            animating = false;
            showMap();
          }, step3);

        }, step2*0.5);

      }, step1*0.65);
    };

    // Apparently unused animation
    $(document).on("click", ".card:not(.req-active1) .card__header__close-btn", function() {
      if (animating) return;
      animating = true;
      console.log("animation")

      var $card = $(this).parents(".card");
      $card.removeClass("flip-step3 active");

      setTimeout(function() {
        $card.removeClass("flip-step2");

        setTimeout(function() {
          $card.removeClass("flip-step1");

          setTimeout(function() {
            animating = false;
          }, step1);

        }, step2*0.65);

      }, step3/2);
    });

    // Animation to fold card back up
    const closeCard = () => {
      if (animating) return;
      animating = true;

      var $card = document.getElementById('card');

      $card.classList.add("req-closing1");

      setTimeout(function() {
        $card.classList.add("req-closing2");

        setTimeout(function() {
          $card.classList.add("no-transition", "hidden-hack")
          $card.style.top;
          $card.classList.remove("req-closing2", "req-closing1", "req-active2", "req-active1", "map-active", "flip-step3", "flip-step2", "flip-step1", "active");
          $card.style.top;
          $card.classList.remove("no-transition", "hidden-hack");
          animating = false;
          card.classList.remove("open")
        }, reqClosingStep2);

      }, reqClosingStep1);
    }

    const card = document.getElementById('card');
    card.addEventListener("click", () => {
      if (card.classList.contains("open")){
        closeCard();
      } else {
        unfoldCard();
      }
    })
  });

}

export { initDeliveryCard };
