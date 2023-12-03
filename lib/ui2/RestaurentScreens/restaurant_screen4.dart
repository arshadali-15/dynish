import 'dart:io';

import 'package:demo_flutter/ui2/RestaurentScreens/restaurant_screen2.dart';
import 'package:demo_flutter/ui2/RestaurentScreens/restaurant_screen5.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/custom_colors.dart';
import '../../Widgets/toggle_buttons.dart';

class RestaurentScreen4 extends StatefulWidget {
  const RestaurentScreen4({super.key});

  @override
  State<RestaurentScreen4> createState() => _RestaurentScreen4State();
}

class _RestaurentScreen4State extends State<RestaurentScreen4> {
  GlobalKey<FormState> restaurentFormKey = GlobalKey<FormState>();

  String? dropdownValue;

  TextEditingController ownerNameController = TextEditingController();

  TextEditingController ownerPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  //
  XFile? _ownersPic;

  Future<void> _pickOwnersPic(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _ownersPic = pickedImage;
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
                      hint: Text(
                        "Select here",
                        style: TextStyle(color: CustomColors.white),
                      ),
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


                ///Brand LOGO
                Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    returnLabel("Upload your \n Passport size photo :"),
                    _ownersPic != null
                        ? InkWell(
                      onTap: () {
                        _pickOwnersPic(ImageSource.gallery);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.file(
                          File(_ownersPic!.path),
                          width: 40.w,
                          height: 20.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : InkWell(
                      onTap: (){
                        _pickOwnersPic(ImageSource.gallery);
                      },
                      child: Container(
                          height: 13.h,
                          width: 40.w,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border:Border.all(color: CustomColors.grey,),
                            borderRadius: BorderRadius.circular(25)

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

                SizedBox(height: 15,),

                /// NAME
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("Name :"),
                    Container(
                      height: 9.h,
                      width: 70.w,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: ownerNameController,
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
                          hintText: "Name of the Restaurent",
                          hintStyle:
                              TextStyle(fontSize: 15.sp, color: Colors.grey),
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
                SizedBox(height: 15,),

                /// MOBILE NUMBER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("Phone \n Number:"),
                    Container(
                      height: 9.h,
                      width: 70.w,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: ownerPhoneController,
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


                SizedBox(height: 15,),

                /// Email ID
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("Email Id :"),
                    Container(
                      width: 70.w,
                      height: 9.h,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(

                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
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
                          hintText: "Enter Mail Id",
                          hintStyle:
                          TextStyle(fontSize: 15, color: Colors.grey),
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

                SizedBox(height: 15,),

                /// PAN
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("PAN number :"),
                    Container(
                      width: 70.w,
                      height: 9.h,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: panController,
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
                          hintText: "HADMO2311S",
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey),
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
                  back: 'Cancel',
                  next: 'Next',
                  onPressedBack: () {
                    Navigator.pop(context);
                  },
                  onPressedNext: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RestaurentScreen5()));
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
