import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r1a_portfolio/app_state.dart';
import 'package:r1a_portfolio/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AppState(
        triesLeft: 8,
      ),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'R1A Portfolio',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const StartPage(),
      ),
    );
  }
}