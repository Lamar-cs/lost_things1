import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class GetSize{
  static getWidth(context){
    return MediaQuery.of(context).size.width;
  }
  static getHight(context){
    return MediaQuery.of(context).size.height;
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(ctx,
    String error) {
  return ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text(error, style: const TextStyle(
        color: Colors.grey
    ),),
  ));
}
