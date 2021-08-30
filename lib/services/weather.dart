import 'package:weather_app_dev/services/location.dart';
import 'package:weather_app_dev/services/networking.dart';

class WeatherModel {
  String urlForAPI = "";
  String apiKey = "b732784c0095a70a5d440dc2f397ed68";

  Future<dynamic> getWeatherData() async {
    Location new_location = Location();
    await new_location.getCurrentLocation();

    var latitude = new_location.latitude;
    var longitude = new_location.longitude;
    var urlForAPI =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

    NetworkingHelper netwokinghelper = NetworkingHelper(url: urlForAPI);

    var decodedData = await netwokinghelper.getUserLocationFromAPI();

    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
