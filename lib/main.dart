import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(title: 'Tic-tac-toe'),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> table = List<Widget>.generate(9,
        (int index) => Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black
                width: 1px,
            )
        ),
        child: Text('$index')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(widget.title))),
      body: GridView.count(
        crossAxisCount: 3,
        children: table,
      ),
    );
  }
}
