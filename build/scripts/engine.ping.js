

/*ping instance*/
var ping = {


	call: function(panel,href){
		/*post ping call*/
		$.ajax({
			type: 'POST',
			url: 'build/handler/handle.ping.php',
			data: {
				url: href
			},
			success: function(data){
				ping.update(panel,data);
			},
			async: true
		});
	},


	update: function(panel,data){
		/*update panel class*/
		$('[panel='+panel+']').addClass(data);
	},


	indicate: {
		/*provide ping indication*/


		show: function(){
			/*show possible pings*/
			$('.ping').addClass('indicate');
		},


		hide: function(){
			/*hide pseudo pings*/
			$('.indicate').removeClass('indicate');
		},


	},


}

