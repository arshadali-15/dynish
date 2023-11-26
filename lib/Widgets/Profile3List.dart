import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:demo_flutter/Constants/CustomColors.dart';

class Profile3List extends StatelessWidget {
  const Profile3List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
        height: Adaptive.h(18),
        width: Adaptive.w(70),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("WITHDRAW"),
                    Text("May 2023-June 2023"),
                    Text("Payemnt done using PhonePe UPI"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("#AX2D5454"),
                    Text("+752/-", style: TextStyle(fontSize : 18.sp,fontWeight: FontWeight.w500,color: CustomColors.yellow),),
                    Row(
                      children: [
                        Image.asset("assets/images/clock.png"),
                        Text("Pending", style: TextStyle(color: CustomColors.yellow),),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("2:00 PM 21/04/2023")
              ],
            )
          ],
        ),
      ),
    );
  }
}