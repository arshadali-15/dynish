import 'package:demo_flutter/OrderHistoryScreens/order_history_screen.dart';
import 'package:demo_flutter/ui/login_screen.dart';
import 'package:demo_flutter/ui2/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 80.h,
          width: 80.w,
          child: Column(

            children: [
              Container(
                height: 7.h,
                width: 40.w,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Profile Screens",
                      style: TextStyle(fontSize: Adaptive.sp(15)),
                    )),
              ),
              Container(
                height: 7.h,
                width: 40.w,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage2()));
                    },
                    child: Text(
                      "Restaurant and Food Court Screen",
                      style: TextStyle(fontSize: 15.sp),
                    )),
              ),
              Container(
                height: 7.h,
                width: 40.w,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => OrderHistoryScreen()));
                    },
                    child: Text(
                      "Order History Screen",
                      style: TextStyle(fontSize: 15.sp),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
