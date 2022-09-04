import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue
        ),
          scaffoldBackgroundColor: Colors.white
      ),
      home: PriceScreen(),
    );
  }
}
