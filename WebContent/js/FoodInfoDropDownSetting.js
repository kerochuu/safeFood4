$(function(){	
$('.dropdownInfo li').click(function(){
		localStorage.setItem("isFirst", true);
		localStorage.setItem("searchWord", 'default');
	});
});