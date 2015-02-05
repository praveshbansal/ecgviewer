$('table').on('click','tr',function(e){
			 $(this).addClass('highlight').siblings().removeClass('highlight')
			});
		