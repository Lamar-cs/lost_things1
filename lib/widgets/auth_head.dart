

import 'package:flutter/material.dart';
import 'package:lost_things/statics/static_color.dart';

class AuthHead extends StatelessWidget {
  AuthHead({super.key,required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height: 75,
        ),
        Image.asset(
          logo,
          height: 100,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Lost Things",
            style: TextStyle(
                fontSize: 32, fontFamily: "Pacifico", color: Colors.white),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}