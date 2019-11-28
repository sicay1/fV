import 'package:flutter/material.dart';
import 'package:videoplayer1/screens/HomeScreen.dart';

class RouteGen {
  static Route<dynamic> genRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
         return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/viewscreen':
        // return MaterialPageRoute(builder: (_) => ViewScreen());
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