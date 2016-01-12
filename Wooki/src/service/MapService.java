package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Component;

@Component
public class MapService {

	public String executeHttp(String targetURL) {
		HttpURLConnection connection = null;

		try {
			// String targetURL2 = URLEncoder.encode(targetURL, "UTF-8");
			URL url = new URL(targetURL);
			connection = (HttpURLConnection) url.openConnection();// ø‰√ª∫∏≥ø
			connection.setRequestMethod("POST");

			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));

			StringBuffer result = new StringBuffer();
			String line;

			while ((line = br.readLine()) != null) {
				result.append(line);
			}
			br.close();
			return result.toString();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
	}

}
