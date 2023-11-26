import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:demo_flutter/Constants/CustomColors.dart';



class ResuableCard extends StatelessWidget {
  const ResuableCard({
    super.key,
    required this.title,
    required this.title2,
    required this.image1,
    required this.image2,
  });

  final String title;
  final String title2;
  final String image1;
  final String image2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(20),
        width: Adaptive.w(90),
        decoration: BoxDecoration(
            color: CustomColors.lightGrey,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: CustomColors.white,
                      child: Image.asset(image1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(title),
                  ],
                ),
                Icon(Icons.navigate_next)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: CustomColors.white,
                      child: Image.asset(image2),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(title2),
                  ],
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ],
        ),
      ),
    );
  }
}