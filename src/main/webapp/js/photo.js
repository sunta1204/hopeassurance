(function () {
	var video = document.getElementById('video'),
	    canvas = document.getElementById('canvas'),
	    context = canvas.getContext('2d'),
	    vendorUrl = window.URL || window.webkitURL;
	
	navigator.getMedia = navigator.getUserMedia || 
						 navigator.webkitGetUserMedia ||
						 navigator.mozGetUserMedia;

	navigator.getMedia({
		video: true,
		audio: false
	}, function(stream) {
		video.src = vendorUrl.createObjectURL(stream);
		video.play();
	}, function(error) {
		// error.code
	});
	
	//ปุ่มถ่าย
	document.getElementById("snap").addEventListener("click", function () {
		context.drawImage(video,0,0,640,480);
		var gh = canvas.toDataURL('image/png');
		var a = document.createElement('a');
		a.href = gh;
		a.download = "";
		a.click();
	});
})();