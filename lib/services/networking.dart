import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {
  final String url;

  NetworkingHelper({required this.url});

  Future getUserLocationFromAPI() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "Something went wrong!";
    }
  }
}
