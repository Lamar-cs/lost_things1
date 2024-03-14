import 'package:flutter/material.dart';
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
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController rePinController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    repassController.dispose();
    pinController.dispose();
    rePinController.dispose();
  }

  String? email;

  String? name;

  String? password;

  String? fatherCode;

  String? age;

  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey();

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
                    labelText: 'name',
                    ispass: false,
                    validetor: (value) {
                      if (value.isEmpty) {
                        return 'enter valid name';
                      }
                      return null; // Validation passed
                    },
                    onchange: (data) {
                      name = data;
                      setState(() {});
                    },
                    hint: "John Smith",
                    textEditingController: nameController,
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustumeTextField(
                    labelText: "Email",
                    ispass: false,
                    validetor: (value) {
                      if (value.isEmpty) {
                        return 'Enter valid Email';
                      }
                      if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                        return 'من فضلك ادخل اميل الكتروني صحيح';
                      }
                      return null; // Validation passed
                    },
                    onchange: (data) {
                      email = data;
                      setState(() {});
                    },
                    textEditingController: emailController,
                    textInputType: TextInputType.emailAddress,
                    hint: "example@gmial.com",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustumeTextField(
                    labelText: "password",
                    validetor: (data) {
                      if (data.isEmpty) {
                        return 'Enter valid Password';
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
                    hint: "*********",
                    ispass: true,
                    textEditingController: passController,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustumeTextField(
                    labelText: "Confirm password",
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
                    textEditingController: repassController,
                    textInputType: TextInputType.visiblePassword,
                    hint: "*********",
                    ispass: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeButton(
                    text: "Register",
                    ontab: () async {
                      var usermodel =
                      UserModel(name: name!, email: email!, userType: UserType.USER.value);
                      register(usermodel: usermodel);
                    },
                  ),
                  const SizedBox(height: 20),
                  RegisterRow(
                      text1: 'Have an Account ?  ',
                      text2: 'Login',
                      screen: LoginPage()),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register({usermodel}) async {
    if (formKey.currentState!.validate()) {
      isloading = true;
      setState(() {});

       await Auth.register(
          userModel: usermodel,
          nextScreen: HomeScreen(),
          ctx: context,
          password: password!);
      isloading = false;
      setState(() {});
    }
  }
}
