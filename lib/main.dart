import 'package:example_project/views/resultView.dart';
import 'package:example_project/views/userListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'views/calculatorView/calculatorView.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xff4E31AA),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ),
        ),
        // I will create a BMI Calculator
        home: const HomeView(),
        routes: <String, WidgetBuilder>{
          // '/calculate': (BuildContext context) => const HomeView(),
          '/result': (BuildContext context) => const ResultsView(),
        });
  }
}
