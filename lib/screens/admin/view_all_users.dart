/*
import 'package:flutter/material.dart';
import 'package:lost_things/enums/UserTypes.dart';
import 'package:lost_things/models/user_model.dart';
import 'package:lost_things/screens/admin/user_info.dart';
import 'package:lost_things/statics/static_color.dart';

class ViewAllUsers extends StatelessWidget {
  const ViewAllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: KprimaryColor,
          centerTitle: true,
          title: Text("View All Users"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return UserTile(
              userModel: users[index],
            );
          },
        ));
  }
}

class UserTile extends StatelessWidget {
  UserModel userModel;

  UserTile({
    required this.userModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          ListTile(
            title: Text(userModel.name),
            subtitle: Text(
                userModel.userType == UserType.ADMIN.value ? "Admin" : "User"),
            leading: CircleAvatar(
              radius: 20,
              backgroundColor:  userModel.userType == UserType.ADMIN.value ? KsecondColor : KprimaryColor,
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UserInfo(
                    userModel: users[0],
                  );
                }));
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: KprimaryColor,
              ),
            ),
          ),
          Divider(
            color: KprimaryColor,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
*/
