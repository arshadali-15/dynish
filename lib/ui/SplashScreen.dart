import 'package:demo_flutter/Constants/CustomColors.dart';
import 'package:demo_flutter/Constants/SizeConfig.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // User? currentUser = _auth.currentUser;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);

  //   Future.delayed(Duration(seconds: 6), () {
  //     if (currentUser != null) {
  //       Navigator.pushReplacementNamed(context, '/setProfile');
  //     } else {
  //       Navigator.pushReplacementNamed(context, '/login');
  //     }
  //   });
   }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    double blockH = SizeConfig.blockH ?? 600;
    double blockV = SizeConfig.blockV ?? 400;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomColors.grey, CustomColors.darkGrey],
            begin: Alignment(0.0, 1.0),
            end: Alignment(0.0, 0.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              flex: 2, // Adjust the flex values as needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/DYNISH.png',
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/subdynish.png',
                      width: width * 2,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 0, // Adjust the flex values as needed
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/burger.png',
                  width: width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}