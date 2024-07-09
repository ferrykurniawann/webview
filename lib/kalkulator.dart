import 'package:flutter/material.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({Key? key}) : super(key: key);

  @override
  
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  String display = '0';
  String operator = '';
  int firstOperand = 0;
  int secondOperand = 0;

  void inputNumber(int value) {
    setState(() {
      if (operator.isEmpty) {
        firstOperand = firstOperand * 10 + value;
        display = firstOperand.toString();
      } else {
        secondOperand = secondOperand * 10 + value;
        display = secondOperand.toString();
      }
    });
  }

  void setOperator(String newOperator) {
    setState(() {
      if (operator.isEmpty) {
        operator = newOperator;
        display = '$firstOperand $operator';
      }
    });
  }

  void calculateResult() {
    setState(() {
      int result;
      switch (operator) {
        case '+':
          result = firstOperand + secondOperand;
          break;
        case '-':
          result = firstOperand - secondOperand;
          break;
        case '*':
          result = firstOperand * secondOperand;
          break;
        case '/':
          if (secondOperand != 0) {
            result = firstOperand ~/ secondOperand;
          } else {
            result = 0; // Avoid division by zero
          }
          break;
        default:
          result = 0;
      }
      display = result.toString();
      firstOperand = result;
      secondOperand = 0;
      operator = '';
    });
  }

  void clearCalculator() {
    setState(() {
      display = '0';
      operator = '';
      firstOperand = 0;
      secondOperand = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: clearCalculator,
          tooltip: 'Clear',
          child: const Text('C'),
        ),
        
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.lightBlue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 12.0),
                child: Text(
                  display,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  buildButtonRow(['1', '2', '3', '+']),
                  buildButtonRow(['4', '5', '6', '-']),
                  buildButtonRow(['7', '8', '9', '*']),
                  buildButtonRow(['0', '=', '/']),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildButtonRow(List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.map((label) {
        return CalculatorButton(
          label: label,
          onPressed: () {
            if (label == '+' || label == '-' || label == '*' || label == '/') {
              setOperator(label);
            } else if (label == '=') {
              calculateResult();
            } else {
              inputNumber(int.parse(label));
            }
          },
        );
      }).toList(),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CalculatorButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}