<script>
    import { onMount } from "svelte";
    import L from "leaflet";

    let customcrs = L.extend({}, L.CRS.Simple, {
        projection: L.Projection.LonLat,
        scale: function(zoom) {
            return Math.pow(2, zoom);
        },
        zoom: function(sc) {

            return Math.log(sc) / 0.6931471805599453;
        },
        distance: function(pos1, pos2) {
            var x_difference = pos2.lng - pos1.lng;
            var y_difference = pos2.lat - pos1.lat;
            return Math.sqrt(x_difference * x_difference + y_difference * y_difference);
        },
        transformation: new L.Transformation(0.02072, 117.3, -0.0205, 172.8),
        infinite: false
        });

        onMount(async () => {
            var map = L.map("map", {
            crs: customcrs,
            minZoom: 1,
            maxZoom: 4,
            zoom: 1.73,
            preferCanvas: true,

            center: [0, -1024],
            maxBoundsViscosity: 1.0
            });

            var customImageUrl = 'https://www.bragitoff.com/wp-content/uploads/2015/11/GTAV-HD-MAP-satellite.jpg';

            var sw = map.unproject([0, 1024], 3 - 1);
            var ne = map.unproject([1024, 0], 3 - 1);
            var mapbounds = new L.LatLngBounds(sw, ne);
            map.setView([-50000, 100], 2);
            map.setMaxBounds(mapbounds);


            map.attributionControl.setPrefix(false)

            L.imageOverlay(customImageUrl, mapbounds).addTo(map);

            map.on('dragend', function() {
            if (!mapbounds.contains(map.getCenter())) {
                map.panTo(mapbounds.getCenter(), { animate: false });
            }
            });

            var Dispatches = {};
            var DispatchPing = L.divIcon({
            html: '<i class="fa fa-location-dot fa-2x"></i>',
            iconSize: [20, 20],
            className: 'map-icon map-icon-ping',
            offset: [-10, 0]
            });
            var mapMarkers = L.layerGroup();

            function DispatchMAP(DISPATCH) {
            var MIN = Math.round(Math.round((new Date() - new Date(DISPATCH.time)) / 1000) / 60);
            if (MIN > 10) return;

            var COORDS_X = DISPATCH.origin.x
            var COORDS_Y = DISPATCH.origin.y
            var CODE = DISPATCH.callId

            Dispatches[CODE] = L.marker([COORDS_Y, COORDS_X], { icon: DispatchPing });
            Dispatches[CODE].addTo(map);
            
            setTimeout(function() {
                map.removeLayer(Dispatches[CODE]);
            }, 1200000);
            
            Dispatches[CODE].bindTooltip(`<div class="map-tooltip-info">${DISPATCH.dispatchMessage}</div></div><div class="map-tooltip-id">#${DISPATCH.callId}</div>`,
                {
                    direction: 'top',
                    permanent: false,
                    offset: [0, -10],
                    opacity: 1,
                    interactive: true,
                    className: 'map-tooltip'
            });

            Dispatches[CODE].addTo(mapMarkers);

            Dispatches[CODE].on('click', function() {
                const callId = CODE
            });

            Dispatches[CODE].on('contextmenu', function() {
                map.removeLayer(Dispatches[CODE]);
            });
        }
    });

</script>

<svelte:head>
    <link
        rel="stylesheet"
        href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
        integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
        crossorigin="" />

    <script
        src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
        integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
        crossorigin="">
    </script>
</svelte:head>

<div class="h-full w-[278vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div id="map" class="w-full h-full rounded-[0.5vh]" style="background: #143d6b;"></div>
</div>