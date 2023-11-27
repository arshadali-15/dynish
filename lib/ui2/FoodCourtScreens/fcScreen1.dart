import 'dart:io';

import 'package:demo_flutter/Constants/custom_colors.dart';
import 'package:demo_flutter/Widgets/fc_screen_toggle.dart';
import 'package:demo_flutter/ui2/foodCourtScreens/fcScreen2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FCScreen1 extends StatefulWidget {
  FCScreen1({super.key});

  @override
  State<FCScreen1> createState() => _FCScreen1State();
}

class _FCScreen1State extends State<FCScreen1> {
  /// FORM KEY
  GlobalKey<FormState> fcFormKey = GlobalKey<FormState>();
  bool _canPark = false;

  /// CONTROLLERS

  TextEditingController fcNameController = TextEditingController();
  TextEditingController brandIdController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController openTimeController = TextEditingController();
  TextEditingController closeTimeController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  //
  XFile? _brandLogo;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _brandLogo = pickedImage;
      });
    }
  }

  /// Flags for phone number
  String? flags;

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

                /// NAME
                Container(
                  height: 10.h,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: fcNameController,
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
                      hintText: "Name of the Food Court",
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

                /// BrandID && Brand LOGO
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        returnLabel("Brand ID"),
                        Container(
                          width: 50.w,
                          height: 10.h,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: brandIdController,
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
                              // hintText: "Name of the Food Court",
                              // hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        returnLabel("Upload Brand Logo"),
                        _brandLogo != null
                            ? InkWell(
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.file(
                                    File(_brandLogo!.path),
                                    width: 35.w,
                                    height: 20.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                height: 10.h,
                                width: 50.w,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  readOnly: true,
                                  //  controller: brandLogo,
                                  onTap: () {
                                    _pickImage(ImageSource.gallery);
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
                                          color: CustomColors.orange,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    helperText: " ",
                                    hintText: "45X45 jpg,png,jPEG",
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: Colors.grey),
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
                  ],
                ),

                /// LOCATION
                Column(
                  children: [
                    returnLabel("Location"),
                    Container(
                      height: 10.h,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60.w,
                            child: TextFormField(
                              controller: locationController,
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
                                hintText: "Enter your Food Court location",
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
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(bottom: 15),
                            width: 25.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: CustomColors.orange,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.location_searching_outlined),
                                Text("Detect"),
                              ],
                            ),
                          ),
                        ],
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
                        controller: phoneNoController,
                        validator: (_) {
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          prefix: DropdownButton(
                            value: flags,
                            items: [
                              DropdownMenuItem(
                                value: "Usa",
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset(
                                      "assets/images/flag_INDIA.png"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Germany",
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset(
                                      "assets/images/flag_GERMANY.png"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "India",
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child:
                                      Image.asset("assets/images/flag_USA.png"),
                                ),
                              ),
                            ],
                            onChanged: (Object? value) {
                              setState(() {
                                flags = value as String?;
                              });
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.orange, width: 2.0),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          helperText: " ",
                          hintText: "Phone Number",
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

                /// OPEN - CLOSE TIME
                Column(
                  children: [
                    returnLabel("Open-Close Time "),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50.w,
                          height: 10.h,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: openTimeController,
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
                              hintText: "08:00 AM",
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
                        Container(
                          height: 10.h,
                          width: 50.w,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: closeTimeController,
                            onTap: () {},
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
                              hintText: "10:00 PM",
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
                  ],
                ),

                /// AREA
                Column(
                  children: [
                    returnLabel("Area in Acres(Approx)"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: areaController,
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
                          hintText: "1",
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

                /// PARKING Availability
                ///
                Container(
                  width: 90.w,
                  child: Row(
                    children: [
                      returnLabel("Parking Availability :"),
                      Container(
                        child: Switch(
                          // thumb color (round icon)
                          activeColor: CustomColors.orange,
                          activeTrackColor: CustomColors.black,
                          inactiveThumbColor: CustomColors.darkGrey,
                          inactiveTrackColor: CustomColors.grey,
                          splashRadius: 50.0,
                          value: _canPark,
                          onChanged: (value) {
                            setState(() {
                              _canPark = value;
                            });
                          },
                        ),
                      ),
                      //Text(("Non A/C").padRight(18, ' ')),

                      _canPark
                          ? Container(
                              width: 12.w,
                              height: 5.h,
                              child: Image.asset(
                                'assets/images/tick.png',
                                fit: BoxFit.fill,
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),

                FCScreenToggle(
                  back: 'Back',
                  next: 'Next',
                  onPressedBack: () {
                    Navigator.pop(context);
                  },
                  onPressedNext: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FCScreen2()));
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
