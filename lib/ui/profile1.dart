import 'package:demo_flutter/ui/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:demo_flutter/Constants/custom_colors.dart';
import 'package:demo_flutter/Widgets/reusable_card.dart';
import 'package:demo_flutter/Widgets/single_widget.dart';

class Profile1 extends StatefulWidget {
  const Profile1(
      {
      //   required this.name,
      // required this.email,
      // required this.phone,
      super.key});

  //
  // final String name;
  // final String email;
  // final String phone;

  @override
  State<Profile1> createState() => _Profile1State();
}

final _auth = FirebaseAuth.instance;

class _Profile1State extends State<Profile1> {
  /// late Future<void> _updateUserFuture;

  User? user = _auth.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _updateUserFuture = UserRepo.instance
    //     .createUser(widget.name, widget.email, widget.phone, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: CustomColors.orange,
          pinned: true,
          expandedHeight: 12.h,
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              'Profile',
              style: TextStyle(color: CustomColors.black),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 0, 0),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/images/ic_back.png')),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 18, 30, 0),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/images/ic_more.png')),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: CustomColors.orange,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 12.h,
            decoration: BoxDecoration(
                color: CustomColors.orange,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: CustomColors.orange,
                    radius: 30,
                    child: Image.asset("assets/images/profilePic.png"),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Vishal Khadok",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'Sen'),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          "mailer@gmail.com \n +9195343242423",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/images/ic_edit.png'))
                ],
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
            child: Column(
          children: [
            ResuableCard(
                title: "Setup Food Court",
                title2: "Shops in Court",
                image1: 'assets/images/foodCourt.png',
                image2: 'assets/images/shopsInCourt.png'),
            ResuableCard(
                title: "Ad postings",
                title2: "Payments",
                image1: "assets/images/ad_postings.png",
                image2: "assets/images/payments.png"),
            ResuableCard(
                title: "Support 24/7",
                title2: "Settings",
                image1: "assets/images/support.png",
                image2: "assets/images/settings.png"),
            SingleWidget(title: "Log Out", image: "assets/images/logout.png")
          ],
        ))
      ],
    ));
  }
}
