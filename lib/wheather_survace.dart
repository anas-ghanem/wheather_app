import 'package:dio/dio.dart';
import 'package:wheather_app/model/wheather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseurl = 'https://api.weatherapi.com/v1';
  final String apikey = 'b07548a26e4b49f19f82312222520021';

  WeatherService(this.dio);

  Future<WheatherModel> getCurrentWeather({required String cityname}) async {
    try {
      Response response = await dio.get(
        '$baseurl/forecast.json',
        queryParameters: {
          'key': apikey,
          'q': cityname,
          'days': 1,
          'aqi': 'no',
          'alerts': 'no',
        },
      );
      WheatherModel wheatherModel = WheatherModel.fromjson(response.data);
      return wheatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ?? "Could not connect to server";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("Something went wrong, please try again");
    }
  }
}
