
import 'package:demo_flutter/ui/profile2.dart';
import 'package:demo_flutter/ui/profile3.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'profile1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 7.h,
              width: 35.w,
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Profile1()));
                  },
                  child: Text(
                    "Profile 1",
                    style:
                        TextStyle(fontSize: Adaptive.sp(15), fontFamily: 'Sen'),
                  )),
            ),
            Container(
              height: 7.h,
              width: 35.w,
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Profile2()));
                  },
                  child: Text(
                    "Profile 2",
                    style: TextStyle(fontSize: Adaptive.sp(15)),
                  )),
            ),
            Container(
              height: 7.h,
              width: 35.w,
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Profile3()));
                  },
                  child: Text(
                    "Profile 3",
                    style: TextStyle(fontSize: Adaptive.sp(15)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
