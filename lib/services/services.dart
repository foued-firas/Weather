import 'package:weather/utils/consts.dart';
import 'package:weather/model/weather.dart';
import 'package:http/http.dart' as http;

import 'package:weather/main.dart'
;

class WeatherServices {
  Future<WeatherModel> getWeather(String cityName) async {
    final response =
        await http.get(Uri.parse("$BASE_URL?q=$cityName&appid=$API_KEY"));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error getting weather");
    }
  }
  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
String? cityName = placeMark[0].locality;
    return cityName ?? "gabes";
  }
   
}