

/*detail instance*/
var detail = {


	view: function(projectid){
		/*load details panel*/
		gui.progress.show();
		$.ajax({
			type: 'POST',
			url: 'build/handler/handle.detail.php',
			data: {
				projectid: projectid
			},
			success: function(data){
				detail.clear();
				detail.draw(projectid,data);
			},
			async: true
		});
	},


	draw: function(projectid,data){
		/*append returned listing*/
		$('.right section').append(data);
		gui.tween('.right section');
		gui.progress.hide();
		if(projectid == undefined){
			mode.enableinputs();
		}
	},


	clear: function(){
		$('.right section *').remove();
		$('.modal').removeClass('modal');
	},


	link: function(){
		if(!mode.state.adding && !mode.state.editing){
			window.open('http://'+$('[relation=url]').text());
		}
	},


}




