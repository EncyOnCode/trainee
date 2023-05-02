import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().config(),
    );
  }
}

@RoutePage()
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: GPSWidget(cityName: 'Prague'),
        )
      ),
      body: const Center(
        child: GPSWidget(
            cityName: 'Prague',
        ),
      ),
    );
  }
}

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class GPSWidget extends StatelessWidget {
  final String cityName;

  const GPSWidget({Key? key, required this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.pin_drop),
        const SizedBox(width: 8),
        Text(
          cityName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
