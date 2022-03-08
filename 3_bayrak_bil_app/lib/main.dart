import 'package:bayrak_bil_app/quizEkrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("QUİZE HOŞGELDİNİZ"),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("BAŞLA"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => QuizEkrani())));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
