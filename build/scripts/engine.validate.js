

/*validation instance*/
var validation = {


	valid: undefined,
	/*valid state*/


	result: function(){
		/*validate and return*/
		validation.valid = true;
		var name = $('h2[dataset]').html();
		var url = $('[dataset][relation=url]').html();
		validation.check.blankinput(name,url);
		validation.check.semicolon();
		validation.check.htmltags();
		if(mode.state.adding){
			validation.check.duplicate(name,url);
		}
		return validation.valid;
	},


	check: {
	/*validating conditions*/


		blankinput: function(name,url){
			/*provide at least headline and main domain*/
			if(
				(name == $('h2[dataset]').attr('default')) ||
				(name == '') ||
				(url == '')
			){
				validation.valid = false;
				gui.notify.warning();
			}
		},


		duplicate: function(name,url){
			/*check for duplicate projects*/
			$.ajax({
				type: 'POST',
				url: 'build/handler/handle.duplicates.php',
				data: {
					name: name,
					url: url
				},
				success: function (data) {
					if (data != 'unique') {
						validation.valid = false;
						gui.notify.duplicate();
					}
				},
				async: false
			});
		},


		semicolon: function(){
			/*no semicolons*/
			$.each($('[dataset]'), function( index, value ) {
				if ($(this).text().indexOf(';') >= 0){
					validation.valid = false;
					gui.notify.warning();
				}
			});
		},


		htmltags: function(){
			/*no copypasted html tags except breaks*/
			$.each($('[dataset]'), function( index, value ) {
				if ($(this).html().match(/<(?!br|\/br).*?>/)){
					validation.valid = false;
					gui.notify.syntax();
				}
			});
		},


	}



}