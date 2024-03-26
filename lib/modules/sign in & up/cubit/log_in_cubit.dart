import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/modules/sign%20in%20&%20up/cubit/log_in_states.dart';

class LogInCuit extends Cubit<LogInCubitStates> {
  LogInCuit() : super(LogInCubitStates());

  Future<void> login(
      {required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: " emailController.text",
        password: "passwordController.text",
      );
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Handle user not found
      } else if (e.code == 'wrong-password') {
        // Handle wrong password
      }
    }
  }

  Future<void> signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "emailController.text",
        password: "passwordController.text",
      );
      // Handle successful sign up
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // Handle weak password
      } else if (e.code == 'email-already-in-use') {
        // Handle email already in use
      }
    }
  }
}
