import 'package:flutter/material.dart';
import 'package:demo_flutter/Constants/CustomColors.dart';
import 'package:sizer/sizer.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const CustomElevatedButton({
    required this.text,
    required this.onPressed,
  });



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: (MediaQuery.of(context).size.width <= 550)
            ? EdgeInsets.symmetric(horizontal: 100, vertical: MediaQuery.of(context).size.width * 0.05)
            : EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2, vertical: 25),
        textStyle: TextStyle(fontSize: (MediaQuery.of(context).size.width <= 550) ? 13 : 17),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: (MediaQuery.of(context).size.width <= 550) ? 13.sp : 23,
          fontFamily: 'AppFonts',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}