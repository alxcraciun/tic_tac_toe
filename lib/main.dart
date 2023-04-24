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
  bool playerTurn = true; // true = player1
  List<Color> tableColors = List<Color>.generate(9, (int index) => Colors.white);

  List<Widget> table = List<Widget>.generate(
    9,
    (int index) => GestureDetector(
      onTap: () {
        setState(() {
          if(playerTurn) {
            tableColors[index] = Colors.green;
          }
          else {
            tableColors[index] = Colors.red;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(border: Border.all()),
        color: tableColors[index],
        child: Text('$index'),
      ),
    ),
  );

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
