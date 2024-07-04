import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = '0';
  String _input = '';
  String _operator = '';
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _input = '';
        _operator = '';
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _input = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_input);

        switch (_operator) {
          case '+':
            _output = (_num1 + _num2).toString();
            break;
          case '-':
            _output = (_num1 - _num2).toString();
            break;
          case '*':
            _output = (_num1 * _num2).toString();
            break;
          case '/':
            _output = (_num1 / _num2).toString();
            break;
        }

        _input = '';
        _operator = '';
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  Widget _buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            padding: const EdgeInsets.all(24),
            shape: const CircleBorder(),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7', Colors.grey[850]!, Colors.white),
              _buildButton('8', Colors.grey[850]!, Colors.white),
              _buildButton('9', Colors.grey[850]!, Colors.white),
              _buildButton('/', Colors.orange, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4', Colors.grey[850]!, Colors.white),
              _buildButton('5', Colors.grey[850]!, Colors.white),
              _buildButton('6', Colors.grey[850]!, Colors.white),
              _buildButton('*', Colors.orange, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1', Colors.grey[850]!, Colors.white),
              _buildButton('2', Colors.grey[850]!, Colors.white),
              _buildButton('3', Colors.grey[850]!, Colors.white),
              _buildButton('-', Colors.orange, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('0', Colors.grey[850]!, Colors.white),
              _buildButton('.', Colors.grey[850]!, Colors.white),
              _buildButton('=', Colors.orange, Colors.white),
              _buildButton('+', Colors.orange, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('C', Colors.grey[700]!, Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
