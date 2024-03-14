



import 'package:flutter/material.dart';
import 'package:lost_things/models/message_model.dart';
import 'package:lost_things/statics/static_color.dart';

class ChatBuble extends StatelessWidget {
   ChatBuble({
   required this.message,
  });
  Message message;


  @override
  Widget build(BuildContext context) {
    bool isme= message.uid=="user";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Align(
            alignment:isme? Alignment.centerRight:Alignment.centerLeft,
            child: Container(
              width: 260,
              height: 70,
              decoration:   BoxDecoration(
                  borderRadius:  isme? BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ):BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: isme? KprimaryColor:Color(0xff006F93)
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: Align(
                        alignment:isme? Alignment.centerRight:Alignment.centerLeft,
                        child: Text(message.text??"",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                          ),)),
                  ),
                  Align(
                    alignment:isme? Alignment.topLeft:Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 50,
                      child: Image.asset(isme? "assets/images/Hero_Student.png":"assets/images/90549chatbot-4071274_1920-removebg-preview.png",fit: BoxFit.fill,),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}