import 'package:flutter/material.dart';
import 'package:sport_ease/presentation/screen/reset_password_screen.dart';
import '../screen/splash_screen.dart';
import '../screen/opening_screen.dart';
import '../screen/login_screen.dart';
import '../screen/register_screen.dart';
import '../screen/home_screen.dart';

class AppRoute{
  static const String splash = '/splash';
  static const String opening = '/opening';
  static const String login = '/login';
  static const String register = '/register';
  static const String resetpassword = '/reset';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case opening:
        return MaterialPageRoute(builder: (_) => OpeningScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case resetpassword:
        return MaterialPageRoute(builder: (_) => ResetPassword());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('Halaman tidak ditemukan.'),),
        ));
    }
  }
}