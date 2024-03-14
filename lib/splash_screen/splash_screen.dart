import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:lost_things/functions/get_size.dart';
import 'package:lost_things/screens/auth_screens/login.dart';
import 'package:lost_things/widgets/custome_button.dart';

import '../statics/static_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: KprimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: GetSize.getWidth(context)),
          Container(
            width: 300,
            height:  230,
            child: Image.asset(logo,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 20),
          const Text("Lost Things",
            style: TextStyle(
                fontFamily: "Pacifico",
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 20),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Find What You Lost'),
                WavyAnimatedText('Social App'),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
          SizedBox(height: 30),
          CircularProgressIndicator(
            color: Colors.white,
          ),
          SizedBox(height: 50),
          CustomeButton(
            text: "Get Start",
            ontab: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                return LoginPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
