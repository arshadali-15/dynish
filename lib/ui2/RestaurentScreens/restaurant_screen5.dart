import 'dart:io';

import 'package:demo_flutter/ui2/home_page2.dart';
import 'package:demo_flutter/ui2/RestaurentScreens/restaurant_screen2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/custom_colors.dart';
import '../../Widgets/fc_screen_toggle.dart';

class RestaurentScreen5 extends StatefulWidget {
  const RestaurentScreen5({super.key});

  @override
  State<RestaurentScreen5> createState() => _RestaurentScreen5State();
}

class _RestaurentScreen5State extends State<RestaurentScreen5> {
  /// Checkbox
  bool _accept = false;

  /// FORM KEY
  GlobalKey<FormState> restaurentFormKey = GlobalKey<FormState>();

  /// DROPDOWN
  String? dropdownValue;

  /// CONTROLLERS
  TextEditingController accountNoController = TextEditingController();
  TextEditingController IFSCController = TextEditingController();

  /// IMAGE
  XFile? _gstImg;

  Future<void> _pickGstImg(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _gstImg = pickedImage;
      });
    }
  }

  returnLabel(String label) {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      alignment: Alignment.centerLeft,
      child: Text(
        " $label",
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                      "Bank Account Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                  ),
                ),

                /// NAME
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("Account Number :"),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 9.h,
                        width: 70.w,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: accountNoController,
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                /// IFSC

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnLabel("Account Number :"),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 9.h,
                        width: 70.w,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: IFSCController,
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
                            hintText: "Enter IFSC Code",
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                ///Brand LOGO
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    returnLabel("GST/Declaration Form:"),
                    SizedBox(
                      height: 10,
                    ),
                    _gstImg != null
                        ? InkWell(
                            onTap: () {
                              _pickGstImg(ImageSource.gallery);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.file(
                                File(_gstImg!.path),
                                width: 40.w,
                                height: 20.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              _pickGstImg(ImageSource.gallery);
                            },
                            child: Container(
                                height: 13.h,
                                width: 40.w,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: CustomColors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "45X45",
                                      style: TextStyle(
                                          color: CustomColors.darkGrey),
                                    ),
                                    Text("JPG,PNG,JPEG",
                                        style: TextStyle(
                                            color: CustomColors.darkGrey)),
                                    Icon(
                                      Icons.file_upload_outlined,
                                      color: CustomColors.darkGrey,
                                    ),
                                  ],
                                )),
                          ),
                  ],
                ),

                Container(
                  width: 90.w,
                  height: 10.h,
                  //  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Checkbox(
                            activeColor: CustomColors.orange,
                            value: this._accept,
                            onChanged: (bool? value) {
                              setState(() {
                                this._accept = value!;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 70.w,
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

                Center(
                  child: ElevatedButton(

                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        backgroundColor: CustomColors.orange,
                        content: Text(
                          "Successfully ENROLLED!!",
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                        duration: Duration(seconds: 2),
                      ));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage2()));
                    },
                    child: Container(
                    width: 25.w,
                        height: 5.h,
                        child: Center(child: Text("Submit" ,style: TextStyle(fontSize: 18.sp ,color: CustomColors.white,fontWeight: FontWeight.bold),)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_outlined),
                    Text("Back")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
