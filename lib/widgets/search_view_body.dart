
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: TextField(
          onSubmitted: (value) {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            suffixIcon:
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            labelText: 'Search',
            labelStyle: const TextStyle(
              fontSize: 20,
            ),
            hintText: 'Enter City Name',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          ),
        ),
      ),
    );
  }
}
