<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>list.jsp</title>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	var pos;
	var sido;
	var sigugun;

	getLocation();
	
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			alert("No");
		}
	}

	function showPosition(position) {
		pos = position.coords.longitude + ", " + position.coords.latitude;
		$.ajax({
// 			url : "../../JSPproject/map",
			url : "map.do",
			type : "POST",
			data : {
				"query" : pos
			},
			dataType : "xml",
			success : function(data) {
				var result = "";
				
				$(data).find("item").each(function() {
					sido = $(this).find("sido").text();
					sigugun = $(this).find("sigugun").text();
					
					return false;
				})
				
				window.location.href="list.do?sido=" + escape(encodeURIComponent(sido)) + "&sigugun=" + escape(encodeURIComponent(sigugun));
			},
			error : function(e) {
				alert("¿¡·¯³²:" + e);
			}
		})
		
	}

</script>
</head>
<body>
</body>
</html>