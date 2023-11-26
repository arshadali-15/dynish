import 'dart:async';

import 'package:demo_flutter/Constants/CustomColors.dart';
import 'package:demo_flutter/Constants/SizeConfig.dart';
import 'package:demo_flutter/firebase/Auth.dart';
import 'package:demo_flutter/ui/Profile1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'HomePage.dart';
import 'LoginScreen.dart';


final auth = FirebaseAuth.instance;
String verificationId= "";

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;

  TextEditingController otpController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController? errorController;

  String currentText = "";

  int _countdown = 60; // Initial countdown time in seconds
  bool _canResend = true; // Whether "Resend" button can be pressed

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Make it transparent
      statusBarIconBrightness: Brightness.dark,
    ));

    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          // Timer expired, enable "Resend" button
          _canResend = true;
          _timer.cancel(); // Cancel the timer
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    // Cancel the timer when disposing of the screen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  final Map<String, dynamic> args =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String phoneNumber = '';
    String name = '';
    String email = '';

    SizeConfig().init(context);

    double screenWidth = SizeConfig.screenW!;
    double screenHeight = SizeConfig.screenH!;
    return Scaffold(
      /*  appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 18, 18),
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: screenWidth * 0.06,
            ),
            onPressed: () {
              // Navigate back to LoginScreen
              Navigator.pop(context);
            },
          ),
        ),
        forceMaterialTransparency: true,
        elevation: 0,
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset('assets/images/otpScreen_img.png'),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Verification Code',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.black),
                    ),

                    Text(
                      'Please type the verification code sent to ${phoneNumber}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.1),

                    // OTP TextField

                    Container(
                        margin: EdgeInsets.only(
                            left: screenWidth * 0.025,
                            right: screenWidth * 0.025),
                        child: PinCodeTextField(

                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: CustomColors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: false,

                          //    blinkWhenObscuring: true,

                          pinTheme: PinTheme(

                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 50,
                            fieldWidth: screenWidth * 0.13,
                            activeFillColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            activeColor: Colors.grey,
                            selectedColor: CustomColors.yellow,
                            inactiveColor: Colors.grey,
                            selectedFillColor: Colors.white,
                            inactiveFillColor:
                                const Color.fromARGB(255, 255, 255, 255),
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,

                          controller: otpController,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("Completed ${otpController.text}");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            debugPrint(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),

                    _canResend
                        ? TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                                shadowColor: Colors.black),
                            onPressed: () {
                              // Implement resend OTP logic here
                              // Reset the timer and disable "Resend" button
                              setState(() {
                                _countdown = 60;
                                _canResend = false;
                              });
                              startTimer();
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "I didn't recceive a code!! ",
                                style: TextStyle(color: Colors.black),
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: " Please Resend",
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ))
                        : Text(
                            'Didn\'t recieve OTP? (Resend in $_countdown seconds)',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),

                    SizedBox(
                      height: screenHeight * 0.05,
                    ),

                    // CustomElevatedButton(
                    //   text: "Log In",
                    //   onPressed: () async {
                    //     try {
                    //       Auth().verifyOtp(context, textEditingController.text);
                    //       // PhoneAuthCredential credential =
                    //       // PhoneAuthProvider.credential(
                    //       //     verificationId: LoginScreen.verify,
                    //       //     smsCode: textEditingController.text);
                    //       //
                    //       // // Sign the user in (or link) with the credential
                    //       // await auth.signInWithCredential(credential);
                    //       // // Get.offAll(const Home());
                    //       // Navigator.pushReplacementNamed(context, '/setProfile');
                    //     } catch (e) {
                    //       ScaffoldMessenger.of(context)
                    //           .showSnackBar(const SnackBar(
                    //         backgroundColor: Color.fromARGB(255, 247, 247, 247),
                    //         content: Text(
                    //           'Wrong OTP',
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       ));
                    //     }
                    //   },
                    // ),

                    ElevatedButton(
                      onPressed: () async {
                        try {
                          // Auth().verifyOtp(context, otpController.text,verificationId );
                          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);
                          await auth.signInWithCredential(credential);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Correct OTP",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: CustomColors.black),
                              ),
                              backgroundColor: CustomColors.red.withOpacity(0.1),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => HomePage()));
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
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: (MediaQuery.of(context).size.width <= 550)
                            ? EdgeInsets.symmetric(
                                horizontal: 70,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.05)
                            : EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.2,
                                vertical: 25),
                        textStyle: TextStyle(
                            fontSize: (MediaQuery.of(context).size.width <= 550)
                                ? 13
                                : 17),
                      ),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: (MediaQuery.of(context).size.width <= 550)
                              ? 16.sp
                              : 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
