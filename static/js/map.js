var osm = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors'
});

googleStreets = L.tileLayer('http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',{
    maxZoom: 20,
    subdomains:['mt0','mt1','mt2','mt3']
});
googleHybrid = L.tileLayer('http://{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}',{
    maxZoom: 20,
    subdomains:['mt0','mt1','mt2','mt3']
});
googleSat = L.tileLayer('http://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}',{
    maxZoom: 20,
    subdomains:['mt0','mt1','mt2','mt3']
});
googleTerrain = L.tileLayer('http://{s}.google.com/vt/lyrs=p&x={x}&y={y}&z={z}',{
    maxZoom: 20,
    subdomains:['mt0','mt1','mt2','mt3']
});

var baseLayers = {
    "OpenStreetMap": osm,
    "Google Streets": googleStreets,
    "Google Hybrid": googleHybrid,
    "Google Satellite": googleSat,
    "Google Terrain": googleTerrain
};




        //console.log(data.features.length);
     
      
        map = L.map("map",{layers:osm}).setView([27, 85], 6);;
        
        
        //map.addLayer(osm);
        layerswitcher = L.control.layers(baseLayers, {}, {collapsed: true}).addTo(map);

        var icon = L.icon({
          iconUrl: 'https://png.pngtree.com/element_origin_min_pic/16/12/02/51e6452ca365f618ab4b723c7aa18be9.jpg',
          iconSize: [32, 37],
          iconAnchor: [16, 37],
          popupAnchor: [0, -37]
        });
        L.marker([27.6692636, 85.3326804],{icon:icon}).bindPopup("बैदेशिक रोजगार बिभाग ").addTo(map);
        // L.marker([27.696446, 85.3221903],{icon:icon}).bindPopup("Baidesik Rojgar bibhag").addTo(map);
        // L.marker([27.6931977, 85.3242567],{icon:icon}).bindPopup("Baidesik Rojgar bibhag").addTo(map);
        // L.marker([27.6482818, 85.3050494],{icon:icon}).bindPopup("Baidesik Rojgar bibhag").addTo(map);
        // L.marker([27.6867262, 85.3365863],{icon:icon}).bindPopup("Baidesik Rojgar bibhag").addTo(map);


