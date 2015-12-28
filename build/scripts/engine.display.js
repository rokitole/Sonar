

/*interface instance*/
var gui = {


	controls: {
	/*provide controls handling*/


		use: function(controls){
			/*activate controls provided by array*/
			$('button.active').removeClass('active');
			controls = controls.split(',');
			$.each(controls,function(key,control) {
				$('button.'+control).addClass('active');
			});
		},


	},


	progress: {
	/*provide progress indication*/


		show: function(){
			/*show progress*/
			$('.progress').addClass('show');
		},


		hide: function(){
			/*hide progress*/
			$('.progress').removeClass('show');
		},


	},


	notify: {
	/*notification messages*/


		done: function(){
			/*show done message*/
			$('.done').addClass('show');
			gui.notify.hide();
		},


		duplicate: function(){
			/*show duplicate message*/
			$('.duplicate').addClass('show');
			gui.notify.hide();
		},


		warning: function(){
			/*show warning message*/
			$('.warning').addClass('show');
			gui.notify.hide();
		},


		syntax: function(){
			/*show syntax message*/
			$('.syntax').addClass('show');
			gui.notify.hide();
		},


		hide: function(){
			/*hide message*/
			setTimeout(function(){
				$('.notify.show').removeClass('show');
			}, 3500);

		},


	},


	tween: function(element){
		/*tween inteface elements*/
		$(element).removeClass('show');
		setTimeout(function(){
			$(element).addClass('show');
		}, 100);
	}


};

