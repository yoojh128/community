package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.MapService;

@Controller
public class MapController {

	private MapService service;

	@Autowired
	public void setService(MapService service) {
		this.service = service;
	}

	@RequestMapping("/map.do")
	public void map(HttpServletRequest request, HttpServletResponse response) {
		String query = request.getParameter("query");

		String requestURL = null;
		try {
			requestURL = "http://openapi.map.naver.com/api/reversegeocode?"
					+ "key=e83dd9c677382556561546a3c8f1b903&encoding=utf-8&coord=latlng&output=xml&" + "query="
					+ URLEncoder.encode(query, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String result = service.executeHttp(requestURL);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		writer.print(result);
	}
}
