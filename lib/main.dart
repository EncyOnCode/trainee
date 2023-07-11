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
      theme: ThemeData(fontFamily: 'Mark Pro', useMaterial3: true),
    );
  }
}
