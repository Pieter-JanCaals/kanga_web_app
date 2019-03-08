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

const initMapbox = () => {
  const eta = document.querySelector("#eta");

  const mapElement = document.getElementById('map');

  let markers = JSON.parse(mapElement.dataset.markers);

  if (mapElement && eta) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/light-v9',
      center: [markers[0].lng, markers[0].lat]
    });
    const coorUser = markers.shift();

    addUserToMap(map, coorUser);
    // fitMapToMarkers(map, markers, coorUser);

    eta.addEventListener("click", () => {
      document.querySelector('.mapboxgl-canvas').setAttribute("height", "300px");
      document.querySelector('.mapboxgl-canvas').setAttribute("style", "height:300px");
      mapElement.classList.toggle('map_open');

      setTimeout(() => {
        console.log("inside timeout")
        addMarkersToMap(map, markers);
        fitMapToMarkers(map, markers, coorUser);
      }, 2000);
    })
  }
};


export { initMapbox };
