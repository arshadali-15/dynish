import 'dart:io';

import 'package:demo_flutter/ui2/RestaurentScreens/restaurant_screen2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/custom_colors.dart';
import '../../Widgets/toggle_buttons.dart';

class RestaurentScreen1 extends StatefulWidget {
  const RestaurentScreen1({super.key});

  @override
  State<RestaurentScreen1> createState() => _RestaurentScreen1State();
}

class _RestaurentScreen1State extends State<RestaurentScreen1> {
  GlobalKey<FormState> restaurentFormKey = GlobalKey<FormState>();

  bool _canPark = false;

  String? dropdownValue;

  TextEditingController rNameController = TextEditingController();
  TextEditingController brandIdController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController openTimeController = TextEditingController();
  TextEditingController closeTimeController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  //
  XFile? _brandLogo;

  Future<void> _pickBrandLogo(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _brandLogo = pickedImage;
      });
    }
  }
/// flags for phone number
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
        key: restaurentFormKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                /// DROPDOWN
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

                  child: DropdownButtonFormField(
                    hint: Text("Select here", style: TextStyle(color: CustomColors.white),),
                      iconEnabledColor: CustomColors.white,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: CustomColors.orange, width: 1)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: CustomColors.orange,
                              width: 1), //<-- SEE HERE
                        ),
                        filled: true,
                        fillColor: CustomColors.orange,
                      ),
                      dropdownColor: CustomColors.orange,
                      value: dropdownValue,
                      items: <String>[
                        'Dine-in + Takeaway',
                        'Dine-in',
                        'Takeaway'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 18.sp, color: CustomColors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (Object? value) {
                        (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        };
                      }),
                ),

                /// NAME
                Container(
                  height: 10.h,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: rNameController,
                    validator: (_) {
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 17.sp,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.orange, width: 2.0),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      helperText: " ",
                      hintText: "Name of the Restaurent",
                      hintStyle: TextStyle(fontSize: 15.sp, color: Colors.grey),
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

                /// BrandID
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    returnLabel("Brand ID :"),
                    Container(
                      width: 70.w,
                      height: 9.h,
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
                          hintText: "Only if applicable!",
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


                ///Brand LOGO
                Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    returnLabel("Upload Brand Logo :"),
                    _brandLogo != null
                        ? InkWell(
                            onTap: () {
                              _pickBrandLogo(ImageSource.gallery);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.file(
                                File(_brandLogo!.path),
                                width: 40.w,
                                height: 20.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : InkWell(
                      onTap: (){
                        _pickBrandLogo(ImageSource.gallery);
                      },
                          child: Container(
                              height: 13.h,
                              width: 50.w,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:Border.all(color: CustomColors.grey,)

                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("45X45", style: TextStyle(color: CustomColors.darkGrey),),
                                 Text("JPG,PNG,JPEG",style: TextStyle(color: CustomColors.darkGrey)),
                                 Icon(Icons.file_upload_outlined , color: CustomColors.darkGrey,),
                               ],
                              )
                            ),
                        )
                  ],
                ),

                /// LOCATION
                Container(
                  height: 10.h,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.w,
                        child: TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          controller: locationController,
                          validator: (_) {
                            return null;
                          },
                          style: TextStyle(
                            fontSize: 17.sp,
                          ),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: CustomColors.orange, width: 2.0),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            helperText: " ",
                            hintText: "Enter your Restaurent's location",
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

                /// MOBILE NUMBER
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("Phone \n Number:"),
                    Container(
                      height: 10.h,
                      width: 70.w,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneNoController,
                        validator: (_) {
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 17.sp,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,


                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    returnLabel("Open-Closes \n Time: "),
                    Container(
                      width: 35.w,
                      height: 10.h,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(

                        keyboardType: TextInputType.datetime,
                        controller: openTimeController,
                        validator: (_) {
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 17.sp,
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
                      width: 35.w,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        controller: closeTimeController,
                        onTap: () {},
                        validator: (_) {
                          return null;
                        },
                        style: TextStyle(
                          fontSize:17.sp,
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

                /// AREA
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("Area in Acres(Approx) :"),
                    Container(
                      width: 30.w,
                      height: 9.h,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: areaController,
                        validator: (_) {
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 17.sp,
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

                Container(
                  width: 90.w,
                  child: Row(
                    children: [
                      returnLabel("Parking Availability :"),
                      Container(
                        child: Switch(
                          // thumb color (round icon)
                          activeColor: CustomColors.orange,
                          activeTrackColor: CustomColors.darkGrey,
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

                CustomToggleWidget(
                  back: 'Cancel',
                  next: 'Next',
                  onPressedBack: () {
                    Navigator.pop(context);
                  },
                  onPressedNext: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RestaurentScreen2()));
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
