import 'dart:io';
import 'package:demo_flutter/Constants/CustomColors.dart';
import 'package:demo_flutter/Constants/SizeConfig.dart';
import 'package:demo_flutter/firebase/UserRepo.dart';
import 'package:demo_flutter/ui/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SetProfileScreen extends StatefulWidget {
  @override
  _SetProfileScreenState createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  XFile? _profileImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _profileImage = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    double screenWidth = SizeConfig.screenW!;
    double screenHeight = SizeConfig.screenH!;
    final inputTextSize = screenWidth * 0.04; // Adjust the text size
    final inputFieldHeight =
        screenHeight * 0.065; // Adjust the input field height

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: screenWidth * 0.06,
            ),
            onPressed: () {
              // Navigate back to LoginScreen
              Navigator.pop(context);
            },
          ),
        ),
        forceMaterialTransparency: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  _pickImage(ImageSource.gallery);
                },
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: _profileImage == null
                          ? Icon(
                              Icons.account_circle,
                              size: 150,
                              color: Colors.grey[600],
                            )
                          : ClipOval(
                              child: Image.file(
                                File(_profileImage!.path),
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 24,
                          color: CustomColors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.03), // Adjust vertical spacing
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: inputTextSize),
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  floatingLabelStyle: TextStyle(
                    color: CustomColors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.orange,
                      // Set border color when focused
                      width: 2.0, // Set border width
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black,
                style: TextStyle(fontSize: inputTextSize),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  floatingLabelStyle: TextStyle(
                    color: CustomColors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.orange,
                      // Set border color when focused
                      width: 2.0, // Set border width
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              TextFormField(
                //  initialValue: '+919898989898',
                controller: _phoneController,
                enabled: true,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: inputTextSize),
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.orange,
                      // Set border color when focused
                      width: 2.0, // Set border width
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              //Adjust vertical spacing
              // CustomElevatedButton(
              //
              //   text: 'Create Account',
              //   onPressed: () {
              //     // Save profile information logic here
              //     final name = _nameController.text;
              //     final email = _emailController.text;
              //     final profileImage = _profileImage;
              //
              //     Navigator.pushReplacementNamed(context, '/home');
              //
              //     // Navigate to the next screen or perform desired actions
              //   },
              // ),
              //

              ElevatedButton(
                onPressed: () async {
                  // Save profile information logic here
                  final name = _nameController.text;
                  final email = _emailController.text;
                  //  final profileImage = _profileImage;
                  final phone = _phoneController.text;

                  // Navigator.pushReplacementNamed(context, '/home');

                  UserRepo userRepo = Get.put(UserRepo());
                  await userRepo.createUser(name, email, phone, context);

                  // Navigate to the next screen or perform desired actions
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: (MediaQuery.of(context).size.width <= 550)
                      ? EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: MediaQuery.of(context).size.width * 0.05)
                      : EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.2,
                          vertical: 25),
                  textStyle: TextStyle(
                      fontSize:
                          (MediaQuery.of(context).size.width <= 550) ? 13 : 17),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        (MediaQuery.of(context).size.width <= 550) ? 15.sp : 23,
                    fontFamily: 'AppFonts',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Do it Later!",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
