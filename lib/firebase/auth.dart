import 'package:flutter/material.dart';
import 'package:demo_flutter/ui/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Constants/custom_colors.dart';
import '../ui/login_screen.dart';

final _auth = FirebaseAuth.instance;

class Auth {
  String verificationId = "";

  Future<void> phoneAuth(BuildContext context, String phoneNo) async {

    if (phoneNo.length == 10) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${'+' + 91.toString() + phoneNo}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color.fromARGB(255, 247, 247, 247),
            content: Text(
              "Resend",
              style: TextStyle(color: Colors.black),
            ),
          ));
        },
        codeSent: (String verificationId, int? resendToken) {
          LoginScreen.verify = verificationId;
          Navigator.of(context).pushNamed(
            '/otp',
            arguments: {
              'phoneNumber': '+91${phoneNo}',
            },
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        backgroundColor:
        Colors.red,
        content: Text(
          "Input 10 digit Number",
          style: TextStyle(color: Colors.black),
        ),
      ));
    }

  }


  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: LoginScreen.verify, smsCode: otp);
      await auth.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, '/homePage');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Wrong OTP",
            textAlign: TextAlign.center,
            style: TextStyle(color: CustomColors.black),
          ),
          backgroundColor: CustomColors.red.withOpacity(0.1),
          duration: Duration(seconds: 3),
        ),
      );
      // Handle the authentication error (e.g., show an error message to the user)
      print("Error during OTP verification: $e");
    }
  }
}