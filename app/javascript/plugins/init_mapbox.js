import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers, coorUser) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  bounds.extend([ coorUser.lng - 0.00009, coorUser.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 25 })
}

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    //element.style.backgroundImage = `url(${marker.image_url})`;
    //element.style.backgroundRepeat = 'no-repeat';
    //element.style.backgroundSize = 'contain';
    element.style.width = '70px';
    element.style.height = '70px';

    new mapboxgl.Marker()// add element if you want custom marker
    .setLngLat([marker.lng, marker.lat])
    .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
    .setHTML(marker.infoWindow))
    .addTo(map);
  })
}

const addUserToMap = (map, coordinates) => {
  // if (navigator.geolocation) {
    const popup = new mapboxgl.Popup().setHTML("<div>You are here!</div>");
    // navigator.geolocation.getCurrentPosition((position) => {
      new mapboxgl.Marker()
      .setLngLat([coordinates.lng - 0.00009, coordinates.lat])
      .setPopup(popup)
      .addTo(map);
      console.debug("user added to map")
    // });
  // } else {
  //   alert("Geolocation is not supported by this browser.")
  // }
}

const removeMarkersFromMap = () => {
  $('.mapboxgl-marker').remove();
}

const initMapbox = () => {
  const eta = document.querySelector("#eta");

  const mapElement = document.getElementById('map');
  const container = document.querySelector('.map_container');
  const overlay_map_color = document.querySelector('.overlay-map-color');


  let markers = JSON.parse(mapElement.dataset.markers);

  if (mapElement && eta) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/light-v9',
      center: [markers[0].lng - 0.0007, markers[0].lat - 0.0009],
      zoom: 16
    });
    const coorUser = markers.shift();

    addMarkersToMap(map, markers);
    addUserToMap(map, coorUser);
    // fitMapToMarkers(map, markers, coorUser);

    container.addEventListener("click", () => {
      container.classList.toggle('map_open');
      overlay_map_color.classList.toggle('overlay-map-height');
      document.querySelector('.overlay-map-color p').classList.toggle('p-open');
      if (container.classList.contains('map_open')) {
        map.setCenter(coorUser);
      } else {
        setTimeout(() => {
          map.setCenter([coorUser.lng - 0.0007, coorUser.lat - 0.0009])
          map.setZoom(16);
        }, 800)
      }
    })
    eta.addEventListener("click", () => {
      container.classList.toggle('map_open');
      overlay_map_color.classList.toggle('overlay-map-height');
      document.querySelector('.overlay-map-color p').classList.toggle('p-open');
      if (container.classList.contains('map_open')) {
        map.setCenter(coorUser);
      } else {
        setTimeout(() => {
          map.setCenter([coorUser.lng - 0.0007, coorUser.lat - 0.0009])
          map.setZoom(16);
        }, 800)
      }
    })
  }
};


export { initMapbox };
