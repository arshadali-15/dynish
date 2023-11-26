import 'package:demo_flutter/Constants/CustomColors.dart';
import 'package:demo_flutter/Constants/SizeConfig.dart';
import 'package:demo_flutter/Widgets/signup_button_option.dart';
import 'package:demo_flutter/ui/HomePage.dart';
import 'package:demo_flutter/ui/OtpScreen.dart';
import 'package:demo_flutter/ui/SetProfileScreen.dart';
import 'package:demo_flutter/firebase/Auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String verify = '';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _contactEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.home,
            color: CustomColors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),

      // Wrap the Scaffold with SingleChildScrollView
      body: SingleChildScrollView(
        physics:
            BouncingScrollPhysics(), // Add this for a more natural scroll effect
        reverse: true, // Set this to true
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0,
          ),
          child: Container(
            width: double.infinity,
            child: (SizeConfig.screenW! <= 550)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 17.h,
                      ),
                      Image.asset(
                        'assets/images/login_img.png',
                        width: 95.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset('assets/images/line.png'),
                              SizedBox(
                                width: SizeConfig.screenW! * .02,
                              ),
                              Text(
                                'Login in or Signup',
                                style: TextStyle(
                                  fontSize: 2.5.h,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.screenW! * .02,
                              ),
                              Image.asset('assets/images/line.png'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        width: 88.w,
                        height: 10.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixText: '+91 ',
                            prefixStyle: TextStyle(
                              fontSize: 2.5.h,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            hintText: ' Phone Number',
                            hintStyle: TextStyle(
                              fontSize: 2.h,
                              color: Colors.grey[400],
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.yellow),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[400]!, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your phone number";
                            } else if (value.length != 10) {
                              return "Please enter 10 digits";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: _contactEditingController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          style: TextStyle(fontSize: 2.5.h),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      // CustomElevatedButton(
                      //   text: "Continue",
                      //   onPressed: () async {
                      //     if (_contactEditingController.text.length == 10) {
                      //       await FirebaseAuth.instance.verifyPhoneNumber(
                      //         phoneNumber:
                      //         '${'+' + 91.toString() + _contactEditingController.text}',
                      //         verificationCompleted:
                      //             (PhoneAuthCredential credential) {},
                      //         verificationFailed: (FirebaseAuthException e) {
                      //           ScaffoldMessenger.of(context)
                      //               .showSnackBar(const SnackBar(
                      //             backgroundColor:
                      //             Color.fromARGB(255, 247, 247, 247),
                      //             content: Text(
                      //               "Resend",
                      //               style: TextStyle(color: Colors.black),
                      //             ),
                      //           ));
                      //         },

                      //         codeSent:
                      //             (String verificationId, int? resendToken) {
                      //           LoginScreen.verify = verificationId;
                      //           Navigator.of(context).pushNamed(
                      //             '/otp',
                      //             arguments: {
                      //               'phoneNumber':
                      //               '+91${_contactEditingController.text}',
                      //             },
                      //           );
                      //         },
                      //         codeAutoRetrievalTimeout:
                      //             (String verificationId) {},
                      //       );
                      //     } else {
                      //       ScaffoldMessenger.of(context)
                      //           .showSnackBar(const SnackBar(
                      //         backgroundColor:
                      //         Color.fromARGB(255, 247, 247, 247),
                      //         content: Text(
                      //           "Input 10 digit Number",
                      //           style: TextStyle(color: Colors.black),
                      //         ),
                      //       ));
                      //     }
                      //   },
                      // ),

                      // Login Button

                      ElevatedButton(
                        onPressed: () async {
                          if (_contactEditingController.text.length == 10) {
                            Auth().phoneAuth(
                                context,
                                '${'+' + 91.toString() + _contactEditingController.text}'
                                    .trim());
                          } else {
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
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: (MediaQuery.of(context).size.width <= 550)
                              ? EdgeInsets.symmetric(
                                  horizontal: 100,
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.05)
                              : EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.2,
                                  vertical: 25),
                          textStyle: TextStyle(
                              fontSize:
                                  (MediaQuery.of(context).size.width <= 550)
                                      ? 13
                                      : 17),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (MediaQuery.of(context).size.width <= 550)
                                ? 15.sp
                                : 23,
                            fontFamily: 'AppFonts',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenH! * .04,
                      ),
                      Center(
                        child: Row(
                          children: [
                            Image.asset('assets/images/line.png'),
                            SizedBox(
                              width: SizeConfig.screenW! * .12,
                            ),
                            Text(
                              'or continue with',
                              style: TextStyle(
                                fontSize: 2.h,
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.screenW! * .12,
                            ),
                            Image.asset('assets/images/line.png'),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomElevatedButtonAccount(
                                url: 'assets/images/google.png',
                                onPressed: () {}),
                            CustomElevatedButtonAccount(
                                url: 'assets/images/apple.png',
                                onPressed: () {}),
                            CustomElevatedButtonAccount(
                                url: 'assets/images/facebook.png',
                                onPressed: () {})
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SetProfileScreen()));
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account?? ",
                              style: TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: " Sign up",
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )

                ////  WEB
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Image.asset(
                        'assets/images/login_image.png',
                        width: 80.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.w, top: 4.h),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 6.h,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 80.w,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixText: '+91 ',
                                prefixStyle: TextStyle(
                                  fontSize: 5.h,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                hintText: 'Enter your phone number',
                                hintStyle: TextStyle(
                                  fontSize: 5.h,
                                  color: Colors.grey[400],
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: CustomColors.yellow),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey[400]!, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              controller: _contactEditingController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              style: TextStyle(fontSize: 5.h),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          // CustomElevatedButton(
                          //   text: "Continue",
                          //   onPressed: () {
                          //     Navigator.pushNamed(
                          //       context,
                          //       '/otp',
                          //       arguments: {
                          //         'phoneNumber':
                          //             '+91${_contactEditingController.text}',
                          //       },
                          //     );
                          //   },
                          // ),

                          ElevatedButton(
                            onPressed: () {
                              // Save profile information logic here
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpScreen()));
                              // Navigate to the next screen or perform desired actions
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: (MediaQuery.of(context).size.width <=
                                      550)
                                  ? EdgeInsets.symmetric(
                                      horizontal: 100,
                                      vertical:
                                          MediaQuery.of(context).size.width *
                                              0.05)
                                  : EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      vertical: 25),
                              textStyle: TextStyle(
                                  fontSize:
                                      (MediaQuery.of(context).size.width <= 550)
                                          ? 13
                                          : 17),
                            ),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    (MediaQuery.of(context).size.width <= 550)
                                        ? 15.sp
                                        : 23,
                                fontFamily: 'AppFonts',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
