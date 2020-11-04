window.onload = function() {		// body의 트리구조 생성된 후, onload 호출.
	let form = document.forms[0];
	let deptnos = document.getElementsByName("deptno");
	deptnos[0].addEventListener('change', function() {		//직접 function 정의해서 사용.
		form.action = "applicationdemo1.jsp";		//자기 자신을 호출.
		form.method = "GET";
		form.submit();
	}, false);		
	
}