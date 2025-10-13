import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubit/get_wheather_cubit.dart';
import 'package:wheather_app/main.dart';
import 'package:wheather_app/model/wheather_model.dart';

class Wheatherinfo extends StatelessWidget {
  const Wheatherinfo({super.key, required this.wheather});
  final WheatherModel wheather;

  @override
  Widget build(BuildContext context) {
    WheatherModel wheatherModel =
        BlocProvider.of<GetWheatherCubit>(context).wheatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [getWeatherColor( wheatherModel.wheathercondition),
          getWeatherColor( wheatherModel.wheathercondition)[300]!,getWeatherColor( wheatherModel.wheathercondition)[50]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(wheatherModel.cityname,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              "updated at ${wheatherModel.date.hour}:${wheatherModel.date.minute}",
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${wheatherModel.image}'),
                Text("${wheatherModel.temp.round()}",style: TextStyle(fontSize: 20),),
                Column(
                  children: [
                    Text("max temp: ${wheatherModel.maxtemp.round()}"),SizedBox(height: 1),
                    Text("min temp: ${wheatherModel.mintemp.round()}"),
                  ],
                ),
              ],
            ),
            Text(wheatherModel.wheathercondition),
          ],
        ),
      ),
    );
  }
}
