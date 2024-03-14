import 'package:flutter/material.dart';
import 'package:lost_things/statics/static_color.dart';

class ProcessTile extends StatelessWidget {
  String text;
  VoidCallback function;
  IconData iconData;
   ProcessTile({
     required this.text,
     required this.function,
     required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: Icon(
            iconData,
            color: Colors.white,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
            onPressed: function,
          ),
        ),
        Divider(
          color: KsecondColor,
          thickness: 2,
        )
      ],
    );
  }
}