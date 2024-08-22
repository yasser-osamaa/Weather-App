import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class InfoWeatherBody extends StatelessWidget {
  const InfoWeatherBody({super.key, required this.model});
  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getWeatherColor(model.weatherCondition),
            getWeatherColor(model.weatherCondition)[300]!,
            getWeatherColor(model.weatherCondition)[50]!,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.cityName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                'updated at ${model.date.hour}:${model.date.minute}',
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 22),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https:${model.image}',
                    //height: 100,
                    //width: 100,
                  ),
                  Text(
                    ' ${model.temp.round()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  Column(
                    children: [
                      Text(
                        'MaxTemp:${model.maxTemp.toInt()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      Text(
                        'MinTemp:${model.minTemp.round()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                model.weatherCondition,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
