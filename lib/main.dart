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
              final condition = BlocProvider.of<GetWheatherCubit>(context)
                  .wheatherModel
                  ?.wheathercondition;
              final colors = getWeatherGradient(condition);
              return MaterialApp(
                theme: ThemeData(
                  useMaterial3: true,
                  fontFamily: 'Roboto',
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor: colors[0],
                  colorScheme: ColorScheme.dark(
                    primary: colors[1],
                    secondary: colors[2],
                    surface: colors[0],
                  ),
                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    titleTextStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HOME_viewr(),
              );
            },
          );
        },
      ),
    );
  }
}

/// Returns a gradient of 3 colors based on the weather condition.
List<Color> getWeatherGradient(String? condition) {
  if (condition == null) {
    return [
      const Color(0xFF1A1A2E),
      const Color(0xFF16213E),
      const Color(0xFF0F3460),
    ];
  }

  final lower = condition.toLowerCase();

  if (lower.contains('sunny') || lower.contains('clear')) {
    return [
      const Color(0xFFF97316),
      const Color(0xFFFB923C),
      const Color(0xFFFDE68A),
    ];
  } else if (lower.contains('thunder')) {
    return [
      const Color(0xFF1E1B4B),
      const Color(0xFF312E81),
      const Color(0xFF4338CA),
    ];
  } else if (lower.contains('snow') || lower.contains('blizzard') || lower.contains('ice')) {
    return [
      const Color(0xFF164E63),
      const Color(0xFF0E7490),
      const Color(0xFF67E8F9),
    ];
  } else if (lower.contains('heavy rain') || lower.contains('torrential')) {
    return [
      const Color(0xFF1E3A5F),
      const Color(0xFF1E40AF),
      const Color(0xFF3B82F6),
    ];
  } else if (lower.contains('rain') || lower.contains('drizzle') || lower.contains('sleet')) {
    return [
      const Color(0xFF1E3A5F),
      const Color(0xFF2563EB),
      const Color(0xFF60A5FA),
    ];
  } else if (lower.contains('fog') || lower.contains('mist') || lower.contains('haze')) {
    return [
      const Color(0xFF374151),
      const Color(0xFF4B5563),
      const Color(0xFF9CA3AF),
    ];
  } else if (lower.contains('overcast')) {
    return [
      const Color(0xFF374151),
      const Color(0xFF4B5563),
      const Color(0xFF6B7280),
    ];
  } else if (lower.contains('cloudy') || lower.contains('partly')) {
    return [
      const Color(0xFF1E3A5F),
      const Color(0xFF3B82F6),
      const Color(0xFF93C5FD),
    ];
  }

  return [
    const Color(0xFF1A1A2E),
    const Color(0xFF16213E),
    const Color(0xFF0F3460),
  ];
}

/// Returns the appropriate weather icon based on condition text.
IconData getWeatherIcon(String? condition) {
  if (condition == null) return Icons.wb_sunny_outlined;

  final lower = condition.toLowerCase();

  if (lower.contains('sunny') || lower.contains('clear')) {
    return Icons.wb_sunny_rounded;
  } else if (lower.contains('thunder')) {
    return Icons.thunderstorm_rounded;
  } else if (lower.contains('snow') || lower.contains('blizzard') || lower.contains('ice')) {
    return Icons.ac_unit_rounded;
  } else if (lower.contains('rain') || lower.contains('drizzle') || lower.contains('sleet')) {
    return Icons.water_drop_rounded;
  } else if (lower.contains('fog') || lower.contains('mist') || lower.contains('haze')) {
    return Icons.foggy;
  } else if (lower.contains('cloud') || lower.contains('overcast')) {
    return Icons.cloud_rounded;
  }

  return Icons.wb_cloudy_rounded;
}
