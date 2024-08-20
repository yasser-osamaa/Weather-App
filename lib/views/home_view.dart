import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/info_weather_body.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
//import 'package:weather_app/widgets/no_weather_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 194, 237),
        title: const Text(
          'Weather Daily',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is StartedState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return InfoWeatherBody(
              model: state.weatherModel,
            );
          } else if (state is WeatherFailureState) {
            return Text('oops has an error, in ${state.errorMsg}');
          } else {
            return const Text('oops has an error, try later');
          }
        },
      ),
    );
  }
}
