window.onload = function() {
	document.forms[0]
		.addEventListener('submit', myclick, false);		//ID : btnCalc인 버튼을 클릭하면 myclick()함수 호출.
	
}

function myclick(evt) {
	var f = this;	//this = document.forms[0]	//0번째 form을 f로 저장.
	if(!f.username || !f.age || !f.height || !f.weight) {	//자바스크립트의 string에 값이 없으면 false 	//username안쓰면
		alert("필수 입력 값 처리해 주세요.");
		return false;
		//evt.preventDefault();		//이벤트 전파 막기.
	};
	f.action = "/1103/bmiserver.jsp";
	f.method="post";
	f.submit();
}