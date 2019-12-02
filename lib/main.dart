import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'Config/app_settings.config.dart';
import 'route.dart';

void main() {
  GlobalConfiguration().loadFromMap(appSettings);
  runApp(Home());
}

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
