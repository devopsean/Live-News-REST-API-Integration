import 'package:flutter/material.dart';
import 'package:rest_api_integration_youtube/pages/homepage.dart';
import 'package:rest_api_integration_youtube/services/api_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    API_Manager().getNews();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
