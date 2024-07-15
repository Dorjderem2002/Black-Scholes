import 'package:black_scholes_model/backend/option_data.dart';
import 'package:black_scholes_model/home.dart';
import 'package:black_scholes_model/sidemenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  OptionParameters data =
      OptionParameters(S: 0, K: 0, sigma: 0, r: 0, T: 0, delta: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            SideMenu(
              options: data,
              onChange: onChange,
            ),
            Expanded(
              child: Home(options: data),
            )
          ],
        ),
      ),
    );
  }

  void onChange() {
    setState(() {});
  }
}
