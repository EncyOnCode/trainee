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
      theme: ThemeData(
        fontFamily: 'Mark Pro'
      ),
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
          backgroundColor: Colors.white,
          title: const Center(
            child: GPSWidget(cityName: 'Czech, Prague'),
          )),
      body: const Center(),
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
        const Icon(Icons.pin_drop, color: Color(0xFFFF6E4E),),
        const SizedBox(width: 8),
        Text(
          cityName,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF010035)
          ),
        ),
        Spacer(),
        Icon(Icons.filter_list_alt, color: Color(0xFF010035), size: 17,)
      ],
    );
  }
}

