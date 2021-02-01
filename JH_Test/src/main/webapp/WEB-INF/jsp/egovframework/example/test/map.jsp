<html>
  <head>
<script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
<link rel="stylesheet" href="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/css/ol.css">
    <title>tms</title>
	<style>
	html,body{width:100%;height:100%;padding:0;margin:0;}
	.tile{width:100px;height:100px;position:absolute;top:0;z-index:1;box-sizing:border-box;
	border:1px solid #000;color:#f00;font-weight:bold;font-size:18px;}
	.tile label{position:absolute;top:0;padding:5px;z-index:1;}
	</style>
  </head>
  <body>   

	<div id="baseMap" style="width:100%;height:100%;"></div>

	<script type="text/javascript">

		var info=[
			{tile:'http://xdworld.vworld.kr:8080/2d/Base/201512/{z}/{x}/{y}.png',}
		];
		for(var i=0;i<info.length;i++){
			info[i].view = new ol.View({
				center: [14163572.765192, 4445290.1505662],
				zoom: 7
			});
			info[i].tile = new ol.layer.Tile({
					source: new ol.source.XYZ({
					attributions: false,
					url: info[i].tile
				})
			});
			info[i].map = new ol.Map({
			  target: 'map'+i,
			  layers: [
				info[i].tile
			  ],
			  controls:[],
			  view: info[i].view
			});
			info[i].map.on('click',function(){
				for(var j=0;j<info.length;j++){
					baseMap.removeLayer(info[j].map.getLayers().getArray()[0]);
				}
				baseMap.addLayer(this.getLayers().getArray()[0]);
			});
		}

		var baseMap = new ol.Map({
		  target: 'baseMap',
		  layers: [
			info[0].tile
		  ],
		  controls:[],
		  view: new ol.View({
				center: [14163572.765192, 4445290.1505662],
				zoom: 7
			})
		});
		
		baseMap.on('precompose', function() {
			for(var i=0;i<info.length;i++){
				var c1 = baseMap.getCoordinateFromPixel([i*100,100]);
				var c2 = baseMap.getCoordinateFromPixel([100*i+100,0]);
				var lon = (c1[0]+c2[0])/2;
				var lat = (c1[1]+c2[1])/2;
				info[i].view.setCenter([lon,lat]);
				info[i].view.setZoom(baseMap.getView().getZoom());
			}
		});

	</script>

  </body>
</html>
