import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:demo_flutter/Constants/CustomColors.dart';


class SingleWidget extends StatelessWidget {
  const SingleWidget({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      width: Adaptive.w(90),
      decoration: BoxDecoration(
          color: CustomColors.lightGrey,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(

                backgroundColor: CustomColors.white,
                child: Image.asset(image),
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
    );
  }
}
