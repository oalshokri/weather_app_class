import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/services/location.dart';

const apiKey = 'f716a43596a928023a827e6beeb88596';

class NetworkHelper {
  Future<dynamic> getData(Location location) async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> getDataByCityName(String city) async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
