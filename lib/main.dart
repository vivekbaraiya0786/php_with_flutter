import 'package:flutter/material.dart';
import 'package:php_with_flutter/views/screens/homepage.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + PHP CRUD',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        // '/create': (context) => Create(),
        // '/details': (context) => Details(),
        // '/edit': (context) => Edit(),
      },
    );
  }
}