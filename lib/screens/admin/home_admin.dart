

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_things/functions/get_size.dart';
import 'package:lost_things/models/post_model.dart';
import 'package:lost_things/screens/admin/AllUsersScreen.dart';
import 'package:lost_things/screens/admin/view_all_users.dart';
import 'package:lost_things/screens/user/my_posts_screen.dart';
import 'package:lost_things/screens/user/presonal_info_screen.dart';
import 'package:lost_things/statics/static_color.dart';
import 'package:lost_things/widgets/auth_head.dart';
import 'package:lost_things/widgets/custome_button.dart';
import 'package:lost_things/widgets/custome_text_filed.dart';
import 'package:lost_things/widgets/post_tile.dart';
import 'package:lost_things/widgets/process_tile.dart';
class AdminHome extends StatefulWidget {
   AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: KprimaryColor,
        title: Text("Admin Home"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) {
          return PostTile(postModel: posts[i],isme: true,);
        },
      ),
      floatingActionButton: Builder(
          builder: (ctx) {
            return FloatingActionButton(
              onPressed: (){
                showBottomSheet(
                  context: ctx,
                  builder: (ctx) {
                    return Container(
                      height: 400,
                      decoration: BoxDecoration(
                          color: KprimaryColor
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustumeTextField(
                                ispass: false,
                                labelText: 'what you found/lost',
                                validetor: (v){},
                                hint: "write here",
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await getImage();
                                  print(image!.path);
                                  setState(() {});
                                },
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  color: Colors.white,
                                  strokeWidth: 1,
                                  radius: Radius.circular(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    width: GetSize.getWidth(context),

                                    height: GetSize.getHight(context)*.2,
                                    child: image!=null? ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(image!,fit: BoxFit.fill,)):SizedBox(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomeButton(
                                ontab: (){},
                                text: "Add",
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              backgroundColor: KprimaryColor,
              child: Icon(Icons.add),
            );
          }
      ),
      drawer: Drawer(
        backgroundColor: KprimaryColor,
        child: Column(
          children: [
            AuthHead(name: ""),
            Divider(
              color: KsecondColor,
              thickness: 2,
            ),
            ProcessTile(
              text: 'Account',
              function: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ProfileScreen();
                }));
              },
              iconData: Icons.person,
            ),
            ProcessTile(
              text: 'My Posts',
              function: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyPostsScreen();
                }));
              },
              iconData: Icons.post_add,
            ),
            ProcessTile(
              text: 'All User',
              function: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AllUsersScreen();
                }));
              },
              iconData: Icons.people,
            ),
            Spacer(),
            ProcessTile(
              text: 'LogOut',
              function: (){},
              iconData: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }

  final picker = ImagePicker();

  File? image;

  Future getImage() async {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>1");
    final pickerFile = await picker.pickImage(source: ImageSource.camera);
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>2");
    setState(() {
      if (pickerFile != null) {
        image = File(pickerFile.path);
      } else {
        print('No photo');
      }
    });
  }
}
