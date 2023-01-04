import 'dart:async';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}


class _TimerPageState extends State<TimerPage> {

bool _isButtonPressed=false;
bool _showtext=false;
void _startTimer() {
    // Disable the button after it has been pressed
    setState(() {
      _isButtonPressed = true;
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showtext = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: 
          [Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                     child: ElevatedButton(
                      onPressed:_isButtonPressed==false? _startTimer:null, child: Text('Time'),
                     // tooltip: 'Increment',
                      //child: const Icon(Icons),
                    ), 
                  ),
                  _showtext==true?Text('data')
                  :Text('Press the button and wait to see the text',
                  //textAlign: TextAlign.center,
                  ),
                  
                ],
              ),
      
            ],
          ),
        ],
      ),
    );
  }
}