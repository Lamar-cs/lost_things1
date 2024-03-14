import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lost_things/functions/get_size.dart';


class CustumeTextField extends StatefulWidget {

  CustumeTextField({
        this.visibility=true,
        this.textEditingController,
        this.enabled = true,
        this.prefixIcon,
        this.hint,
        this.onchange,
        required this.validetor,
        required this.ispass,
        this.labelText,
        this.textInputType=TextInputType.text,
      });

  String? hint;
  String? labelText;
  TextInputType textInputType;
  Function(String)? onchange;
  final String? Function(dynamic value) validetor;
  bool ispass = true;
  bool visibility;
  Widget? prefixIcon;
  bool enabled;
  TextEditingController? textEditingController;


  @override
  State<CustumeTextField> createState() => _CustumeTextFieldState();
}


class _CustumeTextFieldState extends State<CustumeTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: widget.textInputType,
        style: TextStyle(
            color: Colors.white
        ),
        validator: (v) => widget.validetor(v),
        onChanged:widget.onchange ,
        controller: widget.textEditingController,
        decoration: InputDecoration(

          hintText: widget.hint,
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.white
          ),
          hintStyle: TextStyle(
              color: Colors.white
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Colors.red,
              )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}