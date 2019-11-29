import 'package:flutter/material.dart';
import 'package:videoplayer1/screens/HomeScreen.dart';
import 'package:videoplayer1/screens/VideoScreen.dart';

class RouteGen {
  static Route<dynamic> appRouter(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/videoscreen':
        return MaterialPageRoute(builder: (_) => VideoScreen());
      default:
        return _errRoute();
    }
  }

  static Route<dynamic> _errRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}