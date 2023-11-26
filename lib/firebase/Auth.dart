import 'package:demo_flutter/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:demo_flutter/ui/OtpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final _auth = FirebaseAuth.instance;
//late final Rx<User?> user;

class Auth {
  String verificationId = "";

  Future<void> phoneAuth(BuildContext context, String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId = verificationId;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => OtpScreen()));
        },
        verificationFailed: (e) {
          if (e.code == "invalid-phone-number") {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Color.fromARGB(255, 247, 247, 247),
              content: Text(
                "Resend",
                style: TextStyle(color: Colors.black),
              ),
              duration: Duration(seconds: 3),
            ));
          }
        },
        codeAutoRetrievalTimeout: (verification) {});
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
