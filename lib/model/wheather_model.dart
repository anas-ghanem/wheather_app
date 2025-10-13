class WheatherModel {
  final String cityname;
  final DateTime date;
  final String image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String wheathercondition;

  WheatherModel({
    required this.cityname,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.wheathercondition,
  });
  factory WheatherModel.fromjson(json) {
    return WheatherModel(
      cityname: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      image: json['forecast']['forecastday'][0]['day']["condition"]["icon"],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']["maxtemp_c"],
      mintemp: json['forecast']['forecastday'][0]['day']["mintemp_c"],
      wheathercondition: json['forecast']['forecastday'][0]['day']["condition"]["text"],
    );
  }
}
