import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String displayText = "0";
  String input = "";

  void onButtonPress(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        displayText = "0";
      } else {
        input += value;
        displayText = input;
      }
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onButtonPress(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 22),
            shape: const CircleBorder(),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              displayText,
              style: const TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),

          const SizedBox(height: 20),

          // Buttons
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton("7", Colors.grey.shade800),
                    buildButton("8", Colors.grey.shade800),
                    buildButton("9", Colors.grey.shade800),
                    buildButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey.shade800),
                    buildButton("5", Colors.grey.shade800),
                    buildButton("6", Colors.grey.shade800),
                    buildButton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey.shade800),
                    buildButton("2", Colors.grey.shade800),
                    buildButton("3", Colors.grey.shade800),
                    buildButton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("0", Colors.grey.shade800),
                    buildButton("%", Colors.grey.shade700),
                    buildButton("C", Colors.grey.shade700),
                    buildButton("+", Colors.orange),
                  ],
                ),
                // "=" Button
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () => onButtonPress("="),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 22),
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            "=",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
