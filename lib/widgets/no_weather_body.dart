import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There is No Weather 😄 \n Start Searching Now 🔍',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
