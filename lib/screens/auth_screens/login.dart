import 'package:flutter/material.dart';
import 'package:lost_things/screens/admin/home_admin.dart';
import 'package:lost_things/screens/auth_screens/register_screen.dart';
import 'package:lost_things/screens/auth_screens/reset_password.dart';
import 'package:lost_things/screens/user/home_screen.dart';
import 'package:lost_things/statics/static_color.dart';
import 'package:lost_things/widgets/auth_head.dart';
import 'package:lost_things/widgets/custome_button.dart';
import 'package:lost_things/widgets/custome_text_filed.dart';
import 'package:lost_things/widgets/register_row.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../enums/UserTypes.dart';
import '../../models/user_model.dart';
import '../../services/auth_services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String? email, password;
  bool isloading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ModalProgressHUD(
          inAsyncCall: isloading,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthHead(name: ""),
                  CustumeTextField(
                    ispass: false,
                    validetor: (value) {
                      if (value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null; // Validation passed
                    },
                    onchange: (data) {
                      email = data;
                      setState(() {});
                    },
                    hint: "Email",
                    textEditingController: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustumeTextField(
                    validetor: (data) {
                      if (data.isEmpty) {
                        return 'Please enter a password';
                      }
                      // Simple password length check
                      if (data.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null; // Validation passed
                    },
                    onchange: (data) {
                      password = data;
                      setState(() {});
                    },
                    hint: "Password",
                    ispass: true,
                    textEditingController: passController,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return ResetPassword();
                      }));
                    },
                    child: Text(
                      "forgot your password?",
                      style: TextStyle(
                        color: KsecondColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeButton(
                    text: 'login',
                    ontab: () async {
                      login();

                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RegisterRow(
                      text1: "Don't Have An Acount ?   ",
                      text2: 'SignUP',
                      screen: RegisterPage()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
void login() async{
  print("login");
  if (formKey.currentState!.validate()){
    isloading = true;
    setState(() {});
    await Auth.login(
        email: email!, pass: password!, ctx: context);    isloading = false;
    setState(() {});
  }
}
}
