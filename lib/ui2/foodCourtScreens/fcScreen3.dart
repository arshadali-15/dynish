import 'dart:io';

import 'package:demo_flutter/main.dart';
import 'package:demo_flutter/ui2/HomePage2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/CustomColors.dart';
import '../../Widgets/fcScreenToggle.dart';

class FCScreen3 extends StatefulWidget {
  const FCScreen3({super.key});

  @override
  State<FCScreen3> createState() => _FCScreen3State();
}

class _FCScreen3State extends State<FCScreen3> {
  bool _accepted = false;

  XFile? _leaseAgreement;
  XFile? _NOC;

  Future<void> _pickLeaseAgreement(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _leaseAgreement = pickedImage;
      });
    }
  }

  Future<void> _pickNOC(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _NOC = pickedImage;
      });
    }
  }

  returnLabel(String label) {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      alignment: Alignment.centerLeft,
      child: Text(
        " $label",
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

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
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Text(
                "FoodCourt",
                style: TextStyle(color: CustomColors.darkGrey, fontSize: 18.sp),
              ),
            ),

            /// Lease agreement
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: returnLabel(
                      "Upload Property Ownership or Lease Agreement \n For example :Current bill"),
                ),

                _leaseAgreement != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              _pickLeaseAgreement(ImageSource.gallery);
                            },
                            child: Container(
                              width: 70.w,
                              height: 20.h,
                              child: Image.file(
                                File(_leaseAgreement!.path),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: InkWell(
                          onTap: () {
                            _pickLeaseAgreement(ImageSource.gallery);
                          },
                          child: Container(
                            width: 90.w,
                            height: 20.h,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  color: CustomColors.darkGrey,
                                ),
                                Text(
                                  "PNG  |  JPEG  |  WEBP",
                                  style: TextStyle(
                                      color: CustomColors.grey,
                                      fontSize: 18.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),

            /// NOC
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                returnLabel("Upload NOC Certificate (optional)"),
                _NOC != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              _pickNOC(ImageSource.gallery);
                            },
                            child: Container(
                              width: 70.w,
                              height: 20.h,
                              child: Image.file(
                                File(_NOC!.path),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: InkWell(
                          onTap: () {
                            _pickNOC(ImageSource.gallery);
                          },
                          child: Container(
                            width: 90.w,
                            height: 20.h,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  color: CustomColors.darkGrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
              ],
            ),

            /// AGREED TEXT
            Container(
              width: 90.w,
              height: 10.h,
              //  color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Switch(
                    // thumb color (round icon)
                    activeColor: CustomColors.orange,
                    activeTrackColor: CustomColors.black,
                    inactiveThumbColor: CustomColors.darkGrey,
                    inactiveTrackColor: CustomColors.grey,
                    splashRadius: 50.0,
                    value: _accepted,
                    onChanged: (value) {
                      setState(() {
                        _accepted = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 60.w,
                  child: RichText(
                    maxLines: 2,
                    text: TextSpan(
                      text: "I have accepted the ",
                      style: TextStyle(color: Colors.black),
                      children: const <TextSpan>[
                        TextSpan(
                            text: "Terms and Conditions",
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                )
              ]),
            ),

            /// NAVIGATOR
            FCScreenToggle(
              back: 'Back',
              next: 'Submit',
              onPressedBack: () {
                Navigator.pop(context);
              },
              onPressedNext: () {

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage2()));

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25) ,topRight: Radius.circular(25))
                  ),
                  backgroundColor: CustomColors.orange,
                  content: Text(
                    "Successfully ENROLLED!!",
                    style: TextStyle(color: Colors.white,fontSize:15.sp),

                  ),
                  duration: Duration(seconds: 2),
                ));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
