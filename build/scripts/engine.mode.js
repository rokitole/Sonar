

/*mode instance*/
var mode = {


	/*currentproject*/
	project: undefined,


	state: {
		/*mode states*/
		adding: false,
		editing: false,
		deleting: false,
	},


	adding: function(){
		/*start adding mode and create blank inputs*/
		mode.project = 0;
		mode.state.adding = true;
		gui.controls.use('save,cancel');
		$('.column.right').addClass('modal');
		mode.createblank();
	},


	editing: function(){
		/*start editing mode and load editable values*/
		mode.project = $('.column.middle li.selected').attr('project');
		mode.state.editing = true;
		gui.controls.use('save,delete,cancel');
		mode.enableinputs();
	},


	enableinputs: function(){
		/*enable inputs*/
		$('[dataset]').attr('contenteditable','true');
		$('.column.right').addClass('modal');
	},


	disableinputs: function(){
		/*disable inputs*/
		$('[dataset]').attr('contenteditable','false');
		$('.modal').removeClass('modal');
	},


	createblank: function(){
		/*load empty detail page*/
		$('.selected').removeClass('selected');
		detail.view();
	},


	reload: function(){
		/*reload details and middle listing*/
		mode.disableinputs();
		detail.view(mode.project);
		listing.offset = $('.middle').scrollTop();
		menu.filter($('.filtered'));
	},


	cancel: function(){
		/*soft cancelling with delete checking*/
		if($('button.delete').hasClass('confirm')) {
			update.disable.cancel();
		}else{
			mode.quit();
		}
	},


	abort: function(){
		/*hardly cancel all modes*/
		if(mode.state.editing||mode.state.adding){
			update.disable.cancel();
			mode.quit();
		}
	},


	quit: function(){
		/*remove editing state*/
		mode.disableinputs();
		/*reload details or just clear*/
		if(!mode.state.deleting){
			mode.reload();
		}else{
			$('.right section *').remove();
		}
		/*load gui controls*/
		if(mode.state.adding){
			if(mode.project != 0){
				gui.controls.use('add,edit');
			}else{
				gui.controls.use('add');
			}
		}
		if(mode.state.editing){
			gui.controls.use('add,edit');
		}
		if(mode.state.deleting){
			gui.controls.use('add');
		}
		/*discharge mode states*/
		mode.state.editing = false;
		mode.state.adding = false;
		mode.state.deleting = false;
	}


}











