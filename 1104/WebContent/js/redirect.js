window.onload = function() {		// body의 트리구조 생성된 후, onload 호출.
	var form = document.forms[0];
	var searchs = document.getElementsByName("search");
	searchs[0].addEventListener('change', function() {		//직접 function 정의해서 사용.
		form.action = "search.jsp";
		form.method = "GET";
		form.submit();
	}, false);		
	
}