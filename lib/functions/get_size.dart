import 'package:flutter/cupertino.dart';

class GetSize{
  static getWidth(context){
   return MediaQuery.of(context).size.width;
  }
  static getHight(context){
    return MediaQuery.of(context).size.height;
  }
}