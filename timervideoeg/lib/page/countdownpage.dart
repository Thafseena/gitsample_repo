import 'dart:async';

import 'package:flutter/material.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({super.key});

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  Duration duration = Duration();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: buildTime(),
        ),
      );

  Widget buildTime() {
//below code 9---> 09 shows
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours=twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: hours, header: 'HOURS'),
        const SizedBox(
          width: 8,
        ),
        buildTimeCard(time: minutes, header: 'MINUTES'),
        const SizedBox(
          width: 8,
        ),
        buildTimeCard(time: seconds, header: 'SECONDS'),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Text(
              time,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
            ),
          ),
        const  SizedBox(height: 24,),
        Text(header,style: TextStyle(color: Colors.white),)
        ],
      );
}



//***Working code */
// import 'dart:async';

// import 'package:flutter/material.dart';

// class CountdownPage extends StatefulWidget {
//   const CountdownPage({super.key});

//   @override
//   State<CountdownPage> createState() => _CountdownPageState();
// }

// class _CountdownPageState extends State<CountdownPage> {
// Duration duration=Duration();
// Timer? timer;
// @override
// void initState(){
//   super.initState();
//   startTimer();
// }
// void addTime(){
//   final addSeconds=1;
//   setState(() {
//     final seconds=duration.inSeconds+addSeconds;
//     duration =Duration(seconds: seconds);
//   });
// }

// void startTimer(){
//   timer=Timer.periodic(Duration(seconds: 1),(_)=>addTime() );
// }

//   @override
//   Widget build(BuildContext context)=> Scaffold(
//       body: Center(
//         child: buildTime(),
//       ),
//     );

//     Widget buildTime(){
// //below code 9---> 09 shows
//       String twoDigits(int n)=>n.toString().padLeft(2,'0');
//       final minutes=twoDigits(duration.inMinutes.remainder(60));
//       final seconds=twoDigits(duration.inSeconds.remainder(60));
//       return Text('$minutes:$seconds',style: TextStyle(fontSize: 80),);
//     }
  
// }