

/*auth instance*/
var auth = {


	reload: function(){
		/*reload page*/
		location.reload();
	},


	deny: function(){
		/*deny*/
		$('input').prop('value','');
		$('.window').addClass('denied');
		setTimeout(function(){
			$('.denied').removeClass('denied');
		}, 300);
	},


	logout: function(){
		/*call session destroy*/
		$.ajax({
			type: 'POST',
			url: 'build/handler/handle.auth.php',
			data: {
				action: 'logout'
			},
			success: function(data){
				if(data == 'quit') {
					auth.reload();
				}
			},
			async: false
		});
	},


	login: function(){
		/*login*/
		var keyword = $('input').prop('value');
		auth.remember.check(keyword);
		$.ajax({
			type: 'POST',
			url: 'build/handler/handle.auth.php',
			data: {
				action: 'login',
				keyword: keyword
			},
			success: function(data){
				if(data == 'valid') {
					auth.reload();
				}else{
					auth.deny();
				}
			},
			async: false
		});
	},


	remember: {
		/*provide remember password functionality*/


		check: function(keyword){
			/*check input*/
			if($('[remember]').attr('remember') == 'yes'){
				localStorage.sonar_remember = keyword;
				localStorage.sonar_today = Math.round((new Date()).getTime()/1000);
			}
		},


		toggle: function(){
			/*toggle element state*/
			if($('[remember]').attr('remember') == 'yes'){
				$('[remember]').attr('remember','no');
			}else{
				$('[remember]').attr('remember','yes');
			}
		},


		prefill: function(){
			/*remember handling*/
			if( localStorage.sonar_today < (Math.round((new Date()).getTime()/1000)-86400) ){
				localStorage.removeItem('sonar_remember');
				localStorage.removeItem('sonar_today');
			}else{
				$('input').prop('value',localStorage.sonar_remember);
			}
		},


	}


}


