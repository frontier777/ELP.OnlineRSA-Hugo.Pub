//a.btn-navbar
//.main-navi .nav-collapse
//div.navbar-inner div.container div.nav-collapse

//data-class = toggle class
//data-target = targets selector
document.addEventListener('DOMContentLoaded', function() {
	document.querySelectorAll('[data-action="toggleclass"]').forEach(function(item) {
		var targetList=document.querySelectorAll(item.getAttribute('data-target'));
		var toggleClass=item.getAttribute('data-class');
		
		item.addEventListener('click', function() {
			targetList.forEach(function(target) {
				target.classList.toggle(toggleClass);
			});
		});
	});
});


