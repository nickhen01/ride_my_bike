import 'mapbox-gl/dist/mapbox-gl.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';

const mapElement = document.getElementById('map');

if (mapElement) { mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    var el = document.createElement('div');
    el.className = 'marker';
    new mapboxgl.Marker(el)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 })
      .setHTML(marker.infoWindow.content))
      .addTo(map);
  })
  const coords = [];
  markers.forEach((marker) => {
    coords.push(String([marker.lng, marker.lat]))
  });
  console.log(coords)
  if (markers.length === 0) {
    map.setZoom(1);
  } else if (coords.every( (val, i, arr) => val === arr[0])) {
    map.setZoom(14);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else if (markers.length === 1) {
    map.setZoom(14);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    map.fitBounds(bounds, { duration: 0, padding: 75 })
  }
}
