import 'package:flutter/material.dart';

void main() {
  runApp(SOSGame());
}

class SOSGame extends StatelessWidget {
  const SOSGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // 3x3 grid placeholder
  List<List<String>> grid = List.generate(3, (_) => List.generate(3, (_) => ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Game Grid
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (row) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (col) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // Toggle between "S" and "O" for now
                          grid[row][col] = grid[row][col] == 'S' ? 'O' : 'S';
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          grid[row][col], // Display S or O
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ),
          // Reset Button
          ElevatedButton(
            onPressed: () {
              setState(() {
                grid = List.generate(3, (_) => List.generate(3, (_) => ''));
              });
            },
            child: const Text('Reset Game'),
          ),
        ],
      ),
    );
  }
}
