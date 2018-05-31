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
          iconUrl: 'https://files.slack.com/files-pri/T1QG0R92R-FAX1UMY8Y/marker-icon.png',
          iconSize: [32, 37],
          iconAnchor: [16, 37],
          popupAnchor: [0, -37]
        });
        if(lat){
                L.marker([parseFloat(lat), parseFloat(lon)],{icon:icon}).bindPopup(name).addTo(map);
        }else{

            L.marker([27.687096, 85.327176],{icon:icon}).bindPopup("बैदेशिक रोजगार बिभाग ").addTo(map);
            L.marker([27.686727, 85.337680],{icon:icon}).bindPopup("श्रम विभाग").addTo(map);
            L.marker([ 27.692456, 85.335741],{icon:icon}).bindPopup("वैदेशिक रोजगार प्रवर्द्धन वोर्ड").addTo(map);
            L.marker([ 27.646982, 85.308698],{icon:icon}).bindPopup("व्यवसायिक तथा सीप विकास तालिम केन्द्र").addTo(map);
            L.marker([27.647100, 85.308526],{icon:icon}).bindPopup("व्यवसायजन्य सुरक्षा तथा स्वास्थ्य सम्बन्धी आयोजना").addTo(map);
            L.marker([27.669276, 85.334866],{icon:icon}).bindPopup("ई. पि. एस. कोरिया शाखा").addTo(map);
            L.marker([27.693550,85.325032],{icon:icon}).bindPopup("सामाजिक सुरक्षा कोष").addTo(map);
            L.marker([ 27.693610,  85.324807],{icon:icon}).bindPopup("वैदेशिक रोजगार न्यायधिकरण").addTo(map);
        }

