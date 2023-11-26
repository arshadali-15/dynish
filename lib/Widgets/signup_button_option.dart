import 'package:flutter/material.dart';
import 'package:demo_flutter/Constants/CustomColors.dart';

class CustomElevatedButtonAccount extends StatelessWidget {
  final String url;
  final Function()? onPressed;

  const CustomElevatedButtonAccount({
    required this.url,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: (width <= 550)
              ? EdgeInsets.symmetric(horizontal: 20, vertical: width * 0.05)
              : EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 25),
          textStyle: TextStyle(fontSize: (width <= 550) ? 13 : 17),
        ),
        child: Image.asset(url.toString()));
  }
}