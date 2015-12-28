

/*listing instance*/
var listing = {


	offset: 0,	/*preserve scroll*/


	rescroll: function(){
		/*scroll to offset*/
		$('.middle').scrollTop(listing.offset);
	},


	clear: function(){
		/*remove all items from listing*/
		$('.middle [meta]').remove();
		$('.middle ul li').remove();
		$('.middle ul').removeClass('show');
	},


	reselect: function(project){
		/*select the formerly clicked panel*/
		$('[project='+project+']').addClass('selected');
	},


	meta: function(data){
		/*append listing count*/
		var wording,slug;
		data.count == '1' ? wording = 'Ergebnis' : wording = 'Ergebnisse';
		slug = data.count+' '+wording;
		$('.middle ul').before('<div meta><div class="box"><span contenteditable slug="'+slug+'">'+slug+'</span><i class="icon search use fa fa-search" title="Ergebnis durchsuchen"></i><i class="icon reveal fa fa-times" title="Suche beenden"></i></div></div>');
	},


	draw: function(data){
		/*append new panels*/
		$('.middle ul').append(data.listing);
		gui.tween('.middle ul');
		gui.progress.hide();
	},


	ping: function(){
		/*call sonar pings*/
		$('.middle .ping').each(function(){
			var panel = $(this).attr('panel');
			var href = $(this).children().attr('href');
			ping.call(panel,href);
		});
	},


	select: function(panel){
		/*select project*/
		$('.selected').removeClass('selected');
		panel.addClass('selected');
		detail.view(panel.attr('project'));
		gui.controls.use('add,edit');
	},


	request: function(table,ident){
		/*request panels*/
		$.ajax({
			type: 'POST',
			url: 'build/handler/handle.listing.php',
			dataType: 'json',
			cache: false,
			data: {
				table: table,
				ident: ident
			},
			success: function(data){
				listing.meta(data);
				listing.draw(data);
				listing.ping();
				listing.reselect(mode.project);
				listing.rescroll();
			},
			async: true
		});
	},


	update: function(table,ident){
		/*update middle listing*/
		gui.progress.show();
		listing.clear();
		listing.request(table,ident);
	},


	search: {
	/*search handler*/


		go: function(){
			/*search extension*/
			$('.fault').removeClass('fault');
			var search = $('[meta]').text();
			if(search != ''){
				$.each($('.middle li'), function( index, value ) {
					if (!($(this).text().indexOf(search) >= 0)){
						$(this).addClass('fault');
					}
				});
			}
		},


		focus: function(){
			/*focus input span*/
			if($('[meta] span').text() == $('[meta] span').attr('slug')){
				$('[meta] span').html('');
			}
			$('[meta] span').focus();
			$('[meta]').addClass('active');
			$('[meta] .icon').removeClass('use');
			$('[meta] .icon.reveal').addClass('use');
		},


		reveal: function(){
			/*reset search*/
			$('.middle li').removeClass('fault');
			$('[meta] span').text($('[meta] span').attr('slug'));
			$('[meta]').removeClass('active');
			$('[meta] .icon').removeClass('use');
			$('[meta] .icon.search').addClass('use');
		},


	},


};





