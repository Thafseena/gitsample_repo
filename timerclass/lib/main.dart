import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:timerclass/SharedPrefs.dart';
void main() async{
 
  runApp( TestWidget());
}

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late DateTime _lastButtonPress;
  late String _pressDuration;
  late Timer _ticker;
   late SharedPreferences _sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Time since button pressed"),
            Text(_pressDuration),
            ElevatedButton(
              child: Text("Press me"),
              onPressed: ()async {
                _lastButtonPress = DateTime.now();
                _updateTimer();
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
                _sharedPreferences.setString("lastButtonPress",_lastButtonPress.toIso8601String());
              },
            )
          ],
        ),
      ),
    );
  }


  @override
  void initState() {
   // super.initState();
     
    final lastPressString = _sharedPreferences.getString("lastButtonPress");
    _lastButtonPress = lastPressString!=null ? DateTime.parse(lastPressString) : DateTime.now();
    _updateTimer();
    _ticker = Timer.periodic(Duration(seconds:1),(_)=>_updateTimer());
  }


  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }



  void _updateTimer() {
    final duration = DateTime.now().difference(_lastButtonPress);
    final newDuration = _formatDuration(duration);
    setState(() {
      _pressDuration = newDuration;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}






// import 'package:flutter/material.dart';
// import 'package:timerclass/eg.dart';
// import 'package:timerclass/timer.dart';
// import 'package:timerclass/timercounting.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Timer Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text(widget.title)),
//       ),
//       body: TimerCountScreen(),
//       // body: Center(
//       //   child: Column(
         
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: <Widget>[
//       //       Padding(
//       //         padding: const EdgeInsets.all(8.0),
//       //         child: const Text(
//       //           'You have pushed the button this many times:',
//       //         ),
//       //       ),
//       //       Text(
//       //         '$_counter',
//       //         style: Theme.of(context).textTheme.headline4,
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _incrementCounter,
//       //   tooltip: 'Increment',
//       //   child: const Icon(Icons.add),
//       // ), 
//     );
//   }
// }
