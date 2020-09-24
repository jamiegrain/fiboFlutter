import 'package:flutter/material.dart';

void main() {
  runApp(FiboApp());
}

class FiboApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(backgroundColor: Colors. black26,
            body: Counter()));
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int n1 = 0;
  int n2 = 1;

  final n = new TextEditingController();

  void countUp() {
    int n3 = n2 + n1;
    setState(() {
      n1 = n2;
      n2 = n3;
    });
  }

  void findNthFibo(String input) {
    if (input != "") {
      int intInput = int.parse(input);
      setState(() {
        n1 = 0;
        n2 = 1;
      });
      for (int i = 0; i <= intInput; i++) {
        countUp();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    n1.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48
                    ),
                  ),
                  TextField(
                    controller: n,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter a number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white
                    ),
                    style: TextStyle(
                      color: Colors.black26,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  FlatButton(onPressed: () {
                    findNthFibo(n.text);
                    },
                  child: Text("Find Fibo"),
                  color: Colors.white)
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
