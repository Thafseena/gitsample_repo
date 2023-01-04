
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Carousel Slider',
      home: MyHomePage(title: 'Flutter Carousel Slider'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key,required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];

  bool _isPlaying = false;
  GlobalKey<_MyHomePageState> _sliderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: ListView(
        children: <Widget>[
          Container(
            height: 180,
            child: CarouselSlider.builder(
                key: _sliderKey,
                unlimitedMode: true,
                viewportFraction: 1,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                scrollPhysics: const BouncingScrollPhysics(),
                enableAutoSlider: true,
                autoSliderTransitionCurve: Curves.decelerate,
                autoSliderDelay: const Duration(seconds: 5),
                autoSliderTransitionTime:const Duration(milliseconds: 1000) ,
                slideBuilder: (index) {
                  return Container(
                    alignment: Alignment.center,
                    color: colors[index],
                    child: Text(
                      letters[index],
                      style: TextStyle(fontSize: 50, color: Colors.black),
                    ),
                  );
                },
                slideTransform:DefaultTransform(),
                slideIndicator: CircularSlideIndicator(
                  itemSpacing: 6,
                  indicatorRadius: 4,
                  padding: EdgeInsets.only(bottom: 15),
                ),
                itemCount: colors.length),
          ),
       
        ],
      ),
    );
  }
}