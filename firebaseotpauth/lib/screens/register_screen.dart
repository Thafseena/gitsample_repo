import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:firebaseotpauth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 TextEditingController phoneController=TextEditingController();

Country selectedCountry=Country(
  phoneCode: '91', 
  countryCode: "IN", 
  e164Sc: 0, 
  geographic: true, 
  level: 1, 
  name: "India", 
  example: "India", 
  displayName: "India", 
  displayNameNoCountryCode: "IN", 
  e164Key: "");

  @override
  Widget build(BuildContext context) {
    phoneController.selection=TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length)
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:35 ,vertical:25 ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.all(35.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple.shade50,
                  //     image:  DecorationImage(
                  //     image: AssetImage('assets/image2.png'),
                  // fit: BoxFit.cover),
                    ),
                    child: Image.asset("assets/image2.png"),
                    ),
                    const SizedBox(height: 20,),
                    Text("Register",
                style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),
                 Text("Add your phone number. We'll sent you a verification code",
                style:TextStyle(fontSize: 12,
                color: Colors.black38,
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
                const SizedBox(height: 20,),
                TextFormField(
                  cursorColor: Colors.purple,
                  controller:phoneController,
                  style: const TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    log('lenth==='+phoneController.text.length.toString());
                    setState(() {
                      phoneController.text=value;
                    });
                    
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
                    hintStyle: TextStyle(
                      fontSize:15 ,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12)
                    ),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          
                        showCountryPicker(context: context, 
                        countryListTheme:  CountryListThemeData(
                          bottomSheetHeight: 500,
                        ),
                        onSelect: ((value) {
                          
                          setState(() {
                            selectedCountry=value;
                          });
                        }));  
                        },
                        child: Text("${selectedCountry.flagEmoji} ${selectedCountry.phoneCode}",
                          style:TextStyle(fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),),
                      ),
                    ),
                    suffixIcon: phoneController.text.length > 9
                    ? Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(Icons.done,
                      color: Colors.white,
                      size: 20,
                      ),
                    )
                    : null,
            
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(text: "Login",onPressed: () {
                    
                  },),
                )
                ],
              ),
            ),
          ),
        )),
    );
  }
}