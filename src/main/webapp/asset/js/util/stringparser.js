/**
 * query 스트링 js단에서 사용하기 위한 QueryString parser입니다.
 */
function getParam(name) {
	var curr_url = location.search.substr(location.search.indexOf("?") + 1);
	var svalue = "";
	curr_url = curr_url.split("&");
	for (var i = 0; i < curr_url.length; i++) {
		var temp = curr_url[i].split("=");
		if ([temp[0]] == name) { svalue = temp[1]; }
	}
	return svalue;
}