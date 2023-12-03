import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/custom_colors.dart';
import '../../Widgets/toggle_buttons.dart';
import 'fcScreen3.dart';

class FCScreen2 extends StatefulWidget {
  const FCScreen2({super.key});

  @override
  State<FCScreen2> createState() => FCScreen2State();
}

class FCScreen2State extends State<FCScreen2> {
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController ownerPhoneController = TextEditingController();
  TextEditingController ownerPanController = TextEditingController();

  GlobalKey<FormState> fcFormKey = GlobalKey<FormState>();

  XFile? _ownerPic;
  XFile? _foodCourtPic;

  Future<void> _ownerImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _ownerPic = pickedImage;
      });
    }
  }

  Future<void> _foodCourtImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _foodCourtPic = pickedImage;
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
      body: Form(
        key: fcFormKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Text(
                    "FoodCourt",
                    style: TextStyle(
                        color: CustomColors.darkGrey, fontSize: 18.sp),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("Upload Image of Food Court"),
                    _foodCourtPic != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  _foodCourtImage(ImageSource.gallery);
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 20.h,
                                  child: Image.file(
                                    File(_foodCourtPic!.path),

                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: InkWell(
                              onTap: (){
                                _foodCourtImage(ImageSource.gallery);
                              },
                              child: Container(
                                width: 90.w,
                                height: 20.h,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(25),),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Icon(Icons.file_upload_outlined ,color: CustomColors.darkGrey,),
                                    Text("PNG  |  JPEG  |  WEBP" ,style: TextStyle(color: CustomColors.grey),)
                                  ],
                                ),
                              ),
                            ),
                          )
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Center(
                    child: Text(
                      "OWNER DETAILS",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                  ),
                ),

                /// Owners photo

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("Upload Your Photo"),
                    _ownerPic != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  _ownerImage(ImageSource.gallery);
                                },
                                child: Image.file(
                                  File(_ownerPic!.path),
                                  width: 40.w,
                                  height: 50.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 10.h,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              readOnly: true,
                              onTap: () {
                                _ownerImage(ImageSource.gallery);
                              },
                              validator: (_) {
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CustomColors.orange, width: 2.0),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),

                                suffixIcon: Icon(
                                  Icons.file_upload_outlined,
                                  color: CustomColors.grey,
                                ),
                                helperText: " ",
                                // /  hintText: "",
                                hintStyle:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                                helperStyle: TextStyle(
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          )
                  ],
                ),

                /// NAME
                Column(
                  children: [
                    returnLabel("Name"),
                    Container(
                      height: 10.h,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: ownerNameController,
                        validator: (_) {
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomColors.orange, width: 2.0),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          helperText: " ",
                          hintText: "Full Name",
                          hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                          helperStyle: TextStyle(
                            color: Colors.red,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// MOBILE NUMBER
                Column(
                  children: [
                    returnLabel("Mobile No."),
                    Container(
                      height: 10.h,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: ownerPhoneController,
                        validator: (_) {
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.orange, width: 2.0),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          helperText: " ",
                          hintText: "Your Mobile Number",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.grey),
                          helperStyle: TextStyle(
                            color: Colors.red,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// PAN NO.

                Column(
                  children: [
                    returnLabel("Your PAN number"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: ownerPanController,
                        validator: (_) {
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.orange, width: 2.0),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          helperText: " ",
                          hintText: "Your PAN Number",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.grey),
                          helperStyle: TextStyle(
                            color: Colors.red,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                CustomToggleWidget(
                  back: 'Back',
                  next: 'Next',
                  onPressedBack: () {
                    Navigator.pop(context);
                  },
                  onPressedNext: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FCScreen3()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
