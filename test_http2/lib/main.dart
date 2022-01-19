import 'package:flutter/material.dart';
import 'package:test_http2/views/HomePage.dart';
import 'package:test_http2/widgets/create_page.dart';
import 'package:test_http2/widgets/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage(), routes: {
      'home': (context) => const HomePage(),
      'create': (context) => const CreatePage(),
      'update': (context) => const UpdatePage(),
    });
  }
}
