

/*init*/
$(document).ready(function(){


	/*basic calls*/
	auth.remember.prefill();
	menu.listall();
	gui.controls.use('add');


	/*register events*/
	$(document).on('click', '[remember]', auth.remember.toggle);
	$(document).on('click', '[unlock]', auth.login);
	$(document).on('click', '.logout', auth.logout);
	$(document).on('click', '.left ul li span', menu.toggle);
	$(document).on('click', '.reset', menu.listall);
	$(document).on('click', '.filter', function(){ menu.filter($(this)) });
	$(document).on('click', '.middle li', function(){ listing.select($(this)) });
	$(document).on('click', '[meta] span', listing.search.focus);
	$(document).on('click', '[meta] .search', listing.search.focus);
	$(document).on('click', '[meta] .reveal', listing.search.reveal);
	$(document).on('click', '[modal] span[new]', function(){ modal.clear($(this)) });
	$(document).on('click', '[modal] span', function(){ modal.set($(this)) });
	$(document).on('click', 'button.add', mode.adding);
	$(document).on('click', 'button.edit', mode.editing);
	$(document).on('click', 'button.cancel', mode.cancel)
	$(document).on('click', '.column.left li li', mode.abort);
	$(document).on('click', '.column.middle li', mode.abort);
	$(document).on('click', '.column:not(.right)', mode.abort);
	$(document).on('click', 'button.save', update.save.execute);
	$(document).on('click', 'button.delete', update.disable.confirm);
	$(document).on('click', 'button.delete.confirm', update.disable.execute);
	$(document).on('click', '[relation=url]', detail.link);
	$(document).on('mouseover', '[brand]', ping.indicate.show);
	$(document).on('mouseleave', '[brand]', ping.indicate.hide);
	$(document).on('focus', '[dataset]', function(){ modal.prepare($(this)) });
	$(document).on('blur', '[dataset]', modal.remove);
	$(document).on('keypress', 'input', function(key){ if (key.which == 13) { auth.login(); } });
	$(document).on('keyup', '[meta]', listing.search.go);
	$(document).on('keyup', function(key){ if (key.which == 27) { mode.abort() } });


});

