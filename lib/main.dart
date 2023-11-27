import 'package:demo_flutter/home_navigation.dart';
import 'package:demo_flutter/ui/home_page.dart';
import 'package:demo_flutter/ui/login_screen.dart';
import 'package:demo_flutter/ui/otp_screen.dart';
import 'package:demo_flutter/ui/set_profile_screen.dart';
import 'package:demo_flutter/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp( MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Sen'),
        //home: Scaffold(
          //body: HomeNavigation(),)

          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (context) => HomeNavigation(),
            '/login': (context) => LoginScreen(),
            '/otp': (context) => OtpScreen(),
            '/setProfile': (context) => SetProfileScreen(),
            '/homePage' : (context)=> HomePage()

          },
        );
      },
    );
  }
}
