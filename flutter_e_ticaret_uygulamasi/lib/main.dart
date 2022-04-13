import 'package:flutter/material.dart';
import 'package:flutter_e_ticaret_uygulamasi/Kategoriler.dart';
import 'package:flutter_e_ticaret_uygulamasi/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Ticaret App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}
