import 'package:flutter/widgets.dart';
import 'package:wheather_app/model/wheather_model.dart';

import 'get_wheather_cubit.dart';

  class wheather_status {}
class nowheather extends wheather_status{}
class wheather_data extends wheather_status{
  final WheatherModel wheatherModel;
  wheather_data({required this.wheatherModel});
}
class erorr extends wheather_status{
  final String message;
  erorr({required this.message});
  
}