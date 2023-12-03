import 'dart:io';

import 'package:demo_flutter/ui2/RestaurentScreens/restaurant_screen3.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/custom_colors.dart';
import '../../Widgets/toggle_buttons.dart';

class RestaurentScreen2 extends StatefulWidget {
  const RestaurentScreen2({super.key});

  @override
  State<RestaurentScreen2> createState() => _RestaurentScreen2State();
}

class _RestaurentScreen2State extends State<RestaurentScreen2> {

  String? dropdownValue;

  //
  XFile? _restaurentImg;
  XFile? _menuImg;
  XFile? _leaseAgreement;


  Future<void> _pickRestaurentImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _restaurentImg = pickedImage;
      });
    }
  }

  Future<void> _pickMenuImg(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _menuImg = pickedImage;
      });
    }
  }

  Future<void> _pickLeaseAgreement(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _leaseAgreement = pickedImage;
      });
    }
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
                          borderSide:
                              BorderSide(color: CustomColors.orange, width: 1)),
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
                    items: <String>['Dine-in + Takeaway', 'Dine-in', 'Takeaway']
                        .map<DropdownMenuItem<String>>((String value) {
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

              /// RESTAURENT IMAGES
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _restaurentImg != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                _pickRestaurentImage(ImageSource.gallery);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all()
                                ),
                                width: 70.w,
                                height: 20.h,
                                child: Image.file(
                                  File(_restaurentImg!.path),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: InkWell(
                            onTap: () {
                              _pickRestaurentImage(ImageSource.gallery);
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
                                  Text(
                                  "Format: PNG  |  JPEG  |  WEBP",
                                  style: TextStyle(
                                      color: CustomColors.grey,
                                      fontSize: 17.sp),
                                ),
                                  SizedBox(height: 2.h,),

                                  Icon(
                                    Icons.file_upload_outlined,
                                    color: CustomColors.darkGrey,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 2.h,),

                  Center(
                    child: Text(textAlign :TextAlign.center,
                      "Upload Images of Restaurent",style: TextStyle(fontSize: 17.sp),),
                  ),

                ],
              ),
              SizedBox(
                height: 5.h,
              ),

              /// MENU
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  _menuImg != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                _pickMenuImg(ImageSource.gallery);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all()
                                ),
                                width: 70.w,
                                height: 20.h,
                                child: Image.file(
                                  File(_menuImg!.path),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: InkWell(
                            onTap: () {
                              _pickMenuImg(ImageSource.gallery);
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
                                  Text(
                                    "Format: PNG  |  JPEG  |  WEBP",
                                    style: TextStyle(
                                        color: CustomColors.grey,
                                        fontSize: 17.sp),
                                  ),
                                  SizedBox(height: 2.h,),

                                  Icon(
                                    Icons.file_upload_outlined,
                                    color: CustomColors.darkGrey,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 2.h,),
                  Center(
                    child: Text(textAlign :TextAlign.center,
                      "Upload Menu",style: TextStyle(fontSize: 17.sp),),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),

              /// LEASE AGREEMENT
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _leaseAgreement != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                _pickLeaseAgreement(ImageSource.gallery);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all()
                                ),
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

                                  Text(
                                    "Format: PNG  |  JPEG  |  WEBP",
                                    style: TextStyle(
                                        color: CustomColors.grey,
                                        fontSize: 17.sp),
                                  ),
                                  SizedBox(height: 2.h,),

                                  Icon(
                                    Icons.file_upload_outlined,
                                    color: CustomColors.darkGrey,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 2.h,),

                  Center(
                    child: Text(textAlign :TextAlign.center,
                        "Upload Property Ownership or \n Lease Agreement",style: TextStyle(fontSize: 17.sp),),
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
                      builder: (context) => RestaurentScreeen3()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
