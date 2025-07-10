import 'package:first_app/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback App',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: const MyHomePage(title: 'Homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello and welcome, please tap the button below to start feedback:",
            ),

            const SizedBox(height: 15),

        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SecondPage(),
              ),
            );
          },
          child: const Text("Give Feedback"),
        ),
          ],
        ),
      ),
    );
  }
}
