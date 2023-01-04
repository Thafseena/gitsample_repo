import 'package:flutter/material.dart';
import 'dart:async';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         // Hide the debug banner
//         debugShowCheckedModeBanner: false,
//         title: 'Kindacode.com',
//         home: HomeScreen());
//   }
// }

class TimerCountScreen extends StatefulWidget {
  const TimerCountScreen({Key? key}) : super(key: key);

  @override
  State<TimerCountScreen> createState() => _TimerCountScreenState();
}

class _TimerCountScreenState extends State<TimerCountScreen> {
  // This list hold the items of the list view
  final List<String> _items = [];

  // This variable determines whether the timer runs or not
  bool _isRunning = true;

  // This function will add a new item to the list every 1 second
  void _addItem() {
    final DateTime now = DateTime.now();
    
    setState(() {
      _items.add("${now.hour}:${now.minute}:${now.second}");
    });
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!_isRunning) {
        // cancel the timer
        timer.cancel();
      }
      _addItem();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Kindacode.com'),
      // ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            color: Colors.amber,
            elevation: 5,
            child: ListTile(
              title: Text(_items[index]),
            ),
          );
        },
      ),
      // This button will stop the timer
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isRunning = false;
          });
        },
        child: const Icon(Icons.stop_circle),
      ),
    );
  }
}