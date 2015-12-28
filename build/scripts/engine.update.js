

/*update instance*/
var update = {


	save: {
	/*saving pipeline*/


		execute: function(){
			/*check if validation is neccessary*/
			if(validation.result() == true){
				update.save.store();
			}
		},


		store: function(){
			/*gather data*/
			var dataset = [];
			$.each($('[dataset]'), function(key,value){
				dataset.push($(this).html());
			});
			dataset = dataset.join(';');
			gui.progress.show();
			update.save.post(dataset);
		},


		post: function(dataset){
			/*send data*/
			$.ajax({
				type: 'POST',
				url: 'build/handler/handle.save.php',
				data: {
					project: mode.project,
					dataset: dataset
				},
				success: function(data){
					mode.project = data;
					mode.quit();
					gui.progress.hide();
					gui.notify.done();
				},
				async: false
			});
		}


	},


	disable: {
	/*disable, not delete, current project*/


		confirm: function(){
			/*second click security*/
			$('button.delete').addClass('confirm');
		},


		cancel: function(){
			/*abort deletion*/
			$('button.delete').removeClass('confirm');
		},


		execute: function () {
			/*disable current project*/
			gui.progress.show();
			mode.project = $('.column.middle li.selected').attr('project');
			$.ajax({
				type: 'POST',
				url: 'build/handler/handle.disable.php',
				data: {
					project: mode.project
				},
				success: function (data) {
					mode.project = 0;
					mode.state.deleting = true;
					update.disable.cancel();
					mode.quit();
					detail.clear();
					menu.filter($('.filtered'));
					gui.progress.hide();
					gui.notify.done();
				},
				async: true
			});
		},


	},


}

