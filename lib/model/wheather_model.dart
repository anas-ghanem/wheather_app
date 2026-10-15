class WheatherModel {
  final String cityname;
  final DateTime date;
  final String image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String wheathercondition;
  final int humidity;
  final double windKph;
  final double feelsLikeC;
  final double uv;

  WheatherModel({
    required this.cityname,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.wheathercondition,
    required this.humidity,
    required this.windKph,
    required this.feelsLikeC,
    required this.uv,
  });

  factory WheatherModel.fromjson(json) {
    final current = json["current"];
    final forecast = json['forecast']['forecastday'][0]['day'];
    return WheatherModel(
      cityname: json["location"]["name"],
      date: DateTime.parse(current["last_updated"]),
      image: current["condition"]["icon"],
      temp: (current["temp_c"] as num).toDouble(),
      maxtemp: (forecast["maxtemp_c"] as num).toDouble(),
      mintemp: (forecast["mintemp_c"] as num).toDouble(),
      wheathercondition: forecast["condition"]["text"],
      humidity: (current["humidity"] as num).toInt(),
      windKph: (current["wind_kph"] as num).toDouble(),
      feelsLikeC: (current["feelslike_c"] as num).toDouble(),
      uv: (current["uv"] as num).toDouble(),
    );
  }
}
