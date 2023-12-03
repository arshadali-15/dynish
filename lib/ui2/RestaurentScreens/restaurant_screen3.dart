import 'dart:io';

import 'package:demo_flutter/ui2/RestaurentScreens/restaurant_screen4.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/custom_colors.dart';
import '../../Widgets/toggle_buttons.dart';


class RestaurentScreeen3 extends StatefulWidget {
  const RestaurentScreeen3({super.key});

  @override
  State<RestaurentScreeen3> createState() => _RestaurentScreeen3State();
}

class _RestaurentScreeen3State extends State<RestaurentScreeen3> {


  String? dropdownValue;

  XFile? _FSCCIImg;
  XFile? _chequeImg;
  XFile? _gstImg;


  Future<void> _pickFSCCIImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _FSCCIImg = pickedImage;
      });
    }
  }

  Future<void> _pickChequeImg(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _chequeImg = pickedImage;
      });
    }
  }

  Future<void> _pickGstImg(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _gstImg = pickedImage;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(

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

              /// FSCII Certificate
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _FSCCIImg != null
                      ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _pickFSCCIImage(ImageSource.gallery);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all()
                          ),
                          width: 70.w,
                          height: 20.h,
                          child: Image.file(
                            File(_FSCCIImg!.path),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  )
                      : Center(
                    child: InkWell(
                      onTap: () {
                        _pickFSCCIImage(ImageSource.gallery);
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
                      "Upload FSCCI Certificate",style: TextStyle(fontSize: 17.sp),),
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

                  _chequeImg != null
                      ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _pickChequeImg(ImageSource.gallery);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all()
                          ),
                          width: 70.w,
                          height: 20.h,
                          child: Image.file(
                            File(_chequeImg!.path),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  )
                      : Center(
                    child: InkWell(
                      onTap: () {
                        _pickChequeImg(ImageSource.gallery);
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
                      "Upload Cancelled Cheque or \n Bank Statement",style: TextStyle(fontSize: 17.sp),),
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

                  _gstImg != null
                      ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _pickGstImg(ImageSource.gallery);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all()
                          ),
                          width: 70.w,
                          height: 20.h,
                          child: Image.file(
                            File(_gstImg!.path),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  )
                      : Center(
                    child: InkWell(
                      onTap: () {
                        _pickGstImg(ImageSource.gallery);
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
                      "GST Declaration Form",style: TextStyle(fontSize: 17.sp),),
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
                      builder: (context) => RestaurentScreen4()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
