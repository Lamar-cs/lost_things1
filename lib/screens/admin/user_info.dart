import 'package:flutter/material.dart';
import 'package:lost_things/models/user_model.dart';
import 'package:lost_things/statics/static_color.dart';
import 'package:lost_things/widgets/custome_button.dart';

class UserInfo extends StatefulWidget {
  UserModel userModel;

  UserInfo({required this.userModel});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: KprimaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Name",
          style: TextStyle(
              fontSize: 22, fontFamily: "Pacifico", color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Builder(builder: (ctx) {
            return Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "Name : ${widget.userModel.name}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: KprimaryColor,
                  thickness: 1.2,
                ),
                buildColumn(
                    text: "Name : ${widget.userModel.name}", icon: Icons.person),
                buildColumn(
                    text: "Email : ${widget.userModel.email}", icon: Icons.email),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Block"),
                    Switch(
                      // This bool value toggles the switch.
                      value: light,
                      activeColor: KsecondColor,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          light = value;
                        });
                      },
                    ),
                    Text("UnBlock"),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  Column buildColumn({text, icon, function}) {
    return Column(
      children: [
        ListTile(
          onTap: function,
          title: Text(text),
          leading: Icon(
            icon,
            color: KprimaryColor,
          ),
        ),
        Divider(
          color: KprimaryColor,
          thickness: 1.2,
        )
      ],
    );
  }
}




