import 'package:flutter/material.dart';
import 'route.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // home: new ImagesPage(),
      // home: new ViewScreen(),
      initialRoute: '/',
      onGenerateRoute: RouteGen.appRouter,
    );
  }
}
