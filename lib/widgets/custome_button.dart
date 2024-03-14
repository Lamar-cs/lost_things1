
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
   CustomeButton({required this.ontab,
   required this.text,
     this.color=Colors.white,
  });
   Color color;
   VoidCallback ontab;
   String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontab ,
      child: Container(
        width: 200,
        height: 50,
        decoration:  BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w600

            ),
          ),
        ),
      ),
    );
  }
}