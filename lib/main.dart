import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubit/get_wheather_cubit.dart';
import 'package:wheather_app/cubit/wheather_status.dart';
import 'package:wheather_app/home_viwer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWheatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWheatherCubit, wheather_status>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getWeatherColor(
                    BlocProvider.of<GetWheatherCubit>(
                      context,
                    ).wheatherModel?.wheathercondition,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: HOME_viewr(),
              );
            },
          );
        },
      ),
    );
  }
}

class custommaterial extends StatelessWidget {
  const custommaterial({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: getWeatherColor(
            BlocProvider.of<GetWheatherCubit>(
              context,
            ).wheatherModel?.wheathercondition,
          ),
        ),
        primarySwatch: getWeatherColor(
          BlocProvider.of<GetWheatherCubit>(
            context,
          ).wheatherModel?.wheathercondition,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HOME_viewr(),
    );    
  }
}

MaterialColor getWeatherColor(condition) {
  Map<String, MaterialColor> weatherColors = {
    "null": Colors.grey,
    "Sunny": Colors.orange,
    "Partly cloudy": Colors.blueGrey,
    "Cloudy": Colors.grey,
    "Overcast": Colors.brown,
    "Mist": Colors.blueGrey,
    "Patchy rain possible": Colors.lightBlue,
    "Patchy snow possible": Colors.cyan,
    "Patchy sleet possible": Colors.indigo,
    "Thundery outbreaks possible": Colors.deepPurple,
    "Blowing snow": Colors.blue,
    "Blizzard": Colors.blue,
    "Fog": Colors.blueGrey,
    "Freezing fog": Colors.teal,
    "Light rain": Colors.lightBlue,
    "Moderate rain": Colors.blue,
    "Heavy rain": Colors.indigo,
    "Light snow": Colors.cyan,
    "Moderate snow": Colors.blue,
    "Heavy snow": Colors.indigo,
    "Ice pellets": Colors.teal,
    "Torrential rain shower": Colors.deepPurple,
    "Patchy light rain with thunder": Colors.deepOrange,
    "Moderate or heavy snow with thunder": Colors.purple,
  };

  return weatherColors[condition] ?? Colors.blue;
}
