import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_flutter/Constants/custom_colors.dart';
import 'package:demo_flutter/ui/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  createUser(
      String name, String email, String phone, BuildContext context) async {
    if (name.isEmpty || email.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error \n Please provide all required information.",
            textAlign: TextAlign.center,
            style: TextStyle(color: CustomColors.black),
          ),
          backgroundColor: CustomColors.red.withOpacity(0.1),
          duration: Duration(seconds: 3),
        ),
      );
      return; // Exit the method if validation fails
    }
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await _db.collection("users").add({
          "name": name,
          "email": email,
          "phone": phone,
        });
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User added successfully!!"),
          backgroundColor: CustomColors.orange.withOpacity(0.1),
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } catch (error) {
      // Handle any errors that occur during the Firestore operation
      print("Error adding user: $error");
      // Optionally, show an error message using Get.snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error adding user: $error"),
          backgroundColor: CustomColors.red.withOpacity(0.1),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
