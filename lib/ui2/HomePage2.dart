import 'package:demo_flutter/Constants/CustomColors.dart';
import 'package:demo_flutter/ui2/RestaurentScreen/restaurentScreen1.dart';
import 'package:demo_flutter/ui2/foodCourtScreens/fcScreen1.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/ic_options.png"),
        actions: [
          Card(
            elevation: 2,
            child: Image.asset("assets/images/profile_img.png"),
          )
        ],
      ),
      body: Center(
        child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 80.w,
              height: 8.h,
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.all(12),
              child: Text(
                "Enrollment",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500),
              ),
            ),
            Card(
              color: CustomColors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 2,
              child: Container(
                  width: 80.w,
                  height: 25.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => RestaurentScreen1()));
                        },
                        child: Container(
                          width: 70.w,
                          height: 15.h,
                          child: Center(
                            child: Image.asset("assets/images/plus.png"),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Enroll as a Restaurant",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(height: 15,),
            InkWell(
              child: Card(
                color: CustomColors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 2,
                child: Container(
                  width: 80.w,
                  height: 8.h,
                  child: Center(
                    child: Text("Enroll your Food Court",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp)),
                  ),
                ),
              ),

              onTap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FCScreen1()));
              }
            ),
          ],
        ),
      ),
    );
  }
}
