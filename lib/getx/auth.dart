import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restorant/screens/authentication.dart';
import 'package:restorant/screens/home.dart';
import 'package:restorant/widgets/Auth/signup.dart';

class Auth {
  Signup(email, pass, fname, lname, ctx) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      var user = FirebaseAuth.instance.currentUser;
      print("--------- current user : $user");
      user.updateDisplayName(fname);
      await addUserToFirestore(user.uid, fname, lname, email, "");
      Get.off(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        mySnackBar(ctx, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        mySnackBar(ctx, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signin(email, pass, ctx) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      Get.off(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        mySnackBar(ctx, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        mySnackBar(ctx, 'Wrong password provided for that user.');
      }
    }
  }

  Future<void> signInWithGoogle(context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final _googleSignIn = GoogleSignIn();
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final _credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await auth.signInWithCredential(_credential);
      var user = auth.currentUser;
      await addUserToFirestore(
          user.uid, user.displayName, "", user.email, user.phoneNumber);
      Get.off(HomeScreen());
    } catch (e) {
      print("errrrrrrrrrorrrr ---------------------");
      print(e);
      mySnackBar(context, "An error occured , try again later");
    }
  }

  Future<void> signInWithFacebook(context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final LoginResult loginResult = await FacebookAuth.i.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken.token);
      await auth.signInWithCredential(facebookAuthCredential);
      var user = auth.currentUser;
      await addUserToFirestore(
          user.uid, user.displayName, "", user.email, user.phoneNumber);
      Get.off(HomeScreen());
    } catch (e) {
      mySnackBar(context, e.code.toString());
    }
  }

  Future<void> addUserToFirestore(uid, fname, lname, email, mobNumber) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(uid).set({
      'address': [],
      'cart': [],
      'fav': [],
      'firstName': fname,
      'lastName': lname,
      'email': email,
      'mobileNumber': mobNumber,
      'role': 0,
    }).then((value) => print("----------User Added------------"));
  }

  mySnackBar(BuildContext ctx, String text) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(text)));
  }
}
