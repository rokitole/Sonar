

/*modal instance*/
var modal = {


	prepare: function(element){
		/*check for relation*/
		var target = element;
		var relation = target.attr('relation');
		if(relation.indexOf('son') >= 0){
			modal.request(target,relation);
		}
	},


	request: function(target,relation){
		/*get related options*/
		$.ajax({
			type: 'POST',
			url: 'build/handler/handle.modal.php',
			data: {
				relation: relation
			},
			success: function(data){
				modal.draw(target,data);
			},
			async: false
		});
	},


	draw: function(target,data){
		/*build modal*/
		var options = data.split(';');
		var modal = $(document.createElement('div')).attr({modal:''}).attr({contenteditable:'false'});
		modal.append('<span new>Andere Eingabe</span>');
		$.each(options,function(key,option){
			modal.append('<span>'+option+'</span>');
		});
		target.append(modal);
		setTimeout(function(){
			$('[modal]').addClass('show');
		}, 1);
	},


	remove: function(){
		/*hide modal window*/
		$('[modal]').remove();
	},


	clear: function(element){
		/*clear inputs*/
		element.parent().parent().html('');
		modal.remove();
	},


	set: function(element){
		/*set item as input*/
		element.parent().parent().html(element.html());
		modal.remove();
	},


}


