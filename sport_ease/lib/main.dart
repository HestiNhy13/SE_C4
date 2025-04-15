import 'package:flutter/material.dart';
import './presentation/routes/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SportEase',
      initialRoute: AppRoute.splash,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
