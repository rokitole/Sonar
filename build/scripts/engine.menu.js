

/*menu instance*/
var menu = {


	/*list all available entries*/
	listall: function() {
		$('.filtered').removeClass('filtered');
		$('.reset').addClass('filtered');
		listing.update();
	},


	/*filter by table and ident*/
	filter: function(element){
		$('.filtered').removeClass('filtered');
		$(element).addClass('filtered');
		var table = $(element).attr('table');
		var ident = $(element).attr('ident');
		listing.update(table,ident);
	},


	/*toggle filter collapsible*/
	toggle: function(){
		$(this).parent().toggleClass('open');
	},


};


