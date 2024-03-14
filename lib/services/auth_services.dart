
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_things/screens/admin/home_admin.dart';
import 'package:lost_things/screens/auth_screens/login.dart';
import 'package:lost_things/screens/user/home_screen.dart';

import '../enums/UserTypes.dart';
import '../functions/size.dart';
import '../models/user_model.dart';

class Auth {
  static Future<void> register(
      {required UserModel userModel,
      required ctx,
      required String password,
      required Widget nextScreen}) async {
    String error;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: password,
      );
      final User? auth = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(auth!.uid.toString())
          .set({
        'name': userModel.name,
        'email': userModel.email,
        'userType': userModel.userType,
      });

      Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context) {
        return nextScreen;
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        error = 'The password provided is too weak.';
        showSnackBar(ctx, error);
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email.';
        showSnackBar(ctx, error);
      }
    }
  }

  static Future<void> login(
      {required String email, required String pass, required ctx}) async {
    String error = '';
    try {
      final User? auth = FirebaseAuth.instance.currentUser;
      print(">>>>>>>>>>>>>>>>>>>enter login function");
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      /*  .then((value) async {
         var docId = "";
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection("Users").doc(auth!.uid)
            .get()
            .then((snapshot) {
          print(snapshot);
          print("username: ${snapshot['name']}");
          docId = userData!.id;
        });
      });*/
      print(">>>>>>>>>>>>>>>>>>> login credential" +
          credential.user!.uid.toString());

      DocumentSnapshot? snapshot = await readUserProfileData(userId: auth!.uid);

      Map<String, dynamic> data = snapshot!.data() as Map<String, dynamic>;

      UserModel? userModel = UserModel.fromFirestore(data);

      print(">>>>>>>>>>>>>>>>>>> login credential usertype" +
          userModel.userType.toString());
      if (Navigator.canPop(ctx)) {
        Navigator.pop(ctx);
      }

      Widget nextScreen;
      if (userModel.userType == UserType.ADMIN.value) {
        nextScreen = AdminHome();
      } else {
        nextScreen = HomeScreen();
      }

      Navigator.push(ctx, MaterialPageRoute(builder: (context) {
        return nextScreen;
      }));
    } on FirebaseAuthException catch (e) {
      showSnackBar(ctx, e.code);
      print(">>>>>>>>>>>>>>>>>>>error");
      if (e.code == 'user-not-found') {
        error = 'No user found for that email.';

        print(error);
      } else if (e.code == 'wrong-password') {
        error = 'Wrong password provided for that user.';
        showSnackBar(ctx, error);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> resetPassword({required email, required ctx}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      // Show a success message or navigate to a success screen
      showSnackBar(ctx, 'check your email');
    } catch (error) {
      // Handle any errors that occur during password reset
      print('Error sending password reset email: $error');
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content:
              Text('Error sending password reset email. Please try again.'),
        ),
      );
    }
  }

  static Future<void> logOut(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      for (; Navigator.canPop(context);) Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    } catch (e) {
      print('Error logging out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error logging out. Please try again.'),
        ),
      );
    }
  }

  static Future<DocumentSnapshot?> readUserProfileData({
    required String userId,
  }) {
    final User? auth = FirebaseAuth.instance.currentUser;
    print("auth!.uid + ${auth!.uid}");
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(auth!.uid)
        .get(); /*{
      print(snapshot);
      print("username: ${snapshot.docs[0]['name']}");
      return snapshot.docs[0];
    });*/
    //return null;
  }
}
