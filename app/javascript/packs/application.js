import "core-js/stable";
import "regenerator-runtime/runtime";

/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).on('turbolinks:load', function() {
    if (gon.coords != undefined) {
        mapboxgl.accessToken = 'pk.eyJ1IjoiYWxleGFsZXgyMDIwIiwiYSI6ImNrNTZxM2djYjA1dGgzZm1pOTh2ZDgzd3oifQ.7HFyz0xmdVYHiXPYwqWCtQ';
        var map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [+gon.coords[0][0], +gon.coords[0][1]],
            zoom: 10
        });
        var coordinates = [];
        for (let i=0; i < gon.coords.length; ++i){
            coordinates.push([+gon.coords[i][0], +gon.coords[i][1]]);
        }
        map.on('load', function() {
            var excavator_id = Math.random();
            map.addLayer({
                'id': 'maine' + excavator_id,
                'type': 'fill',
                'source': {
                    'type': 'geojson',
                    'data': {
                        'type': 'Feature',
                        'geometry': {
                            'type': 'Polygon',
                            'coordinates':
                                [
                                    coordinates
                                ]
                        }
                    }
                },
                'layout': {},
                'paint': {
                    'fill-color': '#088',
                    'fill-opacity': 0.8
                }
            });
        });
    };
    if (!localStorage.getItem("reload")) {
        localStorage.setItem("reload", "true");
        location.reload();
    }
    else {
        localStorage.removeItem("reload");
    }
});
