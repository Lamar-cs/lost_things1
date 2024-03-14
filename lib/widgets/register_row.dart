
import 'package:flutter/material.dart';
import 'package:lost_things/statics/static_color.dart';

class RegisterRow extends StatelessWidget {
  RegisterRow({
    required this.text1,
    required this.text2,
    required this.screen,
    super.key,
  });

  String text1;
  String text2;
  Widget screen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          text1,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return screen;
                }));
          },
          child: Text(
            text2,
            style:  TextStyle(
              color: KsecondColor,
            ),
          ),
        )
      ],
    );
  }
}