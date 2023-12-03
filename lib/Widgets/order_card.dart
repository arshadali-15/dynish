import 'package:demo_flutter/Constants/custom_colors.dart';
import 'package:demo_flutter/Constants/images.dart';
import 'package:demo_flutter/Widgets/toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.hour,
    required this.mins,
  });

  final String hour;
  final String mins;

  @override
  Widget build(BuildContext context) {
    int hourValue = int.tryParse(hour) ?? 0;
    Color color = hourValue > 15 ? CustomColors.red : CustomColors.green;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "#162432",
                style: TextStyle(color: CustomColors.darkGrey),
              ),
              Text(
                "Dine-in",
                style: TextStyle(color: CustomColors.darkGrey),
              ),
            ],
          ),
          Card(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 1.h ,horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(width: 5.w, child: Image.asset(Images.veg)),
                      Text("1x Butter Scotch Milk")
                    ],
                  ),
                  Row(
                    children: [
                      Container(width: 5.w, child: Image.asset(Images.nonVeg)),
                      Text("1x Chicken Manchurian")
                    ],
                  ),
                  Text(
                    "8:01pm   23 May 2023",
                    style: TextStyle(color: CustomColors.darkGrey),
                  ),
                  Row(
                    children: [
                      Text(
                        "TIMER",
                        style: TextStyle(color: color),
                      ),
                      timerContainer(hour, mins, color),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 3.w),
                        child: Text(
                          "Rs 150",
                          style: TextStyle(color: CustomColors.darkGrey),
                        ),
                      ),
                    ],
                  ),
                  CustomToggleWidget(
                      back: "Done",
                      next: "Remind Chef",
                      onPressedBack: () {},
                      onPressedNext: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget timerContainer(String hour, String mins, Color color) {
  return Center(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      width: 25.w,
      height: 4.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: Text(
              hour,
              style: TextStyle(color: color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 15.w,
              height: 4.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: color),
              child: Center(
                child: Text(
                  "${mins}min",
                  style: TextStyle(color: CustomColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
