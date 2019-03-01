import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 25, maxZoom: 25 })
}

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url(${marker.image_url})`;
    element.style.backgroundRepeat = 'no-repeat';
    element.style.backgroundSize = 'contain';
    element.style.width = '70px';
    element.style.height = '70px';

    new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
    .setHTML(marker.infoWindow))
    .addTo(map);
  })
}

const addUserToMap = (map) => {
  if (navigator.geolocation) {
    const popup = new mapboxgl.Popup().setHTML("<div>You are here!</div>");
    navigator.geolocation.getCurrentPosition((position) => {
      new mapboxgl.Marker()
      .setLngLat([position.coords.longitude, position.coords.latitude])
      .setPopup(popup)
      .addTo(map);
      console.log("user added to map")
    });
  } else {
    alert("Geolocation is not supported by this browser.")
  }
}

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  let markers = JSON.parse(mapElement.dataset.markers);

  if (mapElement) {
    console.log("map found")
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [markers[0].lng, markers[0].lat]
    });
    markers.shift();

    addUserToMap(map);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};


export { initMapbox };
