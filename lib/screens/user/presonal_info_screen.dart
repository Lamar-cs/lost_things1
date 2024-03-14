import 'package:flutter/material.dart';
import 'package:lost_things/models/user_model.dart';
import 'package:lost_things/statics/static_color.dart';
import 'package:lost_things/widgets/custome_button.dart';
import 'package:lost_things/widgets/custome_text_filed.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? currentText;
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> formKey2 = GlobalKey();
  bool isload = false;
  UserModel userModel = UserModel(
    name: 'test',
    email: 'test.email@gmail.com', userType: null,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    "Name : ${userModel.name}",
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
                      text: "Name : ${userModel.name}", icon: Icons.person),
                  buildColumn(
                      text: "Email : ${userModel.email}", icon: Icons.email),

                  buildColumn(
                      text: "Change Password ",
                      icon: Icons.edit,
                      function: () {
                        showBottomSheet(
                            context: ctx,
                            builder: (ctx) {
                              TextEditingController pin1 =
                                  TextEditingController();
                              TextEditingController pin2 =
                                  TextEditingController();
                              TextEditingController pin3 =
                                  TextEditingController();
                              return ModalProgressHUD(
                                inAsyncCall: isload,
                                child: Form(
                                  key: formKey2,
                                  child: Container(
                                    width: size.width,
                                    height: size.height * .6,
                                    color: KprimaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          CustumeTextField(
                                            validetor: (v) {
/*
                                              if (v != userModel.password) {
                                                return "old password in not correct";
                                              }
*/
                                            },
                                            textEditingController: pin1,
                                            ispass: true,
                                            hint: "*****",
                                            labelText: 'Old Password',
                                          ),
                                          CustumeTextField(
                                            validetor: (v) {
                                              if (v.length < 8) {
                                                return 'Password must be at least 8 characters long';
                                              }
                                            },
                                            textEditingController: pin2,
                                            ispass: true,
                                            hint: "*****",
                                            labelText: 'New Password',
                                          ),
                                          CustumeTextField(
                                            textEditingController: pin3,
                                            validetor: (v) {
                                              if (v != pin2.text) {
                                                return 'Not Correct';
                                              }
                                            },
                                            ispass: true,
                                            hint: "*****",
                                            labelText: 'Confirm Password',
                                          ),
                                          CustomeButton(
                                              ontab: () async {
                                                // if (formKey2.currentState!
                                                //     .validate()) {
                                                //   isload = true;
                                                //   setState(() {});
                                                //   await ChangePasswordAndPin
                                                //       .changePassword(
                                                //           pass: pin2.text,
                                                //           id: snapshot
                                                //               .data!.docs[0].id,
                                                //           ctx: context,
                                                //           email:
                                                //               userModel.email);
                                                //   isload = false;
                                                //   setState(() {});
                                                //   pin1.clear();
                                                //   pin2.clear();
                                                //   pin3.clear();
                                                //   Navigator.pop(context);
                                                // }
                                              },
                                              text: 'Change')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
                  SizedBox(height: 20),
                  CustomeButton(ontab: (){}, text: "LogOut",color: KsecondColor),
                ],
              );
            }),
          ),
        ));
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
