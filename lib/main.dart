import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  // primaryColor: getWeatherColor(
                  //     BlocProvider.of<GetWeatherCubit>(context)
                  //         .weatherModel
                  //         ?.weatherCondition),
                  appBarTheme: AppBarTheme(
                    backgroundColor: getWeatherColor(BlocProvider.of<
                            GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition), // Explicitly set the AppBar color
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
    case "clear":
      return Colors.orange;
    case "partly cloudy":
      return Colors.lightBlue;
    case "cloudy":
      return Colors.grey;
    case "overcast":
      return Colors.blueGrey;
    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.teal;
    case "patchy rain possible":
    case "light drizzle":
    case "light rain":
      return Colors.lightBlue;
    case "moderate rain":
    case "heavy rain":
      return Colors.blue;
    case "patchy snow possible":
    case "light snow":
    case "snow showers":
    case "moderate snow":
    case "heavy snow":
      return Colors.cyan;
    case "thundery outbreaks possible":
    case "light rain with thunder":
    case "moderate rain with thunder":
    case "heavy rain with thunder":
      return Colors.purple;
    default:
      return Colors.blueGrey; // Default color for unspecified conditions
  }
}
