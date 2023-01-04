
import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // If the user presses the button, _isButtonPressed is set to true
  // Then the button will be disable
  bool _isButtonPressed = false;

  // show a blue box when _showBox == true
  bool _showBox = false;

  void _startTimer() {
    // Disable the button after it has been pressed
    setState(() {
      _isButtonPressed = true;
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showBox = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // appBar: AppBar(title: const Text('KindaCode.com')),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isButtonPressed == false ? _startTimer : null,
                  child: const Text('Show The Blue Box'),
                ),
                _showBox == true
                    ? Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.blue,
                      )
                    : const Text(
                        'Press the button and wait for 3 seconds to see the box',
                        textAlign: TextAlign.center,
                      )
              ]),
        ));
  }
}
