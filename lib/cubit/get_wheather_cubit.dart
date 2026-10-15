import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/model/wheather_model.dart';
import 'package:wheather_app/wheather_survace.dart';

import 'wheather_status.dart';

class GetWheatherCubit extends Cubit<wheather_status> {
  GetWheatherCubit() : super(nowheather());
  WheatherModel? wheatherModel;

  getwheather({required String cityname}) async {
    emit(wheather_loading());
    try {
      wheatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityname: cityname);
      emit(wheather_data(wheatherModel: wheatherModel!));
    } on Exception catch (e) {
      emit(erorr(message: e.toString().replaceAll('Exception: ', '')));
    }
  }
}
