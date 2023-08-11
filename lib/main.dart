import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '/src/core/app_router.dart';

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
        fontFamily: 'Mark Pro',
        useMaterial3: true,
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              );
            }
            return null;
          }),
        ),
      ),
    );
  }
}
