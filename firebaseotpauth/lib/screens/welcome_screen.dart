import 'package:firebaseotpauth/screens/register_screen.dart';
import 'package:firebaseotpauth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25,horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image1.png",
              height: 300,),
              const SizedBox(height: 20,),
              Text("Let's get started",
              style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
               Text("Never a better time than now to start",
              style:TextStyle(fontSize: 12,
              color: Colors.black38,
              fontWeight: FontWeight.bold),),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterScreen())
                  )
                  );
                },
                text:'Get Started'),
              )
            ],
            ),)) ),
    );
  }
}